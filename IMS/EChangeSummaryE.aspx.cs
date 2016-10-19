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
    public partial class EChangeSummaryE : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ID = (SystemSet.GetRequestSet("ID") != "") ? SystemSet.GetRequestSet("ID") : "";
            if (!IsPostBack)
            {
                LoadContent();
            }
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
        //取得建入資料
        protected DataTable GetDataBox()
        {

            DataTable DataTableBox = new DataTable();
            string SQLString = "PID,EEdition,ApprovedDate,ApprovedDoc,AdjestDuration,AdjestBookFinishDate,AdjestPrice,AdjestTotalPrice,Notes";
            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }


            //後台功能，必需要有的欄位名稱               

            DataRow DataTableDr = DataTableBox.NewRow();

            #region 內容設定
            if (Session["ProjectCode"] != null)
            {
                DataTableDr["PID"] = Session["ProjectCode"].ToString();
                DataTableDr["EEdition"] = LbNum.Text;
                DataTableDr["ApprovedDate"] = LbDate.Text != "" && LbDate.Text != "0" ? DateTime.Parse(LbDate.Text).ToString("yyyy/MM/dd") : "";
                DataTableDr["ApprovedDoc"] = LbNo.Text;
                DataTableDr["AdjestDuration"] = LbDuration.Text != "" && LbDuration.Text != "0" ? int.Parse(LbDuration.Text) : 0;
                DataTableDr["AdjestBookFinishDate"] = LbPredict.Text != "" && LbPredict.Text != "0" ? DateTime.Parse(LbPredict.Text).ToString("yyyy/MM/dd") : "";
                DataTableDr["AdjestPrice"] = decimal.Parse(LbIdMoney.Text);
                DataTableDr["AdjestTotalPrice"] = decimal.Parse(LbCAmount.Text);
                DataTableDr["Notes"] = LbNotes.Text;

                DataTableBox.Rows.Add(DataTableDr);
            #endregion


            }

            return DataTableBox;
        }


        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Write("<script> window.close();</script>");
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            bool result = WebModel.EditAction_Anyid(database, "EBudget_Change", "UID", ID, GetDataBox());
            if (result)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                Response.Write("<script> window.close();</script>");
            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔失敗');", true);

            }
        }
    }
}