using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class CChangeDetail : System.Web.UI.Page
    {
        protected string CWID;
        protected string UId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["ProjectCode"] == null || Session["ProjectCode"] == "")
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請選擇專案');", true);
                Response.Redirect("Main.aspx");
            }
            CWID = SystemSet.GetRequestSet("CWID");
            LoadContent();
            LoadEBContent();
            if (!IsPostBack)
            {
                LoadDetail();
            }
        }
        protected void TB_5_TextChanged(object sender, EventArgs e)
        {
            //double A = double.Parse(Label181.Text, System.Globalization.NumberStyles.Number);
            //double B = double.Parse(TB_5.Text, System.Globalization.NumberStyles.Number);
            //double C = A + B;
            //double D = double.Parse(Label188.Text, System.Globalization.NumberStyles.Number);
            //double E = C * D;
            //Label184.Text = Convert.ToString(C);
            //Label187.Text = Convert.ToString(E);
        }
        protected void LoadContent()
        {
            string SQLSelect = "Select * from CBudget_WBS a left join Pro_Resource b on a.PriceID=b.PriceID where CWID=" + CWID;
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLSelect);
            LbEdition.Text = (WebModel.MaxAnyID(database, "CBudget_Change", Session["ProjectCode"].ToString(), "CEdition")).ToString();
            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                foreach (DataRow row in DataTableBox.Rows)
                {

                    //LbEdition.Text = row["CEdition"].ToString();
                    LbItemName.Text = row["ItemName"].ToString();
                    LbUnit.Text = row["Unit"].ToString();
                    LbItemOrder.Text = row["ItemOrder"].ToString();
                    LbNotes.Text = row["Notes"].ToString();
                    string upperwid = row["UpperWID"].ToString();
                    string SelectItemName = "Select * from CBudget_WBS where CWID=" + upperwid;
                    string PriceID = row["PriceID"].ToString();
                    LbUpItem.Text = WebModel.SItemName(database, SelectItemName, "ItemName");
                    LbQuantity.Text = row["CNumber"].ToString() !=""?row["CNumber"].ToString():"0";
                    LbCPrice.Text = row["CPrice"].ToString() != "" ? decimal.Parse(row["CPrice"].ToString()).ToString("N0") : "0";
                    LbCComplex.Text = (decimal.Parse(LbQuantity.Text) * decimal.Parse(LbCPrice.Text)).ToString("N0");
                    LbCBQuantity.Text = row["LastCNumber"].ToString() !=""?row["LastCNumber"].ToString():"0";
                    LbCCPrice.Text = row["CPrice"].ToString() != "" ? decimal.Parse(row["CPrice"].ToString()).ToString("N0") : "0";
                    LbCCComplex.Text = (decimal.Parse(LbCBQuantity.Text) * decimal.Parse(LbCCPrice.Text)).ToString("N0");
                    TxIDQuantity.Text = TxIDQuantity.Text != "" ? TxIDQuantity.Text : "0";
                    LbACQuantity.Text = (decimal.Parse(TxIDQuantity.Text)+ decimal.Parse(LbCBQuantity.Text)).ToString("N0");
                    LbACPrice.Text=row["CPrice"].ToString() != "" ? decimal.Parse(row["CPrice"].ToString()).ToString("N0") : "0";
                    LbACComplex.Text = (decimal.Parse(LbACQuantity.Text) * decimal.Parse(LbACPrice.Text)).ToString("N0");
                }
            }
        }
        protected void LoadEBContent()
        {
            string SQLSelect = "Select * from EBudget_WBS a left join CBudget_WBS b on a.LayerCode=b.LayerCode left join Pro_Resource c on a.PriceID=c.PriceID where a.EWID=" + CWID;
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLSelect);
            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                foreach (DataRow row in DataTableBox.Rows)
                {

                    LbEQuantity.Text = row["ENumber"].ToString() !=""?row["ENumber"].ToString():"0";
                    LbEPrice.Text = row["EPrice"].ToString() != "" ? decimal.Parse(row["EPrice"].ToString()).ToString("N0") : "0";
                    LbEComplex.Text = (decimal.Parse(LbEQuantity.Text) * decimal.Parse(LbEPrice.Text)).ToString("N0");
                    LbCEQuantity.Text = row["LastENumber"].ToString() !=""?row["LastENumber"].ToString():"0";
                    LbCEPrice.Text = row["EPrice"].ToString() != "" ? decimal.Parse(row["EPrice"].ToString()).ToString("N0") : "0";
                    LbCEComplex.Text = (decimal.Parse(LbCEQuantity.Text) * decimal.Parse(LbCEPrice.Text)).ToString("N0");
                }
            }

        }
        protected void LoadDetail()
        {
            string SQLSelect = "Select * from CBudget_Change_Detail where CWID=" + CWID + " and CEdition=" + LbEdition.Text+"";
            string database = Session["DatabaseName"].ToString();
             DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLSelect);
             if (DataTableBox != null && DataTableBox.Rows.Count > 0)
             {
                 foreach (DataRow row in DataTableBox.Rows)
                 {
                     DDL_Respond.SelectedValue = row["Response"].ToString();
                     DDL_Reason.SelectedValue = row["Reason"].ToString();
                     LbACQuantity.Text = row["ChNumber"].ToString()!=""?row["ChNumber"].ToString():"0";
                     LbQuantity.Text = LbQuantity.Text != "" ? LbQuantity.Text : "0";
                     TxIDQuantity.Text = (decimal.Parse(LbACQuantity.Text) - decimal.Parse(LbQuantity.Text)).ToString();
                 }
             }

        }
        protected DataTable GetDataBox()
        {
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox = new DataTable();
            string SQLDetail = "PID,CWID,CEdition,ChNumber,Response,Reason";
            foreach (string DataName in SQLDetail.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }
            DataRow DTDr = DataTableBox.NewRow();
            if (Session["ProjectCode"] != null)
            {
                DTDr["PID"] = Session["ProjectCode"].ToString();
                DTDr["CWID"] = CWID;
                DTDr["CEdition"] = LbEdition.Text;
                DTDr["ChNumber"] = decimal.Parse(LbACQuantity.Text);
                DTDr["Response"] = DDL_Respond.SelectedValue;
                DTDr["Reason"] = DDL_Reason.SelectedValue;
                
                DataTableBox.Rows.Add(DTDr);
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }

            return DataTableBox;

        }
        protected DataTable GetDataBox1()
        {
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox = new DataTable();
            string SQLDetail = "PID,CEdition,LastCNumber";
            foreach (string DataName in SQLDetail.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }
            DataRow DTDr = DataTableBox.NewRow();
            if (Session["ProjectCode"] != null)
            {
                DTDr["PID"] = Session["ProjectCode"].ToString();
                //DTDr["CWID"] = CWID;
                DTDr["CEdition"] = LbEdition.Text;
                DTDr["LastCNumber"] = decimal.Parse(LbACQuantity.Text);
            

                DataTableBox.Rows.Add(DTDr);
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }

            return DataTableBox;

        }
        public bool datacheck()
        {
            string database = Session["DatabaseName"].ToString();
            string SQLString = "Select * from CBudget_Change_Detail where CEdition=" + LbEdition.Text + " and CWID=" + SystemSet.GetRequestSet("CWID") + "";
            if (Session["ProjectCode"] == null)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            else
            {


                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                     foreach (DataRow row in DataTableBox.Rows)
                    {
                         UId = row["UID"].ToString();

                    
                    }
                    return true;
                }
                else
                {

                    return false;
                }

            }
            return false;

        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string ErrorString = "";
            ErrorString += (TxIDQuantity.Text) == "" || (TxIDQuantity.Text) == "0"? "請輸入本次追加減金額!!\\n" : "";

               if (ErrorString == "")
                {

                    if (datacheck() == false)
                    {
                        WebModel.SaveAction(database, "CBudget_Change_Detail", GetDataBox());
                        WebModel.EditAction_Anyid(database, "CBudget_WBS", CWID, "CWID", GetDataBox1());
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('儲存成功');", true);
                    }
                    else
                    {
                        WebModel.EditAction_Anyid(database, "CBudget_Change_Detail", UId, "UID", GetDataBox());
                        //WebModel.EditAction(database, "CBudget_Change_Detail",UId, GetDataBox());
                        WebModel.EditAction_Anyid(database, "CBudget_WBS", CWID, "CWID", GetDataBox1());
                      
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('儲存成功');", true);
                    }

                }
               else
               {

                   ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

               }
        }
    }
}