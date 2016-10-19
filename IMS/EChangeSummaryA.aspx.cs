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
    public partial class EChangeSummaryA : System.Web.UI.Page
    {
        int Cedittion = 0;
        int Eedittion = 0;
        string ErrorString="";
        protected void Page_Load(object sender, EventArgs e)
        {
          
            string database = Session["DatabaseName"].ToString();
            if (Session["ProjectCode"] != null)
            {
                Cedittion = WebModel.MaxAnyID(database, "CBudget_Change", Session["ProjectCode"].ToString(), "CEdition");
                Eedittion = WebModel.MaxAnyID(database, "EBudget_Change", Session["ProjectCode"].ToString(), "EEdition")+1;
                LbCNum.Text = Eedittion.ToString();
            }
            if (!IsPostBack)
            {

                for (int i = 1; i <= Cedittion; i++)
                {
                    DropDownList1.Items.Add(new ListItem(i.ToString(), i.ToString()));

                }
                for (int i = 1; i <= Eedittion; i++)
                {
                    DropDownList2.Items.Add(new ListItem(i.ToString(), i.ToString()));

                    DropDownList2.SelectedValue = Eedittion.ToString();
                }

            }
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {


            string database = Session["DatabaseName"].ToString();
            string _TableName = "EBudget_Change";
            string UdCBudget = "Update CBudget_Change set EEdition=" + Eedittion + " where CEdition=" + DropDownList1.SelectedValue;
            string SQLEBLock = "Select * from ProjectM0 where PID=" + Session["ProjectCode"].ToString();
            string EBLock = WebModel.SItemName(database, SQLEBLock, "EBudgetLock");
            //確認選項是否存在或過期           
            if (Session["ProjectCode"] == null)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            else if (EBLock !="1")
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 執行預算尚未鎖定，請鎖定後再變更!!');", true);

            }
            else
            {
              
                WebModel.SaveAction(database, _TableName, GetDataBox());
                WebModel.SQLAction(database, UdCBudget);
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                Response.Write("<script>self.close()</script>");
              
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
                //DataTableDr["CWID"] =SystemSet.GetRequestSet("ID") ;
                DataTableDr["EEdition"] = Eedittion;
                //DataTableDr["CEdition"] = DropDownList1.SelectedValue;
                DataTableDr["ApprovedDate"] = TxCDate.Text;
                DataTableDr["ApprovedDoc"] = TxCNo.Text;
                DataTableDr["AdjestDuration"] = TxDuration.Text;
                DataTableDr["AdjestBookFinishDate"] = TxFdate.Text;
                DataTableDr["AdjestPrice"] = TxIDMoney.Text != "" ? TxIDMoney.Text : "0";
                DataTableDr["AdjestTotalPrice"] = TxCamount.Text != "" ? TxCamount.Text : "0";
                DataTableDr["Notes"] = TxNotes.Text;



                DataTableBox.Rows.Add(DataTableDr);
            #endregion


            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇專案');", true);
            }
            return DataTableBox;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Write("<script>self.close()</script>");
        }
    }
}