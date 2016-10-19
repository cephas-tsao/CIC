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
    public partial class ProjectInfoView : System.Web.UI.Page
    {
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
            bool check = Utility.Access_check.check_project_access_by_Session(Session["LoginAccess"].ToString(), Request.FilePath.Substring(1), Session["ProjectCode"].ToString());
            //if (!check)
            //{
            //    Response.Write("<script>alert('您必須先選擇專案或您沒有專案的權限');location.href='Main.aspx';</script>");
            //}
            LoadContent();
            //DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            //DDL.Visible = false;
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
        }
        public void LoadContent()
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
                        DDLEngCountry.Text = row["EngCountry"].ToString();
                        DDLEngLocation.Text = row["EngLocation"].ToString();
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
                        RBPerformanceBondType.Text = (row["PerformanceBondType"].ToString() == "") ? "" : (row["PerformanceBondType"].ToString() == "0") ? "金額" : "百分比";
                        TxPerformanceBond.Text = row["PerformanceBond"].ToString();
                        RBEngType.Text = (row["EngType"].ToString() == "") ? "" : (row["EngType"].ToString() == "0") ? "公共工程" : "民間工程";
                        DDLEngClass.Text = row["EngClass"].ToString();
                        TxDownFloorNum.Text = row["DownFloorNum"].ToString();
                        TxUpFloorNum.Text = row["UpFloorNum"].ToString();
                        TxDownFloorArea.Text = row["DownFloorArea"].ToString();
                        TxUpFloorArea.Text = row["UpFloorArea"].ToString();
                        TxHeight.Text = row["Height"].ToString();
                        TxExcDepth.Text = row["ExcDepth"].ToString();
                        DDLFoundationType.Text = row["FoundationType"].ToString();
                        DDLRetaining.Text = row["Retaining"].ToString();
                        TxConNote.Text = row["ConNote"].ToString();
                        TxOther.Text = row["Other"].ToString();
                        LbOContrctPrice.Text = row["OContrctPrice"].ToString() != "" ? decimal.Parse(row["OContrctPrice"].ToString()).ToString("N0") :"0";
                        LbBuildLicense.Text = row["BuildLicense"].ToString();
                        LbBuildLicenseDtae.Text = row["BuildLicenseDtae"].ToString();
                        LbUseLicense.Text = row["UseLicense"].ToString();
                        LbUseLicenseDate.Text = row["UseLicenseDate"].ToString();
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
                        TxProjectCode.Text = row["ProjectCode"].ToString();
                        TxProjectName.Text = row["ProjectName"].ToString();
                        //TxOContrctPrice.Text = row["OContrctPrice"].ToString();

                        //datatable(ProjectM1)
                        DDLDurationType.Text = (row["DurationType"].ToString() == "1") ? "限期完工" : (row["DurationType"].ToString() == "2") ? "工作天" : (row["DurationType"].ToString() == "3") ? "日曆天" : (row["DurationType"].ToString() == "4") ? "其他" : "";
                        RBContractWay.Text = (row["ContractWay"].ToString() == "0") ? "實做實算" : (row["ContractWay"].ToString() == "1") ? "總價承攬" : (row["ContractWay"].ToString() == "2") ? "實做+總價" : (row["ContractWay"].ToString() == "3") ? "統包" : (row["ContractWay"].ToString() == "4") ? "其他" : "";

                        TxOwnerName.Text = row["OwnerName"].ToString();
                        TxArchitectName.Text = row["ArchitectName"].ToString();
                        TxConsultantName.Text = row["ConsultantName"].ToString();
                        TxPCMname.Text = row["PCMname"].ToString();
                        TxDuration.Text = row["Duration"].ToString();
                        //TxBuildLicense.Text = row["BuildLicense"].ToString();
                        //TxBuildLicenseDtae.Text = (row["BuildLicenseDtae"].ToString() != "") ? Convert.ToDateTime(row["BuildLicenseDtae"].ToString()).ToString("yyyy/MM/dd") : "";
                        //TxUseLicense.Text = row["UseLicense"].ToString();
                        //TxUseLicenseDate.Text = (row["UseLicenseDate"].ToString() != "") ? Convert.ToDateTime(row["UseLicenseDate"].ToString()).ToString("yyyy/MM/dd") : "";
                      

                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
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
            GridView1.DataSourceID = "";
        }
        protected void ImageButton179_Click(object sender, ImageClickEventArgs e)
        {
            GridView1.DataSourceID = "SqlDataSource1";
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.DataSourceID = "SqlDataSource1";
        }
    }
}