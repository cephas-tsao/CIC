using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class PriceAnalysis_Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["ID"] = Request.QueryString["ID"];
            DDL_Unit.DataSource = Utility.Unitlist.UnitList();
            
            if (!IsPostBack)
            {
                make_table_loading(Session["DatabaseName"].ToString(), Session["ID"].ToString());
                //ViewState["edit_count"] = 0;
            }
            else
            {
                if (Session["PriceName"] == null)
                {
                    Session["PriceName"] = "0";
                }
                if (Session["PriceNumber"] == null)
                {

                    Session["PriceNumber"] = "0";
                }
                //else
                //{
                    make_table(Session["DatabaseName"].ToString(), Session["ID"].ToString(), Session["PriceName"].ToString(), Session["PriceNumber"].ToString());
                //}
            }
            DDL_Unit.DataBind();
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource1.SelectCommand = "Select * from PrivateResource";
            
        }

        public void make_table(string dbname, string ID, string PriceName, string PriceNumber)
        {
            ViewState["edit_count"] = 0;
            DAL.PriceAnalysis PA = new DAL.PriceAnalysis();
            string[] original_result = PA.SelectByID(dbname, Convert.ToInt32(ID));
            if (original_result[3] != null)
            {
                if (original_result[1] == "1")
                {
                    TB_PriceName.Text = original_result[0];
                    DDL_Unit.SelectedValue = original_result[2];
                    TB_AnaNum.Text = original_result[5];
                    string[] PriceList = Utility.str_process.str2array(PriceName);
                    string[] NumberList = Utility.str_process.str2array(PriceNumber);
                    for (int i = 0; i < PriceList.Length; i++)
                    {
                        make_row(PriceList[i], NumberList[i]);
                    }
                }
                else
                {
                    Response.Write("<script>alert('此項目非拆工拆料項!');</script>");

                }
            }
           
        }

        public void make_table_loading(string dbname, string ID)
        {
            ViewState["edit_count"] = 0;
            DAL.PriceAnalysis PA = new DAL.PriceAnalysis();
            string[] result = PA.SelectByID(dbname, Convert.ToInt32(ID));
            if (result[1] == "1")
            {
                TB_PriceName.Text = result[0];
                DDL_Unit.SelectedValue = result[2];
                TB_AnaNum.Text = result[5];
                string[] PriceList = Utility.str_process.str2array(result[3]);
                string[] NumberList = Utility.str_process.str2array(result[4]);
                Session["PriceName"] = result[3];
                Session["PriceNumber"] = result[4];
                if(result[3] !=null)
                {
                    for (int i = 0; i < PriceList.Length; i++)
                    {
                        make_row(PriceList[i], NumberList[i]);
                    }
                }
            }
            else
            {
                TB_PriceName.Text = result[0];
                DDL_Unit.SelectedValue = result[2];
                TB_AnaNum.Text = result[5];
            }
        }

        protected void del_btn(object sender, CommandEventArgs e)
        {
            int rows = Convert.ToInt32(e.CommandArgument);
            //int rows = 1;
            Tbl_Price.Rows.Remove(Tbl_Price.Rows[rows]);

            string[] PName = Utility.str_process.str2array(Session["PriceName"].ToString());
            string[] PNumber = Utility.str_process.str2array(Session["PriceNumber"].ToString());
            string[] NewPName = new string[PName.Length - 1];
            string[] NewPNumber = new string[PNumber.Length - 1];
            int count = 0;
            for (int i = 0; i < PName.Length; i++)
            {
                if (i != (rows - 1))
                {
                    NewPName[count] = PName[i];
                    NewPNumber[count] = PNumber[i];
                    count++;
                }
            }
            Session["PriceName"] = Utility.array_process.array2str(NewPName);//.Substring(0, Utility.array_process.array2str(NewPName).Length - 1);
            Session["PriceNumber"] = Utility.array_process.array2str(NewPNumber);//.Substring(0, Utility.array_process.array2str(NewPNumber).Length - 1);
        }

        public void make_row(string PriceName, string Number)
        {
            TableRow TR = new TableRow();
            TableCell TC1 = new TableCell();
            Button Btn = new Button();
            Btn.Text = "刪除";
            Btn.CommandName = "del";
            Btn.Command += new CommandEventHandler(del_btn);
            ViewState["edit_count"] = Convert.ToInt32(ViewState["edit_count"]) + 1;
            Btn.ID = "TC1_ID_" + ViewState["edit_count"].ToString();
            Btn.CommandArgument = ViewState["edit_count"].ToString();

            TC1.Controls.Add(Btn);
            TR.Cells.Add(TC1);
            TableCell TC2 = new TableCell();
            DropDownList DDL = new DropDownList();
            DDL.DataSourceID = "SqlDataSource1";
            DDL.DataTextField = "ItemName";
            DDL.DataValueField = "PriceID";
            DDL.SelectedValue = PriceName;
            DDL.ID = "TC2_DDL_" + ViewState["edit_count"].ToString();
            DDL.SelectedIndexChanged += new EventHandler(DDL_change);
            DDL.Width = System.Web.UI.WebControls.Unit.Pixel(600);
            TC2.Controls.Add(DDL);
            TR.Cells.Add(TC2);
            TableCell TC3 = new TableCell();
            TextBox TB = new TextBox();
            TB.Text = Number;
            TB.ID = "TC3_TB_" + ViewState["edit_count"].ToString();
            TB.TextChanged += new EventHandler(TB_change);

            TC3.Controls.Add(TB);
            TR.Cells.Add(TC3);
            Tbl_Price.Rows.Add(TR);
        }

        protected void TB_change(object sender, EventArgs e)
        {
            int rows = 0;
            TextBox tb = (TextBox)sender;
            string[] temp = tb.ID.Split('_');
            rows = Convert.ToInt32(temp[2]);
            string[] PNumber = Utility.str_process.str2array(Session["PriceNumber"].ToString());
            PNumber[rows - 1] = tb.Text;

            Session["PriceNumber"] = Utility.array_process.array2str(PNumber);//.Substring(0, Utility.array_process.array2str(PNumber).Length - 1);
        }

        protected void DDL_change(object sender, EventArgs e)
        {
            int rows = 0;
            DropDownList ddl = (DropDownList)sender;
            string[] temp = ddl.ID.Split('_');
            rows = Convert.ToInt32(temp[2]);
            string[] PName = Utility.str_process.str2array(Session["PriceName"].ToString());
            PName[rows - 1] = ddl.SelectedValue;

            Session["PriceName"] = Utility.array_process.array2str(PName);//.Substring(0, Utility.array_process.array2str(PName).Length - 1);
        }

        protected void Btn_Add_Click(object sender, EventArgs e)
        {
            if (ViewState["edit_count"] != null && ViewState["edit_count"] !="")
            {
                if (Session["PriceName"].ToString() == "0")
                {

                    Session["PriceName"] = "0";
                    Session["PriceNumber"] = "1";
                    //ViewState["edit_count"] = 0;
                }
                else
                {
                    Session["PriceName"] = Session["PriceName"].ToString() + ",1";
                    Session["PriceNumber"] = Session["PriceNumber"].ToString() + ",0";
                }
                TableRow NewTR = new TableRow();
                TableCell NewTC1 = new TableCell();
                Button NewBtn1 = new Button();
                NewBtn1.Text = "刪除";
                NewBtn1.CommandName = "del";
                NewBtn1.Command += new CommandEventHandler(del_btn);
                ViewState["edit_count"] = Convert.ToInt32(ViewState["edit_count"]) + 1;
                NewBtn1.ID = "TC1_ID_" + ViewState["edit_count"].ToString();
                NewBtn1.CommandArgument = ViewState["edit_count"].ToString();

                NewTC1.Controls.Add(NewBtn1);
                NewTR.Cells.Add(NewTC1);
                NewTR.Style.Add("Background-color", "yellow");
                TableCell NewTC2 = new TableCell();
                DropDownList DDL = new DropDownList();
                DDL.DataSourceID = "SqlDataSource1";
                DDL.DataTextField = "ItemName";
                DDL.DataValueField = "PriceID";
                DDL.SelectedValue = "1";
                DDL.ID = "TC2_DDL_" + ViewState["edit_count"].ToString();
                DDL.SelectedIndexChanged += new EventHandler(DDL_change);

                DDL.Width = System.Web.UI.WebControls.Unit.Pixel(600);
                //DDL.BackColor = "yellow";
                NewTC2.Controls.Add(DDL);
                NewTR.Cells.Add(NewTC2);

                TableCell NewTC3 = new TableCell();
                TextBox TB = new TextBox();
                TB.Width = System.Web.UI.WebControls.Unit.Pixel(170);
                TB.Text = "0";
                TB.ID = "TC3_TB_" + ViewState["edit_count"].ToString();
                TB.TextChanged += new EventHandler(TB_change);

                NewTC3.Controls.Add(TB);
                NewTR.Cells.Add(NewTC3);

                Tbl_Price.Rows.Add(NewTR);
            }
        }

        protected void Btn_Save_Click(object sender, EventArgs e)
        {
            decimal temp = 0.000M;
            decimal.TryParse(TB_AnaNum.Text, out temp);
            bool result = DAL.PriceAnalysis.UpdatePrivatePrice(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ID"].ToString()), TB_PriceName.Text, DDL_Unit.SelectedValue, Session["PriceName"].ToString(), Session["PriceNumber"].ToString(), temp);
            if (result)
            {
                Response.Write("<script>alert('工料：" + TB_PriceName.Text + " 更新成功');</script>");
            }
            else
            {
                Response.Write("<script>alert('工料：" + TB_PriceName.Text + " 更新失敗');</script>");
            }
        }
    }
}