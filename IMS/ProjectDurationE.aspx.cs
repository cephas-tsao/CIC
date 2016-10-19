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
    public partial class ProjectDurationE : System.Web.UI.Page
    {
        string _TableName = "ProjectM2";
        string ErrorString = "";
        string SQLString = "Pid,StartDeadlinetype,StartDeadline,CompletionEscDeadline,DelayEscDeadline";

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                CreatRadioButtonList();//建立radiobutton選項
               
                Recovery_Click(this, null);
            }
            string datasource = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            DurationPunish.ConnectionString = datasource;
            //DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            //DDL.Visible = false;
        }
        protected void CreatRadioButtonList()
        {
            SetRadioButtonList("StartDeadlinetype", Unitlist.StartDeadlinetype(), "");  //承攬方式
        }

        protected void SetRadioButtonList(string thisName, string thisData, string thisSet)
        {
            RadioButtonList thisRadioButtonList = (RadioButtonList)Page.FindControl(thisName);

            thisRadioButtonList.Items.Clear();

            int count = 0;
            foreach (string DataName in thisData.Split(','))
            {
                thisRadioButtonList.Items.Add(new ListItem(DataName, count.ToString()));
                count++;
            }
            count = 0;
        }
        protected void StartDeadlinetype_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (StartDeadlinetype.SelectedIndex == 2)
            {
                Itemname.Text = "西元(YYYY/MM/DD)";
             
            }
            else
            {
                Itemname.Text = "天";
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                Label Duration = (Label)e.Row.FindControl("Duration");
                Label DurationType = (Label)e.Row.FindControl("DurationType");
                Label PunishType = (Label)e.Row.FindControl("PunishType");
                Label Punish = (Label)e.Row.FindControl("Punish");
                             
                Duration.Text = DurationType.Text == "0" ? "西元" + Duration.Text + "年" : DurationType.Text == "1" ? "工作天" + Duration.Text + "天" : DurationType.Text == "2" ? "日曆天" + Duration.Text : DurationType.Text == "3" ? "其他" + Duration.Text + "天" : "";
                Punish.Text = PunishType.Text == "0" ? "千分之" + Punish.Text + "/每天" : PunishType.Text == "1" ? "一天" + Punish.Text + "元" : "";
            
           
            }
        }
        //儲存資料
        protected void SaveAction(object sender, EventArgs e)
        {

            string database = Session["DatabaseName"].ToString();
            //檢查標題文字
            //ErrorString += (StartDeadlinetype.SelectedIndex) == -1 ? "開工期限方式請選擇!!\\n" : "";
            //ErrorString += (StartDeadline.Text) == string.Empty ? "開工期限天數請填入!!\\n" : "";
            //ErrorString += (CompletionEscDeadline.Text) == string.Empty ? "完工提報期限請填入!!\\n" : "";
            //ErrorString += (DelayEscDeadline.Text) == string.Empty ? "工期延展請填入!!\\n" : "";



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
                    //確認資料庫是否有資料
                    if (datacheck(Session["ProjectCode"].ToString()) == false)
                    {

                      string result= WebModel.SaveAction_pro(database, _TableName, GetDataBox(), Session["ProjectCode"].ToString());
                      if (result !="0")
                        {
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔失敗');", true);
                        }
                    }
                    else
                    {
                    
                       bool result= WebModel.EditAction_pro(database, _TableName, Session["ProjectCode"].ToString(), GetDataBox());
                       if (result)
                       {
                           ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('修改完成');", true);
                       }
                       else
                       {
                           ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('修改失敗');", true);
                       }
                    }
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
                DataTableDr["Pid"] = Session["ProjectCode"].ToString();
                DataTableDr["StartDeadlinetype"] = StartDeadlinetype.SelectedItem.Value;
                DataTableDr["StartDeadline"] = StartDeadline.Text;
                DataTableDr["CompletionEscDeadline"] = CompletionEscDeadline.Text;
                DataTableDr["DelayEscDeadline"] = DelayEscDeadline.Text;

                DataTableBox.Rows.Add(DataTableDr);
            #endregion


            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            return DataTableBox;
        }
        public bool datacheck(string data)
        {
            string database = Session["DatabaseName"].ToString();
            if (Session["ProjectCode"] == null)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            else
            {


              
                DataTable DataTableBox = WebModel.LoadContentData_pro(database, _TableName, Session["ProjectCode"].ToString(), SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {

                    return true;
                }
                else
                {

                    return false;
                }

            }
            return false;

        }

        protected void Recovery_Click(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || Session["ProjectCode"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string database = Session["DatabaseName"].ToString();
               
                DataTable DataTableBox = WebModel.LoadContentData_pro(database, _TableName, Session["ProjectCode"].ToString(), SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {

                        StartDeadlinetype.SelectedIndex = (row["StartDeadlinetype"].ToString()) !="" ? int.Parse(row["StartDeadlinetype"].ToString()) : -1;
                        StartDeadline.Text = row["StartDeadline"].ToString();
                        CompletionEscDeadline.Text = row["CompletionEscDeadline"].ToString();
                        DelayEscDeadline.Text = row["DelayEscDeadline"].ToString();


                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "edit")
            {
            //    string Duration = ((TextBox)GridView1.Rows[ID_class].FindControl("Duration")).Text.Trim();
            //    string StageName = ((TextBox)GridView1.Rows[ID_class].FindControl("StageName")).Text.Trim();
            //     string Punish = ((TextBox)GridView1.Rows[ID_class].FindControl("Punish")).Text.Trim();
            //    string Notes = ((TextBox)GridView1.Rows[ID_class].FindControl("Notes")).Text.Trim();
        

            //    GridView1.DataSourceID = "DurationPunish";
           
            //    DurationPunish.UpdateCommand = "Update ProjectM_DurationPunish SET PID='" + Session["ProjectCode"] + "', StageName='" + StageName + "', Duration=" + Duration + ", Notes='" + Notes + "', Punish=" + Punish + " FROM ProjectM_DurationPunish  where PunishID=@PunishID";
                OpenNewWindow("ProjectDurationEdit.aspx");
            }
            if (e.CommandName == "delete")
            {
                DurationPunish.DeleteCommand = "delete ProjectM_DurationPunish WHERE [PunishID] = @PunishID";
                
            }
        }

        protected void add_Click(object sender, EventArgs e)
        {
            OpenNewWindow("ProjectDurationNew.aspx");
        }
        public void OpenNewWindow(string url)
        {

            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=500,width=950";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}', 'yourWin', '{1}');</script>", url, winFeatures));

        }
    }
}