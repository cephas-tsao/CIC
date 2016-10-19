using System;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class FFundDebit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["PID"] = Session["ProjectCode"];
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (!IsPostBack)
            {
                DAL.Temp3.cc = 0;
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
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Pnl_1.Visible = true;
            Session["SCID"] = DropDownList1.SelectedValue;
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.SelectCommand = "Select * From FFund_Modify LEFT OUTER JOIN FFund_Main ON FFund_Modify.BelongFFID = FFund_Main.FFID WHERE FFund_Modify.SCID = " + Session["SCID"] + " and FFund_Modify.IncreaseDebit = 'D'";
            this.GridView1.DataBind();
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            long number1 = 0;
            bool canConvert = long.TryParse(TB_Price.Text, out number1);
            if (canConvert == true)
            {
                double x = Convert.ToDouble(TB_Price.Text) * 0.05;
                TB_Tax.Text = Convert.ToString(x);
                TB_Tax_1.Text = Convert.ToString(x);
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
                TB_SumPrice_1.Text = Convert.ToString(x);
            }
        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            double x = Convert.ToDouble(TB_Price0.Text) * 0.05;
            TB_Tax0.Text = Convert.ToString(x);
            TB_Tax0_1.Text = Convert.ToString(x);
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
                TB_SumPrice0_1.Text = Convert.ToString(x);
            }
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
                    if (DDL_Style.SelectedValue == "代支代付")
                    {
                        Date_Load = DAL.FirmFundMode.Insert_FFundDebit(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]), Convert.ToInt32(Session["SCID"]), DDL_Style.SelectedValue.ToString(), TB_Subject.Text, TB_Date.Text, Convert.ToDecimal(TB_Price.Text), Convert.ToDecimal(TB_Tax.Text), Convert.ToDecimal(TB_SumPrice.Text), Session["Name"].ToString(), "D", 0);
                        int FF_MID = DAL.FirmFundMode.Search_FF_MID(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]));
                        Date_Load = DAL.FirmFundMode.Insert_FFundDebit(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]), Convert.ToInt32(DropDownList3.SelectedValue), DDL_Style.SelectedValue.ToString(), TB_Subject.Text, TB_Date.Text, Convert.ToDecimal(TB_Price.Text), Convert.ToDecimal(TB_Tax.Text), Convert.ToDecimal(TB_SumPrice.Text), Session["Name"].ToString(), "I", FF_MID);
                        Date_Load = DAL.FirmFundMode.Update_FFundDebit(Session["DatabaseName"].ToString(), FF_MID, DDL_Style.SelectedValue, TB_Subject.Text, TB_Date.Text, Convert.ToInt32(TB_Price.Text), Convert.ToInt32(TB_Tax.Text), Convert.ToInt32(TB_SumPrice.Text), FF_MID+1);
                        Response.Write("<script language=javascript>alert('" + DropDownList1.SelectedItem.Text + "將新增一筆扣款紀錄，而" + DropDownList3.SelectedItem.Text + "將新增一筆加款紀錄。" + "')</script>");
                    }
                    else
                    {
                        Date_Load = DAL.FirmFundMode.Insert_FFundDebit(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]), Convert.ToInt32(Session["SCID"]), DDL_Style.SelectedValue.ToString(), TB_Subject.Text, TB_Date.Text, Convert.ToDecimal(TB_Price.Text), Convert.ToDecimal(TB_Tax.Text), Convert.ToDecimal(TB_SumPrice.Text), Session["Name"].ToString(), "D", 0);
                    }
                    SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                    SqlDataSource2.SelectCommand = "Select * From FFund_Modify LEFT OUTER JOIN FFund_Main ON FFund_Modify.BelongFFID = FFund_Main.FFID WHERE FFund_Modify.SCID = " + Session["SCID"] + " and FFund_Modify.IncreaseDebit = 'D'";
                    GridView1.DataBind();
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
            TB_Subject.Text="";
            TB_Price.Text="";
            TB_Tax.Text="";
            TB_Date.Text="";
            TB_SumPrice.Text = "";
            DDL_Style.SelectedValue = "0";
            TB_Subject_1.Text = "";
            TB_Price_1.Text = "";
            TB_Tax_1.Text = "";
            TB_Date_1.Text = "";
            TB_SumPrice_1.Text = "";
            DDL_Style_1.SelectedValue = "0";
        }

        protected void TB_Subject0_TextChanged(object sender, EventArgs e)
        {
            TB_Subject0_1.Text=TB_Subject0.Text;
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Pnl_Update.Visible = true;
            TB_Subject0.Text = DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Subject");
            DDL_Style0.SelectedValue = DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Type");
            TB_Date0.Text = (DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Date")).ToString();
            TB_Price0.Text = (DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Price")).ToString();
            TB_Tax0.Text = (DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Tax")).ToString();
            TB_SumPrice0.Text = (DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "SumPrice")).ToString();

            TB_Subject0_1.Text = DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Subject");
            DDL_Style0_1.SelectedValue = DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Type");
            TB_Date0_1.Text = (DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Date")).ToString();
            TB_Price0_1.Text = (DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Price")).ToString();
            TB_Tax0_1.Text = (DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Tax")).ToString();
            TB_SumPrice0_1.Text = (DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "SumPrice")).ToString();

            bool Rsult = DAL.FirmFundMode.SC_Name_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]));

            if (Rsult)
            {
                DropDownList4.Items.Clear();
                DropDownList4.Items.Add(new ListItem("-請選擇-", "0"));
                for (int i = 1; i < DAL.Temp2.i; i++)
                {
                    DropDownList4.Items.Add(new ListItem(DAL.Temp2.count[0, i], DAL.Temp2.count[1, i]));
                }
            }

            if (DDL_Style0.SelectedValue == "代支代付")
            {
                Pnl_Update_1.Visible = false;
                Pnl_Update_2.Visible = true;
                DropDownList4.SelectedValue = (DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "SCID")).ToString();
            }
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            int RelationFF_MID = Convert.ToInt32(DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "RelationFF_MID"));
            int BelongFFID = Convert.ToInt32(DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "BelongFFID"));

            if (BelongFFID == 0)
            {
                bool Date_Load = false;
                Pnl_Update.Visible = true;
                if (DDL_Style0.SelectedValue == "代支代付")
                {
                    Date_Load = DAL.FirmFundMode.Delete_FFundDebit(Session["DatabaseName"].ToString(), RelationFF_MID);
                    Date_Load = DAL.FirmFundMode.Delete_FFundDebit(Session["DatabaseName"].ToString(), DAL.Temp3.cc);
                }
                else
                {
                    Date_Load = DAL.FirmFundMode.Delete_FFundDebit(Session["DatabaseName"].ToString(), DAL.Temp3.cc);
                }
                if (Date_Load)
                {
                    Response.Write("<script language=javascript>alert('刪除成功！')</script>");
                }
                else
                {
                    Response.Write("<script language=javascript>alert('刪除失敗！')</script>");
                }
                SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource2.SelectCommand = "Select * From FFund_Modify LEFT OUTER JOIN FFund_Main ON FFund_Modify.BelongFFID = FFund_Main.FFID WHERE FFund_Modify.SCID = " + Session["SCID"] + " and FFund_Modify.IncreaseDebit = 'D'";
                this.GridView1.DataBind();
                TB_Subject0.Text = "";
                DDL_Style0.SelectedValue = "0";
                TB_Date0.Text = "";
                TB_Price0.Text = "";
                TB_Tax0.Text = "";
                TB_SumPrice0.Text = "";
                TB_Subject0_1.Text = "";
                DDL_Style0_1.SelectedValue = "0";
                TB_Date0_1.Text = "";
                TB_Price0_1.Text = "";
                TB_Tax0_1.Text = "";
                TB_SumPrice0_1.Text = "";
                Pnl_Update.Visible = false;
            }
            else
            {
                Response.Write("<script language=javascript>alert('代支代付已指定無法進行修改！')</script>");
            }
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            int RelationFF_MID = Convert.ToInt32(DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "RelationFF_MID"));
            int BelongFFID = Convert.ToInt32(DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "BelongFFID"));

            if (BelongFFID == 0)
            {
                bool Date_Load = false;
                Pnl_Update.Visible = true;
                if (DDL_Style0.SelectedValue == "代支代付")
                {
                    if (RelationFF_MID == 0)
                    {
                        Date_Load = DAL.FirmFundMode.Insert_FFundDebit(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]), Convert.ToInt32(DropDownList4.SelectedValue), DDL_Style0.SelectedValue.ToString(), TB_Subject0.Text, TB_Date0.Text, Convert.ToDecimal(TB_Price0.Text), Convert.ToDecimal(TB_Tax0.Text), Convert.ToDecimal(TB_SumPrice0.Text), Session["Name"].ToString(), "I", DAL.Temp3.cc);
                        int FF_MID = DAL.FirmFundMode.Search_RelationFF_MID_2(Session["DatabaseName"].ToString(), DAL.Temp3.cc);
                        Date_Load = DAL.FirmFundMode.Update_FFundDebit(Session["DatabaseName"].ToString(), DAL.Temp3.cc, DDL_Style0.SelectedValue, TB_Subject0.Text, TB_Date0.Text, Convert.ToInt32(TB_Price0.Text), Convert.ToInt32(TB_Tax0.Text), Convert.ToInt32(TB_SumPrice0.Text), FF_MID);
                        Response.Write("<script language=javascript>alert('" + DropDownList4.SelectedItem.Text + "將新增一筆加款紀錄。" + "')</script>");
                    }
                    else
                    {
                        Date_Load = DAL.FirmFundMode.Update_FFundDebit(Session["DatabaseName"].ToString(), DAL.Temp3.cc, DDL_Style0.SelectedValue, TB_Subject0.Text, TB_Date0.Text, Convert.ToInt32(TB_Price0.Text), Convert.ToInt32(TB_Tax0.Text), Convert.ToInt32(TB_SumPrice0.Text), RelationFF_MID);
                        Date_Load = DAL.FirmFundMode.Update_FFundDebit(Session["DatabaseName"].ToString(), RelationFF_MID, DDL_Style0.SelectedValue, TB_Subject0.Text, TB_Date0.Text, Convert.ToInt32(TB_Price0.Text), Convert.ToInt32(TB_Tax0.Text), Convert.ToInt32(TB_SumPrice0.Text), DAL.Temp3.cc);
                    }
                }
                else
                {
                    if (RelationFF_MID != 0)
                    {
                        Date_Load = DAL.FirmFundMode.Delete_FFundDebit(Session["DatabaseName"].ToString(), RelationFF_MID);
                        Response.Write("<script language=javascript>alert('" +  DropDownList4.SelectedItem.Text + "將刪除一筆加款紀錄。" + "')</script>");
                    }
                    Date_Load = DAL.FirmFundMode.Update_FFundDebit(Session["DatabaseName"].ToString(), DAL.Temp3.cc, DDL_Style0.SelectedValue, TB_Subject0.Text, TB_Date0.Text, Convert.ToInt32(TB_Price0.Text), Convert.ToInt32(TB_Tax0.Text), Convert.ToInt32(TB_SumPrice0.Text), 0);
                }
                if (Date_Load)
                {
                    Response.Write("<script language=javascript>alert('修改成功！')</script>");
                }
                else
                {
                    Response.Write("<script language=javascript>alert('修改失敗！')</script>");
                }
                SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource2.SelectCommand = "Select * From FFund_Modify LEFT OUTER JOIN FFund_Main ON FFund_Modify.BelongFFID = FFund_Main.FFID WHERE FFund_Modify.SCID = " + Session["SCID"] + " and FFund_Modify.IncreaseDebit = 'D'";
                this.GridView1.DataBind();
            }
            else
            {
                Response.Write("<script language=javascript>alert('代支代付已指定無法進行修改！')</script>");
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

            TB_Subject0.Text = DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Subject");
            DDL_Style0.SelectedValue = DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Type");
            TB_Date0.Text = (DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Date")).ToString();
            TB_Price0.Text = (DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Price")).ToString();
            TB_Tax0.Text = (DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Tax")).ToString();
            TB_SumPrice0.Text = (DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "SumPrice")).ToString();

            TB_Subject0_1.Text = DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Subject");
            DDL_Style0_1.SelectedValue = DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Type");
            TB_Date0_1.Text = (DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Date")).ToString();
            TB_Price0_1.Text = (DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Price")).ToString();
            TB_Tax0_1.Text = (DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Tax")).ToString();
            TB_SumPrice0_1.Text = (DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "SumPrice")).ToString();

            bool Rsult = DAL.FirmFundMode.SC_Name_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]));

            if (Rsult)
            {
                DropDownList4.Items.Clear();
                DropDownList4.Items.Add(new ListItem("-請選擇-", "0"));
                for (int i = 1; i < DAL.Temp2.i; i++)
                {
                    DropDownList4.Items.Add(new ListItem(DAL.Temp2.count[0, i], DAL.Temp2.count[1, i]));
                }
            }

            if (DDL_Style0.SelectedValue == "代支代付")
            {
                Pnl_Update_1.Visible = false;
                Pnl_Update_2.Visible = true;
                DropDownList4.SelectedValue = (DAL.FirmFundMode.FFD_ID_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "SCID")).ToString();
            }
        }

        protected void DDL_Style_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDL_Style.SelectedValue == "代支代付")
            {
                Pnl_Insert_1.Visible = false;
                Pnl_Insert_2.Visible = true;
                DDL_Style_1.SelectedValue = DDL_Style.SelectedValue;
            }
        }

        protected void DDL_Style_1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDL_Style_1.SelectedValue != "代支代付")
            {
                Pnl_Insert_1.Visible = true;
                Pnl_Insert_2.Visible = false;
                DDL_Style.SelectedValue = DDL_Style_1.SelectedValue;
            }
        }

        protected void TB_Subject_TextChanged(object sender, EventArgs e)
        {
            TB_Subject_1.Text = TB_Subject.Text;
        }

        protected void TB_Subject_1_TextChanged(object sender, EventArgs e)
        {
            TB_Subject.Text = TB_Subject_1.Text;
        }

        protected void TB_Price_TextChanged(object sender, EventArgs e)
        {
            TB_Price_1.Text = TB_Price.Text;
        }

        protected void TB_Price_1_TextChanged(object sender, EventArgs e)
        {
            TB_Price.Text = TB_Price_1.Text;
        }

        protected void TB_Tax_TextChanged(object sender, EventArgs e)
        {
            TB_Tax_1.Text = TB_Tax.Text;
        }

        protected void TB_Tax_1_TextChanged(object sender, EventArgs e)
        {
            TB_Tax.Text = TB_Tax_1.Text;
        }

        protected void TB_Date_TextChanged(object sender, EventArgs e)
        {
            TB_Date_1.Text = TB_Date.Text;
        }

        protected void TB_Date_1_TextChanged(object sender, EventArgs e)
        {
            TB_Date.Text = TB_Date_1.Text;
        }

        protected void TB_SumPrice_TextChanged(object sender, EventArgs e)
        {
            TB_SumPrice_1.Text = TB_SumPrice.Text;
        }

        protected void TB_SumPrice_1_TextChanged(object sender, EventArgs e)
        {
            TB_SumPrice.Text = TB_SumPrice_1.Text;
        }

        protected void DDL_Style0_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDL_Style0.SelectedValue == "代支代付")
            {
                Pnl_Update_1.Visible = false;
                Pnl_Update_2.Visible = true;
                DDL_Style0_1.SelectedValue = DDL_Style0.SelectedValue; 
            }
        }

        protected void DDL_Style0_1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDL_Style0_1.SelectedValue != "代支代付")
            {
                Pnl_Update_1.Visible = true;
                Pnl_Update_2.Visible = false;
                DDL_Style0.SelectedValue = DDL_Style0_1.SelectedValue;
            }
        }

        protected void TB_Subject0_1_TextChanged(object sender, EventArgs e)
        {
            TB_Subject0.Text = TB_Subject0_1.Text;
        }

        protected void TB_Price0_TextChanged(object sender, EventArgs e)
        {
            TB_Price0_1.Text = TB_Price0.Text;
        }

        protected void TB_Price0_1_TextChanged(object sender, EventArgs e)
        {
            TB_Price0.Text = TB_Price0_1.Text;
        }

        protected void TB_Tax0_TextChanged(object sender, EventArgs e)
        {
            TB_Tax0_1.Text = TB_Tax0.Text;
        }

        protected void TB_Tax0_1_TextChanged(object sender, EventArgs e)
        {
            TB_Tax0.Text = TB_Tax0_1.Text;
        }

        protected void TB_Date0_TextChanged(object sender, EventArgs e)
        {
            TB_Date0_1.Text = TB_Date0.Text;
        }

        protected void TB_Date0_1_TextChanged(object sender, EventArgs e)
        {
            TB_Date0.Text = TB_Date0_1.Text;
        }

        protected void TB_SumPrice0_TextChanged(object sender, EventArgs e)
        {
            TB_SumPrice0_1.Text = TB_SumPrice0.Text;
        }

        protected void TB_SumPrice0_1_TextChanged(object sender, EventArgs e)
        {
            TB_SumPrice0.Text = TB_SumPrice0_1.Text;
        }
    }
}