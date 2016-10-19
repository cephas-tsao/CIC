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
    public partial class ProjectDurationNew : System.Web.UI.Page
    {
        string _TableName = "ProjectM_DurationPunish";
        string ErrorString = "";
        string SQLString = "Pid,StageName,DurationType,Duration,PunishType,Punish,Notes";

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || (Session["ProjectCode"] == null)))
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                CreatRadioButtonList();//建立radiobutton選項
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
            ErrorString += (DurationType.SelectedIndex) == -1 ? "工期方式請選擇!!\\n" : "";
            ErrorString += (Duration.Text) == string.Empty ? "開工期限天數請填入!!\\n" : "";
            ErrorString += (PunishType.SelectedIndex) == -1 ? "逾罰請填入!!\\n" : "";
            ErrorString += (Punish.Text) == string.Empty ? "逾罰請填入!!\\n" : "";
        


            //確認是否全選
            if (ErrorString == "")
            {
                //確認選項是否存在或過期           
                if (Session["ProjectCode"] == null)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
                }
                else
                {
                   
                    WebModel.SaveAction_pro(database, _TableName, GetDataBox(),Session["ProjectCode"].ToString());
                   
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                   
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
            if (Session["ProjectCode"] != null)
            {
                DataTableDr["pid"] = Session["ProjectCode"].ToString();
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
      

        protected void Clear_Click(object sender, EventArgs e)
        {
            DurationType.SelectedIndex = -1;
            PunishType.SelectedIndex = -1;
            StageName.Text = "";
            Duration.Text = "";
            Punish.Text = "";
            Notes.Text = "";
        }
        protected void DurationType_IndexChange(object sender, EventArgs e)
        {
            if (DurationType.SelectedIndex == 0)
            {
                ltDuration.Text = "(YYYY/MM/DD)";
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