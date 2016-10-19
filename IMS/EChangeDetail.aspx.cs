using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class EChangeDetail : System.Web.UI.Page
    {
        protected string EWID;
        protected string UId;
        protected void Page_Load(object sender, EventArgs e)
        {
            EWID = SystemSet.GetRequestSet("EWID");
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            LoadContent();
            LoadEBContent();
            if (!IsPostBack)
            {
                int Eedition = 0;
                string database = Session["DatabaseName"].ToString();
                Eedition = WebModel.MaxAnyID(database, "EBudget_Change", Session["ProjectCode"].ToString(), "EEdition");
                if (ViewState["edition"] == null)
                {
                    for (int i = 1; i <= Eedition; i++)
                    {
                        CheckBoxList2.Items.Add(new ListItem("第" + i.ToString() + "變更設計", i.ToString()));

                    }
                }
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
        protected void Label184_TextChanged(object sender, EventArgs e)
        {
            //double A = double.Parse(Label181.Text, System.Globalization.NumberStyles.Number);
            //double B = double.Parse(Label184.Text, System.Globalization.NumberStyles.Number);
            //double C = B - A;
            //double D = double.Parse(Label188.Text, System.Globalization.NumberStyles.Number);
            //double E = B * D;
            //TB_5.Text = Convert.ToString(C);
            //Label187.Text = Convert.ToString(E);
        }
        protected void LoadContent()
        {
           
            string database = Session["DatabaseName"].ToString();
           
            string SQLSelect = "Select * from EBudget_WBS a left join Pro_Resource b on a.PriceID=b.PriceID where a.EWID=" + EWID;
           
            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLSelect);
            LbEdition.Text = (WebModel.MaxAnyID(database, "EBudget_Change", Session["ProjectCode"].ToString(), "EEdition")).ToString();
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
                    string SelectItemName = "Select * from EBudget_WBS where EWID=" + upperwid;
                    string PriceID = row["PriceID"].ToString();
                    LbUpItem.Text = WebModel.SItemName(database, SelectItemName, "ItemName");
                    LbEQuantity.Text = row["LastENumber"].ToString() != "" ? row["LastENumber"].ToString() : "0";
                    LbEPrice.Text = row["EPrice"].ToString() != "" ? decimal.Parse(row["EPrice"].ToString()).ToString("N0") : "0";
                    LbEComplex.Text = (decimal.Parse(LbEQuantity.Text) * decimal.Parse(LbEPrice.Text)).ToString("N0");
                  
                
                }
            }
        }
        protected void LoadEBContent()
        {
            string SQLSelect = "Select * from EBudget_WBS a left join CBudget_WBS b on a.CWID=B.CWID left join Pro_Resource c on a.PriceID=c.PriceID where a.EWID=" + EWID;
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLSelect);
            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                foreach (DataRow row in DataTableBox.Rows)
                {

                    LbCQuantity.Text = row["CNumber"].ToString() != "" ? row["CNumber"].ToString() : "0";
                    LbCPrice.Text = row["CPrice"].ToString() != "" ? decimal.Parse(row["CPrice"].ToString()).ToString("N0") : "0";
                    LbCComplex.Text = (decimal.Parse(LbCQuantity.Text) * decimal.Parse(LbCPrice.Text)).ToString("N0");
                    LbAEPrice.Text = row["CPrice"].ToString() != "" ? decimal.Parse(row["CPrice"].ToString()).ToString("N0") : "0";
              
                }
            }

        }
        protected void LoadDetail()
        {
            string SQLSelect = "Select * from EBudget_Change_Detail where EWID=" + EWID;
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLSelect);
            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                foreach (DataRow row in DataTableBox.Rows)
                {
                    //DDL_Respond.SelectedValue = row["Response"].ToString();
                    //DDL_Reason.SelectedValue = row["Reason"].ToString();
                    //LbACQuantity.Text = row["ChNumber"].ToString();
                    //TxIDQuantity.Text = (decimal.Parse(LbACQuantity.Text) - decimal.Parse(LbQuantity.Text)).ToString();
                }
            }

        }
        protected DataTable GetDataBox()
        {
            string database = Session["DatabaseName"].ToString();
            string SQLSelect="Select CEdition from CBudget_Change where EEdition="+LbEdition.Text;
            string CBVersion = WebModel.SItemName(database, SQLSelect, "CEdition");
            DataTable DataTableBox = new DataTable();
            string SQLDetail = "PID,EWID,ChNumber" + LbEdition.Text + ",Response" + LbEdition.Text + ",Reason" + LbEdition.Text + ",CBudget"+ LbEdition.Text + "";
            foreach (string DataName in SQLDetail.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }
            DataRow DTDr = DataTableBox.NewRow();
            if (Session["ProjectCode"] != null)
            {
                DTDr["PID"] = Session["ProjectCode"].ToString();
                DTDr["EWID"] = EWID;
                DTDr["ChNumber" + LbEdition.Text + ""] = decimal.Parse(TxACQuantity.Text);
                DTDr["CBudget" + LbEdition.Text + ""] = CBVersion;

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
            string SQLDetail = "PID,EEdition,LastENumber";
            foreach (string DataName in SQLDetail.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }
            DataRow DTDr = DataTableBox.NewRow();
            if (Session["ProjectCode"] != null)
            {
                DTDr["PID"] = Session["ProjectCode"].ToString();
                //DTDr["CWID"] = CWID;
                DTDr["EEdition"] = LbEdition.Text;
                DTDr["LastENumber"] = decimal.Parse(TxACQuantity.Text);


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
            string SQLString = "Select * from EBudget_Change_Detail where EWID=" + SystemSet.GetRequestSet("EWID") + "";
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
            ErrorString += (TxIDQuantity.Text) == "" || (TxIDQuantity.Text) == "0" ? "請輸入本次追加減金額!!\\n" : "";

            if (ErrorString == "")
            {

                if (datacheck() == false)
                {
                    WebModel.SaveAction(database, "EBudget_Change_Detail", GetDataBox());
                    WebModel.EditAction_Anyid(database, "EBudget_WBS", EWID, "EWID", GetDataBox1());
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('儲存成功');", true);
                }
                else
                {
                    WebModel.EditAction_Anyid(database, "EBudget_Change_Detail", UId, "UID", GetDataBox());
                    //WebModel.EditAction(database, "CBudget_Change_Detail",UId, GetDataBox());
                    WebModel.EditAction_Anyid(database, "EBudget_WBS", EWID, "EWID", GetDataBox1());

                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('儲存成功');", true);
                }

            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

            }
        }

        protected void ReLoad_Click(object sender, EventArgs e)
        {
            string tmpListStr = "";
            string database = Session["DatabaseName"].ToString();
            Literal1.Text = "";
            string Edition = CheckBoxList2.SelectedValue;
            if (CheckBoxList2.SelectedValue != "")
            {
                StringBuilder tmpStr = new StringBuilder();
                //StringBuilder tmpStr1 = new StringBuilder();
                foreach (ListItem item1 in CheckBoxList2.Items)
                {
                    //tmpStr2.Clear();
                     //string SQLString="Select * From EBudget_Change_Detail a left join EBudget_WBS b on a.EWID=b.EWID left join Pro_Resource c on b.PriceID=c.PriceID  Where a.EWID="+EWID+" and a.EEdition="+item1.Value+"";
                    string SQLSelect = "a.ChNumber" + item1.Value + ",a.Response" + item1.Value + ",a.Reason" + item1.Value + ",a.CBudget" + item1.Value + "";
                     string SQLString = "select b.*,c.*,a.PID," + SQLSelect + " from EBudget_Change_Detail a left join EBudget_WBS  b on a.EWID=b.EWID left join Pro_Resource c on b.PriceID=c.PriceID where a.EWID=" + EWID + " and a.PID="+Session["ProjectCode"].ToString();
                     DataTable DataTableBox=WebModel.LoadSetContentData(database,SQLString);
                     //if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                     //{
                foreach (DataRow row in DataTableBox.Rows)
                {

                    string EEdtiton = row["CBudget" + item1.Value + ""].ToString() != "" ? row["CBudget" + item1.Value + ""].ToString() : "0";
                    string Quantity = row["ChNumber" + item1.Value + ""].ToString() != "" ? decimal.Parse(row["ChNumber" + item1.Value + ""].ToString()).ToString("N0") : "0";
                    //string LbChNumber1 = vsDr1["ChNumber" + item1.Value + ""].ToString() != "" ? vsDr1["ChNumber" + item1.Value + ""].ToString() : "0";
                    string Price = row["EPrice"].ToString() != "" ? decimal.Parse(row["EPrice"].ToString()).ToString("N0") : "0";
                    string Complex = (decimal.Parse(Quantity) * decimal.Parse(Price)).ToString("N0");
                 
                    
               
                    //string tmpListStr1 = "";
                    if (item1.Selected == true)
                    {


                        tmpListStr = "<tr><td class=\"auto-style2\"> 第" + item1.Value + "次變更後</td>" +
                                        "<td class=\"auto-style3C\">-</td><td class=\"auto-style3C\">-</td><td class=\"auto-style3C\">-</td>"+
                                        "<td class=\"auto-style3C\">" + Quantity + "</td>" +
                                        "<td class=\"auto-style3C\">" + Price + "</td>" +
                                        "<td class=\"auto-style3C\">" + Complex + "</td></tr>";

                   
                           }
                    Literal1.Text += tmpListStr;
                        }
                    //}

                }
            }
        }

        protected void TxACQuantity_TextChanged(object sender, EventArgs e)
        {
            string SQLSelect = "Select * from EBudget_WBS where EWID=" + EWID;
            string database = Session["DatabaseName"].ToString();
            string LastENumber1 = "";
           DataTable LastENumber = WebModel.LoadSetContentData(database, SQLSelect);
           if (LastENumber != null && LastENumber.Rows.Count > 0)
           {
               foreach (DataRow row in LastENumber.Rows)
               {
                   LastENumber1 = row["LastENumber"].ToString()!=""?row["LastENumber"].ToString():"0";


               }
           }
            TxACQuantity.Text =(decimal.Parse(LastENumber1)+ decimal.Parse(TxIDQuantity.Text)).ToString("N0");
            LbAComplex.Text = (decimal.Parse(TxACQuantity.Text) * decimal.Parse(LbAEPrice.Text)).ToString("N0");
        }
    }
}