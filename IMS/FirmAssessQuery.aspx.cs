using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data.SqlClient;

namespace IMS
{
    public partial class FirmAssessQuery : System.Web.UI.Page
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
        protected void Rep_company_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
             
            
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;

              
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
                Label Label1 = (Label)e.Item.FindControl("Label1");
                Literal Literal1 = (Literal)e.Item.FindControl("Literal1");
                Literal Literal2 = (Literal)e.Item.FindControl("Literal2");
                Literal Literal3 = (Literal)e.Item.FindControl("Literal3");
                Literal Literal4 = (Literal)e.Item.FindControl("Literal4");
                Literal Literal5 = (Literal)e.Item.FindControl("Literal5");
                Literal Literal6 = (Literal)e.Item.FindControl("Literal6");
                Literal Literal7 = (Literal)e.Item.FindControl("Literal7");
                Literal Literal8 = (Literal)e.Item.FindControl("Literal8");
                Literal Literal9 = (Literal)e.Item.FindControl("Literal9");
                Literal Literal10 = (Literal)e.Item.FindControl("Literal10");
                Literal Literal11 = (Literal)e.Item.FindControl("Literal11");
                Literal LtAssessor = e.Item.FindControl("LtAssessor") as Literal;
                Literal LtResult = e.Item.FindControl("LtResult") as Literal;
                Literal LtExplan = e.Item.FindControl("LtExplan") as Literal;

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
                Literal1.Text = vsDr["capital1"].ToString();
                Literal3.Text = vsDr["staff"].ToString();
                Literal5.Text = vsDr["profession"].ToString();
                Literal7.Text = vsDr["equipment"].ToString();
                Literal9.Text = vsDr["quality"].ToString();
                Literal11.Text = vsDr["quotation"].ToString();
                LtAssessor.Text = vsDr["Assessor"].ToString();
                LtExplan.Text = vsDr["explanation"].ToString();
              
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
                                  "(select capital from FirmAssess where uid =" + com + ") as capital1," +                                 
                                  "(select staff from FirmAssess where uid =" + com + ") as staff," +
                                  "(select profession from FirmAssess where uid =" + com + ") as profession," +
                                  "(select equipment from FirmAssess where uid =" + com + ") as equipment," +
                                  "(select quality from FirmAssess where uid =" + com + ") as quality," +
                                  "(select quotation from FirmAssess where uid =" + com + ") as quotation,"+
                                  "(select score from FirmAssess where uid =" + com + ") as score," +
                                  "(select result from FirmAssess where uid =" + com + ") as result," +
                                  "(select Assessor from FirmAssess where uid =" + com + ") as Assessor," +
                                  "(select explanation from FirmAssess where uid =" + com + ") as explanation";
               DataTable DataTableBox = WebModel.LoadContentData(database,"FirmM",com,SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {
                    Rep_company.DataSource = DataTableBox;
                    Rep_company.DataBind();

                }

            }
        }

        protected void SelectActionButton_Click(object sender, EventArgs e)
        {
            LoadData();
        }
    }
}