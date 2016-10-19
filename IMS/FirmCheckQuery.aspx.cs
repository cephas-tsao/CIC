using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace IMS
{
    public partial class FirmCheckQuery : System.Web.UI.Page
    {
        string _TableName = "FirmM";


        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                LoadData();

            }
        }

        //讀取資料
        protected void LoadData()
        {
            if (Session["DatabaseName"] == null)
            {
                Response.Redirect("../login.aspx");
            }
            string database = Session["DatabaseName"].ToString();

            //讀取列表
            DataTable DataTableBox = GetListData();


            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                RadioButtonList1.Items.Clear();
                foreach (DataRow row in DataTableBox.Rows)
                {

                    ListItem LI = new ListItem();
                    LI.Text = row["Name"].ToString();
                    LI.Value = row["uid"].ToString();
                    RadioButtonList1.Items.Add(LI);
                    RadioButtonList1.Attributes.Add("style", "margin-left:100px;margin-right:100px;");

                }
                DataTableBox.Dispose(); //釋放Table資源
            }
        }

        //取得列表資料
        protected DataTable GetListData()
        {
            DataTable DataTableBox = new DataTable(); //建立表格
            string SQLString = "select * from " + _TableName + " a ";
            string database = Session["DatabaseName"].ToString();

            #region 搜尋條件
            string SelectString = "";
            SelectString = (Keyword.Text != "") ? "Name like @SelectKey and " : "";
            SelectString = (SelectString.Length > 1) ? "where " + SelectString.Substring(0, SelectString.Length - 4) : "";
            #endregion

            #region 找出總筆數

            //搜尋資料表

            //int AllList = 0;
            using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
            {
                using (SqlCommand SelectList = new SqlCommand(SQLString + SelectString, L_Conn))
                {
                    SelectList.Parameters.AddWithValue("@SelectKey", "%" + SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(Keyword.Text)) + "%");

                    SelectList.CommandType = CommandType.Text;
                    L_Conn.Open();
                    SqlDataReader SelectList_read = SelectList.ExecuteReader();
                    DataTableBox = new DataTable();
                    DataTableBox.Load(SelectList_read);
                }
            }
            #endregion

            return DataTableBox;
        }

        protected void gvEmps_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;
               
                Session["type"] = vsDr["Type"].ToString();
                if (vsDr["Type"].ToString() == "材料供應商")
                {
                    com2.Visible = true;
                    com1.Visible = false;
                    result.Visible = true;
                }
                else
                {
                    com1.Visible = true;
                    com2.Visible = false;
                    result.Visible = true;
                }

                Literal uid = e.Item.FindControl("uid") as Literal;
                Literal ltName = (Literal)e.Item.FindControl("ltName");
                Literal ltOwner = (Literal)e.Item.FindControl("ltOwner");
                Literal ltOwnerMobile = (Literal)e.Item.FindControl("ltOwnerMobile");
                Literal ltEIN = (Literal)e.Item.FindControl("ltEIN");
                Literal ltTEL1 = (Literal)e.Item.FindControl("ltTEL1");
                Literal ltTEL2 = (Literal)e.Item.FindControl("ltTEL2");
                Literal ltFax1 = (Literal)e.Item.FindControl("ltFax1");
                Literal ltFax2 = (Literal)e.Item.FindControl("ltFax2");
                Literal ltCapital = (Literal)e.Item.FindControl("ltCapital");
                Literal ltStaffAmount = (Literal)e.Item.FindControl("ltStaffAmount");
                Literal ltRegisteredAddress = (Literal)e.Item.FindControl("ltRegisteredAddress");
                Literal ltContectAddress = (Literal)e.Item.FindControl("ltContectAddress");
               

                uid.Text = vsDr["uid"].ToString();
                ltName.Text = vsDr["Name"].ToString();
                ltOwner.Text = vsDr["Owner"].ToString();
                ltOwnerMobile.Text = vsDr["OwnerMobile"].ToString();
                ltEIN.Text = vsDr["EIN"].ToString();
                ltTEL1.Text = vsDr["TEL1"].ToString();
                ltTEL2.Text = vsDr["TEL2"].ToString();
                ltFax1.Text = vsDr["Fax1"].ToString();
                ltFax2.Text = vsDr["Fax2"].ToString();
                ltCapital.Text = vsDr["Capital"].ToString();
                ltStaffAmount.Text = vsDr["StaffAmount"].ToString();
                ltRegisteredAddress.Text = vsDr["RegisteredAddress"].ToString();
                ltContectAddress.Text = vsDr["ContectAddress"].ToString();
                if (Session["type"].ToString() != "材料供應商")
                {
                    Literal1.Text = vsDr["quality"].ToString();
                    Literal3.Text = vsDr["progress"].ToString();
                    Literal5.Text = vsDr["coordiate_com1"].ToString();
                    Literal7.Text = vsDr["clean"].ToString();
                    Literal9.Text = vsDr["security"].ToString();
                    Literal11.Text = vsDr["material"].ToString();
                }
                else
                {
                    Literal14.Text = vsDr["material_QA"].ToString();
                    Literal16.Text = vsDr["stock_timimg"].ToString();
                    Literal18.Text = vsDr["coordiate_com2"].ToString();
                    Literal20.Text = vsDr["service"].ToString();
                    Literal22.Text = vsDr["clean_ma"].ToString();
                }
                LtExplan.Text = vsDr["explanation"].ToString();
                LtAssessor.Text = vsDr["Assessor"].ToString();
                //DataTableDr["as_date"] ;
                //LtScore.Text= vsDr["score"]ToString();

               
              

                if (vsDr["result"].ToString() == "合格")
                {
                    LtResult.Text = "<span style=\"color : blue;  font-weight:bold\">" +
                    "" + vsDr["result"].ToString() + "</span>";
                }
                else
                {
                    LtResult.Text = "<span style=\"color : red;  font-weight:bold\">" +
                       "" + vsDr["result"].ToString() + "</span>";
                }
            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (Session["DatabaseName"] == null)
            {
                Response.Redirect("../login.aspx");
            }

            string database = Session["DatabaseName"].ToString();

            if (RadioButtonList1.SelectedItem != null)
            {

                string com = RadioButtonList1.SelectedItem.Value;
                string SQLString = "uid,Name,Type,Owner,OwnerMobile,EIN,TEL1,TEL2,Fax1,Fax2,Capital,StaffAmount,RegisteredAddress,ContectAddress," +
                                   "(select ProjectCode from FirmCheck where uid =" + com + ") as ProjectCode," +
                                   "(select quality from FirmCheck where uid =" + com + ") as quality," +
                                   "(select progress from FirmCheck where uid =" + com + ") as progress," +
                                   "(select coordiate_com1 from FirmCheck where uid =" + com + ") as coordiate_com1," +
                                   "(select clean from FirmCheck where uid =" + com + ") as clean," +
                                   "(select security from FirmCheck where uid =" + com + ") as security," +
                                   "(select material from FirmCheck where uid =" + com + ") as material," +
                                   "(select material_QA from FirmCheck where uid =" + com + ") as material_QA," +
                                   "(select stock_timimg from FirmCheck where uid =" + com + ") as stock_timimg," +
                                   "(select coordiate_com2 from FirmCheck where uid =" + com + ") as coordiate_com2,"+
                                   "(select service from FirmCheck where uid =" + com + ") as service," +
                                   "(select clean_ma from FirmCheck where uid =" + com + ") as clean_ma," +
                                   "(select score from FirmCheck where uid =" + com + ") as score," +
                                   "(select result from FirmCheck where uid =" + com + ") as result," +
                                   "(select explanation from FirmCheck where uid =" + com + ") as explanation,"+
                                   "(select as_date from FirmCheck where uid =" + com + ") as as_date," +
                                   "(select Assessor from FirmCheck where uid =" + com + ") as Assessor";
                DataTable DataTableBox = WebModel.LoadContentData(database, "FirmM", com, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    gvEmps.DataSource = DataTableBox;
                    gvEmps.DataBind();

                }

            }
        }
        protected void SelectActionButton_Click(object sender, EventArgs e)
        {
            LoadData();
        }
    }
}