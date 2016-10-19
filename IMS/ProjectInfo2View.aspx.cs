using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace IMS
{
    public partial class ProjectInfo2View : System.Web.UI.Page
    {
       
       
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
           
                       LoadContent();
                       DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
                       DDL.Visible = false;
        }
        protected void LoadContent()
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || Session["ProjectCode"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string database = Session["DatabaseName"].ToString();
                string SQLString = "Select* From ProjectM0 a Left Join ProjectM2 b on a.pid =b.pid Where a.PID = '" + Session["ProjectCode"].ToString() + "'";

                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        Session["Pid"] = row["Pid"].ToString();
                        TxProjectCode.Text = row["ProjectCode"].ToString();
                        TxProjectName.Text = row["ProjectName"].ToString();
                        TxOContrctPrice.Text = row["OContrctPrice"].ToString();

                        //datatable(ProjectM1)
                        DDLDurationType.Text = (row["DurationType"].ToString() == "1") ?"限期完工" : (row["DurationType"].ToString() == "2") ? "工作天" :(row["DurationType"].ToString() == "3") ? "日曆天" : (row["DurationType"].ToString() == "4") ? "其他" : "";                       
                        RBContractWay.Text = (row["ContractWay"].ToString() == "0") ? "實做實算" : (row["ContractWay"].ToString() == "1") ? "總價承攬" : (row["ContractWay"].ToString() == "2") ? "實做+總價" : (row["ContractWay"].ToString() == "3") ? "統包" : (row["ContractWay"].ToString() == "4") ? "其他" : "";

                        TxOwnerName.Text = row["OwnerName"].ToString();
                        TxArchitectName.Text = row["ArchitectName"].ToString();
                        TxConsultantName.Text = row["ConsultantName"].ToString();
                        TxPCMname.Text = row["PCMname"].ToString();
                        TxDuration.Text = row["Duration"].ToString();
                        TxBuildLicense.Text = row["BuildLicense"].ToString();
                        TxBuildLicenseDtae.Text = (row["BuildLicenseDtae"].ToString()!="")?Convert.ToDateTime(row["BuildLicenseDtae"].ToString()).ToString("yyyy/MM/dd"):"";
                        TxUseLicense.Text = row["UseLicense"].ToString();
                        TxUseLicenseDate.Text = (row["UseLicenseDate"].ToString()!="")?Convert.ToDateTime(row["UseLicenseDate"].ToString()).ToString("yyyy/MM/dd"):"";
                      
                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        
        }

        protected void Duration_Click(object sender, EventArgs e)
        {
            OpenNewWindow("ProjectDurationV.aspx");
        }
        public void OpenNewWindow(string url)
        {

            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=350,width=950";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}', 'yourWin', '{1}');</script>", url, winFeatures));

        }

        protected void Warranty_Click(object sender, EventArgs e)
        {
            OpenNewWindow("ProjectWarrantyV.aspx");
        }

        protected void Pay_Click(object sender, EventArgs e)
        {
            OpenNewWindow("ProjectPayV.aspx");
        }

        protected void Caution_Click(object sender, EventArgs e)
        {
            OpenNewWindow("ProjectCautionV.aspx");
        }
    }
}