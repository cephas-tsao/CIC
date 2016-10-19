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
    public partial class BidInfo4 : System.Web.UI.Page
    {
        string _TableName = "BidM4";
        string ErrorString = "";
        string SQLString = "bid,EngType,EngClass,DownFloorNum,UpFloorNum,Height,ExcDepth,DownFloorArea,UpFloorArea,FoundationType,Retaining,Note,Other";
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                CreateDropDownList(); //建立下拉選項
                //CreatRadioButtonList();//建立radiobutton選項
                string datasource = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.ConnectionString = datasource;
                SqlDataSource1.SelectCommand = "Select * from BidM0 ";
                DropDownList3.DataSourceID = "SqlDataSource1";
                DropDownList3.DataBind();
               
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

                DropDownList3.Items.Insert(0, LI);
                DropDownList3.SelectedIndex = 0;

                DLFoundationType.Items.Insert(0, LI);
                DLFoundationType.SelectedIndex = 0;

                DLRetaining.Items.Insert(0, LI);
                DLRetaining.SelectedIndex = 0;
            }
            DropDownList DDL = (DropDownList)Master.FindControl("Ddl_Project");
            DDL.Visible = false;
        }
        protected void Page_Init()
        {
            //設定SqlDataSource連線及Select命令
            sqlEmployees.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            sqlEmployees.SelectCommand = "Select * from BidM0 where BidName=@BidName";//

            Repeater1.DataSourceID = sqlEmployees.ID;

        }

        //建立多選選項
        protected void CreateDropDownList()
        {
            SetDropDownList("DLEngClass", Unitlist.ClassList(), "");  //工程所在國家
          
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
                //CreateDropDownList(); //建立下拉選項
                RBEngType.SelectedIndex = -1;
                DLEngClass.SelectedIndex = -1;
                DownFloorNum.Text = "";
                UpFloorNum.Text = "";
                Height.Text = "";
                ExcDepth.Text = "";
                DLFoundationType.SelectedIndex = -1;
                DLRetaining.SelectedIndex = -1;
                DownFloorArea.Text = "";
                UpFloorArea.Text = "";
                Note.Text = "";
                Other.Text = "";
              

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
            ErrorString += (RBEngType.SelectedIndex) == -1 ? "工程區分請選擇!!\\n" : "";
            ErrorString += (DLEngClass.SelectedIndex) == 0 ? "工程分類請選擇!!\\n" : "";
            ErrorString += (DownFloorNum.Text) == string.Empty ? "地下樓層數請填入!!\\n" : "";
            ErrorString += (UpFloorNum.Text) == string.Empty ? "地上樓層數請填入!!\\n" : "";
            ErrorString += (Height.Text) == string.Empty ? "地下樓層面積請填入!!\\n" : "";
            ErrorString += (ExcDepth.Text) == string.Empty ? "地上樓層面積請填入!!\\n" : "";
            ErrorString += (DLFoundationType.SelectedIndex) == 0 ? "基礎型式請選擇!!\\n" : "";
            ErrorString += (DLRetaining.SelectedIndex) == 0 ? "擋土措施請選擇!!\\n" : "";
            ErrorString += (DownFloorArea.Text) == string.Empty ? "建物高度請填入!!\\n" : "";
            ErrorString += (UpFloorArea.Text) == string.Empty ? "開挖深度請填入!!\\n" : "";
            ErrorString += (Note.Text) == string.Empty ? "施工概要備註請填入!!\\n" : "";
            ErrorString += (Other.Text) == string.Empty ? "其他工程概要請填入!!\\n" : "";


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
                DataTableDr["EngType"] = RBEngType.SelectedItem.Value;
                DataTableDr["EngClass"] = DLEngClass.SelectedItem.Value;
                DataTableDr["DownFloorNum"] = DownFloorNum.Text;
                DataTableDr["UpFloorNum"] = UpFloorNum.Text;
                DataTableDr["Height"] = Height.Text;
                DataTableDr["ExcDepth"] = ExcDepth.Text;
                DataTableDr["FoundationType"] = DLFoundationType.SelectedItem.Text;
                DataTableDr["Retaining"] = DLRetaining.SelectedItem.Text;
                DataTableDr["DownFloorArea"] = DownFloorArea.Text;
                DataTableDr["UpFloorArea"] = UpFloorArea.Text;
                DataTableDr["Note"] = Note.Text;
                DataTableDr["Other"] = Other.Text;


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

                        RBEngType.SelectedIndex = int.Parse(row["EngType"].ToString());
                        DLEngClass.SelectedIndex = int.Parse(row["EngClass"].ToString());
                        DownFloorNum.Text = row["DownFloorNum"].ToString();
                        UpFloorNum.Text = row["UpFloorNum"].ToString();
                        Height.Text = row["Height"].ToString();
                        ExcDepth.Text = row["ExcDepth"].ToString();
                        DLFoundationType.SelectedValue = (row["FoundationType"].ToString() != "") ? row["FoundationType"].ToString() : "";
                       // RadioButtonList1.SelectedIndex = (row["PreSuggestion"].ToString() != "") ? int.Parse(row["PreSuggestion"].ToString()) : -1;
                        DLRetaining.SelectedValue = row["Retaining"].ToString()!=""?row["Retaining"].ToString():"";
                        DownFloorArea.Text = row["DownFloorArea"].ToString();
                        UpFloorArea.Text = row["UpFloorArea"].ToString();
                        Note.Text = row["Note"].ToString();
                        Other.Text = row["Other"].ToString();

                    }
                    DataTableBox.Dispose(); //釋放Table資源
                }
            }
        }
    }
}