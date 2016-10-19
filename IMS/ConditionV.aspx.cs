using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace IMS
{
    public partial class ConditionV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
        }
        //讀取資料
        protected void LoadData()
        {
            if (Session["DatabaseName"] == null && Session["bid"] == null)
            {
                Response.Redirect("../login.aspx");
            }

            string SQLString = "Select * from BidM0 a Left join  BidAssess e on a.bid=e.bid where a.bid ='" + Session["bid"].ToString() + "'";
            string database = Session["DatabaseName"].ToString();

            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);

            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {

                foreach (DataRow row in DataTableBox.Rows)
                {
                    Session["bid"] = row["bid"].ToString();

                    LbCondition1.Text = row["Condition1"].ToString();
                    LbConditionNote1.Text = row["ConditionNote1"].ToString();
                    LbCondition2.Text = row["Condition2"].ToString();
                    LbConditionNote2.Text = row["ConditionNote2"].ToString();
                    LbCondition3.Text = row["Condition3"].ToString();
                    LbConditionNote3.Text = row["ConditionNote3"].ToString();
                    LbCondition4.Text = row["Condition4"].ToString();
                    LbConditionNote4.Text = row["ConditionNote4"].ToString();
                    LbCondition5.Text = row["Condition5"].ToString();
                    LbConditionNote5.Text = row["ConditionNote5"].ToString();
                    LbCondition6.Text = row["Condition6"].ToString();
                    LbConditionNote6.Text = row["ConditionNote6"].ToString();
                    


                }
            }
            DataTableBox.Dispose(); //釋放Table資源
        }
    }
}