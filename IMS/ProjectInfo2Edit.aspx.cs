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
    public partial class ProjectInfo2Edit : System.Web.UI.Page
    {
      
        string ErrorString = "";
    
        string _TableNameM2 = "ProjectM2";
        string SQLStringM2 = "PID,OContrctPrice,ContractWay,OwnerName,ArchitectName,ConsultantName,PCMname,DurationType,Duration,BuildLicense,BuildLicenseDtae,UseLicense,UseLicenseDate";

       protected void Page_Load(object sender, EventArgs e)
        {
          
            string datasource = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
        
            bool check = Utility.Access_check.check_project_access_by_Session(Session["LoginAccess"].ToString(), Request.FilePath.Substring(1), Session["ProjectCode"].ToString());
            if (!check)
            {
                Response.Write("<script>alert('您必須先選擇專案或您沒有專案的權限');location.href='Main.aspx';</script>");
            }
            else
            {
                SqlDataSource4.ConnectionString = datasource;
                SqlDataSource4.SelectCommand = "SELECT ProjectM_JV.Fid,ProjectM_JV.PID,ProjectM_JV.JVID, FirmM.Name AS 聯合承攬廠商名稱, ProjectM_JV.JVItem AS 承攬項目, ProjectM_JV.JVPrice AS 合約金額 FROM FirmM INNER JOIN ProjectM_JV ON FirmM.UID = ProjectM_JV.FID where ProjectM_JV.Pid= " + Session["ProjectCode"].ToString();//Session["Bid"].ToString() + "";
               
            }
            if (!IsPostBack)
            {
                CreatRadioButtonList();
                CreateDropDownList();
                Recovery_Click(this, null);
            }
           
            SqlDataSource5.ConnectionString = datasource;
            SqlDataSource5.SelectCommand = "SELECT * from FirmM";
            DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            DDL.Visible = false;
           
        }
       protected void CreateDropDownList()
       {
           SetDropDownList("DDLDurationType", Unitlist.DurationType(), "");  //工期計算方式
           
       }
       protected void SetDropDownList(string thisName, string thisData, string thisSet)
       {
           DropDownList thisDropDownList = (DropDownList)Page.Master.FindControl("ContentPlaceHolder1").FindControl(thisName);

           thisDropDownList.Items.Clear();
       
           int count = 0;
           foreach (string DataName in thisData.Split(','))
           {
               thisDropDownList.Items.Add(new ListItem(DataName, count.ToString()));
               count++;
           }
           count = 0;
       }
       protected void CreatRadioButtonList()
       {
           SetRadioButtonList("RBContractWay", Unitlist.ContractWay(), "");  //承攬方式
       
       }

       protected void SetRadioButtonList(string thisName, string thisData, string thisSet)
       {
           RadioButtonList thisRadioButtonList = (RadioButtonList)Page.Master.FindControl("ContentPlaceHolder1").FindControl(thisName);

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
            ErrorString += (RBContractWay.SelectedIndex) == -1 ? "承攬方式請選擇!!\\n" : "";
            ErrorString += (DDLDurationType.SelectedIndex) == 0 ? "工期計算方式請選擇!!\\n" : "";
            ErrorString += (TxOContrctPrice.Text) == string.Empty ? "原合約總價請填入!!\\n" : "";
            ErrorString += (TxOwnerName.Text) == string.Empty ? "工地電話請填入!!\\n" : "";
            ErrorString += (TxDuration.Text) == string.Empty ? "工期請填入!!\\n" : "";
          


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

                        WebModel.SaveAction_pro(database, _TableNameM2, GetDataBox(), Session["ProjectCode"].ToString());

                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                        //Response.Redirect("ProjectInfo1View.aspx");
                    }
                    else
                    {
                        WebModel.EditAction_pro(database, _TableNameM2, Session["ProjectCode"].ToString(), GetDataBox());
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

            foreach (string DataName in SQLStringM2.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }


            //後台功能，必需要有的欄位名稱               

            DataRow DataTableDr = DataTableBox.NewRow();

            #region 內容設定

            // DataTableDr["ProjectCode"] = Session["ProjectCode"].ToString();
            DataTableDr["pid"] = Session["ProjectCode"].ToString();
            DataTableDr["OContrctPrice"] = TxOContrctPrice.Text;
            DataTableDr["ContractWay"] = RBContractWay.SelectedItem.Value;
            DataTableDr["OwnerName"] = TxOwnerName.Text;
            DataTableDr["ArchitectName"] = TxArchitectName.Text;
            DataTableDr["ConsultantName"] = TxConsultantName.Text;
            DataTableDr["PCMname"] = TxPCMname.Text;
            DataTableDr["DurationType"] = DDLDurationType.SelectedItem.Value;
            DataTableDr["Duration"] = TxDuration.Text;
            DataTableDr["BuildLicense"] = TxBuildLicense.Text;
            DataTableDr["BuildLicenseDtae"] = TxBuildLicenseDtae.Text;
            DataTableDr["UseLicense"] = TxUseLicense.Text;
            DataTableDr["UseLicenseDate"] = TxUseLicenseDate.Text;
           
           // DataTableDr["ExcDepth"] = (TxExcDepth.Text != "") ? TxExcDepth.Text : "0";
           

            DataTableBox.Rows.Add(DataTableDr);
            #endregion

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


                DataTable DataTableBox = WebModel.LoadContentData_pro(database, _TableNameM2, Session["ProjectCode"].ToString(), SQLStringM2);
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
        #region 恢復值-RECOVERY_LINK
        protected void Recovery_Click(object sender, EventArgs e)
        {
            string SQLString = "Select* From ProjectM0 a Left Join ProjectM2 b on a.pid =b.pid Where a.PID = '" + Session["ProjectCode"].ToString() + "'";

            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || Session["ProjectCode"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string database = Session["DatabaseName"].ToString();
                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        //datatable(ProjectM0)
                        // DataTableDr["bid"] = Session["bid"].ToString();
                        Session["Pid"] = row["Pid"].ToString();
                        TxProjectCode.Text = row["ProjectCode"].ToString();
                        TxProjectName.Text = row["ProjectName"].ToString();
                        TxOContrctPrice.Text = row["OContrctPrice"].ToString();
                     
                        //datatable(ProjectM1)
                        DDLDurationType.SelectedIndex = (row["DurationType"].ToString() != "") ? int.Parse(row["DurationType"].ToString()) : 0;
                        RBContractWay.SelectedIndex = (row["ContractWay"].ToString() == "") ?  -1 :int.Parse(row["ContractWay"].ToString()) ;
                      
                        TxOwnerName.Text = row["OwnerName"].ToString();
                        TxArchitectName.Text = row["ArchitectName"].ToString();
                        TxConsultantName.Text = row["ConsultantName"].ToString();
                        TxPCMname.Text = row["PCMname"].ToString();
                        TxDuration.Text = row["Duration"].ToString();
                        TxBuildLicense.Text = row["BuildLicense"].ToString();
                        TxBuildLicenseDtae.Text = row["BuildLicenseDtae"].ToString();
                        TxUseLicense.Text = row["UseLicense"].ToString();
                        TxUseLicenseDate.Text = row["UseLicenseDate"].ToString();
                       
                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        }
        #endregion

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            
            if (e.CommandName == "Update")
            {
                string JVItem = ((TextBox)GridView1.Rows[ID_class].FindControl("JVItem")).Text.Trim();
                string JVPrice = ((TextBox)GridView1.Rows[ID_class].FindControl("JVPrice")).Text.Trim();
                DropDownList DDL = (DropDownList)GridView1.Rows[ID_class].FindControl("Name");

                GridView1.DataSourceID = "SqlDataSource4";

                SqlDataSource4.UpdateCommand = "Update ProjectM_JV SET JVItem='" + JVItem + "', JVPrice='" + JVPrice + "', FID=" + DDL.SelectedValue + " FROM ProjectM_JV  where JVID=@JVID";

            }
            if (e.CommandName == "delete")
            {
                SqlDataSource4.DeleteCommand = "delete Bid_Joint WHERE [JBID] = @JBID";
            }
        }

        #region 新增投標廠商明細
        protected void add_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string _TableNameadd = "ProjectM_JV";
            //檢查標題文字
            ErrorString += (TxJVItem.Text) == string.Empty ? "共同投標項目請填入!!\\n" : "";
            ErrorString += (TxJVPrice.Text) == string.Empty ? "共同投標金額請填入!!\\n" : "";



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

                    WebModel.SaveAction_pro(database, _TableNameadd, GetDataBox_add(), Session["ProjectCode"].ToString());

                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                    GridView1.DataBind();
                    TxJVItem.Text = "";
                    TxJVPrice.Text = "";
                }
            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

            }
        }

        //取得建入資料
        protected DataTable GetDataBox_add()
        {

            DataTable DataTableBox = new DataTable();
            string add_SQLString = "Pid,FID,JVItem,JVPrice";
            foreach (string DataName in add_SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }


            //後台功能，必需要有的欄位名稱               

            DataRow DataTableDr = DataTableBox.NewRow();

            #region 內容設定
            if (Session["ProjectCode"] != null)
            {
                DataTableDr["pid"] = Session["ProjectCode"].ToString();
                DataTableDr["FID"] = DropDownList3.SelectedItem.Value;
                DataTableDr["JVItem"] = TxJVItem.Text;
                DataTableDr["JVPrice"] = TxJVPrice.Text;



                DataTableBox.Rows.Add(DataTableDr);
            #endregion


            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            return DataTableBox;
        }
        #endregion

        public void OpenNewWindow(string url)
        {

            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=500,width=1050";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}', 'yourWin', '{1}');</script>", url, winFeatures));

        }

        protected void punish_Click(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || Session["ProjectCode"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (datacheck(Session["ProjectCode"].ToString()) == false)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請先鍵入合約主資料');", true);
            }
            else
            {
                //this.ClientScript.RegisterStartupScript(this.GetType(), "Open", "window.open('ProjectDurationE.aspx'), config='height=700,width=1500';", true);
                Response.Write("<script>window.open('ProjectDurationE.aspx', 'window', config='height=560,width=1000')</script>");
            }
        }

        protected void Warranty_Click(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || Session["ProjectCode"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (datacheck(Session["ProjectCode"].ToString()) == false)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請先鍵入合約主資料');", true);
            }
            else
            {
                OpenNewWindow("ProjectWarrantyE.aspx");
            }
        }

        protected void BidPay_Click(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || Session["ProjectCode"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (datacheck(Session["ProjectCode"].ToString()) == false)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請先鍵入合約主資料');", true);
            }
            else
            {
                OpenNewWindow("ProjectPayE.aspx");
            }
        }

        protected void BidCaution_Click(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || Session["ProjectCode"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (datacheck(Session["ProjectCode"].ToString()) == false)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請先鍵入合約主資料');", true);
            }
            else
            {
              
                Response.Write("<script>window.open('ProjectCautionE.aspx', 'window', config='height=700,width=1050')</script>");
            }
        }
    }
}