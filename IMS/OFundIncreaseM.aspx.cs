using System;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class OFundIncreaseM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["PID"] = Session["ProjectCode"];
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            GridView1.Attributes.Add("style", "font-family:Microsoft JhengHei;");
            if (!IsPostBack)
            {
                DAL.Temp.cc = -1;
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if ((Pnl_Insert.Visible == true))
            {
                Pnl_Insert.Visible = false;
            }
            else { Pnl_Insert.Visible = true; }
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if ((Pnl_View.Visible == true))
            {
                Pnl_View.Visible = false;
            }
            else { Pnl_View.Visible = true; }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            long number1 = 0;
            bool canConvert = long.TryParse(TB_Price.Text, out number1);
            if (canConvert == true)
            {
                double x = Convert.ToDouble(TB_Price.Text) * 0.05;
                TB_Tax.Text = Convert.ToString(x);
            }
            else
            {
                Response.Write("<script language=javascript>alert('輸入扣款金額非數字！')</script>");
            }
        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            long number1 = 0;
            bool canConvert1 = long.TryParse(TB_Price.Text, out number1);
            if (TB_Tax.Text == "")
            {
                TB_Tax.Text = "0";
            }
            long number2 = 0;
            bool canConvert2 = long.TryParse(TB_Tax.Text, out number2);
            if (canConvert1 == true && canConvert2 == true)
            {
                double x = Convert.ToDouble(TB_Price.Text) + Convert.ToDouble(TB_Tax.Text);
                TB_SumPrice.Text = Convert.ToString(x);
            }
        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            long number1 = 0;
            bool canConvert = long.TryParse(TB_Price0.Text, out number1);
            if (canConvert == true)
            {
                double x = Convert.ToDouble(TB_Price0.Text) * 0.05;
                TB_Tax0.Text = Convert.ToString(x);
            }
            else
            {
                Response.Write("<script language=javascript>alert('輸入扣款金額非數字！')</script>");
            }
        }
        protected void Button7_Click(object sender, EventArgs e)
        {
            long number1 = 0;
            bool canConvert1 = long.TryParse(TB_Price0.Text, out number1);
            if (TB_Tax0.Text == "")
            {
                TB_Tax0.Text = "0";
            }
            long number2 = 0;
            bool canConvert2 = long.TryParse(TB_Tax0.Text, out number2);
            if (canConvert1 == true && canConvert2 == true)
            {
                double x = Convert.ToDouble(TB_Price0.Text) + Convert.ToDouble(TB_Tax0.Text);
                TB_SumPrice0.Text = Convert.ToString(x);
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            TB_Subject.Text = "";
            TB_Price.Text = "";
            TB_Tax.Text = "";
            TB_Date.Text = "";
            TB_SumPrice.Text = "";
            TB_Docu.Text = "";
            DDL_Style.SelectedValue = "0";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            bool Date_Load = false;
            if (TB_Price.Text == "" || TB_Subject.Text == "" || TB_Tax.Text == "" || TB_Date.Text == "" || TB_SumPrice.Text == "" || DDL_Style.SelectedValue == "0")
            {
                Response.Write("<script language=javascript>alert('有資料尚未輸入！')</script>");
            }
            else
            {
                DateTime dtDate;
                if (DateTime.TryParse(TB_Date.Text, out dtDate))
                {
                    Date_Load = DAL.OFundMode.Insert_OFundDebitM(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]), DDL_Style.SelectedValue.ToString(), TB_Subject.Text, TB_Date.Text, Convert.ToDecimal(TB_Price.Text), Convert.ToDecimal(TB_Tax.Text), Convert.ToDecimal(TB_SumPrice.Text), Session["Name"].ToString(), TB_Docu.Text, "I");
                    SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                    SqlDataSource1.SelectCommand = "Select * From OFund_Modify LEFT OUTER JOIN OFund_Main ON OFund_Modify.BelongOFID = OFund_Main.OFID WHERE OFund_Modify.PID = " + Session["PID"] + " And OFund_Modify. IncreaseDebit='I'";
                    this.GridView1.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('發生日期不是正確的日期格式！');</script>");
                }
            }
            if (Date_Load)
            {
                Response.Write("<script language=javascript>alert('新增成功！')</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('新增失敗！')</script>");
            }
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            bool Date_Load = false;
            Pnl_Update.Visible = true;
            Date_Load = DAL.OFundMode.Update_OFundDebitM(Session["DatabaseName"].ToString(), DAL.Temp3.cc, DDL_Style0.SelectedValue, TB_Subject0.Text, TB_Date0.Text, Convert.ToInt32(TB_Price0.Text), Convert.ToInt32(TB_Tax0.Text), Convert.ToInt32(TB_SumPrice0.Text), TB_Docu0.Text);
            if (Date_Load)
            {
                Response.Write("<script language=javascript>alert('修改成功！')</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('修改失敗！')</script>");
            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource1.SelectCommand = "Select * From OFund_Modify LEFT OUTER JOIN OFund_Main ON OFund_Modify.BelongOFID = OFund_Main.OFID WHERE OFund_Modify.PID = " + Session["PID"] + " And OFund_Modify. IncreaseDebit='I'";
            this.GridView1.DataBind();
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Pnl_Update.Visible = true;
            TB_Subject0.Text = DAL.OFundMode.OFund_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Subject");
            DDL_Style0.SelectedValue = DAL.OFundMode.OFund_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Type");
            TB_Date0.Text = (DAL.OFundMode.OFund_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Date")).ToString();
            TB_Price0.Text = (DAL.OFundMode.OFund_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Price")).ToString();
            TB_Tax0.Text = (DAL.OFundMode.OFund_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Tax")).ToString();
            TB_SumPrice0.Text = (DAL.OFundMode.OFund_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "SumPrice")).ToString();
            TB_Docu0.Text = (DAL.OFundMode.OFund_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Documents")).ToString();
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            bool Date_Load = false;
            Pnl_Update.Visible = true;
            Date_Load = DAL.OFundMode.Delete_OFundDebitM(Session["DatabaseName"].ToString(), DAL.Temp3.cc);
            if (Date_Load)
            {
                Response.Write("<script language=javascript>alert('刪除成功！')</script>");
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.SelectCommand = "Select * From OFund_Modify LEFT OUTER JOIN OFund_Main ON OFund_Modify.BelongOFID = OFund_Main.OFID WHERE OFund_Modify.PID = " + Session["PID"] + " And OFund_Modify. IncreaseDebit='I'";
                GridView1.DataBind();
                TB_Subject0.Text = "";
                DDL_Style0.SelectedValue = "-請選擇-";
                TB_Date0.Text = "";
                TB_Price0.Text = "";
                TB_Tax0.Text = "";
                TB_SumPrice0.Text = "";
                TB_Docu0.Text = "";
                Pnl_Update.Visible = false;
            }
            else
            {
                Response.Write("<script language=javascript>alert('刪除失敗！')</script>");
            }
        }

        protected void GridView1_RowDataBound(Object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowIndex > -1)
            {
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#e4c0d6'");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c;");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DAL.Temp.cc != -1)
            {
                if ((DAL.Temp.cc % 2) == 0)
                {
                    GridView1.Rows[DAL.Temp.cc].BackColor = System.Drawing.ColorTranslator.FromHtml("#EFF3FB");
                }
                else
                {
                    GridView1.Rows[DAL.Temp.cc].BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
                }
            }
            GridView1.Rows[GridView1.SelectedIndex].BackColor = System.Drawing.ColorTranslator.FromHtml("#c0d6e4");
            DAL.Temp.cc = GridView1.SelectedIndex;
            DAL.Temp3.cc = Convert.ToInt32(GridView1.DataKeys[GridView1.SelectedIndex].Value);
            Pnl_Update.Visible = true;
            TB_Subject0.Text = DAL.OFundMode.OFund_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Subject");
            DDL_Style0.SelectedValue = DAL.OFundMode.OFund_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Type");
            TB_Date0.Text = (DAL.OFundMode.OFund_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Date")).ToString();
            TB_Price0.Text = (DAL.OFundMode.OFund_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Price")).ToString();
            TB_Tax0.Text = (DAL.OFundMode.OFund_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Tax")).ToString();
            TB_SumPrice0.Text = (DAL.OFundMode.OFund_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "SumPrice")).ToString();
            TB_Docu0.Text = (DAL.OFundMode.OFund_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Documents")).ToString();
        }
    }
}