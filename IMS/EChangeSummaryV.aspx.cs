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
    public partial class EChangeSummaryV : System.Web.UI.Page
    {
        protected string ID;
        protected void Page_Load(object sender, EventArgs e)
        {
            ID = (SystemSet.GetRequestSet("ID") != "") ? SystemSet.GetRequestSet("ID") : "";
            LoadContent();

        }

        protected void LoadContent()
        {
            string database = Session["DatabaseName"].ToString();
            if (ID != "")
            {
                string SQLString = "Select * From EBudget_Change Where PID= " + Session["ProjectCode"] + " And EEdition=" + ID + "";
                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {

                        LbNum.Text = row["EEdition"].ToString();
                        LbDate.Text = row["ApprovedDate"].ToString();
                        LbNo.Text = row["ApprovedDoc"].ToString();
                        LbDuration.Text = row["AdjestDuration"].ToString();
                        LbPredict.Text = row["AdjestBookFinishDate"].ToString();
                        LbIdMoney.Text = row["AdjestPrice"].ToString();
                        LbCAmount.Text = row["AdjestTotalPrice"].ToString();
                        LbNotes.Text = row["Notes"].ToString();

                    }
                }
            }
        }

    }
}