using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using Utility;

namespace IMS
{
    public partial class BidDurationEdit : System.Web.UI.Page
    {
        string _TableName = "BidM_DurationPunish";
        string ErrorString = "";
        string SQLString = "bid,StageName,DurationType,Duration,PunishType,Punish,Notes";

        string PunishID = (SystemSet.GetRequestSet("PunishID") != "") ? SystemSet.GetRequestSet("PunishID") : "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || (Session["bid"] == null)))
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                CreatRadioButtonList();//建立radiobutton選項
                Recovery_Click(this, null);
            }
        }

        protected void CreatRadioButtonList()
        {
            SetRadioButtonList("DurationType", Unitlist.DurationType_Punish(), "");  //承攬方式
            SetRadioButtonList("PunishType", Unitlist.Punish(), "");  //承攬方式
        }

        protected void SetRadioButtonList(string thisName, string thisData, string thisSet)
        {
            RadioButtonList thisRadioButtonList = (RadioButtonList)FindControl(thisName);

            thisRadioButtonList.Items.Clear();

            int count = 0;
            foreach (string DataName in thisData.Split(','))
            {
                thisRadioButtonList.Items.Add(new ListItem(DataName, count.ToString()));
                //thisRadioButtonList.Attributes.CssStyle.Add("padding","3 5em");

                count++;
            }
            count = 0;
        }

        //儲存資料
        protected void SaveAction(object sender, EventArgs e)
        {

            string database = Session["DatabaseName"].ToString();
            //檢查標題文字
            ErrorString += (StageName.Text) == string.Empty ? "階段名稱請填入!!\\n" : "";
            ErrorString += (DurationType.SelectedIndex) == -1 ? "工期請選擇!!\\n" : "";
            ErrorString += (Duration.Text) == string.Empty ? "工期天數請填入!!\\n" : "";
            ErrorString += (PunishType.SelectedIndex) == -1 ? "逾罰型式請選擇!!\\n" : "";
            ErrorString += (Punish.Text) == string.Empty ? "逾罰內容請填入!!\\n" : "";
           // ErrorString += (Notes.Text) == string.Empty ? "工期延展請填入!!\\n" : "";


            //確認是否全選
            if (ErrorString == "")
            {
                //確認選項是否存在或過期           
                if (Session["bid"] == null)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
                }
                else
                {
                    //確認資料庫是否有資料
                    //if (datacheck(Session["Bid"].ToString()) == false)
                    //{

                    //WebModel.SaveAction_BID(database, _TableName, GetDataBox());

                    //ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                    //}
                    //else
                    //{
                    WebModel.EditAction_Anyid(database, _TableName, "PunishID",PunishID, GetDataBox());
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('修改完成');", true);
                        Response.Write("<script>window.opener.document.getElementById('callback').click();</script>");        
                    //}
                }

            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

            }
        }

        //取得建入資料
        protected DataTable GetDataBox()
        {

            DataTable DataTableBox = new DataTable();

            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }


            //後台功能，必需要有的欄位名稱               

            DataRow DataTableDr = DataTableBox.NewRow();

            #region 內容設定
            if (Session["bid"] != null)
            {
                DataTableDr["bid"] = Session["bid"].ToString();
                DataTableDr["StageName"] = StageName.Text;
                DataTableDr["DurationType"] = DurationType.SelectedItem.Value;
                DataTableDr["Duration"] = Duration.Text;
                DataTableDr["PunishType"] = PunishType.SelectedItem.Value;
                DataTableDr["Punish"] = Punish.Text;
                DataTableDr["Notes"] = Notes.Text;

                DataTableBox.Rows.Add(DataTableDr);
            #endregion


            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            return DataTableBox;
        }
      
        protected void Recovery_Click(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || Session["bid"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string database = Session["DatabaseName"].ToString();
                string SQLSelect = "Select * from BidM_DurationPunish where PunishID=" + PunishID;
                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLSelect);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        // DataTableDr["bid"] = Session["bid"].ToString();
                        Session["bid"] = row["bid"].ToString();
                        DurationType.SelectedIndex = int.Parse(row["DurationType"].ToString());
                        StageName.Text = row["StageName"].ToString();
                        Duration.Text = row["Duration"].ToString();                       
                        PunishType.SelectedIndex = int.Parse(row["PunishType"].ToString());
                        Punish.Text = row["Punish"].ToString();
                        Notes.Text = row["Notes"].ToString();
                      

                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        }
        protected void DurationType_IndexChange(object sender, EventArgs e)
        {
            if (DurationType.SelectedIndex == 0)
            {
                ltDuration.Text = "年";
            }
            else if
                (DurationType.SelectedIndex == 1)
            {
                ltDuration.Text = "天";
            }
            else if (DurationType.SelectedIndex == 2)
            {
                ltDuration.Text = "天";
            }
            else if (DurationType.SelectedIndex == 3)
            {
                ltDuration.Text = "";
            }
        }
        protected void PunishType_IndexChange(object sender, EventArgs e)
        {
            if (PunishType.SelectedIndex == 0)
            {
                LtPunish.Text = "/每天";
            }
            else if (PunishType.SelectedIndex == 1)
            {
                LtPunish.Text = "元";
            }
        }
    }
}
