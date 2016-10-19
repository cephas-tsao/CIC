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
    public partial class BidInfo2 : System.Web.UI.Page
    {
        string _TableName = "BidM2";
        string ErrorString = "";
        string SQLString = "bid,EngCountry,EngLocation,EGetBidNY,EBiddingNY,BiddingEndDate,OwnerName,OwnerContactPerson,OwnerAddress,OwnerContactTel,IlluBond,PerformanceBondType,PerformanceBond," +
           "IlluFee,ReturnIlluDeadline,BidBondType,BidBond,GetBidAddress,GetBidNY,OpenBidTime,FirmQualif,JointBidNY,AwardingType,OpenBidAddress";
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                CreateDropDownList(); //建立下拉選項
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.SelectCommand = "Select * from BidM0 ";
                DropDownList1.DataSourceID = "SqlDataSource1";
                DropDownList1.DataBind();
                ListItem LI = new ListItem();
                LI.Text = "--請選擇--";
                LI.Value = "0";

                DropDownList1.Items.Insert(0, LI);
                DropDownList1.SelectedIndex = 0;
            }
            DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            DDL.Visible = false;
        }

        protected void Page_Init()
        {
            //設定SqlDataSource連線及Select命令
            sqlEmployees.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            sqlEmployees.SelectCommand = "Select * from BidM0 a left join  BidM2 b on a.bID = b.bid where BidName=@BidName";//

            Repeater1.DataSourceID = sqlEmployees.ID;

        }
        //建立多選選項
        protected void CreateDropDownList()
        {
            SetDropDownList("DropDownList2", Unitlist.Country(),"");  //工程所在國家
            SetDropDownList("DropDownList4", Unitlist.City(),"");  //工程所在縣市
            SetDropDownList("DropDownList5", Unitlist.YesNo(),"");  //電子領標選項
            SetDropDownList("DropDownList6", Unitlist.YesNo(),"");  //電子投標選項
            SetDropDownList("AwardingType", Unitlist.Awarding(),"");  //電子領標選項
            SetDropDownList("JointBidNY", Unitlist.YesNo(),"");  //電子領標選項
            SetDropDownList("GetBidNY", Unitlist.YesNo(),"");  //電子領標選項
          
         
        }
        protected void SetDropDownList(string thisName, string thisData, string thisSet)
        {
            DropDownList thisDropDownList = (DropDownList)Page.Master.FindControl("ContentPlaceHolder1").FindControl(thisName);
        
            thisDropDownList.Items.Clear();
            //thisDropDownList.Items.Add(new ListItem(stratSet.ToString(), stratSet.ToString()));
            int count = 0;
            foreach ( string DataName in thisData.Split(','))
            {
                thisDropDownList.Items.Add(new ListItem(DataName,count.ToString()));
                count++;
            }
            count = 0;
        }
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;

                

                Literal ltName = (Literal)e.Item.FindControl("ltName");
                Literal LtStatus = (Literal)e.Item.FindControl("LtStatus");
                
                ltName.Text = vsDr["BidName"].ToString();
                LtStatus.Text = vsDr["Status"].ToString();
                Session["bid"] = vsDr["BID"].ToString();
                //string b = Session["bid"].ToString();
              
            }
            if (datacheck(Session["bid"].ToString()) == false)
            {

                DropDownList2.SelectedItem.Value = "0";
                DropDownList4.SelectedItem.Value = "0";
                DropDownList5.SelectedItem.Value = "0";
                DropDownList6.SelectedItem.Value = "0";
                EndDate.Text = "";
                OwnerName.Text = "";
                OwnerContactPerson.Text = "";
                OwnerAddress.Text = "";
                OwnerContactTel.Text = "";
                IlluBond.Text = "";
                PerformanceBondType.SelectedIndex = -1;
                PerformanceBond.Text = "";
                IlluFee.Text = "";
                ReturnIlluDeadline.Text = "";
                BidBondType.SelectedIndex = -1;
                BidBond.Text = "";
                GetBidAddress.Text = "";
                GetBidNY.SelectedItem.Value = "0";
                OpenBidTime.Text = "";
                FirmQualif.Text = "";
                JointBidNY.SelectedItem.Value = "0";
                AwardingType.SelectedItem.Text = "";
                OpenBidAddress.Text = "";
            }
            else
            {
                Recovery_Click(this, null);
            }
        }
        //儲存資料
        protected void SaveAction(object sender, EventArgs e)
        {

            string database = Session["DatabaseName"].ToString();
            //檢查標題文字
            ErrorString += (DropDownList2.SelectedItem) == null ? "工程所在國家請選擇!!\\n" : "";
            ErrorString += (DropDownList4.SelectedItem) == null ? "工程所在縣市請選擇!!\\n" : "";
            ErrorString += (DropDownList5.SelectedItem) == null ? "電子領標請選擇!!\\n" : "";
            ErrorString += (DropDownList6.SelectedItem) == null ? "電子投標請選擇!!\\n" : "";
            ErrorString += (EndDate.Text) == string.Empty ? "截標時間請填入!!\\n" : "";
            ErrorString += (OwnerName.Text) == string.Empty ? "業主名稱請填入!!\\n" : "";
            ErrorString += (OwnerContactPerson.Text) == string.Empty ? "業主聯絡人請填入!!\\n" : "";
            ErrorString += (OwnerAddress.Text) == string.Empty ? "業主地址請填入!!\\n" : "";
            ErrorString += (OwnerContactTel.Text) == string.Empty ? "業主聯絡電話請填入!!\\n" : "";
            ErrorString += (GetBidAddress.Text) == string.Empty ? "領標地址請填入!!\\n" : "";
            ErrorString += (IlluBond.Text) == string.Empty ? "押圖費請填入!!\\n" : "";
            ErrorString += (IlluFee.Text) == string.Empty ? "圖說費請填入!!\\n" : "";
            ErrorString += (ReturnIlluDeadline.Text) == string.Empty ? "退圖期限請填入!!\\n" : "";
            ErrorString += (PerformanceBondType.SelectedItem) == null ? "履約保證金請選擇!!\\n" : "";
            ErrorString += (PerformanceBond.Text) == string.Empty ? "履約保證金請填入!!\\n" : "";
            ErrorString += (BidBondType.SelectedItem) == null ? "押標金請選擇!!\\n" : "";
            ErrorString += (BidBond.Text) == string.Empty ? "押標金請填入!!\\n" : "";
            ErrorString += (FirmQualif.Text) == string.Empty ? "廠商投標規定請填入!!\\n" : "";
            ErrorString += (OpenBidAddress.Text) == string.Empty ? "開標地點請填入!!\\n" : "";
            ErrorString += (OpenBidTime.Text) == string.Empty ? "開標時間請填入!!\\n" : "";
            ErrorString += (AwardingType.SelectedItem.Value) == "0" ? "決標方式請選擇!!\\n" : "";
            ErrorString += (JointBidNY.SelectedItem.Value) == "0" ? "共同投標請選擇!!\\n" : "";
            ErrorString += (GetBidNY.SelectedItem.Value) == "0" ? "已領標請選擇!!\\n" : "";

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
            //string SQLString = "bid,EngCountry,EngLocation,EGetBidNY,EBiddingNY,BiddingEndDate,OwnerName,OwnerContactPerson,OwnerAddress,OwnerContactTel,IlluBond,PerformanceBondType,PerformanceBond," +
            //"IlluFee,ReturnIlluDeadline,BidBondType,BidBond,GetBidAddress,GetBidNY,OpenBidTime,FirmQualif,JointBidNY,AwardingType,OpenBidAddress";

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
                DataTableDr["EGetBidNY"] = DropDownList5.SelectedItem.Value;
                DataTableDr["EBiddingNY"] = DropDownList6.SelectedItem.Value;
                DataTableDr["BiddingEndDate"] = EndDate.Text;
                DataTableDr["OwnerName"] = OwnerName.Text;
                DataTableDr["OwnerContactPerson"] = OwnerContactPerson.Text;
                DataTableDr["OwnerAddress"] = OwnerAddress.Text;
                DataTableDr["OwnerContactTel"] = OwnerContactTel.Text;              
                DataTableDr["IlluBond"] = decimal.Parse(IlluBond.Text).ToString("N0");
                DataTableDr["PerformanceBondType"] = PerformanceBondType.SelectedItem.Value;
                DataTableDr["PerformanceBond"] = decimal.Parse(PerformanceBond.Text).ToString("N0");
                DataTableDr["IlluFee"] = decimal.Parse(IlluFee.Text).ToString("N0");
                DataTableDr["ReturnIlluDeadline"] = ReturnIlluDeadline.Text;
                DataTableDr["BidBondType"] = BidBondType.SelectedItem.Value;
                DataTableDr["BidBond"] = BidBond.Text;
                DataTableDr["GetBidAddress"] = GetBidAddress.Text;
                DataTableDr["GetBidNY"] = GetBidNY.SelectedItem.Value;
                DataTableDr["OpenBidTime"] = OpenBidTime.Text;
                DataTableDr["FirmQualif"] = FirmQualif.Text;
                DataTableDr["JointBidNY"] = JointBidNY.SelectedItem.Value;
                DataTableDr["AwardingType"] = AwardingType.SelectedItem.Text;
                DataTableDr["OpenBidAddress"] = OpenBidAddress.Text;

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
            //    string SQLString = "bid,EngCountry,EngLocation,EGetBidNY,EBiddingNY,BiddingEndDate,OwnerName,OwnerContactPerson,OwnerAddress,OwnerContactTel,IlluBond,PerformanceBondType,PerformanceBond," +
            //"IlluFee,ReturnIlluDeadline,BidBondType,BidBond,GetBidAddress,GetBidNY,OpenBidTime,FirmQualif,JointBidNY,AwardingType,OpenBidAddress";
                //DataTable WebModel =new DataTable;

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
            //string a = Session["Bid"].ToString();
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox = WebModel.LoadContentData_bid(database, _TableName, Session["bid"].ToString(), SQLString);
            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                 foreach (DataRow row in DataTableBox.Rows)
                {
               // DataTableDr["bid"] = Session["bid"].ToString();
               DropDownList2.SelectedItem.Text  = row["EngCountry"].ToString();
               DropDownList4.SelectedItem.Text =row["EngLocation"].ToString();
               DropDownList5.SelectedIndex =int.Parse(row["EGetBidNY"].ToString()); 
               DropDownList6.SelectedIndex =int.Parse(row["EBiddingNY"].ToString()) ;
               EndDate.Text =row["BiddingEndDate"].ToString() ;
               OwnerName.Text= row["OwnerName"].ToString() ;
               OwnerContactPerson.Text=row["OwnerContactPerson"].ToString()  ;
               OwnerAddress.Text =row["OwnerAddress"].ToString() ;
               OwnerContactTel.Text=row["OwnerContactTel"].ToString() ;
               IlluBond.Text=row["IlluBond"].ToString()!=""?Convert.ToDecimal(row["IlluBond"]).ToString("N0"):"";
               PerformanceBondType.SelectedIndex = int.Parse(row["PerformanceBondType"].ToString());
               PerformanceBond.Text=row["PerformanceBond"].ToString()!=""?Convert.ToDecimal(row["PerformanceBond"]).ToString("N0"):"";
               IlluFee.Text = row["IlluFee"].ToString()!=""?Convert.ToDecimal(row["IlluFee"]).ToString("N0"):"";
               ReturnIlluDeadline.Text=row["ReturnIlluDeadline"].ToString()  ;
               BidBondType.SelectedIndex = int.Parse(row["BidBondType"].ToString());
               BidBond.Text=row["BidBond"].ToString()!=""?Convert.ToDecimal(row["BidBond"]).ToString("N0"):""  ;
               GetBidAddress.Text =row["GetBidAddress"].ToString() ;
               GetBidNY.SelectedIndex = int.Parse(row["GetBidNY"].ToString() ) ;
               OpenBidTime.Text = row["OpenBidTime"].ToString();
               FirmQualif.Text=row["FirmQualif"].ToString()  ;
               JointBidNY.SelectedIndex = int.Parse(row["JointBidNY"].ToString());
               AwardingType.SelectedItem.Text =row["AwardingType"].ToString() ;
               OpenBidAddress.Text = row["OpenBidAddress"].ToString();
              
                }
                 DataTableBox.Dispose(); //釋放Table資源
            }
        }

        //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    string a = Session["Bid"].ToString();
        //    if (datacheck(Session["bid"].ToString()) == false)
        //    {

        //        DropDownList2.SelectedItem.Value = "0";
        //        DropDownList4.SelectedItem.Value = "0";
        //        DropDownList5.SelectedItem.Value = "0";
        //        DropDownList6.SelectedItem.Value = "0";
        //        EndDate.Text = "";
        //        OwnerName.Text = "";
        //        OwnerContactPerson.Text = "";
        //        OwnerAddress.Text = "";
        //        OwnerContactTel.Text = "";
        //        IlluBond.Text = "";
        //        PerformanceBondType.SelectedIndex = -1;
        //        PerformanceBond.Text = "";
        //        IlluFee.Text = "";
        //        ReturnIlluDeadline.Text = "";
        //        BidBondType.SelectedIndex = -1;
        //        BidBond.Text = "";
        //        GetBidAddress.Text = "";
        //        GetBidNY.SelectedItem.Value = "0";
        //        OpenBidTime.Text = "";
        //        FirmQualif.Text = "";
        //        JointBidNY.SelectedItem.Value = "0";
        //        AwardingType.SelectedItem.Text = "";
        //        OpenBidAddress.Text = "";
        //    }
        //    else
        //    {
        //        Recovery_Click(this,null);
        //    }
        //}
    }
}

//DropDownList DropDownList2 = (DropDownList)e.Item.FindControl("DropDownList2");
//DropDownList DropDownList4 = (DropDownList)e.Item.FindControl("DropDownList4");
//DropDownList DropDownList5 = (DropDownList)e.Item.FindControl("DropDownList5");
//DropDownList DropDownList6 = (DropDownList)e.Item.FindControl("DropDownList6");
//TextBox EndDate = (TextBox)e.Item.FindControl("EndDate");
//TextBox OwnerName = (TextBox)e.Item.FindControl("OwnerName");
//TextBox OwnerContactPerson = (TextBox)e.Item.FindControl("OwnerContactPerson");
//TextBox OwnerAddress = (TextBox)e.Item.FindControl("OwnerAddress");
//TextBox OwnerContactTel = (TextBox)e.Item.FindControl("OwnerContactTel");
//TextBox GetBidAddress = (TextBox)e.Item.FindControl("GetBidAddress");
//TextBox IlluBond = (TextBox)e.Item.FindControl("IlluBond");
//TextBox IlluFee = (TextBox)e.Item.FindControl("IlluFee");
//TextBox ReturnIlluDeadline = (TextBox)e.Item.FindControl("ReturnIlluDeadline");
//RadioButtonList PerformanceBondType = (RadioButtonList)e.Item.FindControl("PerformanceBondType");
//TextBox PerformanceBond = (TextBox)e.Item.FindControl("PerformanceBond");
//RadioButtonList BidBondType = (RadioButtonList)e.Item.FindControl("BidBondType");
//TextBox BidBond = (TextBox)e.Item.FindControl("BidBond");
//TextBox FirmQualif = (TextBox)e.Item.FindControl("FirmQualif");
//TextBox OpenBidAddress = (TextBox)e.Item.FindControl("OpenBidAddress");
//TextBox OpenBidTime = (TextBox)e.Item.FindControl("OpenBidTime");
//DropDownList AwardingType = (DropDownList)e.Item.FindControl("AwardingType");
//DropDownList JointBidNY = (DropDownList)e.Item.FindControl("JointBidNY");
//DropDownList GetBidNY = (DropDownList)e.Item.FindControl("GetBidNY");


//foreach (string DataName in Unitlist.Country().Split(','))
//{
//    DropDownList2.Items.Add(new ListItem(DataName));

//}
//foreach (string DataName in Unitlist.City().Split(','))
//{
//    DropDownList4.Items.Add(new ListItem(DataName));

//}
//foreach (string DataName in Unitlist.Awarding().Split(','))
//{
//    AwardingType.Items.Add(new ListItem(DataName));

//}


//DropDownList2.SelectedItem.Text = vsDr["EngCountry"].ToString();
//DropDownList4.SelectedItem.Text = vsDr["EngLocation"].ToString();
//DropDownList5.SelectedItem.Text = vsDr["EGetBidNY"].ToString();
//DropDownList6.SelectedItem.Text = vsDr["EBiddingNY"].ToString();
//EndDate.Text = vsDr["BiddingEndDate"].ToString();
//OwnerName.Text = vsDr["OwnerName"].ToString();
//OwnerContactPerson.Text = vsDr["OwnerContactPerson"].ToString();
//OwnerAddress.Text = vsDr["OwnerAddress"].ToString();
//OwnerContactTel.Text = vsDr["OwnerContactTel"].ToString();
//GetBidAddress.Text = vsDr["GetBidAddress"].ToString();
//IlluBond.Text = vsDr["IlluBond"].ToString();
//IlluFee.Text = vsDr["IlluFee"].ToString();
//ReturnIlluDeadline.Text = vsDr["ReturnIlluDeadline"].ToString();
//PerformanceBondType.SelectedItem.Text = vsDr["PerformanceBondType"].ToString();
//PerformanceBond.Text = vsDr["PerformanceBond"].ToString();
//BidBondType.SelectedItem.Text = vsDr["BidBondType"].ToString();
//BidBond.Text = vsDr["BidBond"].ToString();
//FirmQualif.Text = vsDr["FirmQualif"].ToString();
//OpenBidAddress.Text = vsDr["OpenBidAddress"].ToString();
//OpenBidTime.Text = vsDr["OpenBidTime"].ToString();
//AwardingType.SelectedItem.Text = vsDr["AwardingType"].ToString();
//JointBidNY.SelectedItem.Text = vsDr["JointBidNY"].ToString();
//GetBidNY.SelectedItem.Text = vsDr["GetBidNY"].ToString();

//ListItem LI = new ListItem();
//LI.Text = "--請選擇--";
//LI.Value = "0";

//DropDownList4.Items.Insert(0, LI);
//AwardingType.Items.Insert(0, LI);
//DropDownList4.Items.RemoveAt(1);