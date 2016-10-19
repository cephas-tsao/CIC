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
    public partial class CChangeSummaryA : System.Web.UI.Page
    {
        int Cedittion = 0;
        int Eedittion = 0;
        string ErrorString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //ID = (SystemSet.GetRequestSet("ID") != "") ? SystemSet.GetRequestSet("ID") : "";
            string database = Session["DatabaseName"].ToString();
            if (Session["ProjectCode"] != null)
            {
                Cedittion = WebModel.MaxAnyID(database, "CBudget_Change", Session["ProjectCode"].ToString(), "CEdition") + 1;
                Eedittion = WebModel.MaxAnyID(database, "EBudget_Change", Session["ProjectCode"].ToString(), "EEdition") ;
                LbCNum.Text = Cedittion.ToString();
            }
            if (!IsPostBack)
            {
               
                for(int  i=1; i<=Cedittion; i++)
                {
                    DropDownList1.Items.Add(new ListItem(i.ToString(), i.ToString()));

                    DropDownList1.SelectedValue = Cedittion.ToString();
                }
                for (int i = 1; i <= Eedittion; i++)
                {
                    DropDownList2.Items.Add(new ListItem(i.ToString(), i.ToString()));

                  
                }

            }
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            
          
            string database = Session["DatabaseName"].ToString();
            string _TableName = "CBudget_Change";
            

           
         
            //檢查標題文字

            //ErrorString += (TxCDate.Text) == string.Empty ? "變更核定日期請填入!!\\n" : "";
            //ErrorString += (TxCNo.Text) == string.Empty ? "變更核定文號請填入!!\\n" : "";
            //ErrorString += (TxDuration.Text) == string.Empty ? "追加減工期請填入!!\\n" : "";
            //ErrorString += (TxFdate.Text) == string.Empty ? "變更後預計完工日期請填入!!\\n" : "";
            //ErrorString += (TxIDMoney.Text) == string.Empty ? "總追加減金額請填入!!\\n" : "";
            //ErrorString += (TxCamount.Text) == string.Empty ? "變更後合約總價請填入!!\\n" : "";
         


            //確認是否全選
            //if (ErrorString == "")
            //{
                //確認選項是否存在或過期           
                if (Session["ProjectCode"] == null)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
                }
                else
                {
                    //確認資料庫是否有資料
                    //if (datacheck(Session["Bid"].ToString()) == false)
                    //{

                        WebModel.SaveAction(database, _TableName, GetDataBox());

                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                        Response.Write("<script>self.close()</script>");
                    //}
                    //else
                    //{
                    //    WebModel.EditAction_bid(database, _TableName, Session["bid"].ToString(), GetDataBox());
                    //    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('修改完成');", true);
                    //}
                }

            //}
            //else
            //{

            //    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

            //}

        }
        //取得建入資料
        protected DataTable GetDataBox()
        {

            DataTable DataTableBox = new DataTable();
            string SQLString = "PID,CEdition,EEdition,ApprovedDate,ApprovedDoc,AdjestDuration,AdjestBookFinishDate,AdjestPrice,AdjestTotalPrice,Notes";
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
                DataTableDr["CEdition"] = Cedittion;
                DataTableDr["EEdition"] = DropDownList2.SelectedValue;            
                DataTableDr["ApprovedDate"] = TxCDate.Text != "" && TxCDate.Text != "0" ? DateTime.Parse(TxCDate.Text).ToString("yyyy/MM/dd") : "";
                DataTableDr["ApprovedDoc"] = TxCNo.Text;
                DataTableDr["AdjestDuration"] = TxDuration.Text;
                DataTableDr["AdjestBookFinishDate"] = TxFdate.Text != "" && TxFdate.Text != "0" ? DateTime.Parse(TxFdate.Text).ToString("yyyy/MM/dd") : "";
                DataTableDr["AdjestPrice"] = TxIDMoney.Text!=""?TxIDMoney.Text:"0";
                DataTableDr["AdjestTotalPrice"] = TxCamount.Text!=""?TxCamount.Text:"0";
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