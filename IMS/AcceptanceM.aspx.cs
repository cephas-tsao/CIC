using System;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class AcceptanceM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["PID"] = Session["ProjectCode"];
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            TextBox2.Text = DateTime.Now.ToString("yyyy-MM-dd");
            TextBox4.Text = DAL.CompletionMode.AcceptanceM_ProjectCode(Session["DatabaseName"].ToString(), Convert.ToInt16(Session["PID"]));
            TextBox8.Text = DAL.CompletionMode.AcceptanceM_BookFinishDate(Session["DatabaseName"].ToString(), Convert.ToInt16(Session["PID"]));
            TextBox11.Text = DAL.CompletionMode.AcceptanceM_AdjestTotalPrice(Session["DatabaseName"].ToString(), Convert.ToInt16(Session["PID"]));
            decimal Temp = 0;
            if (DAL.CompletionMode.AcceptanceM_OContractPrice(Session["DatabaseName"].ToString(), Convert.ToInt16(Session["PID"])) == "" || DAL.CompletionMode.AcceptanceM_OContractPrice(Session["DatabaseName"].ToString(), Convert.ToInt16(Session["PID"])) == " ")
            {
            }
            else
            {
                Temp = Convert.ToDecimal(DAL.CompletionMode.AcceptanceM_OContractPrice(Session["DatabaseName"].ToString(), Convert.ToInt16(Session["PID"])));
            }
            DAL.CompletionMode.AcceptanceM_OContractPrice(Session["DatabaseName"].ToString(), Convert.ToInt16(Session["PID"]));
            if (Temp >= 200000000)
            {
                RadioButtonList3.SelectedValue = "巨額";
            }
            else if (Temp >= 50000000 && Temp < 200000000)
            {
                RadioButtonList3.SelectedValue = "查核金額以上未達巨額";
            }
            else if (Temp >= 1000000 && Temp < 50000000)
            {
                RadioButtonList3.SelectedValue = "公告金額以上未達查核金額";
            }
            else
            {
                RadioButtonList3.SelectedValue = "未達公告金額";
            }
            GridView1.Attributes.Add("style", "font-family:Microsoft JhengHei;");
            if (!IsPostBack)
            {
                DAL.Temp.cc = -1;
            }
            RadioButtonList1.SelectedValue = "全部驗收";
            RadioButtonList2.SelectedValue = "未逾期";
            RadioButtonList4.SelectedValue = "與契約、圖說、貨樣規定相符";
        }
        protected void RadioButtonList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((RadioButtonList4.SelectedIndex == 1))
            {
                TB_ResultNO.Visible = true;
            }
            else
            {
                TB_ResultNO.Visible = false;
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if ((Pnl_Add.Visible == true))
            {
                Pnl_Add.Visible = false;
            }
            else
            {
                Pnl_Add.Visible = true;
            }
            Pnl_Detail.Visible = false;
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if ((Pnl_View.Visible == true))
            {
                Pnl_View.Visible = false;
            }
            else
            {
                Pnl_View.Visible = true;
            }
        }
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if ((Pnl_Detail.Visible == true))
            {
                Pnl_Detail.Visible = false;
            }
            else
            {
                Pnl_Detail.Visible = true;
            }
            Pnl_Add.Visible = false;
        }
        protected void RadioButtonList8_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((RadioButtonList8.SelectedIndex == 1))
            {
                TB_ResultNO2.Visible = true;
            }
            else
            {
                TB_ResultNO2.Visible = false;
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            DropDownList1.SelectedValue = "-請選擇-";
            TextBox1.Text = "";
            TextBox6.Text = "";
            TextBox5.Text = "";
            TextBox7.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";
            TextBox12.Text = "";
            TB_ResultNO.Text = "";
            TextBox13.Text = "";
            TextBox14.Text = "";
            TextBox2.Text = DateTime.Now.ToString("yyyy-MM-dd");
            TextBox4.Text = DAL.CompletionMode.AcceptanceM_ProjectCode(Session["DatabaseName"].ToString(), Convert.ToInt16(Session["PID"]));
            TextBox8.Text = DAL.CompletionMode.AcceptanceM_BookFinishDate(Session["DatabaseName"].ToString(), Convert.ToInt16(Session["PID"]));
            TextBox11.Text = DAL.CompletionMode.AcceptanceM_AdjestTotalPrice(Session["DatabaseName"].ToString(), Convert.ToInt16(Session["PID"]));
            decimal Temp = 0;
            if (DAL.CompletionMode.AcceptanceM_OContractPrice(Session["DatabaseName"].ToString(), Convert.ToInt16(Session["PID"])) == "" || DAL.CompletionMode.AcceptanceM_OContractPrice(Session["DatabaseName"].ToString(), Convert.ToInt16(Session["PID"])) == " ")
            {
            }
            else
            {
                Temp = Convert.ToDecimal(DAL.CompletionMode.AcceptanceM_OContractPrice(Session["DatabaseName"].ToString(), Convert.ToInt16(Session["PID"])));
            }
            DAL.CompletionMode.AcceptanceM_OContractPrice(Session["DatabaseName"].ToString(), Convert.ToInt16(Session["PID"]));
            if (Temp >= 200000000)
            {
                RadioButtonList3.SelectedValue = "巨額";
            }
            else if (Temp >= 50000000 && Temp < 200000000)
            {
                RadioButtonList3.SelectedValue = "查核金額以上未達巨額";
            }
            else if (Temp >= 1000000 && Temp < 50000000)
            {
                RadioButtonList3.SelectedValue = "公告金額以上未達查核金額";
            }
            else
            {
                RadioButtonList3.SelectedValue = "未達公告金額";
            }
            RadioButtonList4.SelectedValue = "與契約、圖說、貨樣規定相符";
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            bool Load_Part = false;
            //if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox6.Text == "" || TextBox4.Text == "" || TextBox5.Text == "" || TextBox7.Text == "" || TextBox8.Text == "" || TextBox9.Text == "" || TextBox10.Text == "" || TextBox11.Text == "" || TextBox12.Text == "" || TextBox13.Text == "" || TextBox14.Text == "" || RadioButtonList1.SelectedValue == "" || RadioButtonList2.SelectedValue == "" || RadioButtonList3.SelectedValue == "" || RadioButtonList4.SelectedValue == "")
            if (false)
            {
                Response.Write("<script language=javascript>alert('有資料尚未輸入！')</script>");
            }
            else
            {
                DateTime dtDate;
                if (DateTime.TryParse(TextBox2.Text, out dtDate) || DateTime.TryParse(TextBox8.Text, out dtDate) || DateTime.TryParse(TextBox9.Text, out dtDate))
                {
                    if (TextBox1.Text=="")
                    {
                        TextBox1.Text = "0";
                    }
                    if (TextBox10.Text == "")
                    {
                        TextBox10.Text = "0";
                    }
                    if (TextBox11.Text == "")
                    {
                        TextBox11.Text = "0";
                    }
                    Load_Part = DAL.CompletionMode.AcceptanceM_Insert(Session["DatabaseName"].ToString(), Convert.ToInt16(Session["PID"]), DropDownList1.SelectedValue, RadioButtonList1.SelectedValue, Convert.ToInt16(TextBox1.Text), TextBox2.Text, TextBox6.Text, TextBox4.Text, TextBox5.Text, TextBox7.Text, RadioButtonList3.SelectedValue, TextBox8.Text, TextBox9.Text, RadioButtonList2.SelectedValue, Convert.ToDecimal(TextBox11.Text), Convert.ToInt16(TextBox10.Text), TextBox12.Text, RadioButtonList4.SelectedValue, TB_ResultNO.Text, TextBox13.Text, TextBox14.Text);
                }
                else
                {
                    Response.Write("<script>alert('不是正確的日期格式類型！');</script>");
                }
            }
            if (Load_Part)
            {
                Response.Write("<script language=javascript>alert('資料上傳成功！')</script>");
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.SelectCommand = "Select* From AcceptanceRecord Where PID =" + Session["PID"];
                this.GridView1.DataBind();
            }
            else
            {
                Response.Write("<script language=javascript>alert('資料上傳失敗！')</script>");
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            DropDownList2.SelectedValue = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Type");
            RadioButtonList5.SelectedValue = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AllPart");
            TextBox15.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Batch");
            TextBox16.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Date");
            TextBox17.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Location");
            TextBox18.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Code");
            TextBox19.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "FirmName");
            TextBox20.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "TargetNumber");
            RadioButtonList6.SelectedValue = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "PurchaseLevel");
            TextBox21.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "DeadlineDate");
            TextBox22.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "CompletionDate");
            TextBox21.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "DeadlineDate");
            TextBox22.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "CompletionDate");
            RadioButtonList7.SelectedValue = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OverNY");
            TextBox23.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "ChangeCount");
            TextBox25.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Process");
            RadioButtonList8.SelectedValue = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Result");
            TB_ResultNO2.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "ResultNOT");
            TextBox26.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "ImproveDate");
            TextBox27.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Notes");
            if ((RadioButtonList8.SelectedIndex == 1))
            {
                TB_ResultNO2.Visible = true;
            }
            else
            {
                TB_ResultNO2.Visible = false;
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            bool result = DAL.CompletionMode.Delete_AcceptanceM(Session["DatabaseName"].ToString(), DAL.Temp3.cc);
            if (result)
            {
                DropDownList2.SelectedValue = "-請選擇-";
                TextBox15.Text = "";
                TextBox16.Text = "";
                TextBox17.Text = "";
                TextBox18.Text = "";
                TextBox19.Text = "";
                TextBox20.Text = "";
                TextBox21.Text = "";
                TextBox22.Text = "";
                TextBox23.Text = "";
                TextBox24.Text = "";
                TextBox25.Text = "";
                TB_ResultNO2.Text = "";
                TextBox26.Text = "";
                TextBox27.Text = "";
                Response.Write("<script language=javascript>alert('資料刪除成功！')</script>");
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.SelectCommand = "Select* From AcceptanceRecord Where PID =" + Session["PID"];
                GridView1.DataBind();
                Pnl_Detail.Visible = false;
            }
            else
            {
                Response.Write("<script language=javascript>alert('資料刪除失敗！')</script>");
            }
}

        protected void Button4_Click(object sender, EventArgs e)
        {
            bool Load_Part = false;
            if (false)
            {
                Response.Write("<script language=javascript>alert('有資料尚未輸入！')</script>");
            }
            else
            {
                DateTime dtDate;
                if (DateTime.TryParse(TextBox16.Text, out dtDate) || DateTime.TryParse(TextBox21.Text, out dtDate) || DateTime.TryParse(TextBox22.Text, out dtDate))
                {
                    Load_Part = DAL.CompletionMode.Update_AcceptanceM(Session["DatabaseName"].ToString(), DAL.Temp3.cc, DropDownList2.SelectedValue, RadioButtonList5.SelectedValue, Convert.ToInt16(TextBox15.Text), TextBox16.Text, TextBox17.Text, TextBox18.Text, TextBox19.Text, TextBox20.Text, RadioButtonList6.SelectedValue, TextBox21.Text, TextBox22.Text, RadioButtonList7.SelectedValue, Convert.ToDecimal(TextBox23.Text), Convert.ToInt16(TextBox24.Text), TextBox25.Text, RadioButtonList8.SelectedValue, TB_ResultNO2.Text, TextBox26.Text, TextBox27.Text);
                }
                else
                {
                    Response.Write("<script>alert('不是正確的日期格式類型！');</script>");
                }
            }
            if (Load_Part)
            {
                Response.Write("<script language=javascript>alert('資料更新成功！')</script>");
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.SelectCommand = "Select* From AcceptanceRecord Where PID =" + Session["PID"];
                GridView1.DataBind();
                Pnl_Detail.Visible = true;
                Pnl_Detail.Enabled = true;
            }
            else
            {
                Response.Write("<script language=javascript>alert('資料更新失敗！')</script>");
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

            Pnl_Add.Visible = false;
            Pnl_Detail.Visible = true;
            Pnl_Detail.Enabled = true;
            DropDownList2.SelectedValue = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Type");
            RadioButtonList5.SelectedValue = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AllPart");
            TextBox15.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Batch");
            TextBox16.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Date");
            TextBox17.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Location");
            TextBox18.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Code");
            TextBox19.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "FirmName");
            TextBox20.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "TargetNumber");
            RadioButtonList6.SelectedValue = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "PurchaseLevel");
            TextBox21.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "DeadlineDate");
            TextBox22.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "CompletionDate");
            TextBox21.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "DeadlineDate");
            TextBox22.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "CompletionDate");
            RadioButtonList7.SelectedValue = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OverNY");
            TextBox23.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "ContractPrice");
            TextBox24.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "ChangeCount");
            TextBox25.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Process");
            RadioButtonList8.SelectedValue = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Result");
            TB_ResultNO2.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "ResultNOT");
            TextBox26.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "ImproveDate");
            TextBox27.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Notes");
            if ((RadioButtonList8.SelectedIndex == 1))
            {
                TB_ResultNO2.Visible = true;
            }
            else
            {
                TB_ResultNO2.Visible = false;
            }
        }

        protected void TextBox9_TextChanged(object sender, EventArgs e)
        {
            if (DateTime.Compare(Convert.ToDateTime(TextBox8.Text),Convert.ToDateTime(TextBox9.Text)) > 0 || DateTime.Compare(Convert.ToDateTime(TextBox8.Text), Convert.ToDateTime(TextBox9.Text)) == 0)
            {
                RadioButtonList2.SelectedValue = "未逾期";
            }
            else
            {
                RadioButtonList2.SelectedValue = "逾期";
            }
        }

        protected void TextBox22_TextChanged(object sender, EventArgs e)
        {
            if (DateTime.Compare(Convert.ToDateTime(TextBox22.Text), Convert.ToDateTime(TextBox22.Text)) > 0 || DateTime.Compare(Convert.ToDateTime(TextBox22.Text), Convert.ToDateTime(TextBox22.Text)) == 0)
            {
                RadioButtonList7.SelectedValue = "未逾期";
            }
            else
            {
                RadioButtonList7.SelectedValue = "逾期";
            }
        }
    }
}