using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;
using DAL;

namespace IMS
{
    public partial class BidInfo3 : System.Web.UI.Page
    {  
        string _TableName = "BidM3";
        string ErrorString = "";
        string SQLString = "bid,ContractWay,OwnerName,ArchitectName,ConsultantName,PCMname,DurationType,Duration";
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                CreateDropDownList(); //建立下拉選項
                CreatRadioButtonList();//建立radiobutton選項
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.SelectCommand = "Select * from BidM0 ";
                DropDownList3.DataSourceID = "SqlDataSource1";
                DropDownList3.DataBind();
                ListItem LI = new ListItem();
                LI.Text = "--請選擇--";
                LI.Value = "0";

                DropDownList3.Items.Insert(0, LI);
                DropDownList3.SelectedIndex = 0;
            }
            DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            DDL.Visible = false;
        }

        protected void Page_Init()
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                //設定SqlDataSource連線及Select命令
                sqlEmployees.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                sqlEmployees.SelectCommand = "Select * from BidM0 a left join  BidM3 b on a.bID = b.bid where BidName=@BidName";//

                Repeater1.DataSourceID = sqlEmployees.ID;
            }
        }
        //建立多選選項
        protected void CreateDropDownList()
        {
           
            SetDropDownList("DurationType", Unitlist.DurationType(),"");  //工期計算方式
           
        }
        protected void CreatRadioButtonList()
        {
            SetRadioButtonList("ContractWay", Unitlist.ContractWay(), "");  //承攬方式
        }
        protected void SetDropDownList(string thisName, string thisData, string thisSet)
        {
            DropDownList thisDropDownList = (DropDownList)Page.Master.FindControl("ContentPlaceHolder1").FindControl(thisName);
        
            thisDropDownList.Items.Clear();
      
            int count = 0;
            foreach ( string DataName in thisData.Split(','))
            {
                thisDropDownList.Items.Add(new ListItem(DataName,count.ToString()));
                count++;
            }
            count = 0;
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
                CreateDropDownList(); //建立下拉選項
                ContractWay.SelectedIndex = -1;                         
                OwnerName.Text = "";
                ArchitectName.Text = "";
                ConsultantName.Text = "";
                PCMname.Text = "";             
                DurationType.SelectedIndex = -1;
                Duration.Text = "";
               
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
            ErrorString += (ContractWay.SelectedIndex) == -1 ? "承攬方式請選擇!!\\n" : "";          
            ErrorString += (OwnerName.Text) == string.Empty ? "業主名稱請填入!!\\n" : "";
            ErrorString += (ArchitectName.Text) == string.Empty ? "建築師/設計單位名稱請填入!!\\n" : "";
            ErrorString += (ConsultantName.Text) == string.Empty ? "監造單位名稱請填入!!\\n" : "";
            ErrorString += (PCMname.Text) == string.Empty ? "PCM名稱請填入!!\\n" : "";
            ErrorString += (DurationType.SelectedIndex) == 0 ? "工期計算方式請選擇!!\\n" : "";
            ErrorString += (Duration.Text) == string.Empty ? "工期請填入!!\\n" : "";
          

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
                DataTableDr["ContractWay"] = ContractWay.SelectedItem.Value;              
                DataTableDr["OwnerName"] = OwnerName.Text;
                DataTableDr["ArchitectName"] = ArchitectName.Text;
                DataTableDr["ConsultantName"] = ConsultantName.Text;
                DataTableDr["PCMname"] = PCMname.Text;
                DataTableDr["DurationType"] = decimal.Parse(DurationType.Text).ToString();
                DataTableDr["Duration"] = Duration.Text;
              

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
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || Session["bid"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                string database = Session["DatabaseName"].ToString();
                DataTable DataTableBox = WebModel.LoadContentData_bid(database, _TableName, Session["bid"].ToString(), SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    foreach (DataRow row in DataTableBox.Rows)
                    {

                        ContractWay.SelectedIndex = int.Parse(row["ContractWay"].ToString());
                        OwnerName.Text = row["OwnerName"].ToString();
                        ArchitectName.Text = row["ArchitectName"].ToString();
                        ConsultantName.Text = row["ConsultantName"].ToString();
                        PCMname.Text = row["PCMname"].ToString();
                        DurationType.SelectedIndex = int.Parse(row["DurationType"].ToString());
                        Duration.Text = row["Duration"].ToString();


                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        }
        public void OpenNewWindow(string url)
        {

            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=500,width=1050";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}', 'yourWin', '{1}');</script>", url, winFeatures));

        }

        protected void punish_Click(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || Session["bid"] == null))
            {
                Response.Redirect("Login.aspx");
            }
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

        protected void Warranty_Click(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || Session["bid"] == null))
            {
                Response.Redirect("Login.aspx");
            }
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

        protected void BidPay_Click(object sender, EventArgs e)
        {
             if ((Session["UserName"] == null) || (Session["CompanyName"] == null || Session["bid"] == null))
            {
                Response.Redirect("Login.aspx");
            }
             if (datacheck(Session["bid"].ToString()) == false)
             {
                 ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請先鍵入合約主資料');", true);
             }
             else
             {
                 OpenNewWindow("BidPayE.aspx");
             }
        }

        protected void BidCaution_Click(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null || Session["bid"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (datacheck(Session["bid"].ToString()) == false)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請先鍵入合約主資料');", true);
            }
            else
            {
                OpenNewWindow("BidCautionE.aspx");
            }
        }
        
    }
}