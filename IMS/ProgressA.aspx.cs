using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data.SqlClient;
using System.Data;

namespace IMS
{
    public partial class ProgressA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["ProjectCode"] == null || Session["ProjectCode"] == "")
            {

                Response.Write("<script>alert('請先選擇專案');location.href='Main.aspx';</script>");

            }
            else
            {
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.SelectCommand = "Select * from Progress_RVersion where pid=" + Session["ProjectCode"].ToString();
                if (Btn_DailyReload.Text != "")
                {
                    SqlDataSource2.SelectCommand = "Select * From Progress_Real INNER JOIN Progress_WIINF ON Progress_Real.ProgressID = Progress_WIINF.ProgressID Where Progress_Real.ProjectID= " + Session["ProjectCode"].ToString() + " And Progress_Real.Version= " + Btn_DailyReload.Text.Substring(11, 1) + "";
                }
                SqlDataSource3.SelectCommand = "SELECT [ProgressID],[WIName], [WIID] FROM [Progress_WIINF] WHERE ProjectID=" + Session["ProjectCode"].ToString();

            }
            if (!IsPostBack)
            {
                string database = Session["DatabaseName"].ToString();
                string SQLselect = "Select max(Version) as Version from Progress_RVersion where pid=" + Session["ProjectCode"].ToString();
                ViewState["NewVersion"] = WebModel.SItemName(database, SQLselect, "Version")!=""?int.Parse(WebModel.SItemName(database, SQLselect, "Version"))+1:1;
                //if (WebModel.SItemName(database, SQLselect, "Version") != "")
                //{
                //    LB_Version.Text = WebModel.SItemName(database, SQLselect, "Version");

                //    TB_Date.Text = DateTime.Now.ToString("yyyy-MM-dd");
                //    int version = int.Parse(LB_Version.Text) + 1;
                //    Btn_Insert.Text = "新增至第" + LB_Version.Text + "版";
                //    Btn_InsertNew.Text = "另存至第" + version + "版";
                //    Btn_DailyReload.Text = "載入日報資訊並更新至第" + LB_Version.Text + "版";
                //    Btn_DailyReloadNew.Text = "載入日報資訊並另存至第" + version + "版";
                //}
                //else
                //{
                //    string Insert = "Insert into Progress_RVersion ([PID],[Version],[TotalPrice],[LastDate]) values (" + Session["ProjectCode"].ToString() + ",1,0," + DateTime.Now.ToString("yyyy-MM-dd") + ")";
                //    bool result = WebModel.SQLAction(database, Insert);

                //}
            }
           
        }
        protected void IBtn_Draw_Click(object sender, ImageClickEventArgs e)
        {
            Response.Write("<script>window.open('Progress_A_Gantt.aspx','甘特圖',config='height=800,width=800,scrollbars=yes');</script>");
        }
        //protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        //{
        //    int Version = 5;
        //    int MaxVersion = 5;
        //    Pnl_Main.Visible = true;
        //    LB_Version.Visible = true;
        //    //LB_Version.Text = Version;
        //    Btn_DailyReload.Text = "載入日報資訊並更新至第" + Version + "版";
        //    Btn_DailyReloadNew.Text = "載入日報資訊並另存至第" + (MaxVersion + 1) + "版";
        //    Btn_Insert.Text = "新增至第" + Version + "版";
        //    Btn_InsertNew.Text = "另存至第" + (MaxVersion + 1) + "版";
        //}
        protected void Button3_Click(object sender, EventArgs e)
        {
              string database = Session["DatabaseName"].ToString();
            LB_Cal01.Visible = true;
            LB_Cal02.Visible = true;
            LB_CalAns.Visible = true;
            //LB_CalAns.Text = "35.6";
             decimal done=0;
            string SQLSelect = "Select Progress_Real.CompleteAmount, Progress_Real.WorkDate, Progress_WIINF.Amount, EBudget_WBS.LastENumber, EBudget_WBS.EUnitPrice From Progress_Real INNER JOIN Progress_WIINF ON Progress_Real.ProgressID = Progress_WIINF.ProgressID INNER JOIN EBudget_WBS ON Progress_WIINF.WBSID = EBudget_WBS.EWID Where Progress_Real.ProjectID="+Session["ProjectCode"].ToString()+" And Progress_Real. WorkDate <='"+TB_Date.Text+"' And Progress_Real.Version= "+LB_Version.Text+"";
            DataTable Dt=WebModel.LoadSetContentData(database,SQLSelect);
            if (Dt != null && Dt.Rows.Count > 0)
            {
                foreach (DataRow row in Dt.Rows)
                {

                    var CompleteAmount = row["CompleteAmount"].ToString() !=""?row["CompleteAmount"].ToString():"0";
                    var Amount = row["Amount"].ToString() !=""?row["Amount"].ToString():"0";
                    var LastENumber = row["LastENumber"].ToString() !=""?row["LastENumber"].ToString():"0";
                    var EUnitPrice = row["EUnitPrice"].ToString() !=""?row["EUnitPrice"].ToString():"0";

                     done += decimal.Parse(LastENumber) * decimal.Parse(EUnitPrice)*(decimal.Parse(Amount)/100)*(decimal.Parse(CompleteAmount)/100);

                }
            }
            //var Select=WebModel.SItemName(database,,"");
            //var d1="select SUM(EBudget_WBS. EUnitPrice * EBudget_WBS. LastENumber) as sum from EBudget_WBS where EBudget_WBS.PID=" + Session["ProjectCode"].ToString() + "";
            //var d2="(Select SUM(Amount)/100 as sum from Progress_WIINF where ProjectID=" + Session["ProjectCode"].ToString()+"";
            //var d3="Select SUM(CompleteAmount)/100 as sum from Progress_Real where ProjectID=" + Session["ProjectCode"].ToString() + "";
            //var d4=WebModel.SItemName(database,d1,"sum") !=""?WebModel.SItemName(database,d1,"sum"):"0";
            //var d5=WebModel.SItemName(database,d2,"sum") !=""?WebModel.SItemName(database,d2,"sum"):"0";
            //var d6=WebModel.SItemName(database,d3,"sum") !=""?WebModel.SItemName(database,d3,"sum"):"0";

            //var DonePrice = decimal.Parse(d4) * decimal.Parse(d5) * decimal.Parse(d6);
            var EBudgetPrice = "Select SUM(LastENumber*EUnitPrice) as sum From EBudget_WBS Where PID=" + Session["ProjectCode"].ToString() + " and ResourceNY=1";
            var sum = WebModel.SItemName(database, EBudgetPrice, "sum") !=""?WebModel.SItemName(database, EBudgetPrice, "sum"):"0";

            if (sum!="0")
            {LB_CalAns.Text = (Math.Round((done / decimal.Parse(sum)*100),2)).ToString();
            }
            else
            {
                LB_CalAns.Text = "0";
            }
     
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            if (e.CommandName == "Select")
            {
                Pnl_Main.Visible = true;
                int ID_class = Convert.ToInt32(e.CommandArgument);
                ID_class = ID_class % GridView1.PageSize;
                Label UID = (Label)GridView1.Rows[ID_class].FindControl("UID");
                Label Version = (Label)GridView1.Rows[ID_class].FindControl("Version");
               
                string uid = UID.Text;

                SqlDataSource2.SelectCommand = "Select * From Progress_Real INNER JOIN Progress_WIINF ON Progress_Real.ProgressID = Progress_WIINF.ProgressID Where Progress_Real.ProjectID= " + Session["ProjectCode"].ToString() + " And Progress_Real.Version= " + Version.Text + "";
                GridView2.DataBind();                
            
                string SQLselect = "Select max(Version) as Version from Progress_RVersion where pid=" + Session["ProjectCode"].ToString();
                if (WebModel.SItemName(database, SQLselect, "Version") != "")
                {
                    LB_Version.Text = Version.Text;

                    TB_Date.Text = DateTime.Now.ToString("yyyy-MM-dd");
                    int version = int.Parse(LB_Version.Text) + 1;
                    Btn_Insert.Text = "新增至第" + Version.Text + "版";
                    Btn_InsertNew.Text = "另存至第" + ViewState["NewVersion"].ToString() + "版";
                    Btn_DailyReload.Text = "載入日報資訊並更新至第" + Version.Text + "版";
                    Btn_DailyReloadNew.Text = "載入日報資訊並另存至第" + ViewState["NewVersion"].ToString() + "版";
                }
                else
                {
                    string Insert = "Insert into Progress_RVersion ([PID],[Version],[TotalPrice],[LastDate]) values (" + Session["ProjectCode"].ToString() + ",1,0," + DateTime.Now.ToString("yyyy-MM-dd") + ")";
                    bool result = WebModel.SQLAction(database, Insert);

                }
            }
           
            if (e.CommandName == "Delete")
            {
                int ID_class = Convert.ToInt32(e.CommandArgument);
                ID_class = ID_class % GridView1.PageSize;
                Label UID = (Label)GridView1.Rows[ID_class].FindControl("UID");
                string Del = "Delete from Progress_RVersion where UID=" + UID.Text;
                bool result = WebModel.SQLAction(database, Del);
                if (result)
                {

                    Response.Write("<script language='javascript'>alert('刪除完成！')</script>");
                }
                else
                {

                    Response.Write("<script language='javascript'>alert('刪除失敗！')</script>");
                }

            }
        }
        protected void yourGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            // You could just do yourGrid and ignore casting the sender but this 
            // makes the code generic for reuse.
            GridView grid = (GridView)sender;
            grid.EditIndex = e.NewEditIndex;
            GridView1.DataBind(); // need to rebind once the edit index is set.
        }
        protected void GridView1_RowUpdated(object sender, GridViewUpdateEventArgs e)
        {
            string UID = GridView1.DataKeys[e.RowIndex].Values["UID"].ToString();
            TextBox Version = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Version");
            TextBox TotalPrice = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TotalPrice");
            TextBox LastDate = (TextBox)GridView1.Rows[e.RowIndex].FindControl("LastDate");
            TextBox Note = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Note");
            LastDate.Text = DateTime.Parse(LastDate.Text).ToShortDateString();
            //con.Open();
            string database = Session["DatabaseName"].ToString();
             string data = Utility.DBconnection.connect_string(database);
             using (SqlConnection L_Conn = new SqlConnection(data))
             {
               
                 DateTime dt =DateTime.Parse(LastDate.Text);
                 SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                 SqlCommand cmd = new SqlCommand("update Progress_RVersion set Version='" + Version.Text + "', TotalPrice='" + TotalPrice.Text + "', LastDate='" + dt.ToShortDateString() + "', Note='" + Note.Text + "' where UID=" + UID+"",L_Conn);
                 L_Conn.Open();
                 cmd.Connection = L_Conn;
                 cmd.ExecuteNonQuery();
               
                 GridView1.EditIndex = -1;
                 GridView1.DataBind();
                 e.Cancel = true;
             
             }
        }
        
        protected void gridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }

        protected void Btn_Insert_Click(object sender, EventArgs e)
        {
              string database = Session["DatabaseName"].ToString();
            if (DDL_Activity.SelectedValue != "0" && TBDate.Text != "" && TBComplete.Text != "" && Session["ProjectCode"].ToString()!="")
            {
                var sqlInsert = "Insert Into Progress_Real (ProjectID, ProgressID, WorkDate, CompleteAmount, Version) Values (" + Session["ProjectCode"].ToString() + "," + DDL_Activity.SelectedValue + ", '" + TBDate.Text + "', " + TBComplete.Text + ", " + Btn_Insert.Text.Substring(4,1) + ")";
            bool result = WebModel.SQLAction(database, sqlInsert);
            decimal done = 0;
            var select = "Select TotalPrice, LastDate From Progress_RVersion Where PID= " + Session["ProjectCode"].ToString() + " And Version=" + Btn_Insert.Text.Substring(4, 1) + "";
            var TotalPrice = WebModel.SItemName(database, select, "TotalPrice");
            var LastDate = WebModel.SItemName(database, select, "LastDate");
            var SQLOrig = "Select EBudget_WBS.LastENumber, EBudget_WBS.EUnitPrice, Progress_WIINF.Amount,Progress_Real.CompleteAmount From Progress_WIINF INNER JOIN EBudget_WBS ON Progress_WIINF.ProgressID= EBudget_WBS.EWID left join Progress_Real on Progress_WIINF.ProgressID=Progress_Real.ProgressID Where Progress_WIINF.ProgressID =" + DDL_Activity.SelectedValue + "";
            DataTable Dt = WebModel.LoadSetContentData(database, SQLOrig);
            if (Dt != null && Dt.Rows.Count > 0)
            {
                foreach (DataRow row in Dt.Rows)
                {

                    var CompleteAmount = row["CompleteAmount"].ToString() != "" ? row["CompleteAmount"].ToString() : "0";
                    var Amount = row["Amount"].ToString() != "" ? row["Amount"].ToString() : "0";
                    var LastENumber = row["LastENumber"].ToString() != "" ? row["LastENumber"].ToString() : "0";
                    var EUnitPrice = row["EUnitPrice"].ToString() != "" ? row["EUnitPrice"].ToString() : "0";

                    done += decimal.Parse(LastENumber) * decimal.Parse(EUnitPrice) * (decimal.Parse(Amount) / 100) * (decimal.Parse(CompleteAmount) / 100);

                }
            }           

        
            var EBudgetPrice = "Select SUM(LastENumber*EUnitPrice) as sum From EBudget_WBS Where PID=" + Session["ProjectCode"].ToString() + " and ResourceNY=1";
                var sum = WebModel.SItemName(database, EBudgetPrice, "sum") !=""?WebModel.SItemName(database, EBudgetPrice, "sum"):"0";
                if (sum != "0")
                {
                    LB_CalAns.Text = (Math.Round((done / decimal.Parse(sum) * 100), 2)).ToString();
                }
                else
                {
                    LB_CalAns.Text = "0";
                }

            //var TPrice = "EBudget_WBS.EPrice* EBudget_WBS. LastENumber*(Progress_WIINF.Amount/100)*(完成百分比.Text /100)";
            var SQLmaxdate = "Select Max(LastDate)LastDate from Progress_RVersion Where PID=" + Session["ProjectCode"].ToString() + " And Version=" + Btn_Insert.Text.Substring(4, 1) + "";
                var maxdate=DateTime.Parse(WebModel.SItemName(database,SQLmaxdate,"LastDate"))> DateTime.Parse(TBDate.Text)?WebModel.SItemName(database,SQLmaxdate,"LastDate"):TBDate.Text;

                var SQLupdate = "Update Progress_RVersion Set TotalPrice=" + done + ", LastDate=" + maxdate + " where PID=" + Session["ProjectCode"].ToString() + " And Version=" + Btn_Insert.Text.Substring(4, 1) + "";
                bool result1 = WebModel.SQLAction(database, SQLupdate);
                if (result)
                {
                    Response.Write("<script language='javascript'>alert('新增完成！')</script>");
                }
                else
                {

                    Response.Write("<script language='javascript'>alert('新增失敗！')</script>");
                }
                GridView2.DataBind();
            }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                
                string database = Session["DatabaseName"].ToString();
                int ID_class = Convert.ToInt32(e.CommandArgument);
                ID_class = ID_class % GridView2.PageSize;
                Label UID = (Label)GridView2.Rows[ID_class].FindControl("RealProgID");
                SqlDataSource2.DeleteCommand = "Delete from Progress_Real where RealProgID=" + UID.Text;
             
                //bool result = WebModel.SQLAction(database, Del);              
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已刪除');", true);
                GridView2.DataBind();
                //Repeater1.DataSource = Dtvs;
                //Repeater1.DataBind();
                //if (result)
                //{

                //    Response.Write("<script language='javascript'>alert('刪除完成！')</script>");
                //}
                //else
                //{

                //    Response.Write("<script language='javascript'>alert('刪除失敗！')</script>");
                //}

            }
        }

        protected void GridView2_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string UID = GridView2.DataKeys[e.RowIndex].Values["RealProgID"].ToString();
            //TextBox WIName = (TextBox)GridView2.Rows[e.RowIndex].FindControl("WIName");
            TextBox WorkDate = (TextBox)GridView2.Rows[e.RowIndex].FindControl("WorkDate");
            TextBox CompleteAmount = (TextBox)GridView2.Rows[e.RowIndex].FindControl("CompleteAmount");
          

            //con.Open();
            string database = Session["DatabaseName"].ToString();
            string data = Utility.DBconnection.connect_string(database);
            using (SqlConnection L_Conn = new SqlConnection(data))
            {

                DateTime dt = DateTime.Parse(WorkDate.Text);
             
                SqlCommand cmd = new SqlCommand("update Progress_Real set  WorkDate='" + dt.ToShortDateString() + "', CompleteAmount='" + CompleteAmount.Text + "' where RealProgID=" + UID + "", L_Conn);
                L_Conn.Open();
                cmd.Connection = L_Conn;
                cmd.ExecuteNonQuery();

                GridView2.EditIndex = -1;
                GridView2.DataBind();
                e.Cancel = true;

            }
        }

        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView grid = (GridView)sender;
            grid.EditIndex = e.NewEditIndex;
            GridView2.DataBind(); // need to rebind once the edit index is set.
        }

        protected void Btn_DailyReload_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string SQLDel = "Delete From Progress_Real Where ProjectID= " + Session["ProjectCode"].ToString() + " And Version=" +Btn_DailyReload.Text.Substring(11,1);
            bool result = WebModel.SQLAction(database, SQLDel);

            //string SQLSelect = "Select Progress_WIINF.Amount, EBudget_WBS.LastENumber, EBudget_WBS.ENumber, Daily_Main.Date, Daily_Activity.WIID, Daily_Activity.DailyNumber From Daily_Activity INNER JOIN Daily_Main ON Daily_Activity.DailyID = Daily_Main.DailyID INNER JOIN EBudget_WBS ON Daily_Activity.EWID = EBudget_WBS.EWID INNER JOIN Progress_WIINF ON Daily_Activity.WIID = Progress_WIINF.WIID Where Daily_Main.PID=" + Session["ProjectCode"].ToString();
            //string SQLSelect = "Select Progress_WIINF.Amount, EBudget_WBS.LastENumber, EBudget_WBS.ENumber, Daily_Main.Date, Daily_Activity.WIID, Daily_Activity.DailyNumber From Daily_Activity INNER JOIN Daily_Main ON Daily_Activity.DailyID = Daily_Main.DailyID INNER JOIN EBudget_WBS ON Daily_Activity.EWID = EBudget_WBS.EWID INNER JOIN Progress_WIINF ON Daily_Activity.WIID = Progress_WIINF.WIID Where Daily_Main.PID=" + Session["ProjectCode"].ToString();
            //string SQLInsert = "INSERT INTO  Progress_Real(ProjectID, ProgressID, WorkDate, Version,CompleteAmount) SELECT " + Session["ProjectCode"].ToString() + " as ProjectID ,Progress_WIINF.ProgressID as ProgressID,Daily_Main.Date as WorkDate,  " + LB_Version.Text + " as Version,ISNULL(Daily_Activity.DailyNumber/ (EBudget_WBS. LastENumber* (Progress_WIINF.Amount/100)) *100,0) as CompleteAmount  From Daily_Activity INNER JOIN Daily_Main ON Daily_Activity.DailyID = Daily_Main.DailyID INNER JOIN EBudget_WBS ON Daily_Activity.EWID = EBudget_WBS.EWID INNER JOIN Progress_WIINF ON Daily_Activity.WIID = Progress_WIINF.WIID  where Daily_Main.Pid=" + Session["ProjectCode"].ToString();
            //先插入ProjectID, ProgressID, Version
            string SQLInsert = "INSERT INTO  Progress_Real(ProjectID, ProgressID, Version,WorkDate,CompleteAmount) SELECT " + Session["ProjectCode"].ToString() + " as ProjectID ,Progress_WIINF.ProgressID as ProgressID, " + Btn_DailyReload.Text.Substring(11, 1) + " as Version,'1900-01-01',0 From Progress_WIINF  where Progress_WIINF.ProjectID=" + Session["ProjectCode"].ToString();
            bool result1 = WebModel.SQLAction(database, SQLInsert);
            //再插入WorkDate、CompleteAmount
            var SQLUpdate = "SELECT * from Daily_Main  left join Daily_Activity on Daily_Main.DailyID=Daily_Activity.DailyID left join Progress_WIINF on Daily_Activity.EWID=Progress_WIINF.WBSID where Daily_Main.PID=" + Session["ProjectCode"].ToString();
            DataTable Dt = WebModel.LoadSetContentData(database, SQLUpdate);
            if (Dt != null && Dt.Rows.Count > 0)
            {
                foreach (DataRow row in Dt.Rows)
                {

                    var ProgressID = row["ProgressID"].ToString();
                    var Date = DateTime.Parse(row["Date"].ToString()).ToString("yyyy-MM-dd");
                    if (ProgressID!="")
                    {
                        var Update = "Update Progress_Real set WorkDate='" + Date + "' where ProgressID=" + ProgressID + " and Version=" + Btn_DailyReload.Text.Substring(11, 1);
                        bool result2 = WebModel.SQLAction(database, Update);
                    }
               

                }

            }
            var update1 = "select ISNULL(Daily_Activity.DailyNumber/ (EBudget_WBS. LastENumber* (Progress_WIINF.Amount/100)) *100,0) as CompleteAmount,* from Progress_WIINF join EBudget_WBS on EBudget_WBS.EWID=Progress_WIINF.WBSID join Daily_Activity on Daily_Activity.EWID=EBudget_WBS.EWID where Progress_WIINF.ProjectID=" + Session["ProjectCode"].ToString();
            DataTable Dt1 = WebModel.LoadSetContentData(database, update1);
            if (Dt1 != null && Dt1.Rows.Count > 0)
            {
                foreach (DataRow row in Dt1.Rows)
                {

                    var ProgressID = row["ProgressID"].ToString();
                    var CompleteAmount = row["CompleteAmount"].ToString();
                    if (ProgressID != "")
                    {
                        var Update1 = "Update Progress_Real set CompleteAmount=" + CompleteAmount + " where ProgressID=" + ProgressID + " and Version=" + Btn_DailyReload.Text.Substring(11, 1);
                        bool result4 = WebModel.SQLAction(database, Update1);
                    }


                }

            }
            var update2 = "Update Progress_Real set WorkDate=(SELECT Daily_Main.Date as WorkDate from Daily_Main  left join Daily_Activity on Daily_Main.DailyID=Daily_Activity.DailyID  where Daily_Main.PID=" + Session["ProjectCode"].ToString() + ")";
            string sumCompleteAmount = "Select sum(CompleteAmount) as sum from Progress_Real where ProjectID=" + Session["ProjectCode"].ToString() + " and Version=" + Btn_DailyReload.Text.Substring(11, 1);
            string sum = WebModel.SItemName(database, sumCompleteAmount, "sum") !=""?WebModel.SItemName(database, sumCompleteAmount, "sum"):"0";
            string SQL1 = "select SUM(EBudget_WBS. EUnitPrice * EBudget_WBS. LastENumber) as sum from EBudget_WBS where EBudget_WBS.PID=" + Session["ProjectCode"].ToString() + "";
            string sum1=WebModel.SItemName(database,SQL1,"sum") !=""?WebModel.SItemName(database,SQL1,"sum"):"0";
            string SQL2 = "select sum(Progress_WIINF.Amount/100) from Progress_WIINF where ProjectID=" + Session["ProjectCode"].ToString() + "";
            string sum2=WebModel.SItemName(database,SQL2,"sum")!=""?WebModel.SItemName(database,SQL2,"sum"):"0";
           
            string TotalPrice = (decimal.Parse(sum) * decimal.Parse(sum1) * decimal.Parse(sum2)).ToString();
            string Update2 = "Update Progress_RVersion set TotalPrice=" + TotalPrice + " ,LastDate= (Select max(Daily_Main.Date) from Daily_Main where pid=" + Session["ProjectCode"].ToString() + ") where pid=" + Session["ProjectCode"].ToString() + " and version=" + Btn_DailyReload.Text.Substring(11, 1);
            bool result3 = WebModel.SQLAction(database, Update2);
            if (result1 && result3)
            {
                Response.Write("<script language='javascript'>alert('存檔完成！')</script>");
            }
            else
            {
            Response.Write("<script language='javascript'>alert('存檔失敗！')</script>");
            }
            GridView1.DataBind();
            GridView2.DataBind();
        }

        protected void Btn_DailyReloadNew_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            var newvesion = int.Parse(LB_Version.Text) + 1;
            string SQLDel = "Delete From Progress_Real Where ProjectID= " + Session["ProjectCode"].ToString() + " And Version=" + newvesion;
            bool result = WebModel.SQLAction(database, SQLDel);

            //string SQLSelect = "Select Progress_WIINF.Amount, EBudget_WBS.LastENumber, EBudget_WBS.ENumber, Daily_Main.Date, Daily_Activity.WIID, Daily_Activity.DailyNumber From Daily_Activity INNER JOIN Daily_Main ON Daily_Activity.DailyID = Daily_Main.DailyID INNER JOIN EBudget_WBS ON Daily_Activity.EWID = EBudget_WBS.EWID INNER JOIN Progress_WIINF ON Daily_Activity.WIID = Progress_WIINF.WIID Where Daily_Main.PID=" + Session["ProjectCode"].ToString();
            //string SQLInsert = "INSERT INTO  Progress_Real(ProjectID, ProgressID, WorkDate, Version,CompleteAmount) SELECT " + Session["ProjectCode"].ToString() + " as ProjectID ,Progress_WIINF.ProgressID as ProgressID,Daily_Main.Date as WorkDate,  " + newvesion + " as Version,ISNULL(Daily_Activity.DailyNumber/ (EBudget_WBS. LastENumber* (Progress_WIINF.Amount/100)) *100,0) as CompleteAmount  From Daily_Activity INNER JOIN Daily_Main ON Daily_Activity.DailyID = Daily_Main.DailyID INNER JOIN EBudget_WBS ON Daily_Activity.EWID = EBudget_WBS.EWID INNER JOIN Progress_WIINF ON Daily_Activity.WIID = Progress_WIINF.WIID  where Daily_Main.Pid=" + Session["ProjectCode"].ToString();
            //bool result1 = WebModel.SQLAction(database, SQLInsert);
            string SQLInsert = "INSERT INTO  Progress_Real(ProjectID, ProgressID, Version,WorkDate,CompleteAmount) SELECT " + Session["ProjectCode"].ToString() + " as ProjectID ,Progress_WIINF.ProgressID as ProgressID,  " + newvesion + " as Version,'',0 From Progress_WIINF  where Progress_WIINF.ProjectID=" + Session["ProjectCode"].ToString();
            bool result1 = WebModel.SQLAction(database, SQLInsert);
            //再插入WorkDate、CompleteAmount
            var SQLUpdate = "SELECT * from Daily_Main  left join Daily_Activity on Daily_Main.DailyID=Daily_Activity.DailyID left join Progress_WIINF on Daily_Activity.EWID=Progress_WIINF.WBSID where Daily_Main.PID=" + Session["ProjectCode"].ToString();
            DataTable Dt = WebModel.LoadSetContentData(database, SQLUpdate);
            if (Dt != null && Dt.Rows.Count > 0)
            {
                foreach (DataRow row in Dt.Rows)
                {

                    var ProgressID = row["ProgressID"].ToString();
                    var Date = DateTime.Parse(row["Date"].ToString()).ToString("yyyy-MM-dd");
                    if (ProgressID != "")
                    {
                        var Update = "Update Progress_Real set WorkDate='" + Date + "' where ProgressID=" + ProgressID + " and Version=" + newvesion;
                        bool result2 = WebModel.SQLAction(database, Update);
                    }


                }

            }
            var update1 = "select ISNULL(Daily_Activity.DailyNumber/ (EBudget_WBS. LastENumber* (Progress_WIINF.Amount/100)) *100,0) as CompleteAmount,* from Progress_WIINF join EBudget_WBS on EBudget_WBS.EWID=Progress_WIINF.WBSID join Daily_Activity on Daily_Activity.EWID=EBudget_WBS.EWID where Progress_WIINF.ProjectID=" + Session["ProjectCode"].ToString();
            DataTable Dt1 = WebModel.LoadSetContentData(database, update1);
            if (Dt1 != null && Dt1.Rows.Count > 0)
            {
                foreach (DataRow row in Dt1.Rows)
                {

                    var ProgressID = row["ProgressID"].ToString();
                    var CompleteAmount = row["CompleteAmount"].ToString();
                    if (ProgressID != "")
                    {
                        var Update1 = "Update Progress_Real set CompleteAmount=" + CompleteAmount + " where ProgressID=" + ProgressID + " and Version=" + newvesion;
                        bool result4 = WebModel.SQLAction(database, Update1);
                    }


                }

            }
            string sumCompleteAmount = "Select sum(CompleteAmount) as sum from Progress_Real where ProjectID=" + Session["ProjectCode"].ToString() + " and Version=" + newvesion;
            string sum = WebModel.SItemName(database, sumCompleteAmount, "sum") != "" ? WebModel.SItemName(database, sumCompleteAmount, "sum") : "0";
            string SQL1 = "select SUM(EBudget_WBS. EUnitPrice * EBudget_WBS. LastENumber) as sum from EBudget_WBS where EBudget_WBS.PID=" + Session["ProjectCode"].ToString() + "";
            string sum1 = WebModel.SItemName(database, SQL1, "sum")!=""?WebModel.SItemName(database, SQL1, "sum"):"0";
            string SQL2 = "select sum(Progress_WIINF.Amount/100) from Progress_WIINF where ProjectID=" + Session["ProjectCode"].ToString() + "";
            string sum2 = WebModel.SItemName(database, SQL2, "sum") != "" ? WebModel.SItemName(database, SQL2, "sum") : "0";

            string TotalPrice = (decimal.Parse(sum) * decimal.Parse(sum1) * decimal.Parse(sum2)).ToString();
            string SQLver = "Select max(Version) as Version from Progress_RVersion where PID=" + Session["ProjectCode"].ToString();
            var nowversion = WebModel.SItemName(database, SQLver, "Version");
            if ((newvesion) >int.Parse(nowversion))
            {
                string Insert = "Insert INTO Progress_RVersion ([PID],[Version],[TotalPrice],[LastDate]) VALUES (" + Session["ProjectCode"].ToString() + "," + newvesion + ","+TotalPrice+","+"(Select max(Daily_Main.Date) from Daily_Main where pid=" + Session["ProjectCode"].ToString() + "))";
                bool result3 = WebModel.SQLAction(database, Insert);            
            }
            else
            {

                string Update = "Update Progress_RVersion set TotalPrice=" + TotalPrice + " ,LastDate= (Select max(Daily_Main.Date) from Daily_Main where pid=" + Session["ProjectCode"].ToString() + ") where pid=" + Session["ProjectCode"].ToString() + " and version=" + newvesion;
                bool result2 = WebModel.SQLAction(database, Update);
            }
            if (result1)
            {
                Response.Write("<script language='javascript'>alert('存檔完成！')</script>");

            }
            else
            {
                Response.Write("<script language='javascript'>alert('存檔失敗！')</script>");

            }
            GridView1.DataBind();
            GridView2.DataBind();
        }

        protected void Btn_InsertNew_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            if (DDL_Activity.SelectedValue != "0" && TBDate.Text != "" && TBComplete.Text != "" && Session["ProjectCode"].ToString() != "")
            {
                var sqlInsert = "Insert Into Progress_Real (ProjectID, ProgressID, WorkDate, CompleteAmount, Version) Values (" + Session["ProjectCode"].ToString() + "," + DDL_Activity.SelectedValue + ", '" + TBDate.Text + "', " + TBComplete.Text + ", " + Btn_InsertNew.Text.Substring(4, 1) + ")";
                bool result = WebModel.SQLAction(database, sqlInsert);
                
                decimal done = 0;
                var select = "Select TotalPrice, LastDate From Progress_RVersion Where PID= " + Session["ProjectCode"].ToString() + " And Version=" + Btn_InsertNew.Text.Substring(4, 1) + "";
                var TotalPrice = WebModel.SItemName(database, select, "TotalPrice");
                var LastDate = WebModel.SItemName(database, select, "LastDate");
                var SQLOrig = "Select EBudget_WBS.LastENumber, EBudget_WBS.EUnitPrice, Progress_WIINF.Amount,Progress_Real.CompleteAmount From Progress_WIINF INNER JOIN EBudget_WBS ON Progress_WIINF.ProgressID= EBudget_WBS.EWID left join Progress_Real on Progress_WIINF.ProgressID=Progress_Real.ProgressID Where Progress_WIINF.ProgressID =" + DDL_Activity.SelectedValue + "";
                DataTable Dt = WebModel.LoadSetContentData(database, SQLOrig);
                if (Dt != null && Dt.Rows.Count > 0)
                {
                    foreach (DataRow row in Dt.Rows)
                    {

                        var CompleteAmount = row["CompleteAmount"].ToString() != "" ? row["CompleteAmount"].ToString() : "0";
                        var Amount = row["Amount"].ToString() != "" ? row["Amount"].ToString() : "0";
                        var LastENumber = row["LastENumber"].ToString() != "" ? row["LastENumber"].ToString() : "0";
                        var EUnitPrice = row["EUnitPrice"].ToString() != "" ? row["EUnitPrice"].ToString() : "0";

                        done += decimal.Parse(LastENumber) * decimal.Parse(EUnitPrice) * (decimal.Parse(Amount) / 100) * (decimal.Parse(CompleteAmount) / 100);

                    }
                }


                var EBudgetPrice = "Select SUM(LastENumber*EUnitPrice) as sum From EBudget_WBS Where PID=" + Session["ProjectCode"].ToString() + " and ResourceNY=1";
                var sum = WebModel.SItemName(database, EBudgetPrice, "sum");
                LB_CalAns.Text = (Math.Round((done / decimal.Parse(sum) * 100), 2)).ToString();

                //var TPrice = "EBudget_WBS.EPrice* EBudget_WBS. LastENumber*(Progress_WIINF.Amount/100)*(完成百分比.Text /100)";
                var SQLmaxdate = "Select Max(LastDate)LastDate from Progress_RVersion Where PID=" + Session["ProjectCode"].ToString() + " And Version=" + Btn_InsertNew.Text.Substring(4, 1) + "";
                var maxdate = "";
                if (WebModel.SItemName(database, SQLmaxdate, "LastDate") != "")
                {
                    maxdate = DateTime.Parse(WebModel.SItemName(database, SQLmaxdate, "LastDate")) > DateTime.Parse(TBDate.Text) ? WebModel.SItemName(database, SQLmaxdate, "LastDate") : TBDate.Text;
                }
                var SQLupdate = "Update Progress_RVersion Set TotalPrice=" + done + ", LastDate='" + maxdate + "' where PID=" + Session["ProjectCode"].ToString() + " And Version=" + Btn_InsertNew.Text.Substring(4, 1) + "";
                bool result1 = WebModel.SQLAction(database, SQLupdate);
                var SQLselect = "Select * from Progress_RVersion where PID=" + Session["ProjectCode"].ToString() + " and Version=" + Btn_InsertNew.Text;
                var version = WebModel.SItemName(database, SQLselect, "Version");
                bool result3 = false;
                if (version =="")
                {
                    var SQLProgress_RV = "Insert Into Progress_RVersion([PID],[Version],[TotalPrice],[LastDate]) values (" + Session["ProjectCode"].ToString() + "," + Btn_InsertNew.Text.Substring(4, 1) + ",0,'" + TBDate.Text + "')";
                 result3 = WebModel.SQLAction(database, SQLProgress_RV);
                }
                if (result)
                {
                    Response.Write("<script language='javascript'>alert('新增完成！')</script>");
                }
                else
                {

                    Response.Write("<script language='javascript'>alert('新增失敗！')</script>");
                }
                GridView1.DataBind();
                GridView2.DataBind();
            }
            else
            {
                Response.Write("<script language='javascript'>alert('項目不得為空，請輸入內容！')</script>");

            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                //Label LastDate = (Label)e.Row.FindControl("LastDate");
              
                //LastDate.Text = DateTime.Parse(LastDate.Text).ToShortDateString();

            


            }
        }

      
    }
}