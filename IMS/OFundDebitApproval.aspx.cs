using System;
using System.Web.UI.WebControls;
using System.Data;

namespace IMS
{
    public partial class OFundDebitApproval : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void Page_InitComplete(object sender, System.EventArgs e)
        {
            GridView1.Attributes.Add("style", "font-family:Microsoft JhengHei;");
            GridView1_GVgetData();
        }

        private void GridView1_GVgetData()
        {
            bool Result = DAL.OFundMode.OFund_Search4(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["OFID"]), "D");
            if (Result)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("OF_MID");
                dt.Columns.Add("Subject");
                dt.Columns.Add("Type");
                dt.Columns.Add("Date");
                dt.Columns.Add("Price");
                dt.Columns.Add("Tax");
                dt.Columns.Add("SumPrice");
                dt.Columns.Add("Documents");
                dt.Columns.Add("Recorder");
                dt.Columns.Add("ckbSelect");
                dt.Columns.Add("ckb_Show");
                for (int i = 1; i < DAL.Temp2.i; i++)
                {
                    DataRow row = dt.NewRow();
                    if (DAL.Temp2.count[10, i] != Session["OFID"].ToString())
                    {
                        row["ckbSelect"] = "0";
                        row["ckb_Show"] = "1";
                    }
                    else if (DAL.Temp2.count[10, i] == Session["OFID"].ToString())
                    {
                        row["ckbSelect"] = "1";
                        row["ckb_Show"] = "1";
                    }
                    row["OF_MID"] = DAL.Temp2.count[8, i];
                    row["Subject"] = DAL.Temp2.count[0, i];
                    row["Type"] = DAL.Temp2.count[1, i];
                    row["Date"] = DAL.Temp2.count[2, i];
                    row["Price"] = DAL.Temp2.count[3, i];
                    row["Tax"] = DAL.Temp2.count[4, i];
                    row["SumPrice"] = DAL.Temp2.count[5, i];
                    row["Recorder"] = DAL.Temp2.count[6, i];
                    row["Documents"] = DAL.Temp2.count[9, i];
                    dt.Rows.Add(row);
                }
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool Result = false;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                GridViewRow gvr = GridView1.Rows[i];
                CheckBox ckb = (CheckBox)gvr.FindControl("checkbox1");
                if (ckb.Checked == true)
                {
                    Result = DAL.OFundMode.Update_OFundDebitAssign_2(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["OFID"]), Convert.ToInt32(GridView1.DataKeys[i].Value));
                }
                else if (ckb.Checked == false)
                {
                    Result = DAL.OFundMode.Update_OFundDebitAssign_2(Session["DatabaseName"].ToString(), 0, Convert.ToInt32(GridView1.DataKeys[i].Value));
                }
                decimal SUM_SumPrice = DAL.OFundMode.SumPrice_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["OFID"]), "D");
                Result = DAL.OFundMode.Update_OFundDebitAssign_3(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["OFID"]), SUM_SumPrice, "AItem9");
            }
            if (Result)
            {
                Response.Write("<script language=javascript>alert('選取成功！')</script>");
                Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_Self').click();self.close()</script>");
                Response.Write("<script language='javascript'>window.close();</" + "script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('選取失敗！')</script>");
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
            if ((Panel1.Visible == true))
            {
                Panel1.Visible = false;
            }
            else { Panel1.Visible = true; }
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            bool Date_Load = false;
            bool Result = false;
            if (TB_Price.Text == "" || TB_Subject.Text == "" || TB_Tax.Text == "" || TB_Date.Text == "" || TB_SumPrice.Text == "" || DDL_Style.SelectedValue == "0")
            {
                Response.Write("<script language=javascript>alert('有資料尚未輸入！')</script>");
            }
            else
            {
                DateTime dtDate;
                if (DateTime.TryParse(TB_Date.Text, out dtDate))
                {
                    Date_Load = DAL.OFundMode.Insert_OFundDebitM_2(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]), DDL_Style.SelectedValue.ToString(), TB_Subject.Text, TB_Date.Text, Convert.ToDecimal(TB_Price.Text), Convert.ToDecimal(TB_Tax.Text), Convert.ToDecimal(TB_SumPrice.Text), Session["Name"].ToString(), TB_Docu.Text, "D", Convert.ToInt32(Session["OFID"]), Convert.ToInt32(Session["OFID"]));
                    decimal SUM_SumPrice_1 = DAL.OFundMode.SumPrice_Search_11(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["OFID"]), "D");
                    Result = DAL.OFundMode.Update_OFundDebitAssign_3(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["OFID"]), SUM_SumPrice_1, "OItem9");
                    decimal SUM_SumPrice_2 = DAL.OFundMode.SumPrice_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["OFID"]), "D");
                    Result = DAL.OFundMode.Update_OFundDebitAssign_3(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["OFID"]), SUM_SumPrice_2, "AItem9");
                    GridView1_GVgetData();
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

        protected void Button3_Click(object sender, EventArgs e)
        {
            TB_Subject.Text = "";
            TB_Price.Text = "";
            TB_Tax.Text = "";
            TB_Date.Text = "";
            TB_SumPrice.Text = "";
            TB_Docu.Text = "";
            DDL_Style.SelectedValue = "-請選擇-";
        }
    }
}