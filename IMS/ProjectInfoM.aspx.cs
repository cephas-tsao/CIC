using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;

namespace IMS
{
    public partial class ProjectInfoM : System.Web.UI.Page
    {
        string _TableName = "ProjectM0";
        string ErrorString = "";
        string SQLString_check = "PID,ProjectCode,ProjectName,ProjectStatus,ProjectNickname,Note";
        string _TableNameM1 = "ProjectM1";
        string _TableNameM2 = "ProjectM2";
        string SQLStringM2 = "PID,OContrctPrice,ContractWay,OwnerName,ArchitectName,ConsultantName,PCMname,DurationType,Duration,BuildLicense,BuildLicenseDtae,UseLicense,UseLicenseDate";
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {


                Response.Redirect("Login.aspx");
            }

            else if (Session["ProjectCode"] == null || Session["ProjectCode"] == "")
            {
               
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請選擇專案');", true);

            }
            //bool check = Utility.Access_check.check_project_access_by_Session(Session["LoginAccess"].ToString(), Request.FilePath.Substring(1), Session["ProjectCode"].ToString());
            //if (!check)
            //{
            //    //Response.Write("<script>alert('您必須先選擇專案或您沒有專案的權限');location.href='Main.aspx';</script>");
            //    Response.Write("<script>alert('您必須先選擇專案或您沒有專案的權限')';</script>");
            //}
            string datasource = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource1.ConnectionString = datasource;
            SqlDataSource2.ConnectionString = datasource;
            if (!IsPostBack)
            {
                CreateDropDownList(); //建立下拉選項
                CreatRadioButtonList(); //RadioButton
              
                //ListItem LI = new ListItem();
                //LI.Text = "-請選擇-";
                //LI.Value = "0";

                //DDLFoundationType.Items.Insert(0, LI);
                ////DDLFoundationType.SelectedIndex = 0;
                //DDLRetaining.Items.Insert(0, LI);
                //DDLRetaining.SelectedIndex = 0;

                Recovery_Click(this, null);
            }
          

            SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource3.SelectCommand = "SELECT ProjectM_JV.JVID, ProjectM_JV.PID, ProjectM_JV.FID, ProjectM_JV.JVItem, ProjectM_JV.JVPrice, FirmM.Name FROM ProjectM_JV INNER JOIN FirmM ON ProjectM_JV.FID = FirmM.UID where ProjectM_JV.Pid= " + Session["ProjectCode"].ToString();//Session["Bid"].ToString() + "";
                            
            SqlDataSource4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource4.SelectCommand = "SELECT * from FirmM";
        }
        protected void CreateDropDownList()
        {
            SetDropDownList("DDLEngCountry", Unitlist.Country(), "");  //工程所在國家
            SetDropDownList("DDLEngLocation", Unitlist.City(), "");  //工程所在縣市
            SetDropDownList("DDLEngClass", Unitlist.ClassList(), "");  //工程所在縣市
            SetDropDownList("DDLDurationType", Unitlist.DurationType(), "");  //工期計算方式

        }
        protected void SetDropDownList(string thisName, string thisData, string thisSet)
        {
            DropDownList thisDropDownList = (DropDownList)Page.Master.FindControl("ContentPlaceHolder1").FindControl(thisName);

            thisDropDownList.Items.Clear();
            //thisDropDownList.Items.Add(new ListItem(stratSet.ToString(), stratSet.ToString()));
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
            SetRadioButtonList("RBPerformanceBondType", Unitlist.Percent(), "");  //承攬方式
            SetRadioButtonList("RBEngType", Unitlist.Engineer(), "");
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
            //ErrorString += (DDLEngCountry.SelectedIndex) == 0 ? "工程所在國家請選擇!!\\n" : "";
            //ErrorString += (DDLEngLocation.SelectedIndex) == 0 ? "工程所在縣市請選擇!!\\n" : "";
            //ErrorString += (TxSitePerson.Text) == string.Empty ? "工地負責人請填入!!\\n" : "";
            //ErrorString += (TxSiteTel.Text) == string.Empty ? "工地電話請填入!!\\n" : "";
            //ErrorString += (TxOwnerName.Text) == string.Empty ? "業主名稱請填入!!\\n" : "";
            //ErrorString += (TxOwnerContactPerson.Text) == string.Empty ? "業主聯絡人請填入!!\\n" : "";
            //ErrorString += (RBContractWay.SelectedIndex) == -1 ? "承攬方式請選擇!!\\n" : "";
            //ErrorString += (DDLDurationType.SelectedIndex) == 0 ? "工期計算方式請選擇!!\\n" : "";
            //ErrorString += (TxOContrctPrice.Text) == string.Empty ? "原合約總價請填入!!\\n" : "";
            //ErrorString += (TxOwnerName.Text) == string.Empty ? "工地電話請填入!!\\n" : "";
            //ErrorString += (TxDuration.Text) == string.Empty ? "工期請填入!!\\n" : "";

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
                    if (datacheck1(Session["ProjectCode"].ToString()) == false)
                    {

                    string result= WebModel.SaveAction_pro(database, _TableNameM1, GetDataBox(), Session["ProjectCode"].ToString());
                    //string result1 = WebModel.SaveAction_pro(database, _TableNameM2, GetDataBox1(), Session["ProjectCode"].ToString());
                    if (result != "0" )
                        {
                              ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                                Response.Redirect("ProjectInfo1View.aspx");
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔失敗');", true);
                        }

                      
                    }
                    else 
                    {
                     bool result3= WebModel.EditAction_pro(database, _TableNameM1, Session["ProjectCode"].ToString(), GetDataBox());
                     //bool result4= WebModel.EditAction_pro(database, _TableNameM2, Session["ProjectCode"].ToString(), GetDataBox1());
                     if (result3 )
                        {
                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('修改完成');", true);
                        }else
                        {
                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('修改失敗');", true);
                        }
                   
                    }

                    if (datacheck2(Session["ProjectCode"].ToString()) == false)
                    {

                        //string result = WebModel.SaveAction_pro(database, _TableNameM1, GetDataBox(), Session["ProjectCode"].ToString());
                        string result1 = WebModel.SaveAction_pro(database, _TableNameM2, GetDataBox1(), Session["ProjectCode"].ToString());
                        if (result1 != "0")
                        {
                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                            Response.Redirect("ProjectInfo1View.aspx");
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔失敗');", true);
                        }


                    }
                    else
                    {
                        //bool result3 = WebModel.EditAction_pro(database, _TableNameM1, Session["ProjectCode"].ToString(), GetDataBox());
                        bool result4 = WebModel.EditAction_pro(database, _TableNameM2, Session["ProjectCode"].ToString(), GetDataBox1());
                        if ( result4)
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
        protected DataTable GetDataBox1()
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
            DataTableDr["OContrctPrice"] = TxOContrctPrice.Text !=""?decimal.Parse(TxOContrctPrice.Text):0;
            DataTableDr["ContractWay"] = RBContractWay.SelectedValue != "" ? RBContractWay.SelectedValue : "-1";
            DataTableDr["OwnerName"] = TxOwnerName.Text;
            DataTableDr["ArchitectName"] = TxArchitectName.Text;
            DataTableDr["ConsultantName"] = TxConsultantName.Text;
            DataTableDr["PCMname"] = TxPCMname.Text;
            DataTableDr["DurationType"] = DDLDurationType.SelectedItem.Value;
            DataTableDr["Duration"] = TxDuration.Text;
           // DataTableDr["BuildLicense"] = TxBuildLicense.Text;
           // DataTableDr["BuildLicenseDtae"] = TxBuildLicenseDtae.Text;
           // DataTableDr["UseLicense"] = TxUseLicense.Text;
           // DataTableDr["UseLicenseDate"] = TxUseLicenseDate.Text;

            // DataTableDr["ExcDepth"] = (TxExcDepth.Text != "") ? TxExcDepth.Text : "0";


            DataTableBox.Rows.Add(DataTableDr);
            #endregion

            return DataTableBox;
        }
        //取得建入資料
        protected DataTable GetDataBox()
        {
            string SQLString = "PID,EngCountry,EngLocation,SitePerson,SiteTel,SiteFax,OwnerName,OwnerContactPerson,OwnerAddress,OwnerContactTel,BookOpenDate,BookFinishDate,RealOpenDate,RealFinishDate,ApprovedFinishDate,AcceptCheckDate,WarrantyDate,WarrantyMoneyDate,PerformanceBondType,PerformanceBond,EngType,EngClass,DownFloorNum,UpFloorNum,Height,ExcDepth,DownFloorArea,UpFloorArea,FoundationType,Retaining,ConNote,Other";
            DataTable DataTableBox = new DataTable();

            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }


            //後台功能，必需要有的欄位名稱               

            DataRow DataTableDr = DataTableBox.NewRow();

            #region 內容設定

            // DataTableDr["ProjectCode"] = Session["ProjectCode"].ToString();
            DataTableDr["pid"] = Session["ProjectCode"].ToString();
            DataTableDr["EngCountry"] = DDLEngCountry.SelectedItem.Text;
            DataTableDr["EngLocation"] = DDLEngLocation.SelectedItem.Text;
            DataTableDr["SitePerson"] = TxSitePerson.Text;
            DataTableDr["SiteTel"] = TxSiteTel.Text;
            DataTableDr["SiteFax"] = TxSiteFax.Text;
            DataTableDr["OwnerName"] = TxOwnerName.Text;
            DataTableDr["OwnerContactPerson"] = TxOwnerContactPerson.Text;
            DataTableDr["OwnerContactTel"] = TxOwnerContactTel.Text;
            DataTableDr["OwnerAddress"] = TxOwnerAddress.Text;
            DataTableDr["BookOpenDate"] = (TxBookOpenDate.Text != "") ? Convert.ToDateTime(TxBookOpenDate.Text.ToString()).ToString("yyyy/MM/dd") : "";
            DataTableDr["BookFinishDate"] = (TxBookFinishDate.Text != "") ? Convert.ToDateTime(TxBookFinishDate.Text.ToString()).ToString("yyyy/MM/dd") : "";
            DataTableDr["RealOpenDate"] = (TxRealOpenDate.Text != "") ? Convert.ToDateTime(TxRealOpenDate.Text.ToString()).ToString("yyyy/MM/dd") : "";
            DataTableDr["RealFinishDate"] = (TxRealFinishDate.Text != "") ? Convert.ToDateTime(TxRealFinishDate.Text.ToString()).ToString("yyyy/MM/dd") : null;
            DataTableDr["ApprovedFinishDate"] = (TxApprovedFinishDate.Text != "") ? Convert.ToDateTime(TxApprovedFinishDate.Text.ToString()).ToString("yyyy/MM/dd") : "";
            DataTableDr["AcceptCheckDate"] = (TxAcceptCheckDate.Text != "") ? Convert.ToDateTime(TxAcceptCheckDate.Text.ToString()).ToString("yyyy/MM/dd") : "";
            DataTableDr["WarrantyDate"] = (TxWarrantyDate.Text != "") ? Convert.ToDateTime(TxWarrantyDate.Text.ToString()).ToString("yyyy/MM/dd") : "";
            DataTableDr["WarrantyMoneyDate"] = (TxWarrantyMoneyDate.Text != "") ? Convert.ToDateTime(TxWarrantyMoneyDate.Text.ToString()).ToString("yyyy/MM/dd") : "";
            DataTableDr["PerformanceBondType"] = RBPerformanceBondType.SelectedValue;
            DataTableDr["PerformanceBond"] = (TxPerformanceBond.Text != "") ?decimal.Parse(TxPerformanceBond.Text) : 0;
            DataTableDr["EngType"] = RBEngType.SelectedValue;
            DataTableDr["EngClass"] = DDLEngClass.SelectedValue;
            DataTableDr["DownFloorNum"] = TxDownFloorNum.Text;
            DataTableDr["UpFloorNum"] = TxUpFloorNum.Text;
            DataTableDr["UpFloorArea"] = TxUpFloorArea.Text;
            DataTableDr["UpFloorArea"] = (TxUpFloorArea.Text != "") ?decimal.Parse(TxUpFloorArea.Text) : 0;
            DataTableDr["DownFloorArea"] = (TxDownFloorArea.Text != "") ?decimal.Parse(TxDownFloorArea.Text) : 0;
            DataTableDr["Height"] = (TxHeight.Text != "") ?decimal.Parse(TxHeight.Text) : 0;
            DataTableDr["ExcDepth"] = (TxExcDepth.Text != "") ?decimal.Parse(TxExcDepth.Text) : 0;
            DataTableDr["FoundationType"] = DDLFoundationType.SelectedValue;
            DataTableDr["Retaining"] = DDLRetaining.SelectedValue;
            DataTableDr["ConNote"] = TxConNote.Text;
            DataTableDr["Other"] = TxOther.Text;

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


                DataTable DataTableBox = WebModel.LoadContentData_pro(database, _TableName, Session["ProjectCode"].ToString(), SQLString_check);
           
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
        public bool datacheck1(string data)
        {
            string database = Session["DatabaseName"].ToString();
            if (Session["ProjectCode"] == null)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            else
            {


             
                DataTable DataTableBox1 = WebModel.LoadContentData_pro(database, _TableNameM1, Session["ProjectCode"].ToString(), "PID");
            
                if (DataTableBox1 != null && DataTableBox1.Rows.Count > 0)
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
        public bool datacheck2(string data)
        {
            string database = Session["DatabaseName"].ToString();
            if (Session["ProjectCode"] == null)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            else
            {

                DataTable DataTableBox2 = WebModel.LoadContentData_pro(database, _TableNameM2, Session["ProjectCode"].ToString(), SQLStringM2);
                if (DataTableBox2 != null && DataTableBox2.Rows.Count > 0)
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
            string SQLString = "Select* From ProjectM0 a Left Join ProjectM1 b on a.pid =b.pid left join ProjectM2 c on a.pid=c.pid Where a.PID = '" + Session["ProjectCode"].ToString() + "'";
        
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
                        TxProjectNickname.Text = row["ProjectNickname"].ToString();
                        TxNote.Text = row["Note"].ToString();
                        //datatable(ProjectM1)
                        DDLEngCountry.SelectedItem.Text = row["EngCountry"].ToString().Trim();
                        DDLEngLocation.SelectedItem.Text = row["EngLocation"].ToString().Trim();
                        TxSitePerson.Text = row["SitePerson"].ToString();
                        TxSiteTel.Text = row["SiteTel"].ToString();
                        TxSiteFax.Text = row["SiteFax"].ToString();
                        TxOwnerName.Text = row["OwnerName"].ToString();
                        TxOwnerContactPerson.Text = row["OwnerContactPerson"].ToString();
                        TxOwnerContactTel.Text = row["OwnerContactTel"].ToString();
                        TxOwnerAddress.Text = row["OwnerAddress"].ToString();
                        TxBookOpenDate.Text = (row["BookOpenDate"].ToString() != "") ? Convert.ToDateTime(row["BookOpenDate"].ToString()).ToString("yyyy/MM/dd") : "";
                        TxBookFinishDate.Text = (row["BookFinishDate"].ToString() != "") ? Convert.ToDateTime(row["BookFinishDate"].ToString()).ToString("yyyy/MM/dd") : "";
                        TxRealOpenDate.Text = (row["RealOpenDate"].ToString() != "") ? Convert.ToDateTime(row["RealOpenDate"].ToString()).ToString("yyyy/MM/dd") : "";
                        TxRealFinishDate.Text = (row["RealFinishDate"].ToString() != "") ? Convert.ToDateTime(row["RealFinishDate"].ToString()).ToString("yyyy/MM/dd") : "";
                        TxApprovedFinishDate.Text = (row["ApprovedFinishDate"].ToString() != "") ? Convert.ToDateTime(row["ApprovedFinishDate"].ToString()).ToString("yyyy/MM/dd") : "";
                        TxAcceptCheckDate.Text = (row["AcceptCheckDate"].ToString() != "") ? Convert.ToDateTime(row["AcceptCheckDate"].ToString()).ToString("yyyy/MM/dd") : "";
                        TxWarrantyDate.Text = (row["WarrantyDate"].ToString() != "") ? Convert.ToDateTime(row["WarrantyDate"].ToString()).ToString("yyyy/MM/dd") : "";
                        TxWarrantyMoneyDate.Text = (row["WarrantyMoneyDate"].ToString() != "") ? Convert.ToDateTime(row["WarrantyMoneyDate"].ToString()).ToString("yyyy/MM/dd") : "";
                        if (row["PerformanceBondType"].ToString() != "")
                        {
                            RBPerformanceBondType.SelectedIndex = int.Parse(row["PerformanceBondType"].ToString());
                        }
                        else
                        {
                            RBPerformanceBondType.SelectedIndex = -1;
                        }
                        TxPerformanceBond.Text = row["PerformanceBond"].ToString();
                        if (row["EngType"].ToString() != "")
                        {
                            RBEngType.SelectedIndex = int.Parse(row["EngType"].ToString());
                        }
                        else
                        {
                            RBEngType.SelectedIndex = -1;
                        }
                        DDLEngClass.SelectedValue = row["EngClass"].ToString() != "" ? row["EngClass"].ToString() : "0";
                        TxDownFloorNum.Text = row["DownFloorNum"].ToString();
                        TxUpFloorNum.Text = row["UpFloorNum"].ToString();
                        TxDownFloorArea.Text = row["DownFloorArea"].ToString();
                        TxUpFloorArea.Text = row["UpFloorArea"].ToString();
                        TxHeight.Text = row["Height"].ToString();
                        TxExcDepth.Text = row["ExcDepth"].ToString();
                        DDLFoundationType.SelectedValue = row["FoundationType"].ToString() != "" ? row["FoundationType"].ToString() : "0";
                        DDLRetaining.SelectedValue = row["Retaining"].ToString() != "" ? row["Retaining"].ToString() : "0";
                        TxConNote.Text = row["ConNote"].ToString();
                        TxOther.Text = row["Other"].ToString();
                        TxArchitectName.Text = row["ArchitectName"].ToString();
                        TxOwnerName1.Text = row["OwnerName"].ToString();
                        TxConsultantName.Text = row["ConsultantName"].ToString();
                        TxPCMname.Text = row["PCMname"].ToString();
                        DDLDurationType.SelectedValue = row["DurationType"].ToString() !=""?row["DurationType"].ToString():"0";
                        RBContractWay.SelectedIndex = row["ContractWay"].ToString() !=""?int.Parse(row["ContractWay"].ToString()):-1;
                        TxDuration.Text = row["Duration"].ToString();
                        TxOContrctPrice.Text = row["OContrctPrice"].ToString();
                        DateTime dt1 = DateTime.Now.Date;
                        DateTime dt2 = (row["BookOpenDate"].ToString() != "") ? Convert.ToDateTime(row["BookOpenDate"].ToString()).Date : DateTime.MaxValue;
                        DateTime dt3 = (row["RealOpenDate"].ToString() != "") ? Convert.ToDateTime(row["RealOpenDate"].ToString()).Date : DateTime.MaxValue;
                        DateTime dt4 = (row["BookFinishDate"].ToString() != "") ? Convert.ToDateTime(row["BookFinishDate"].ToString()).Date : DateTime.MaxValue;
                        DateTime dt5 = (row["RealFinishDate"].ToString() != "") ? Convert.ToDateTime(row["RealFinishDate"].ToString()).Date : DateTime.MaxValue;
                        DateTime dt6 = (row["ApprovedFinishDate"].ToString() != "") ? Convert.ToDateTime(row["ApprovedFinishDate"].ToString()).Date : DateTime.MaxValue;
                        DateTime dt7 = (row["AcceptCheckDate"].ToString() != "") ? Convert.ToDateTime(row["AcceptCheckDate"].ToString()).Date : DateTime.MaxValue;
                        DateTime dt8 = (row["WarrantyDate"].ToString() != "") ? Convert.ToDateTime(row["WarrantyDate"].ToString()).Date : DateTime.MaxValue;
                        DateTime dt9 = (row["WarrantyMoneyDate"].ToString() != "") ? Convert.ToDateTime(row["WarrantyMoneyDate"].ToString()).Date : DateTime.MaxValue;
                        // LtStatus.Text = (dt1 >= dt2) ? "已開工" : "未開工";
                        if (dt1 < dt2)
                        {
                            LtStatus.Text = "未開工";
                        }
                        else if
                            //實際開工>現在時間
                            (dt1 >= dt2 && dt1 < dt3)
                        {
                            LtStatus.Text = "應開工未開工";
                        }
                        else if (dt1 >= dt3 && dt4 > dt1)
                        {
                            LtStatus.Text = "施工中";
                        }
                        else if (dt1 > dt4)
                        {
                            LtStatus.Text = "施工中(逾期)";
                        }
                        else if (dt1 > dt5)
                        {
                            LtStatus.Text = "已完工請驗中";
                        }
                        else if (dt1 >= dt7 && dt8 > dt1)
                        {
                            LtStatus.Text = "保固中";
                        }
                        else if (dt1 >= dt8)
                        {
                            LtStatus.Text = "保固金待退";
                        }
                        else if (dt1 >= dt9)
                        {
                            LtStatus.Text = "已結案";
                        }
                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        }
        #endregion
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            string JVID = ((Label)GridView1.Rows[ID_class].FindControl("JVID")).Text.Trim();
        
            if (e.CommandName == "Update")
            {

                string JVItem = ((TextBox)GridView1.Rows[ID_class].FindControl("JVItem")).Text.Trim();
                string JVPrice = ((TextBox)GridView1.Rows[ID_class].FindControl("JVPrice")).Text.Trim();
                DropDownList DDL = (DropDownList)GridView1.Rows[ID_class].FindControl("Name");
                GridView1.DataSourceID = "SqlDataSource3";

                SqlDataSource3.UpdateCommand = "Update ProjectM_JV SET JVItem='" + JVItem + "', JVPrice='" + JVPrice + "', FID=" + DDL.SelectedValue + " FROM ProjectM_JV  where JVID=" + JVID;
                GridView1.DataBind();
            }
            if (e.CommandName == "delete")
            {
                SqlDataSource3.DeleteCommand = "delete ProjectM_JV WHERE [JVID] = " + JVID;
                GridView1.DataBind();
            }
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
        public void OpenNewWindow(string url)
        {

            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=500,width=1050";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}', 'yourWin', '{1}');</script>", url, winFeatures));

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
        protected void LBtn_1_Click(object sender, EventArgs e)
        {
            if ((Pnl_1.Visible == true))
            { Pnl_1.Visible = false; }
            else
            { Pnl_1.Visible = true; }
        }
        protected void LBtn_2_Click(object sender, EventArgs e)
        {
            if ((Pnl_2.Visible == true))
            { Pnl_2.Visible = false; }
            else
            { Pnl_2.Visible = true; }
        }

        protected void ImageButton178_Click(object sender, ImageClickEventArgs e)
        {

            DetailsView1.Visible = true;
            GridView1.DataSourceID = "";
        }
        protected void ImageButton179_Click(object sender, ImageClickEventArgs e)
        {
            GridView1.DataSourceID = "SqlDataSource3";
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.DataSourceID = "SqlDataSource3";
        }
    }
}