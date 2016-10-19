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
    public partial class ProjectInfo1View : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
           
            bool check = Utility.Access_check.check_project_access_by_Session(Session["LoginAccess"].ToString(), Request.FilePath.Substring(1), Session["ProjectCode"].ToString());
            if (!check)
            {
                Response.Write("<script>alert('您必須先選擇專案或您沒有專案的權限');location.href='Main.aspx';</script>");
            }
            LoadContent();
            DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            DDL.Visible = false;
        }

        public void LoadContent()
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
                        DDLEngCountry.Text = row["EngCountry"].ToString();
                        DDLEngLocation.Text = row["EngLocation"].ToString();
                        TxSitePerson.Text = row["SitePerson"].ToString();
                        TxSiteTel.Text = row["SiteTel"].ToString();
                        TxSiteFax.Text = row["SiteFax"].ToString();
                        TxOwnerName.Text = row["OwnerName"].ToString();
                        TxOwnerContactPerson.Text = row["OwnerContactPerson"].ToString();
                        TxOwnerContactTel.Text = row["OwnerContactTel"].ToString();
                        TxOwnerAddress.Text = row["OwnerAddress"].ToString();
                        TxBookOpenDate.Text =(row["BookOpenDate"].ToString() !="")? Convert.ToDateTime(row["BookOpenDate"].ToString()).ToString("yyyy/MM/dd"):"";
                        TxBookFinishDate.Text = (row["BookFinishDate"].ToString()!="")?Convert.ToDateTime(row["BookFinishDate"].ToString()).ToString("yyyy/MM/dd"):"";
                        TxRealOpenDate.Text = (row["RealOpenDate"].ToString()!="")? Convert.ToDateTime(row["RealOpenDate"].ToString()).ToString("yyyy/MM/dd"):"";
                        TxRealFinishDate.Text =(row["RealFinishDate"].ToString() != "")? Convert.ToDateTime(row["RealFinishDate"].ToString()).ToString("yyyy/MM/dd"):"";
                        TxApprovedFinishDate.Text =(row["ApprovedFinishDate"].ToString()!="")? Convert.ToDateTime(row["ApprovedFinishDate"].ToString()).ToString("yyyy/MM/dd"):"";
                        TxAcceptCheckDate.Text = (row["AcceptCheckDate"].ToString() !="")? Convert.ToDateTime(row["AcceptCheckDate"].ToString()).ToString("yyyy/MM/dd"):"";
                        TxWarrantyDate.Text = (row["WarrantyDate"].ToString()!="")?Convert.ToDateTime(row["WarrantyDate"].ToString()).ToString("yyyy/MM/dd"):"";
                        TxWarrantyMoneyDate.Text = (row["WarrantyMoneyDate"].ToString()!="")?Convert.ToDateTime(row["WarrantyMoneyDate"].ToString()).ToString("yyyy/MM/dd"):"";
                        RBPerformanceBondType.Text = (row["PerformanceBondType"].ToString() =="")? "":(row["PerformanceBondType"].ToString() =="0")? "金額" :"百分比";                      
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
                        DateTime dt1 = DateTime.Now.Date;
                        DateTime dt2 = (row["BookOpenDate"].ToString() != "") ? Convert.ToDateTime(row["BookOpenDate"].ToString()).Date : DateTime.MaxValue;
                        DateTime dt3 = (row["RealOpenDate"].ToString()!="")?Convert.ToDateTime(row["RealOpenDate"].ToString()).Date:DateTime.MaxValue;
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
                            (dt1 >= dt2 && dt1<dt3)
                        {
                            LtStatus.Text = "應開工未開工";
                        }
                       else if(dt1 >= dt3 && dt4 > dt1)
                        {
                            LtStatus.Text = "施工中";                        
                        }
                        else if (dt1> dt4)
                        {
                            LtStatus.Text = "施工中(逾期)";        
                        }
                        else if(dt1>dt5)
                        {
                            LtStatus.Text = "已完工請驗中";    
                        }
                        else if(dt1>=dt7 && dt8> dt1)
                        {
                            LtStatus.Text = "保固中";  
                        }
                        else if(dt1>=dt8)
                        {
                            LtStatus.Text = "保固金待退";  
                        }
                        else if(dt1>=dt9)
                        {
                            LtStatus.Text = "已結案";  
                        }
                                            

                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        }
       
    }
}