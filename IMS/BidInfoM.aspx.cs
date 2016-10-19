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
    public partial class BidInfoM : System.Web.UI.Page
    {
        string _TableName = "BidM2";
        string _TableName1 = "BidM3";
        string _TableName2 = "BidM4";
        string _TableName3 = "BidM5";
        string ErrorString = "";
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource6.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource7.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            //
            if (!IsPostBack)
            {
                CreateDropDownList(); //建立下拉選項
                //CreatRadioButtonList();//建立radiobutton選項
                string datasource = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.ConnectionString = datasource;
                
                SqlDataSource2.ConnectionString = datasource;
                SqlDataSource2.SelectCommand = "Select * from Foundation ";
                DLFoundationType.DataSourceID = "SqlDataSource2";
                DLFoundationType.DataBind();

                SqlDataSource3.ConnectionString = datasource;
                SqlDataSource3.SelectCommand = "Select * from Retaining";
                DLRetaining.DataSourceID = "SqlDataSource3";
                DLRetaining.DataBind();
                ListItem LI = new ListItem();
                LI.Text = "--請選擇--";
                LI.Value = "0";

               
                DLFoundationType.Items.Insert(0, LI);
                DLFoundationType.SelectedIndex = 0;

                DLRetaining.Items.Insert(0, LI);
                DLRetaining.SelectedIndex = 0;
                SqlDataSource1.SelectCommand = "SELECT * FROM [BidM0] ";
               
            }
            //DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            //DDL.Visible = false;
           
        }
        protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
        {
            DLWorkManName.Items.Clear();
            DLWorkManName.Items.Add("-請選擇部門人員-");
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
        protected void LBtn_3_Click(object sender, EventArgs e)
        {
            if ((Pnl_3.Visible == true))
            { Pnl_3.Visible = false; }
            else
            { Pnl_3.Visible = true; }
        }
        protected void LBtn_4_Click(object sender, EventArgs e)
        {
            if ((Pnl_4.Visible == true))
            { Pnl_4.Visible = false; }
            else
            { Pnl_4.Visible = true; }
        }
        //建立多選選項
        protected void CreateDropDownList()
        {
            SetDropDownList("DropDownList2", Unitlist.Country(), "");  //工程所在國家
            SetDropDownList("DropDownList4", Unitlist.City(), "");  //工程所在縣市
            SetDropDownList("DDL_EGetBidNY", Unitlist.YesNo(), "");  //電子領標選項
            SetDropDownList("DDL_EBiddingNY", Unitlist.YesNo(), "");  //電子投標選項
            SetDropDownList("AwardingType", Unitlist.Awarding(), "");  //決標方式
            SetRadioButtonList("ContractWay", Unitlist.ContractWay(), "");  //承攬方式
            SetDropDownList("DurationType", Unitlist.DurationType(), "");  //工期計算方式
            SetDropDownList("ddl_GetBidNY", Unitlist.YesNo(), "");  //電子領標選項
            SetDropDownList("ddl_JointBidNY", Unitlist.YesNo(), "");  //電子領標選項
            SetDropDownList("DLEngClass", Unitlist.ClassList(), "");  //工程所在國家

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
        protected void DDL_Bid_SelectedIndexChanged(object sender, EventArgs e)
        {
            DLWorkManDep.Items.Clear();
            DLWorkManName.Items.Clear();
            ListItem LI = new ListItem();
            LI.Text = "--請選擇--";
            LI.Value = "0";         
            DLWorkManDep.Items.Insert(0, LI);
            DLWorkManDep.SelectedIndex = 0;
            DLWorkManName.Items.Insert(0, LI);
            DLWorkManName.SelectedIndex = 0;
            CreateDropDownList();
            string database = Session["DatabaseName"].ToString();
            string sqLSelect = "SELECT * FROM [BidM0] a left join BidM2 b on a.BID=b.BID left join BidM3 c on a.Bid=c.Bid left join BidM4 d on a.Bid=d.Bid left join BidM5 e on a.Bid=e.Bid where a.BID=" + DDL_Bid.SelectedValue;
            Session["bid"] = DDL_Bid.SelectedValue;
            DataTable Dtvs = WebModel.LoadSetContentData(database, sqLSelect);
            if (Dtvs != null && Dtvs.Rows.Count > 0)
            {
                foreach (DataRow row in Dtvs.Rows)
                {
                    LbBidName.Text = row["BidName"].ToString();
                    LbStatus.Text = row["Status"].ToString();
                    DropDownList2.DataBind();
                    DropDownList2.SelectedItem.Text = row["EngCountry"].ToString();
                    DropDownList4.DataBind();
                    DropDownList4.SelectedItem.Text = row["EngLocation"].ToString();
                    DDL_EGetBidNY.SelectedValue = row["EGetBidNY"].ToString() !=""?row["EGetBidNY"].ToString():"0";
                    DDL_EBiddingNY.SelectedValue = row["EBiddingNY"].ToString() !=""?row["EBiddingNY"].ToString():"0";
                    TxDeadTime.Text = row["BiddingEndDate"].ToString();
                    TxOwner.Text = row["OwnerName"].ToString();
                    TxContact.Text = row["OwnerContactPerson"].ToString();
                    TxAddress.Text = row["OwnerAddress"].ToString();
                    TxTel.Text = row["OwnerContactTel"].ToString();
                    TxBidAddrss.Text = row["GetBidAddress"].ToString();
                    TxPicFee.Text = row["IlluBond"].ToString();
                    TxIllFee.Text = row["IlluFee"].ToString();
                    TxReturnIlluDeadline.Text = row["ReturnIlluDeadline"].ToString();
                    RadioButtonList1.SelectedValue = row["PerformanceBondType"].ToString();
                    TxGnFee.Text = row["PerformanceBond"].ToString();
                    RadioButtonList2.SelectedValue = row["BidBondType"].ToString();
                    TxBidBond.Text = row["BidBond"].ToString();
                    TxFirmQualif.Text = row["FirmQualif"].ToString();
                    TxOpenBidAddress.Text = row["OpenBidAddress"].ToString();
                    TxOpenBidAddTime.Text = row["OpenBidTime"].ToString();
                    AwardingType.SelectedItem.Text = row["AwardingType"].ToString();
                    ddl_JointBidNY.SelectedValue = row["JointBidNY"].ToString() !=""?row["JointBidNY"].ToString():"0";
                    ddl_GetBidNY.SelectedValue = row["GetBidNY"].ToString() !=""?row["GetBidNY"].ToString():"0";
                    ContractWay.SelectedIndex = row["ContractWay"].ToString() !=""?int.Parse(row["ContractWay"].ToString()):-1;
                    TxOwner1.Text = row["OwnerName"].ToString();
                    TxArchitectName.Text = row["ArchitectName"].ToString();
                    TxConsultantName.Text = row["ConsultantName"].ToString();
                    TxPCMname.Text = row["PCMname"].ToString();
                    DurationType.SelectedValue = row["DurationType"].ToString() !=""?row["DurationType"].ToString():"0";
                    TxDuration.Text = row["Duration"].ToString();
                    RadioButtonList4.SelectedValue = row["EngType"].ToString();
                    DLEngClass.SelectedValue = row["EngClass"].ToString() !=""?row["EngClass"].ToString():"0";
                    TxDownFloorNum.Text = row["DownFloorNum"].ToString();
                    TxUpFloorNum.Text = row["UpFloorNum"].ToString();
                    TxDownFloorArea.Text = row["DownFloorArea"].ToString();
                    TxUpFloorArea.Text = row["UpFloorArea"].ToString();
                    TxHeight.Text = row["Height"].ToString();
                    TxExcDepth.Text = row["ExcDepth"].ToString();
                    DLFoundationType.SelectedValue = row["FoundationType"].ToString() !=""?row["FoundationType"].ToString():"0";
                    DLRetaining.SelectedValue = row["Retaining"].ToString() !=""?row["Retaining"].ToString():"0";
                    TxNote.Text = row["Note"].ToString();
                    TxOther.Text = row["Other"].ToString();                 
                    DLWorkManDep.DataBind();
                    DLWorkManDep.SelectedValue = row["WorkManDep"].ToString() !=""?row["WorkManDep"].ToString():"0";
                  
                    DLWorkManName.DataBind();
                    DLWorkManName.SelectedValue = row["WorkManName"].ToString() !=""?row["WorkManName"].ToString():"0";
                    TxGetBidDate.Text = row["GetBidDate"].ToString() !=""?DateTime.Parse(row["GetBidDate"].ToString()).ToString("yyyy-MM-dd"):"";
                    TxBookEstimateEndDate.Text =row["BookEstimateEndDate"].ToString()!=""? DateTime.Parse(row["BookEstimateEndDate"].ToString()).ToString("yyyy-MM-dd"):"";
                    TxPriBidMeetTime.Text = row["PriBidMeetTime"].ToString() !=""?DateTime.Parse(row["PriBidMeetTime"].ToString()).ToString("yyyy-MM-dd"):"";
                    TxSendBidDate.Text = row["SendBidDate"].ToString() !=""?DateTime.Parse(row["SendBidDate"].ToString()).ToString("yyyy-MM-dd"):"";
                    TxReturnIlluDate.Text =row["ReturnIlluDate"].ToString()!=""? DateTime.Parse(row["ReturnIlluDate"].ToString()).ToString("yyyy-MM-dd"):"";
                    TxEstimateCosts.Text = row["EstimateCosts"].ToString() !=""?decimal.Parse(row["EstimateCosts"].ToString()).ToString("N0"):"";
                    TxProposalPrice.Text = row["ProposalPrice"].ToString() !=""?decimal.Parse(row["ProposalPrice"].ToString()).ToString("N0"):"";
                    TxProposalProfit.Text = row["ProposalProfit"].ToString() !=""?decimal.Parse(row["ProposalProfit"].ToString()).ToString("N0"):"";
                    TxApprovedPrice.Text = row["ApprovedPrice"].ToString() !=""?decimal.Parse(row["ApprovedPrice"].ToString()).ToString("N0"):"";
                    TxApprovedProfit.Text = row["ApprovedProfit"].ToString() !=""?decimal.Parse(row["ApprovedProfit"].ToString()).ToString("N0"):"";

                }

            }
          
         
        }
      
        protected void punish_Click(object sender, EventArgs e)
        {
            if (Session["bid"] == null || Session["bid"].ToString() == "")
            {
                Response.Write("<script>alert('尚未選擇標案');</script>");
            }
            else
            {
                if (datacheck(Session["bid"].ToString()) == false)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請先鍵入合約主資料');", true);
                }
                else
                {
                    //this.ClientScript.RegisterStartupScript(this.GetType(), "Open", "window.open('BidDurationE.aspx');", true);
                    OpenNewWindow("BidDurationE.aspx");
                }
            }
        }

        protected void Warranty_Click(object sender, EventArgs e)
        {
            if (Session["bid"] == null || Session["bid"].ToString() == "")
            {
                Response.Write("<script>alert('尚未選擇標案');</script>");
            }
            else
            {
                if (datacheck(Session["bid"].ToString()) == false)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請先鍵入合約主資料');", true);
                }
                else
                {
                    // this.ClientScript.RegisterStartupScript(this.GetType(), "Open", "window.open('BidWarrantyE.aspx');", true);
                    OpenNewWindow("BidWarrantyE.aspx");
                }
            }
        }

        protected void BidPay_Click(object sender, EventArgs e)
        {
            if (Session["bid"] == null || Session["bid"].ToString() == "")
            {
                Response.Write("<script>alert('尚未選擇標案');</script>");
            }
            else
            {
                if (datacheck(Session["bid"].ToString()) == false)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請先鍵入合約主資料');", true);
                }
                else
                {
                    OpenNewWindow("BidPayE.aspx");
                }
            }
        }

        protected void BidCaution_Click(object sender, EventArgs e)
        {
            if (Session["bid"] == null || Session["bid"].ToString() == "")
            {
                Response.Write("<script>alert('尚未選擇標案');</script>");
            }
            else
            {
                if (datacheck(Session["bid"].ToString()) == false)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請先鍵入合約主資料');", true);
                }
                else
                {
                    //OpenNewWindow("BidCautionE.aspx");
                    ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('BidCautionE.aspx', 'window','height=570,width=1200');</script>"));
                }
            }
        }
      
        public void OpenNewWindow(string url)
        {

            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=500,width=1050";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}', 'yourWin', '{1}');</script>", url, winFeatures));

        }
     
       
        //取得建入資料
        protected DataTable GetDataBox()
        {

            DataTable DataTableBox = new DataTable();
            string SQLString = "bid,EngCountry,EngLocation,EGetBidNY,EBiddingNY,BiddingEndDate,OwnerName,OwnerContactPerson,OwnerAddress,OwnerContactTel,IlluBond,PerformanceBondType,PerformanceBond," +
            "IlluFee,ReturnIlluDeadline,BidBondType,BidBond,GetBidAddress,GetBidNY,OpenBidTime,FirmQualif,JointBidNY,AwardingType,OpenBidAddress";

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
                DataTableDr["EngCountry"] = DropDownList2.SelectedItem.Text;
                DataTableDr["EngLocation"] = DropDownList4.SelectedItem.Text;
                DataTableDr["EGetBidNY"] = DDL_EGetBidNY.SelectedItem.Value;
                DataTableDr["EBiddingNY"] = DDL_EBiddingNY.SelectedItem.Value;
                DataTableDr["BiddingEndDate"] = TxDeadTime.Text;
                DataTableDr["OwnerName"] = TxOwner.Text;
                DataTableDr["OwnerContactPerson"] = TxContact.Text;
                DataTableDr["OwnerAddress"] = TxAddress.Text;
                DataTableDr["OwnerContactTel"] = TxTel.Text;
                DataTableDr["IlluBond"] = TxPicFee.Text !=""?decimal.Parse(TxPicFee.Text):0;
                DataTableDr["PerformanceBondType"] = RadioButtonList1.SelectedValue !=""?RadioButtonList1.SelectedValue:"";
                DataTableDr["PerformanceBond"] = TxGnFee.Text !=""?decimal.Parse(TxGnFee.Text):0;
                DataTableDr["IlluFee"] = TxIllFee.Text !=""?decimal.Parse(TxIllFee.Text):0;
                DataTableDr["ReturnIlluDeadline"] = TxReturnIlluDeadline.Text;
                DataTableDr["BidBondType"] = RadioButtonList2.SelectedValue != "" ? RadioButtonList2.SelectedValue : "";
                DataTableDr["BidBond"] = TxBidBond.Text !=""?decimal.Parse(TxBidBond.Text):0;
                DataTableDr["GetBidAddress"] = TxOpenBidAddress.Text;
                DataTableDr["GetBidNY"] = ddl_GetBidNY.SelectedValue != "" ? ddl_GetBidNY.SelectedValue : "";
                DataTableDr["OpenBidTime"] = TxOpenBidAddTime.Text;
                DataTableDr["FirmQualif"] = TxFirmQualif.Text;
                DataTableDr["JointBidNY"] = ddl_JointBidNY.SelectedValue != "" ? ddl_JointBidNY.SelectedValue : "";
                DataTableDr["AwardingType"] = AwardingType.SelectedItem.Text !=""?AwardingType.SelectedItem.Text:"";
                DataTableDr["OpenBidAddress"] = TxOpenBidAddress.Text;

                DataTableBox.Rows.Add(DataTableDr);
            #endregion


            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            return DataTableBox;
        }
        //取得建入資料
        protected DataTable GetDataBox1()
        {

            DataTable DataTableBox = new DataTable();
            string SQLString = "bid,ContractWay,OwnerName,ArchitectName,ConsultantName,PCMname,DurationType,Duration";

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
                DataTableDr["ContractWay"] = ContractWay.SelectedValue;
                DataTableDr["OwnerName"] = TxOwner1.Text;
                DataTableDr["ArchitectName"] = TxArchitectName.Text;
                DataTableDr["ConsultantName"] = TxConsultantName.Text;
                DataTableDr["PCMname"] = TxPCMname.Text;
                DataTableDr["DurationType"] = DurationType.SelectedValue;
                DataTableDr["Duration"] = TxDuration.Text;


                DataTableBox.Rows.Add(DataTableDr);
            #endregion


            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            return DataTableBox;
        }
        //取得建入資料
        protected DataTable GetDataBox2()
        {

            DataTable DataTableBox = new DataTable();
            string SQLString = "bid,EngType,EngClass,DownFloorNum,UpFloorNum,Height,ExcDepth,DownFloorArea,UpFloorArea,FoundationType,Retaining,Note,Other";
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
                DataTableDr["EngType"] = RadioButtonList4.SelectedValue;
                DataTableDr["EngClass"] = DLEngClass.SelectedValue;
                DataTableDr["DownFloorNum"] = TxDownFloorNum.Text;
                DataTableDr["UpFloorNum"] = TxUpFloorNum.Text;
                DataTableDr["Height"] = TxHeight.Text !=""?decimal.Parse(TxHeight.Text):0;
                DataTableDr["ExcDepth"] = TxExcDepth.Text !=""?decimal.Parse(TxExcDepth.Text):0;
                DataTableDr["DownFloorArea"] = TxDownFloorArea.Text !=""?decimal.Parse(TxDownFloorArea.Text):0;
                DataTableDr["UpFloorArea"] = TxUpFloorArea.Text !=""?decimal.Parse(TxUpFloorArea.Text):0;
                DataTableDr["FoundationType"] = DLFoundationType.SelectedValue;
                DataTableDr["Retaining"] = DLRetaining.SelectedValue;
                DataTableDr["Note"] = TxNote.Text;
                DataTableDr["Other"] = TxOther.Text;


                DataTableBox.Rows.Add(DataTableDr);
            #endregion


            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            return DataTableBox;
        }
        //取得建入資料
        protected DataTable GetDataBox3()
        {

            DataTable DataTableBox = new DataTable();
            string SQLString = "bid,GetBidDate,WorkManDep,WorkManName,BookEstimateEndDate,PriBidMeetTime,SendBidDate,ReturnIlluDate,EstimateCosts,ProposalPrice,ProposalProfit,ApprovedPrice,ApprovedProfit";

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
                DataTableDr["GetBidDate"] = TxGetBidDate.Text;
                DataTableDr["WorkManDep"] = DLWorkManDep.SelectedValue;
                DataTableDr["WorkManName"] = DLWorkManName.SelectedValue;
                DataTableDr["BookEstimateEndDate"] =TxBookEstimateEndDate.Text!=""? DateTime.Parse(TxBookEstimateEndDate.Text).ToString("yyyy-MM-dd"):"";
                DataTableDr["PriBidMeetTime"] =TxPriBidMeetTime.Text!=""? DateTime.Parse(TxPriBidMeetTime.Text).ToString("yyyy-MM-dd"):"";
                DataTableDr["SendBidDate"] = TxSendBidDate.Text !=""?DateTime.Parse(TxSendBidDate.Text).ToString("yyyy-MM-dd"):"";
                DataTableDr["ReturnIlluDate"] =TxReturnIlluDate.Text!=""? DateTime.Parse(TxReturnIlluDate.Text).ToString("yyyy-MM-dd"):"";
                DataTableDr["EstimateCosts"] = TxEstimateCosts.Text !=""?decimal.Parse(TxEstimateCosts.Text):0;
                DataTableDr["ProposalPrice"] = TxProposalPrice.Text !=""?decimal.Parse(TxProposalPrice.Text):0;
                DataTableDr["ProposalProfit"] = TxProposalProfit.Text !=""?decimal.Parse(TxProposalProfit.Text):0;
                DataTableDr["ApprovedPrice"] = TxApprovedPrice.Text !=""?decimal.Parse(TxApprovedPrice.Text):0;
                DataTableDr["ApprovedProfit"] = TxApprovedProfit.Text !=""?decimal.Parse(TxApprovedProfit.Text):0;


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
            string SQLSelect="Select * from BidM2 where bid="+DDL_Bid.SelectedValue;
            if (Session["Bid"] == null)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            else
            {

              string result=  WebModel.SItemName(database, SQLSelect, "BID");
                //DataTable DataTableBox = WebModel.LoadContentData_bid(database, _TableName, DDL_Bid.SelectedValue, SQLString);
              if (result != "" )
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
            string SQLSelect = "Select * from BidM3 where bid=" + DDL_Bid.SelectedValue;
            if (Session["Bid"] == null)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            else
            {

                string result = WebModel.SItemName(database, SQLSelect, "BID");
                //DataTable DataTableBox = WebModel.LoadContentData_bid(database, _TableName, DDL_Bid.SelectedValue, SQLString);
                if (result != "")
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
            string SQLSelect = "Select * from BidM4 where bid=" + DDL_Bid.SelectedValue;
            if (Session["Bid"] == null)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            else
            {

                string result = WebModel.SItemName(database, SQLSelect, "BID");
                //DataTable DataTableBox = WebModel.LoadContentData_bid(database, _TableName, DDL_Bid.SelectedValue, SQLString);
                if (result != "")
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
        public bool datacheck3(string data)
        {
            string database = Session["DatabaseName"].ToString();
            string SQLSelect = "Select * from BidM5 where bid=" + DDL_Bid.SelectedValue;
            if (Session["Bid"] == null)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            else
            {

                string result = WebModel.SItemName(database, SQLSelect, "BID");
                //DataTable DataTableBox = WebModel.LoadContentData_bid(database, _TableName, DDL_Bid.SelectedValue, SQLString);
                if (result != "")
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
        protected void ImgSave_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["bid"] == null || Session["bid"].ToString() == "")
            {
                Response.Write("<script>alert('尚未選擇標案');</script>");
            }
            else
            {
                string database = Session["DatabaseName"].ToString();
                //檢查標題文字
                ErrorString += (DropDownList2.SelectedItem) == null ? "工程所在國家請選擇!!\\n" : "";
                ErrorString += (DropDownList4.SelectedItem) == null ? "工程所在縣市請選擇!!\\n" : "";
                //ErrorString += (DDL_EGetBidNY.SelectedItem) == null ? "電子領標請選擇!!\\n" : "";
                //ErrorString += (DDL_EBiddingNY.SelectedItem) == null ? "電子投標請選擇!!\\n" : "";
                ErrorString += (TxDeadTime.Text) == string.Empty ? "截標時間請填入!!\\n" : "";
                //ErrorString += (TxOwner.Text) == string.Empty ? "業主名稱請填入!!\\n" : "";
                //ErrorString += (TxContact.Text) == string.Empty ? "業主聯絡人請填入!!\\n" : "";
                //ErrorString += (TxAddress.Text) == string.Empty ? "業主地址請填入!!\\n" : "";
                //ErrorString += (TxTel.Text) == string.Empty ? "業主聯絡電話請填入!!\\n" : "";
                //ErrorString += (TxBidAddrss.Text) == string.Empty ? "領標地址請填入!!\\n" : "";
                //ErrorString += (TxPicFee.Text) == string.Empty ? "押圖費請填入!!\\n" : "";
                //ErrorString += (TxIllFee.Text) == string.Empty ? "圖說費請填入!!\\n" : "";
                //ErrorString += (TxReturnIlluDeadline.Text) == string.Empty ? "退圖期限請填入!!\\n" : "";
                //ErrorString += (RadioButtonList1.SelectedItem) == null ? "履約保證金請選擇!!\\n" : "";
                //ErrorString += (TxGnFee.Text) == string.Empty ? "履約保證金請填入!!\\n" : "";
                //ErrorString += (RadioButtonList2.SelectedItem) == null ? "押標金請選擇!!\\n" : "";
                //ErrorString += (TxBidBond.Text) == string.Empty ? "押標金請填入!!\\n" : "";
                //ErrorString += (TxFirmQualif.Text) == string.Empty ? "廠商投標規定請填入!!\\n" : "";
                //ErrorString += (TxOpenBidAddress.Text) == string.Empty ? "開標地點請填入!!\\n" : "";
                ErrorString += (TxOpenBidAddTime.Text) == string.Empty ? "開標時間請填入!!\\n" : "";
                //ErrorString += (AwardingType.SelectedItem.Value) == "0" ? "決標方式請選擇!!\\n" : "";
                //ErrorString += (ddl_JointBidNY.SelectedItem.Value) == "0" ? "共同投標請選擇!!\\n" : "";
                ErrorString += (ddl_GetBidNY.SelectedItem.Value) == "0" ? "已領標請選擇!!\\n" : "";

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
                        if (datacheck(DDL_Bid.SelectedValue) == false)
                        {

                            WebModel.SaveAction_BID(database, _TableName, GetDataBox());

                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                        }
                        else
                        {
                            WebModel.EditAction_bid(database, _TableName, DDL_Bid.SelectedValue, GetDataBox());
                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('修改完成');", true);
                        }

                        if (datacheck1(DDL_Bid.SelectedValue) == false)
                        {

                            WebModel.SaveAction_BID(database, _TableName1, GetDataBox1());

                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                        }
                        else
                        {
                            WebModel.EditAction_bid(database, _TableName1, DDL_Bid.SelectedValue, GetDataBox1());
                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('修改完成');", true);
                        }

                        if (datacheck2(DDL_Bid.SelectedValue) == false)
                        {

                            WebModel.SaveAction_BID(database, _TableName2, GetDataBox2());

                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                        }
                        else
                        {
                            WebModel.EditAction_bid(database, _TableName2, DDL_Bid.SelectedValue, GetDataBox2());
                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('修改完成');", true);
                        }
                        if (datacheck3(DDL_Bid.SelectedValue) == false)
                        {

                            WebModel.SaveAction_BID(database, _TableName3, GetDataBox3());

                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('存檔完成');", true);
                        }
                        else
                        {
                            WebModel.EditAction_bid(database, _TableName3, DDL_Bid.SelectedValue, GetDataBox3());
                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('修改完成');", true);
                        }
                    }

                }
                else
                {

                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

                }
            }
        }

        protected void ImgRecovery_Click(object sender, ImageClickEventArgs e)
        {
            DDL_Bid_SelectedIndexChanged(this, null);
        }

        protected void Self_Click(object sender, EventArgs e)
        {
            Response.Redirect("BidInfoM.aspx");
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((RadioButtonList1.SelectedIndex == 0))
            { LbGnFee.Text = "(元)"; }
            else if ((RadioButtonList1.SelectedIndex == 1))
            { LbGnFee.Text = "(%)"; }
        }

        protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((RadioButtonList2.SelectedIndex == 0))
            { LbBidBond.Text = "(元)"; }
            else if ((RadioButtonList2.SelectedIndex == 1))
            { LbBidBond.Text = "(%)"; }
        }
    }
}