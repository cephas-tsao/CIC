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
    public partial class BidView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {

                CreateDropDownList();
              
            }
            SqlDataSource4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlSelect.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlAll.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlAll.SelectCommand = "SELECT BidM0.BID, BidM0.BidName AS 標案名稱, BidM0.Status AS 標案狀態, BidM2.EngLocation AS 工程所在地, BidM2.OwnerName AS 業主名稱," +
            "BidM2.OpenBidTime AS 開標時間, BidM2.BudgetAmount AS 預算金額, BidM4.EngType AS 工程區分, BidM4.EngClass AS 工程分類, BidM5.ApprovedPrice AS 核定標價," +
            "BidAssess.Result AS 標案評估, BidRecord.Result AS 決標紀錄 FROM BidM0 FULL OUTER JOIN BidAssess ON BidM0.BID = BidAssess.BID FULL OUTER JOIN BidM2 " +
            "ON BidM0.BID = BidM2.BID FULL OUTER JOIN BidM4 ON BidM0.BID = BidM4.BID FULL OUTER JOIN BidM5 ON BidM0.BID = BidM5.BID FULL OUTER JOIN BidRecord ON BidM0.BID = BidRecord.BID";

            //DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            //DDL.Visible = false;
         
        }
        protected void Btn_HideSelect_Click(object sender, EventArgs e)
        {
            if ((Btn_HideSelect.Text == "隱藏搜尋面板"))
            {
                Btn_HideSelect.Text = "顯示搜尋面板";
                Pnl_Select.Visible = false;
            }
            else if ((Btn_HideSelect.Text == "顯示搜尋面板"))
            {
                Btn_HideSelect.Text = "隱藏搜尋面板";
                Pnl_Select.Visible = true;
            }
        }
        protected void DDL_Op5_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((DDL_Op5.SelectedValue == "3"))
            {
                TB_Select4.Visible = true;
            }
            else
            {
                TB_Select4.Visible = false;
            }
        }
        //建立多選選項
        protected void CreateDropDownList()
        {
            SetDropDownList("DDL_Select1", Unitlist.GetBid1(), "");  //標案狀態
            SetDropDownList("DDL_Select2", Unitlist.Country(), "");  //工程所在國家
            SetDropDownList("DDL_Select3", Unitlist.City(), "");  //工程所在縣市
         
        }
        protected void SetDropDownList(string thisName, string thisData, string thisSet)
        {
            DropDownList thisDropDownList = (DropDownList)Page.Master.FindControl("ContentPlaceHolder1").FindControl(thisName);

            thisDropDownList.Items.Clear();
            //thisDropDownList.Items.Add(new ListItem(stratSet.ToString(), stratSet.ToString()));
            int count = 0;
            foreach (string DataName in thisData.Split(','))
            {
                thisDropDownList.Items.Add(new ListItem(DataName, DataName));
                count++;
            }
            count = 0;
        }
        protected void Btn_All_Click(object sender, EventArgs e)
        {
            LB_Title.Text = "標案總覽";
            GridView1.DataSourceID = "SqlAll";
            GridView1.DataBind();
        }
        protected void Btn_SelectGO_Click(object sender, EventArgs e)
        {
          
            string database = Session["DatabaseName"].ToString();
            string Keyword = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TB_Select1.Text));
            string Keyword1 = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TB_Select3.Text));
            string Keyword2 = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TB_Select4.Text));
            string Status = DDL_Select1.SelectedValue;
            string City = DDL_Select3.SelectedValue;
            SqlSelect.SelectCommand = "SELECT BidM0.BID, BidM0.BidName AS 標案名稱, BidM0.Status AS 標案狀態, BidM2.EngLocation AS 工程所在地, BidM2.OwnerName AS 業主名稱," +
            "BidM2.OpenBidTime AS 開標時間, cast(BidM2.BudgetAmount AS DECIMAL(18,2)) AS 預算金額, BidM4.EngType AS 工程區分, BidM4.EngClass AS 工程分類, BidM5.ApprovedPrice AS 核定標價, BidAssess.Result AS 標案評估," +
            "BidRecord.Result AS 決標紀錄 FROM BidM0 FULL OUTER JOIN BidAssess ON BidM0.BID = BidAssess.BID FULL OUTER JOIN BidM2 ON BidM0.BID = BidM2.BID FULL OUTER JOIN BidM4 ON BidM0.BID = BidM4.BID " +
            "FULL OUTER JOIN BidM5 ON BidM0.BID = BidM5.BID FULL OUTER JOIN BidRecord ON BidM0.BID = BidRecord.BID ";
            #region 搜尋條件
            string SelectString = "";
            SelectString = (Keyword != "") ? "BidM0.BidName like '%" + Keyword + "%' " : "";

            if (Keyword == "")
            {
                if (DDL_Op1.SelectedValue == "AND")
                {
                    SelectString += "";
                }
                else if (DDL_Op1.SelectedValue == "OR")
                {
                    SelectString += "";
                }
                else if (DDL_Op1.SelectedValue == "AND NOT")
                {
                    SelectString += "not";
                }
                SelectString += (Status != "-請選擇-") ? "" : "";
            }
            else
            {
                SelectString += (Status != "-請選擇-") ? DDL_Op1.SelectedValue : ""; 
            }
                SelectString += (Status != "-請選擇-") ? " BidM0.Status = '" + Status + "'" : "";
                SelectString += (City != "-請選擇-") ? DDL_Op2.SelectedValue : "";
                SelectString += (City != "-請選擇-") ? " BidM2.EngLocation = '" + City + "'" : "";
           
            if(TB_Select3.Text != "" && DDL_Op5.SelectedValue =="1")
            {
                SelectString += "and BidM2.BudgetAmount <= '" + Keyword1 + "'";
            }
            else if (TB_Select3.Text != "" && DDL_Op5.SelectedValue == "2")
            {
                SelectString += "and BidM2.BudgetAmount > '" + Keyword1 + "'";
            }
            else if (TB_Select3.Text != "" && DDL_Op5.SelectedValue == "3")
            {
                SelectString += "and BidM2.BudgetAmount >= '" + Keyword1 + "'";
                SelectString += "and BidM2.BudgetAmount <= '" + Keyword2 + "'";
            }
         
            SelectString = (SelectString.Length > 1) ? "where " + SelectString : "";
            #endregion

            SqlSelect.SelectCommand += SelectString;
           //string x = SqlSelect.SelectCommand + " WHERE ";
            string xx = "";
            //string Key1 = TB_Select1.Text.Trim();
          
            //string Op1 = DDL_Op1.SelectedValue;
            //string Op2 = DDL_Op2.SelectedValue;
            //string Op3 = DDL_Op3.SelectedValue;
            //string OpKey = DDL_Op4.SelectedValue;
            //string OpPrice = DDL_Op5.SelectedValue;
            //string Op1T = DDL_Op1.SelectedItem.Text;
            //string Op2T = DDL_Op2.SelectedItem.Text;
            //string Op3T = DDL_Op3.SelectedItem.Text;
           // string OpKeyT = DDL_Op4.SelectedItem.Text;
            string OpPriceT = DDL_Op5.SelectedItem.Text;
        
            xx += "依" + Keyword +",";
            xx += Keyword1 != "" ? Keyword1+"," : "";
            xx += Keyword2 != "" ? Keyword2 +",": "";
            xx += Status != "-請選擇-" ? Status+"," : "";
            xx += City != "-請選擇-" ? City +",": "";
            xx += "之搜尋結果";
            LB_Title.Text = xx;
          
            GridView1.DataSourceID = "SqlSelect";       
            GridView1.DataBind();      
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            ID_class = ID_class % GridView1.PageSize;
            if (e.CommandName == "Detail")
            {
                Pnl_Info.Visible = true;
                string BID = ((Label)GridView1.Rows[ID_class].FindControl("BID")).Text.Trim();
                Session["bid"] = BID;
                SqlDataSource4.SelectCommand = "SELECT Bid_Joint.JBID, FirmM.Name AS 共同投標廠商名稱, Bid_Joint.JBItem AS 共同投標項目, Bid_Joint.JBPrice AS 共同投標金額 FROM FirmM INNER JOIN Bid_Joint ON FirmM.UID = Bid_Joint.FID where Bid_Joint.Bid=" + BID + "";
                string SQLString = "SELECT * FROM BidM0 FULL OUTER JOIN BidAssess ON BidM0.BID = BidAssess.BID FULL OUTER JOIN BidM2 ON BidM0.BID = BidM2.BID FULL OUTER JOIN BidM1 ON BidM0.BID = BidM1.BID" +
                                 " FULL OUTER JOIN BidM3 ON BidM0.BID = BidM3.BID FULL OUTER JOIN BidM4 ON BidM0.BID = BidM4.BID FULL OUTER JOIN BidM5 ON BidM0.BID = BidM5.BID FULL OUTER JOIN BidRecord ON BidM0.BID = BidRecord.BID where BidM0.Bid=" + BID + "";
                string database = Session["DatabaseName"].ToString();

                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        // DataTableDr["bid"] = Session["bid"].ToString();
                        //Session["bid"] = row["bid"].ToString();
                        LbName.Text = row["BidName"].ToString();
                        LbStatus.Text = row["Status"].ToString();
                        LbForecastPrice.Text =row["ForecastPrice"].ToString() !=""?decimal.Parse(row["ForecastPrice"].ToString()).ToString("N0"):"";
                        LbForecastBiddingDate.Text = row["ForecastBiddingDate"].ToString();
                        LbNotes.Text = row["Notes"].ToString();
                        LbEngCountry.Text = row["EngCountry"].ToString();
                        LbEngLocation.Text = row["EngLocation"].ToString();
                        LbEGetBidNY.Text = (row["EGetBidNY"].ToString() == "1")? "是" :(row["EGetBidNY"].ToString() == "2")? "否" :"" ;
                        LbEBiddingNY.Text = (row["EBiddingNY"].ToString() == "1") ? "是" : (row["EBiddingNY"].ToString() == "2") ? "否" : "";
                        LbBiddingEndDate.Text = row["BiddingEndDate"].ToString();
                        LbOwnerName.Text = row["OwnerName"].ToString();
                        LbOwnerContactPerson.Text = row["OwnerContactPerson"].ToString();
                        LbOwnerAddress.Text = row["OwnerAddress"].ToString();
                        LbOwnerContactTel.Text = row["OwnerContactTel"].ToString();
                        LbGetBidAddress.Text = row["GetBidAddress"].ToString();
                        LbIlluBond.Text = row["IlluBond"].ToString() != "" && row["IlluBond"].ToString()!="0.00"?decimal.Parse(row["IlluBond"].ToString()).ToString("N0")+"元":"";
                        LbIlluFee.Text = row["IlluFee"].ToString() != "" && row["IlluFee"].ToString() != "0.00"?decimal.Parse(row["IlluFee"].ToString()).ToString("N0")+"元":"";
                        LbReturnIlluDeadline.Text = row["ReturnIlluDeadline"].ToString();
                        LbPerformanceBond.Text = row["PerformanceBond"].ToString() != "" && row["PerformanceBond"].ToString()!="0.00"?decimal.Parse(row["PerformanceBond"].ToString()).ToString("N0")+"元":"";
                        LbBidBond.Text = row["BidBond"].ToString() != "" && row["BidBond"].ToString()!="0.00"?decimal.Parse(row["BidBond"].ToString()).ToString("N0")+"元":"";
                        LbFirmQualif.Text = row["FirmQualif"].ToString();
                        LbOpenBidAddress.Text = row["OpenBidAddress"].ToString();
                        LbOpenBidTime.Text = row["OpenBidTime"].ToString();
                        LbAwardingType.Text = row["AwardingType"].ToString();
                        LbJointBidNY.Text = (row["JointBidNY"].ToString() == "1" )? "是" : (row["JointBidNY"].ToString() == "2" )? "否" :"";
                        LbGetBidNY.Text = (row["GetBidNY"].ToString() =="1")?"是":(row["GetBidNY"].ToString() =="2")? "否":"";
                        LbContractWay.Text = (row["ContractWay"].ToString() =="1")?"實做實算":(row["ContractWay"].ToString() =="2")?"總價承攬":(row["ContractWay"].ToString() =="3")?"實做+總價" :(row["ContractWay"].ToString() =="4")?"統包":(row["ContractWay"].ToString() =="5")?"其他": "";
                        LbOwnerName1.Text = row["OwnerName1"].ToString();
                        LbArchitectName.Text = row["ArchitectName"].ToString();
                        LbConsultantName.Text = row["ConsultantName"].ToString();
                        LbPCMname.Text = row["PCMname"].ToString();
                        LbDurationType.Text = (row["DurationType"].ToString() == "1") ? "限期完工" : (row["DurationType"].ToString() == "2") ? "工作天" : (row["DurationType"].ToString() == "3") ? "日曆天" : (row["DurationType"].ToString() == "4") ? "其他" : "";
                        LbDuration.Text = row["Duration"].ToString();
                        LbEngType.Text = (row["EngType"].ToString() == "0") ? "公共工程" : (row["EngType"].ToString() == "1") ? "民間工程" : "";
                        LbEngClass.Text = (row["EngClass"].ToString() == "1") ? "建築工程" : (row["EngClass"].ToString() == "2") ? "隧道工程" : (row["EngClass"].ToString() == "3") ? "自來水工程" : (row["EngClass"].ToString() == "4") ? "機場工程" :
                        (row["EngClass"].ToString() == "5") ? "高速公路工程" : (row["EngClass"].ToString() == "6") ? "橋梁工程" : (row["EngClass"].ToString() == "7") ? "捷運系統工程" : (row["EngClass"].ToString() == "8") ? "發電工程" :
                        (row["EngClass"].ToString() == "9") ? "公路工程" : (row["EngClass"].ToString() == "10") ? "污水處理廠工程" : (row["EngClass"].ToString() == "11") ? "市區道路工程" : (row["EngClass"].ToString() == "12") ? "高速鐵路工程" :
                        (row["EngClass"].ToString() == "13") ? "鐵路工程" : (row["EngClass"].ToString() == "14") ? "明挖覆蓋隧道工程" : (row["EngClass"].ToString() == "15") ? "港灣工程" : (row["EngClass"].ToString() == "16") ? "水庫工程" :
                        (row["EngClass"].ToString() == "17") ? "河川整治工程" : (row["EngClass"].ToString() == "18") ? "灌溉排水工程" : (row["EngClass"].ToString() == "19") ? "海洋放流工程" : (row["EngClass"].ToString() == "20") ? "焚化廠工程" :
                        (row["EngClass"].ToString() == "21") ? "掩埋場工程" : (row["EngClass"].ToString() == "22") ? "土地重劃工程" : (row["EngClass"].ToString() == "23") ? "水力發電工程" : (row["EngClass"].ToString() == "24") ? "下水道工程" :
                        (row["EngClass"].ToString() == "25") ? "土方資源場工程" : (row["EngClass"].ToString() == "26") ? "山坡地開發" : (row["EngClass"].ToString() == "27") ? "工業區開發工程" : (row["EngClass"].ToString() == "28") ? "其他工程" : "";
                        LbDownFloorNum.Text = row["DownFloorNum"].ToString() != "" && int.Parse(row["DownFloorNum"].ToString()) != 0 ? row["DownFloorNum"].ToString() + "樓" : "";
                        LbUpFloorNum.Text = row["UpFloorNum"].ToString() != "" && int.Parse(row["UpFloorNum"].ToString()) != 0 ? row["UpFloorNum"].ToString() + "樓" : "";
                        LbHeight.Text = row["Height"].ToString() != "" && row["Height"].ToString() != "0.00" ? row["Height"].ToString() + "平方公尺(M<sup>2</sup>)" : "";
                        LbExcDepth.Text = row["ExcDepth"].ToString() != "" && row["ExcDepth"].ToString() != "0.00" ? row["ExcDepth"].ToString() + "平方公尺(M<sup>2</sup>)" : "";
                        LbDownFloorArea.Text = row["DownFloorArea"].ToString() != "" & row["DownFloorArea"].ToString() != "0.00" ? row["DownFloorArea"].ToString() + "公尺(M)" : "";
                        LbUpFloorArea.Text = row["UpFloorArea"].ToString() != "" && row["UpFloorArea"].ToString() != "0.00" ? row["UpFloorArea"].ToString() + "公尺(M)" : "";
                        LbFoundationType.Text = row["FoundationType"].ToString() != "" && row["FoundationType"].ToString() !="0"?row["FoundationType"].ToString():"";
                        LbRetaining.Text = row["Retaining"].ToString() != "" && row["Retaining"].ToString() !="0"?row["Retaining"].ToString() :"";
                        LbNote.Text = row["Note"].ToString();
                        LbOther.Text = row["Other"].ToString();
                        LbWorkManName.Text = row["WorkManName"].ToString();
                        LbGetBidDate.Text = row["GetBidDate"].ToString() !=""?DateTime.Parse(row["GetBidDate"].ToString()).ToString("yyyy-MM-dd"):"";
                        LbBookEstimateEndDate.Text =row["BookEstimateEndDate"].ToString()!=""? DateTime.Parse(row["BookEstimateEndDate"].ToString()).ToString("yyyy-MM-dd"):"";
                        LbPriBidMeetTime.Text =row["PriBidMeetTime"].ToString()!=""? DateTime.Parse(row["PriBidMeetTime"].ToString()).ToString("yyyy-MM-dd"):"";
                        LbSendBidDate.Text = row["SendBidDate"].ToString() !=""?DateTime.Parse(row["SendBidDate"].ToString()).ToString("yyyy-MM-dd"):"";
                        LbReturnIlluDate.Text = row["ReturnIlluDate"].ToString() !=""?DateTime.Parse(row["ReturnIlluDate"].ToString()).ToString("yyyy-MM-dd"):"";
                        LbEstimateCosts.Text = row["EstimateCosts"].ToString() !="" && row["EstimateCosts"].ToString() != "0.00"?decimal.Parse(row["EstimateCosts"].ToString()).ToString("N0"):"";
                        LbProposalPrice.Text = row["ProposalPrice"].ToString() != "" && row["ProposalPrice"].ToString() != "0.00" ? decimal.Parse(row["ProposalPrice"].ToString()).ToString("N0") : ""; ;
                        LbProposalProfit.Text = row["ProposalProfit"].ToString() !="" && row["ProposalProfit"].ToString() !="0.00" ?decimal.Parse(row["ProposalProfit"].ToString()).ToString("N0"):"";
                        LbApprovedPrice.Text = row["ApprovedPrice"].ToString() != "" && row["ApprovedPrice"].ToString() != "0.00" ?decimal.Parse(row["ApprovedPrice"].ToString()).ToString("N0") : "";
                        LbApprovedProfit.Text = row["ApprovedProfit"].ToString() !="" && row["ApprovedProfit"].ToString()!= "0.00"?decimal.Parse(row["ApprovedProfit"].ToString()).ToString("N0"):"";
                       
                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }       
              
            }
            if (e.CommandName == "record")
            {
                string BID = ((Label)GridView1.Rows[ID_class].FindControl("BID")).Text.Trim();
                Session["bid"] = BID;
                OpenNewWindow("BidRecordV.aspx", "1000", "1200");
            }
            if (e.CommandName == "access")
            {
                string BID = ((Label)GridView1.Rows[ID_class].FindControl("BID")).Text.Trim();
                Session["bid"] = BID;
                OpenNewWindow("BidAssessV.aspx", "700", "900");
            }
        }
        public void OpenNewWindow(string url,string height,string width)
        {

            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=" + height + ",width=" + width + "";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}', 'yourWin', '{1}');</script>", url, winFeatures));

        }
        protected void Punish_Click(object sender, EventArgs e)
        {
            OpenNewWindow("BidDurationV.aspx","400","1000");
        }

        protected void Warranty_Click(object sender, EventArgs e)
        {
            OpenNewWindow("BidWarrantyV.aspx","350","1000");
        }

        protected void Payment_Click(object sender, EventArgs e)
        {
            OpenNewWindow("BidPayV.aspx", "320", "1000");
        }

        protected void Notice_Click(object sender, EventArgs e)
        {
            OpenNewWindow("BidCautionV.aspx", "550", "1050");
        }

        protected void Btn_SelectEmpty_Click(object sender, EventArgs e)
        {
            TB_Select1.Text = "";
            DDL_Select1.SelectedValue = "-請選擇-";
            DDL_Select2.SelectedValue = "請選擇國家...";
            DDL_Select3.SelectedValue = "-請選擇-";
            TB_Select3.Text = "";
            TB_Select4.Text = "";
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                Button Button1 = (Button)e.Row.FindControl("Button1");
                Button Button2 = (Button)e.Row.FindControl("Button2");
                string com = DataBinder.Eval(e.Row.DataItem, "決標紀錄").ToString();
                string com1 = DataBinder.Eval(e.Row.DataItem, "標案評估").ToString();
                Label LbEngType = (Label)e.Row.FindControl("LbEngType");
                Label LbEngClass = (Label)e.Row.FindControl("LbEngClass");
                LbEngType.Text = (LbEngType.Text == "0") ? "公共工程" : (LbEngType.Text == "1") ? "民間工程" : "";
                LbEngClass.Text = (LbEngClass.Text == "1") ? "建築工程" : (LbEngClass.Text == "2") ? "隧道工程" : (LbEngClass.Text == "3") ? "自來水工程" : (LbEngClass.Text == "4") ? "機場工程" :
                       (LbEngClass.Text == "5") ? "高速公路工程" : (LbEngClass.Text == "6") ? "橋梁工程" : (LbEngClass.Text == "7") ? "捷運系統工程" : (LbEngClass.Text == "8") ? "發電工程" :
                       (LbEngClass.Text == "9") ? "公路工程" : (LbEngClass.Text == "10") ? "污水處理廠工程" : (LbEngClass.Text == "11") ? "市區道路工程" : (LbEngClass.Text == "12") ? "高速鐵路工程" :
                       (LbEngClass.Text == "13") ? "鐵路工程" : (LbEngClass.Text == "14") ? "明挖覆蓋隧道工程" : (LbEngClass.Text == "15") ? "港灣工程" : (LbEngClass.Text == "16") ? "水庫工程" :
                       (LbEngClass.Text == "17") ? "河川整治工程" : (LbEngClass.Text == "18") ? "灌溉排水工程" : (LbEngClass.Text == "19") ? "海洋放流工程" : (LbEngClass.Text == "20") ? "焚化廠工程" :
                       (LbEngClass.Text == "21") ? "掩埋場工程" : (LbEngClass.Text == "22") ? "土地重劃工程" : (LbEngClass.Text == "23") ? "水力發電工程" : (LbEngClass.Text == "24") ? "下水道工程" :
                       (LbEngClass.Text == "25") ? "土方資源場工程" : (LbEngClass.Text == "26") ? "山坡地開發" : (LbEngClass.Text == "27") ? "工業區開發工程" : (LbEngClass.Text == "28") ? "其他工程" : "";
                Button2.Visible = com == "得標" ? Button2.Visible = true : false;
                Button1.Visible = com1 == "YES" ? Button1.Visible = true : false;
            }
        }
    }
}