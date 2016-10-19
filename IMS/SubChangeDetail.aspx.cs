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
    public partial class SubChangeDetail : System.Web.UI.Page
    {
        string EWID = (SystemSet.GetRequestSet("EWID") != "") ? SystemSet.GetRequestSet("EWID") : "";
        string SC_MID = (SystemSet.GetRequestSet("SC_MID") != "") ? SystemSet.GetRequestSet("SC_MID") : "";
        string Edition = (SystemSet.GetRequestSet("edition") != "") ? SystemSet.GetRequestSet("edition") : "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            LoadContent();
        }
        protected void TB_5_TextChanged(object sender, EventArgs e)
        {
            double A = double.Parse(LbBCQuantity.Text);
            double B = double.Parse(TB_5.Text, System.Globalization.NumberStyles.Number);
            double C = A + B;
            double D = double.Parse(LbACPrice.Text, System.Globalization.NumberStyles.Number);
            double E = C * D;
            LbACQuantity.Text = Convert.ToString(C);
            LbACComplex.Text = Convert.ToString(E);
        }
        protected void Label184_TextChanged(object sender, EventArgs e)
        {
            double A = double.Parse(LbBCQuantity.Text, System.Globalization.NumberStyles.Number);
            double B = double.Parse(LbACQuantity.Text, System.Globalization.NumberStyles.Number);
            double C = B - A;
            double D = double.Parse(LbACPrice.Text, System.Globalization.NumberStyles.Number);
            double E = B * D;
            TB_5.Text = Convert.ToString(C);
            LbACComplex.Text = Convert.ToString(E);
        }
        protected void LoadContent()
        {
            string SQLSelect = "Select * From SubContract_Item Where SC_MID=" + SC_MID;
            string SQLSelectEBudget = "Select * from EBudget_WBS where EWID=" + EWID;
            string database = Session["DatabaseName"].ToString();
            LbEdition.Text = Edition;
            DataTable Dtvs = WebModel.LoadSetContentData(database, SQLSelect);
            DataTable Dtvs1 = WebModel.LoadSetContentData(database, SQLSelectEBudget);
            if (Dtvs != null && Dtvs.Rows.Count>0)
            {
              for(int i=0; i<Dtvs.Rows.Count; i++)
              {
                  DataRow row = Dtvs.Rows[i];
                  LbSCID.Text=row["SCID"].ToString();
                  LbItemName.Text = row["ItemName"].ToString();
                  LbUnit.Text = row["Unit"].ToString();
                  LbBItem.Text = row["BelongItem"].ToString();
                  LbSubQuantity.Text = row["SCNumber"].ToString();
                  LbSubPrice.Text = row["UnitPrice"].ToString();
                  LbBCQuantity.Text = row["LastSCNumber"].ToString();
                  LbBCPrice.Text = row["UnitPrice"].ToString();
                  LbACPrice.Text = row["UnitPrice"].ToString();
                  LbBCComplex.Text = (decimal.Parse(LbBCQuantity.Text) * decimal.Parse(LbBCPrice.Text)).ToString("N0");
                  LbSubComplex.Text = (decimal.Parse(LbSubQuantity.Text) * decimal.Parse(LbSubPrice.Text)).ToString("N0");


              }

            }
            
            if (Dtvs1 != null && Dtvs1.Rows.Count > 0)
            {
                for (int i = 0; i < Dtvs1.Rows.Count; i++)
                {
                    DataRow row = Dtvs1.Rows[i];
                    LbEQuantity.Text =row["ENumber"].ToString()!=""?decimal.Parse(row["ENumber"].ToString()).ToString():"0";
                    string PriceID = row["PriceID"].ToString();
                    string SQLProre="Select * from Pro_Resource where PriceID="+PriceID;
                    LbEPrice.Text = WebModel.SItemName(database, SQLProre, "EPrice");
                    LbEComplex.Text = (decimal.Parse(LbEQuantity.Text) * decimal.Parse(LbEPrice.Text)).ToString("N0");
                    LbLEQuantity.Text = row["LastENumber"].ToString() !=""? decimal.Parse(row["LastENumber"].ToString()).ToString("N0"):"0";
                    LbLEPrice.Text = LbEPrice.Text;
                    LbLEComplex.Text = (decimal.Parse(LbLEQuantity.Text) * decimal.Parse(LbLEPrice.Text)).ToString("N0");

                }
            }


        }
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string ErrorString = "";
            //string SQLInsert = "Insert Into SubContract_Change ([SCID],[SC_MID],[ChNumber],[Edition]) VALUES('" + LbSCID.Text + "','" + SC_MID + "','" + TB_5.Text + "','" + Edition + "')";
            //string SQLUpdate = "Update SubContract_Item set LastSCNumber=" + LbACQuantity.Text + ",ComplexPrice=" + LbACComplex.Text + ",LastEdition=" + Edition + " where SC_MID=" + SC_MID;
            string SQLString = "SC_MID,SCID,ItemName,Unit,ChNumber" + Edition + ",UnitPrice,LastComplexPrice,LastEdition";
            DataTable Dtvs = new DataTable();
            DataRow DataTableDr;
               foreach (string DataName in SQLString.Split(','))
            {
                Dtvs.Columns.Add(DataName, typeof(string));
            }
               DataTableDr = Dtvs.NewRow();
               ErrorString += (TB_5.Text) == string.Empty ? "請輸入分包用量!!\\n" : "";
               if (ErrorString == "")
               {

                   DataTableDr["SC_MID"] = SC_MID;
                   DataTableDr["ItemName"] = LbItemName.Text;
                   DataTableDr["Unit"] = LbUnit.Text;
                   DataTableDr["ChNumber" + Edition] = TB_5.Text;
                   DataTableDr["UnitPrice"] = LbACPrice.Text;
                   DataTableDr["LastComplexPrice"] = LbACComplex.Text;
                   DataTableDr["LastEdition"] = Edition;
                   
                   Dtvs.Rows.Add(DataTableDr);
                   Session["OrItem"] = Dtvs;

               }
             
               else
                {

                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

                }
            //bool result = WebModel.SQLAction(database, SQLInsert);
            //bool result1 = WebModel.SQLAction(database, SQLUpdate);
            //if (result && result1)
            //{
            //    Response.Write("<script>alert('存檔成功');</script>");

            //}
            //else
            //{
            //    Response.Write("<script>alert('存檔失敗');</script>");
            //}
               Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_Self').click();self.close()</script>");
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Write("<script>self.close()</script>");
        }
    }
}