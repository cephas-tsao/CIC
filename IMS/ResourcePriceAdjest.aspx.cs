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
    public partial class ResourcePriceAdjest : System.Web.UI.Page
    {
        string PriceID = (SystemSet.GetRequestSet("PriceID") != "") ? SystemSet.GetRequestSet("PriceID") : "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            Loadcontent();
        }

        protected void Loadcontent()
        {

            string SQLString = "Select * from Bid_Library where PriceID=" + PriceID + "";
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                foreach (DataRow row in DataTableBox.Rows)
                {

                    LbCode.Text = row["Code"].ToString();
                    LbItemName.Text = row["ItemName"].ToString();
                    //RadioButtonList1.SelectedValue = (row["Unit"].ToString() != "") ? row["Unit"].ToString().Trim() : "M";
                    LbUnit.Text = row["Unit"].ToString();
                  
                    LbAmount.Text = (row["Amount"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["Amount"].ToString()))).ToString("#,#") : "0";
                    LbCAmount.Text = (row["CAmount"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["CAmount"].ToString()))).ToString("#,#") : "0";
                    LbPrice.Text = (row["Price"].ToString() != "") ? Convert.ToInt32(Math.Ceiling(decimal.Parse(row["Price"].ToString()))).ToString("#,#") : "0";
                    LbCAmountAmount.Text = (decimal.Parse(LbCAmount.Text) - decimal.Parse(LbAmount.Text)).ToString("N0");

                }
                DataTableBox.Dispose(); //釋放Table資源
            }
        }

        //protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        //{
         
           
        //    decimal CAmount = Convert.ToDecimal(LbCAmount.Text);
        //    decimal Tune = ((TxTune.Text).ToString() !="" ) ? Convert.ToDecimal(TxTune.Text) : 0;
        //    decimal Price = ((LbPrice.Text).ToString() != "") ? Convert.ToDecimal(LbPrice.Text) : 0;
        //    decimal Amount = ((LbAmount.Text).ToString() != "") ? Convert.ToDecimal(LbAmount.Text) : 0;
        //    if (RadioButtonList1.SelectedValue=="1")//四捨五入
        //    {
                
        //       // CAmount1 = Convert.ToInt16(Math.Round(CAmount, 1));

        //        decimal sum = (((Price*CAmount )/Amount)*Tune)/100;
        //        LbCAmountAmount.Text = Convert.ToInt16(Math.Round(sum, 1)).ToString();
        //    }
        //    if (RadioButtonList1.SelectedValue == "2")
        //    {
        //        //CAmount1 = Convert.ToInt16(Math.Ceiling(CAmount));//無條件進位
        //        decimal sum = (((Price * CAmount) / Amount) * Tune) / 100;
        //        LbCAmountAmount.Text = Convert.ToInt16(Math.Ceiling(sum)).ToString();
        //    }
        //    if (RadioButtonList1.SelectedValue == "3")
        //    {
        //        //CAmount1 = Convert.ToInt16(Math.Floor(CAmount));//.無條件捨去
        //        decimal sum = (((Price * CAmount) / Amount) * Tune) / 100;
        //        LbCAmountAmount.Text = Convert.ToInt16(Math.Floor(sum)).ToString();

        //    }
        //    if (RadioButtonList1.SelectedValue == "4")
        //    {
        //        //CAmount1 = Convert.ToInt16(Math.Round(CAmount, 2));
        //        decimal sum = (((Price * CAmount) / Amount) * Tune) / 100;
        //        //Double.Parse(d.ToString("2F"));
        //       //Double LbCAmountAmount1 =  Double.Parse(sum.ToString("2F"));
        //        LbCAmountAmount.Text = sum.ToString("f2");

        //    }
        //    if (RadioButtonList1.SelectedValue == "5")
        //    {
        //        //CAmount1 = Convert.ToInt16(Math.Round(CAmount, 3));
        //        decimal sum = (((Price * CAmount) / Amount) * Tune) / 100;
        //        LbCAmountAmount.Text = sum.ToString("f3");

        //        //LbCAmountAmount.Text = Convert.ToInt16(Math.Round(sum, 4)).ToString();

        //    }

        //    //result = Math.Round((s / 3), 2);
        //    string value = RadioButtonList1.SelectedValue;

         
           

        //}

        protected void BtExcute_Click(object sender, EventArgs e)
        {
            if (TxTune.Text != "")
            {
                decimal APrice = 0;
                
                APrice = ((decimal.Parse(LbAmount.Text) * decimal.Parse(LbPrice.Text)) + ((decimal.Parse(LbPrice.Text) * (decimal.Parse(LbCAmount.Text) - decimal.Parse(LbAmount.Text))) * (decimal.Parse(TxTune.Text)/100))) / decimal.Parse(LbCAmount.Text);

                if (RadioButtonList1.SelectedValue == "1")//四捨五入
                {
                    
                    APrice = Convert.ToInt16(Math.Round(APrice, 1));
                }
                if (RadioButtonList1.SelectedValue == "2")
                {
                   //無條件進位

                    APrice = Convert.ToInt16(Math.Ceiling(APrice));
                }
                if (RadioButtonList1.SelectedValue == "3")
                {
                    //.無條件捨去

                    APrice = Convert.ToInt16(Math.Floor(APrice));

                }
                if (RadioButtonList1.SelectedValue == "4")
                {
                    
                    APrice =decimal.Parse(APrice.ToString("f2"));

                }
                if (RadioButtonList1.SelectedValue == "5")
                {

                    APrice =decimal.Parse(APrice.ToString("f3"));

              

                }
                string SQLString = "Update Bid_Library SET [APrice]= '" + APrice + "'  where PriceID=" + PriceID + "";
                string database = Session["DatabaseName"].ToString();
                bool result= WebModel.SQLAction(database, SQLString);
              if (result)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('已完成存檔');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔失敗');", true);

                }

            }
        }
     
    }
}