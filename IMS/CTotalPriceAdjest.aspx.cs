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
    public partial class CTotalPriceAdjest : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            LB_NormalPrice.Text = (SystemSet.GetRequestSet("TTPrice") != "") ? SystemSet.GetRequestSet("TTPrice") : "";
            if (!IsPostBack)
            {
                //decimal A = decimal.Parse(LB_NormalPrice.Text, System.Globalization.NumberStyles.Number);
                //decimal B = decimal.Parse(TB_Percent.Text, System.Globalization.NumberStyles.Number) / 100;
                //int C = (int)(A * B);
                //TB_Price.Text = Convert.ToString(C);
            }
            
        }
        protected void TB_Percent_TextChanged(object sender, EventArgs e)
        {
            decimal A = decimal.Parse(LB_NormalPrice.Text, System.Globalization.NumberStyles.Number);
            decimal B = decimal.Parse(TB_Percent.Text, System.Globalization.NumberStyles.Number) / 100;
            int C = (int)(A * B);
            TB_Price.Text = Convert.ToString(C);
        }
        protected void TB_Price_TextChanged(object sender, EventArgs e)
        {
            decimal A = decimal.Parse(LB_NormalPrice.Text, System.Globalization.NumberStyles.Number);
            decimal B = decimal.Parse(TB_Price.Text, System.Globalization.NumberStyles.Number);
            decimal C = B / A * 100;
            TB_Percent.Text = Convert.ToString(C);
        }

        protected void CAL_Click(object sender, EventArgs e)
        {
            decimal CPrice = 0;
            if (Session["ProjectCode"] !=null)
            {
                string SQLString = "Select  *  from CBudget_WBS a left join Pro_Resource b on a.PriceID=b.PriceID where a.PID=" + Session["ProjectCode"] + " order by order_Num";
           
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
               if (DataTableBox != null && DataTableBox.Rows.Count > 0)
               {
                   foreach (DataRow row in DataTableBox.Rows)
                   {

                       string PriceID = row["PriceID"].ToString();
                       decimal price = row["CPrice"].ToString() != "" ? decimal.Parse(row["CPrice"].ToString()) : 0;
                       CPrice = (decimal.Parse(TB_Percent.Text)/100) * price;

                       if (PriceID != "" && CPrice != 0)
                       {
                           string UpdateSQL = "Update Pro_Resource set CPrice=" + CPrice + " where PID=" + Session["ProjectCode"] + " and PriceID=" + PriceID + "";
                          bool result= WebModel.SQLAction(database, UpdateSQL);
                       }
                       
                   }
               }
               ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('總價調整完畢');", true);
            }
        }
    }
}