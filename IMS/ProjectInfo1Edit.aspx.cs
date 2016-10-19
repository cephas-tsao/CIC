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
    public partial class ProjectInfo1Edit : System.Web.UI.Page
    {
        
        string _TableName = "ProjectM0";      
        string ErrorString = "";
        string SQLString_check = "PID,ProjectCode,ProjectName,ProjectStatus,ProjectNickname,Note";
        string _TableNameM1 = "ProjectM1";
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null ))
            {
               
            
                Response.Redirect("Login.aspx");
            }

            if (Session["ProjectCode"] == null)
            {
                Response.Write("<script>alert('請先選擇專案');</script>");
                //Response.Redirect("Main.aspx");
            }
            bool check = Utility.Access_check.check_project_access_by_Session(Session["LoginAccess"].ToString(), Request.FilePath.Substring(1), Session["ProjectCode"].ToString());
            if (!check)
            {
                //Response.Write("<script>alert('您必須先選擇專案或您沒有專案的權限');location.href='Main.aspx';</script>");
                Response.Write("<script>alert('您必須先選擇專案或您沒有專案的權限')';</script>");
            }
            if (!IsPostBack)
            {
                CreateDropDownList(); //建立下拉選項
                CreatRadioButtonList(); //RadioButton
                string datasource = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.ConnectionString = datasource;
                SqlDataSource1.SelectCommand = "Select * from Retaining";
                DDLRetaining.DataSourceID = "SqlDataSource1";
                DDLRetaining.DataBind();
              
                SqlDataSource2.ConnectionString = datasource;
                SqlDataSource2.SelectCommand = "Select * from Foundation ";
                DDLFoundationType.DataSourceID = "SqlDataSource2";
                DDLFoundationType.DataBind();
                ListItem LI = new ListItem();
                LI.Text = "--請選擇--";
                LI.Value = "0";

                DDLFoundationType.Items.Insert(0, LI);
                DDLFoundationType.SelectedIndex = 0;

                DDLRetaining.Items.Insert(0, LI);
                DDLRetaining.SelectedIndex = 0;
                Recovery_Click(this, null);
                }

            //DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            //DDL.Visible = false;
                
        }
        protected void CreateDropDownList()
        {
            SetDropDownList("DDLEngCountry", Unitlist.Country(), "");  //工程所在國家
            SetDropDownList("DDLEngLocation", Unitlist.City(), "");  //工程所在縣市
            SetDropDownList("DDLEngClass", Unitlist.ClassList(), "");  //工程所在縣市
          

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
            ErrorString += (TxSitePerson.Text) == string.Empty ? "工地負責人請填入!!\\n" : "";
            ErrorString += (TxSiteTel.Text) == string.Empty ? "工地電話請填入!!\\n" : "";
            ErrorString += (TxOwnerName.Text) == string.Empty ? "業主名稱請填入!!\\n" : "";
            ErrorString += (TxOwnerContactPerson.Text) == string.Empty ? "業主聯絡人請填入!!\\n" : "";


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

                        WebModel.SaveAction_pro(database, _TableNameM1, GetDataBox(), Session["ProjectCode"].ToString());

                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                        Response.Redirect("ProjectInfo1View.aspx");
                    }
                    else
                    {
                        WebModel.EditAction_pro(database, _TableNameM1, Session["ProjectCode"].ToString(), GetDataBox());
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
            DataTableDr["BookOpenDate"] = (TxBookOpenDate.Text != "")? Convert.ToDateTime(TxBookOpenDate.Text.ToString()).ToString("yyyy/MM/dd"):"";
            DataTableDr["BookFinishDate"] = (TxBookFinishDate.Text !="")?Convert.ToDateTime(TxBookFinishDate.Text.ToString()).ToString("yyyy/MM/dd"):"";
            DataTableDr["RealOpenDate"] = (TxRealOpenDate.Text !="")?Convert.ToDateTime(TxRealOpenDate.Text.ToString()).ToString("yyyy/MM/dd"):"";
            DataTableDr["RealFinishDate"] = (TxRealFinishDate.Text !="")?Convert.ToDateTime(TxRealFinishDate.Text.ToString()).ToString("yyyy/MM/dd"):null;
            DataTableDr["ApprovedFinishDate"] = (TxApprovedFinishDate.Text !="")?Convert.ToDateTime(TxApprovedFinishDate.Text.ToString()).ToString("yyyy/MM/dd"):"";
            DataTableDr["AcceptCheckDate"] = (TxAcceptCheckDate.Text !="")?Convert.ToDateTime(TxAcceptCheckDate.Text.ToString()).ToString("yyyy/MM/dd"):"";
            DataTableDr["WarrantyDate"] = (TxWarrantyDate.Text !="")?Convert.ToDateTime(TxWarrantyDate.Text.ToString()).ToString("yyyy/MM/dd"):"";
            DataTableDr["WarrantyMoneyDate"] = (TxWarrantyMoneyDate.Text !="")?Convert.ToDateTime(TxWarrantyMoneyDate.Text.ToString()).ToString("yyyy/MM/dd"):"";
            DataTableDr["PerformanceBondType"] = RBPerformanceBondType.SelectedItem.Value;
            DataTableDr["PerformanceBond"] = (TxPerformanceBond.Text !="")?TxPerformanceBond.Text : "0";
            DataTableDr["EngType"] = RBEngType.SelectedItem.Value;
            DataTableDr["EngClass"] = DDLEngClass.SelectedItem.Text;
            DataTableDr["DownFloorNum"] = TxDownFloorNum.Text;
            DataTableDr["UpFloorNum"] = TxUpFloorNum.Text;
            DataTableDr["UpFloorArea"] = TxUpFloorArea.Text;
            DataTableDr["UpFloorArea"] = (TxUpFloorArea.Text != "") ? TxUpFloorArea.Text : "0";           
            DataTableDr["DownFloorArea"] = (TxDownFloorArea.Text !="")?TxDownFloorArea.Text :"0";
            DataTableDr["Height"] = (TxHeight.Text !="")?TxHeight.Text :"0";
            DataTableDr["ExcDepth"] = (TxExcDepth.Text !="")?TxExcDepth.Text :"0" ;
            DataTableDr["FoundationType"] = DDLFoundationType.SelectedItem.Text;
            DataTableDr["Retaining"] = DDLRetaining.SelectedItem.Text;
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
        #region 恢復值-RECOVERY_LINK
        protected void Recovery_Click(object sender, EventArgs e)
        {
            string SQLString = "Select* From ProjectM0 a Left Join ProjectM1 b on a.pid =b.pid Where a.PID = '" + Session["ProjectCode"].ToString() + "'";

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
                        DDLEngCountry.SelectedItem.Text = row["EngCountry"].ToString();
                        DDLEngLocation.SelectedItem.Text = row["EngLocation"].ToString();
                        TxSitePerson.Text = row["SitePerson"].ToString();
                        TxSiteTel.Text = row["SiteTel"].ToString();
                        TxSiteFax.Text = row["SiteFax"].ToString();
                        TxOwnerName.Text = row["OwnerName"].ToString();
                        TxOwnerContactPerson.Text = row["OwnerContactPerson"].ToString();
                        TxOwnerContactTel.Text = row["OwnerContactTel"].ToString();
                        TxOwnerAddress.Text = row["OwnerAddress"].ToString();
                        TxBookOpenDate.Text = (row["BookOpenDate"].ToString()!="")?Convert.ToDateTime(row["BookOpenDate"].ToString()).ToString("yyyy/MM/dd"):"";
                        TxBookFinishDate.Text = (row["BookFinishDate"].ToString()!="")?Convert.ToDateTime(row["BookFinishDate"].ToString()).ToString("yyyy/MM/dd"):"";
                        TxRealOpenDate.Text = (row["RealOpenDate"].ToString()!="")?Convert.ToDateTime(row["RealOpenDate"].ToString()).ToString("yyyy/MM/dd"):"";
                        TxRealFinishDate.Text =(row["RealFinishDate"].ToString()!="")? Convert.ToDateTime(row["RealFinishDate"].ToString()).ToString("yyyy/MM/dd"):"";
                        TxApprovedFinishDate.Text = (row["ApprovedFinishDate"].ToString()!="")?Convert.ToDateTime(row["ApprovedFinishDate"].ToString()).ToString("yyyy/MM/dd"):"";
                        TxAcceptCheckDate.Text = (row["AcceptCheckDate"].ToString()!="")?Convert.ToDateTime(row["AcceptCheckDate"].ToString()).ToString("yyyy/MM/dd"):"";
                        TxWarrantyDate.Text = (row["WarrantyDate"].ToString()!="")? Convert.ToDateTime(row["WarrantyDate"].ToString()).ToString("yyyy/MM/dd"):"";
                        TxWarrantyMoneyDate.Text =(row["WarrantyMoneyDate"].ToString()!="")? Convert.ToDateTime(row["WarrantyMoneyDate"].ToString()).ToString("yyyy/MM/dd"):""; 
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
                        DDLEngClass.SelectedItem.Text = row["EngClass"].ToString();
                        TxDownFloorNum.Text = row["DownFloorNum"].ToString();
                        TxUpFloorNum.Text = row["UpFloorNum"].ToString();
                        TxDownFloorArea.Text = row["DownFloorArea"].ToString();
                        TxUpFloorArea.Text = row["UpFloorArea"].ToString();
                        TxHeight.Text = row["Height"].ToString();
                        TxExcDepth.Text = row["ExcDepth"].ToString();
                        DDLFoundationType.SelectedItem.Text = row["FoundationType"].ToString();
                        DDLRetaining.SelectedItem.Text = row["Retaining"].ToString();
                        TxConNote.Text = row["ConNote"].ToString();
                        TxOther.Text = row["Other"].ToString();
                      

                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        }
        #endregion
    }
}