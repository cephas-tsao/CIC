using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;
using DAL;
using System.Data.SqlClient;

namespace IMS
{
    public partial class BidDurationE : System.Web.UI.Page
    {
        string _TableName = "BidM3";
        string ErrorString = "";
        string SQLString = "bid,StartDeadlinetype,StartDeadline,CompletionEscDeadline,DelayEscDeadline";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CreatRadioButtonList();//建立radiobutton選項
                LoadData();
                Recovery_Click(this, null);
            }
            //DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            //DDL.Visible = false;
        }

        protected void CreatRadioButtonList()
        {
            SetRadioButtonList("StartDeadlinetype", Unitlist.StartDeadlinetype(), "");  //承攬方式
        }

        protected void SetRadioButtonList(string thisName, string thisData, string thisSet)
        {
            RadioButtonList thisRadioButtonList = (RadioButtonList)FindControl(thisName);

            thisRadioButtonList.Items.Clear();

            int count = 0;
            foreach (string DataName in thisData.Split(','))
            {
                thisRadioButtonList.Items.Add(new ListItem(DataName, count.ToString()));
                count++;
            }
            count = 0;
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
                if (Session["bid"] == null)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
                }
                else
                {
                    //確認資料庫是否有資料
                    if (datacheck(Session["Bid"].ToString()) == false)
                    {

                        WebModel.SaveAction_BID(database, _TableName, GetDataBox());

                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                    }
                    else
                    {
                        WebModel.EditAction_bid(database, _TableName, Session["bid"].ToString(), GetDataBox());
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('修改完成');", true);
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
            if (Session["bid"] != null)
            {
                DataTableDr["bid"] = Session["bid"].ToString();
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
            if (Session["Bid"] == null)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            else
            {


                DataTable DataTableBox = WebModel.LoadContentData_bid(database, _TableName, Session["Bid"].ToString(), SQLString);
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
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || Session["bid"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string database = Session["DatabaseName"].ToString();
                DataTable DataTableBox = WebModel.LoadContentData_bid(database, _TableName, Session["bid"].ToString(), SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {

                        StartDeadlinetype.SelectedIndex = row["StartDeadlinetype"].ToString() !=""?int.Parse(row["StartDeadlinetype"].ToString()):-1;
                        StartDeadline.Text = row["StartDeadline"].ToString();
                        CompletionEscDeadline.Text = row["CompletionEscDeadline"].ToString();
                        DelayEscDeadline.Text = row["DelayEscDeadline"].ToString();


                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        }
        //讀取資料
        protected void LoadData()
        {
            if (Session["DatabaseName"] == null)
            {
                Response.Redirect("../login.aspx");
            }
            string _TableName1 = "BidM_DurationPunish";
            string SQLString1 = "PunishID,bid,StageName,DurationType,Duration,PunishType,Punish,Notes";
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox = WebModel.LoadContentData_bid(database, _TableName1, Session["bid"].ToString(), SQLString1);


            //if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            //{
                Repeater1.DataSource = DataTableBox;
                Repeater1.DataBind();
              //  DataTableBox.Dispose(); //釋放Table資源
            //}
        }
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
           
             if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {

                    ((Panel)e.Item.FindControl("plItem")).Visible = true;   
                    ((Panel)e.Item.FindControl("plEdit")).Visible = false;   
                  
                 
                 DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;


                    //Literal PunishID = (Literal)e.Item.FindControl("PunishID");
                    Literal StageName = (Literal)e.Item.FindControl("StageName");
                    // DropDownList DropDownList2 = (DropDownList)e.Item.FindControl("DropDownList2");
                    Literal Duration = (Literal)e.Item.FindControl("Duration");
                    Literal Punish = (Literal)e.Item.FindControl("Punish");
                    Literal Notes = (Literal)e.Item.FindControl("Notes");

                    //PunishID.Text = vsDr["PunishID"].ToString();
                    StageName.Text = vsDr["StageName"].ToString();
                    Session["bid"] = vsDr["BID"].ToString();
                    Duration.Text = vsDr["DurationType"].ToString() == "0" ? "西元" + vsDr["Duration"].ToString() + "年" : vsDr["DurationType"].ToString() == "1" ? "工作天" + vsDr["Duration"].ToString() + "天" : vsDr["DurationType"].ToString() == "2" ? "日曆天" + vsDr["Duration"].ToString() : vsDr["DurationType"].ToString() == "3" ? "其他" + vsDr["Duration"].ToString() + "天" : "";
                    Punish.Text = vsDr["PunishType"].ToString() == "0" ? "千分之" + vsDr["Punish"].ToString() + "/每天" : vsDr["PunishType"].ToString() == "1" ? "一天" + vsDr["Punish"].ToString()+"元" : "";
                    Notes.Text = vsDr["Notes"].ToString();
                
                }
            }


       

        protected void add_Click(object sender, EventArgs e)
        {
            //this.ClientScript.RegisterStartupScript(this.GetType(), "Open", "window.open('BidDurationNew.aspx');", true);
           // OpenNewWindow("BidDurationNew.aspx");
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('BidDurationNew.aspx', 'window','height=350,width=1200');</script>"));
        }

        public void OpenNewWindow(string url)
        {

            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=500,width=950";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}', 'yourWin', '{1}');</script>", url, winFeatures));

        }
      
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            if (e.CommandName == "Edit")
            {
                //((Panel)e.Item.FindControl("plItem")).Visible = false;
                //((Panel)e.Item.FindControl("plEdit")).Visible = true;
               // OpenNewWindow("BidDurationEdit.aspx");
                ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('BidDurationEdit.aspx?PunishID={0}', 'window','height=350,width=1200');</script>", e.CommandArgument));
            }
            #region 使用textbox方式編輯
            // else if (e.CommandName == "Update")
           //{

                             
            //    ((Panel)e.Item.FindControl("plItem")).Visible = false;
            //   ((Panel)e.Item.FindControl("plEdit")).Visible = true;

            //   //string PunishID = ((TextBox)e.Item.FindControl("PunishID")).Text.Trim();
            //   string StageName = ((TextBox)this.Repeater1.Items[e.Item.ItemIndex].FindControl("TxStageName")).Text.Trim();
            //   string Duration = ((TextBox)this.Repeater1.Items[e.Item.ItemIndex].FindControl("TxDuration")).Text.Trim();
            //   string Punish = ((TextBox)this.Repeater1.Items[e.Item.ItemIndex].FindControl("TxPunish")).Text.Trim();
            //   string Notes = ((TextBox)this.Repeater1.Items[e.Item.ItemIndex].FindControl("TxNotes")).Text.Trim();
            //   SqlDataAdapter adp = new SqlDataAdapter("Update BidM_DurationPunish set StageName= @StageName, Duration=@Duration, Punish=@Punish,Notes=@Notes where PunishID = " + e.CommandArgument + " ", Utility.DBconnection.connect_string(Session["DatabaseName"].ToString()));
            //   adp.SelectCommand.Parameters.AddWithValue("@StageName", StageName);
            //   adp.SelectCommand.Parameters.AddWithValue("@Duration", Duration);
            //   adp.SelectCommand.Parameters.AddWithValue("@Punish", Punish);
            //   adp.SelectCommand.Parameters.AddWithValue("@Notes", Notes);
             
                     
            //DataSet ds = new DataSet();
            //adp.Fill(ds);
         
            //ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 檔案已儲存');", true);
        //    LoadData();
        //}
           
            //else if (e.CommandName == "Cancel")
            //{
            //    ((Panel)e.Item.FindControl("plItem")).Visible = true;
            //    ((Panel)e.Item.FindControl("plEdit")).Visible = false;
            //} 
            #endregion

            else if (e.CommandName == "Delete")
            {
                string SQLString_D = "delete BidM_DurationPunish where PunishID='" + e.CommandArgument + "'";
                string database = Session["DatabaseName"].ToString();
                if ((Session["bid"] == null))
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
                }
                else
                {
                    WebModel.SQLAction(database, SQLString_D);
                    //LoadData();
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 刪除成功');", true);

                }
                LoadData();
            }

        }
        protected void DurationType_IndexChange(object sender, EventArgs e)
        {
            if (StartDeadlinetype.SelectedIndex == 0)
            {
                ltDuration.Text = "天";
            }
            else if
                (StartDeadlinetype.SelectedIndex == 1)
            {
                ltDuration.Text = "天";
            }
            else if (StartDeadlinetype.SelectedIndex == 2)
            {
                ltDuration.Text = "";
            }
            else if (StartDeadlinetype.SelectedIndex == 3)
            {
                ltDuration.Text = "天";
            }
        }
        protected void callback_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
            Response.Redirect("BidDurationE.aspx");
        }
        }
    }
