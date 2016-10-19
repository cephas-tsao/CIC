using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class OFundEdit : System.Web.UI.Page
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
            //getData();
        }
        public static void DisableTextBox(Control control)
        {
            foreach (Control subControl in control.Controls)
            {
                if (subControl is TextBox)
                    (subControl as TextBox).Enabled = false;
                else if (subControl is CheckBox)
                    (subControl as CheckBox).Enabled = false;
            }
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            Pnl_1.Visible = true;
        }
        public void OpenNewWindowA(string url, string Tgr)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=yes,height=700,width=1500";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
        }
        public void OpenNewWindowB(string url, string Tgr)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=yes,height=700,width=1000";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            OpenNewWindowA("OFundItemEdit.aspx", "A");
            Session["Edition"] = TextBox6.Text;
        }
        protected void Button10_Click(object sender, EventArgs e)
        {
            OpenNewWindowB("OFundDebitAssign.aspx", "A");
        }
        protected void Button11_Click(object sender, EventArgs e)
        {
            OpenNewWindowB("OFundIncreaseAssign.aspx", "A");
        }
        protected void Button17_Click(object sender, EventArgs e)
        {
            OpenNewWindowB("OFundDebitApproval.aspx", "A");
        }
        protected void Button18_Click(object sender, EventArgs e)
        {
            OpenNewWindowB("OFundIncreaseApproval.aspx", "A");
        }

        protected void Show_Date()
        {
            TextBox1.Text = DAL.OFundMode.OFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OF_Code");
            TextBox6.Text = DAL.OFundMode.OFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OF_Edition");
            TextBox2.Text = DAL.OFundMode.OFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "StartDate");
            TextBox4.Text = DAL.OFundMode.OFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "EndDate");
            TextBox3.Text = DAL.OFundMode.OFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "FundDate");
            TextBox5.Text = DAL.OFundMode.OFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "PayDate");
            TextBox32.Text = DAL.OFundMode.OFundView_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Note");

            Label1.Text = DAL.OFundMode.OFundView_Search2(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]), "OContrctPrice");
            Label2.Text = DAL.OFundMode.OFundView_Search3(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]), "CEdition");
            Label3.Text = DAL.OFundMode.OFundView_Search3(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]), "AdjestTotalPrice");
            Label4.Text = DAL.OFundMode.OFundView_Search2_5(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]), "PerformanceBond");
            Label5.Text = DAL.OFundMode.OFundView_Search2(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]), "PrepayPercentage") + "%";
            Label6.Text = DAL.OFundMode.OFundView_Search2(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]), "RetentionPercentage") + "%";

            Label7.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem1");
            Label8.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem2");
            Label9.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem3");
            Label10.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem4");
            Label11.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem5");
            Label12.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem6");
            Label13.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem7");
            Label14.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem8");
            Label15.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem9");
            Label16.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem10");
            Label17.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem11");
            Label18.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem12");
            Label19.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem13");
            Label20.Text = DAL.OFundMode.OFundView_Search4(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem14");

            TextBox8.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem1");
            TextBox20.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem2");
            TextBox21.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem3");
            TextBox33.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem4");
            TextBox7.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem5");
            TextBox34.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem6");
            TextBox35.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem7");
            TextBox24.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem8");
            TextBox25.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem9");
            TextBox26.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem10");
            TextBox27.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem11");
            TextBox28.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem12");
            TextBox29.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem13");
            TextBox30.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem14");

            TextBox37.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem1");
            TextBox38.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem2");
            TextBox39.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem3");
            TextBox40.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem4");
            TextBox41.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem5");
            TextBox42.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem6");
            TextBox43.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem7");
            TextBox44.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem8");
            TextBox45.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem9");
            TextBox46.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem10");
            TextBox47.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem11");
            TextBox48.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem12");
            TextBox49.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem13");
            TextBox50.Text = DAL.OFundMode.OFundView_Search5(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem14");

            if (Label7.Text == "" || Label7.Text == " ")
            {
                Label7.Text = "0.00";
            }
            if (Label8.Text == "" || Label8.Text == " ")
            {
                Label8.Text = "0.00";
            }
            if (Label9.Text == "" || Label9.Text == " ")
            {
                Label9.Text = "0.00";
            }
            if (Label10.Text == "" || Label10.Text == " ")
            {
                Label10.Text = "0.00";
            }
            if (Label11.Text == "" || Label11.Text == " ")
            {
                Label11.Text = "0.00";
            }
            if (Label12.Text == "" || Label12.Text == " ")
            {
                Label12.Text = "0.00";
            }
            if (Label13.Text == "" || Label13.Text == " ")
            {
                Label13.Text = "0.00";
            }
            if (Label14.Text == "" || Label14.Text == " ")
            {
                Label14.Text = "0.00";
            }
            if (Label15.Text == "" || Label15.Text == " ")
            {
                Label15.Text = "0.00";
            }
            if (Label16.Text == "" || Label16.Text == " ")
            {
                Label16.Text = "0.00";
            }
            if (Label17.Text == "" || Label17.Text == " ")
            {
                Label17.Text = "0.00";
            }
            if (Label18.Text == "" || Label18.Text == " ")
            {
                Label18.Text = "0.00";
            }
            if (Label19.Text == "" || Label19.Text == " ")
            {
                Label19.Text = "0.00";
            }
            if (Label20.Text == "" || Label20.Text == " ")
            {
                Label20.Text = "0.00";
            }
            if (TextBox37.Text == "" || TextBox37.Text == " ")
            {
                TextBox37.Text = "0.00";
            }
            if (TextBox38.Text == "" || TextBox38.Text == " ")
            {
                TextBox38.Text = "0.00";
            }
            if (TextBox39.Text == "" || TextBox39.Text == " ")
            {
                TextBox39.Text = "0.00";
            }
            if (TextBox40.Text == "" || TextBox40.Text == " ")
            {
                TextBox40.Text = "0.00";
            }
            if (TextBox41.Text == "" || TextBox41.Text == " ")
            {
                TextBox41.Text = "0.00";
            }
            if (TextBox42.Text == "" || TextBox42.Text == " ")
            {
                TextBox42.Text = "0.00";
            }
            if (TextBox43.Text == "" || TextBox43.Text == " ")
            {
                TextBox43.Text = "0.00";
            }
            if (TextBox44.Text == "" || TextBox44.Text == " ")
            {
                TextBox44.Text = "0.00";
            }
            if (TextBox45.Text == "" || TextBox45.Text == " ")
            {
                TextBox45.Text = "0.00";
            }
            if (TextBox46.Text == "" || TextBox46.Text == " ")
            {
                TextBox46.Text = "0.00";
            }
            if (TextBox47.Text == "" || TextBox47.Text == " ")
            {
                TextBox47.Text = "0.00";
            }
            if (TextBox48.Text == "" || TextBox48.Text == " ")
            {
                TextBox48.Text = "0.00";
            }
            if (TextBox49.Text == "" || TextBox49.Text == " ")
            {
                TextBox49.Text = "0.00";
            }
            if (TextBox50.Text == "" || TextBox50.Text == " ")
            {
                TextBox50.Text = "0.00";
            }
            Label21.Text = (Convert.ToDecimal(Label7.Text) + Convert.ToDecimal(TextBox37.Text)).ToString();
            Label22.Text = (Convert.ToDecimal(Label8.Text) + Convert.ToDecimal(TextBox38.Text)).ToString();
            Label23.Text = (Convert.ToDecimal(Label9.Text) + Convert.ToDecimal(TextBox39.Text)).ToString();
            Label24.Text = (Convert.ToDecimal(Label10.Text) + Convert.ToDecimal(TextBox40.Text)).ToString();
            Label25.Text = (Convert.ToDecimal(Label11.Text) + Convert.ToDecimal(TextBox41.Text)).ToString();
            Label26.Text = (Convert.ToDecimal(Label12.Text) + Convert.ToDecimal(TextBox42.Text)).ToString();
            Label27.Text = (Convert.ToDecimal(Label13.Text) + Convert.ToDecimal(TextBox43.Text)).ToString();
            Label28.Text = (Convert.ToDecimal(Label14.Text) + Convert.ToDecimal(TextBox44.Text)).ToString();
            Label29.Text = (Convert.ToDecimal(Label15.Text) + Convert.ToDecimal(TextBox45.Text)).ToString();
            Label30.Text = (Convert.ToDecimal(Label16.Text) + Convert.ToDecimal(TextBox46.Text)).ToString();
            Label31.Text = (Convert.ToDecimal(Label17.Text) + Convert.ToDecimal(TextBox47.Text)).ToString();
            Label32.Text = (Convert.ToDecimal(Label18.Text) + Convert.ToDecimal(TextBox48.Text)).ToString();
            Label33.Text = (Convert.ToDecimal(Label19.Text) + Convert.ToDecimal(TextBox49.Text)).ToString();
            Label34.Text = (Convert.ToDecimal(Label20.Text) + Convert.ToDecimal(TextBox50.Text)).ToString();
        }

        protected void Button15_Click(object sender, EventArgs e)
        {
            bool Date_Load_1 = false;
            bool Date_Load_2 = false;
            Session["Edition"] = DAL.OFundMode.Edition_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]));
            Date_Load_1 = DAL.OFundMode.Insert_OFundEdit_1(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]), Convert.ToInt32(Session["Edition"]));
            Session["OFID"] = DAL.OFundMode.OFID_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]), Convert.ToInt32(Session["Edition"]));
            DAL.OFundMode.CWID_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["PID"]));
            Date_Load_2 = DAL.OFundMode.Insert_OFundEdit_2(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["OFID"]));
            if (Date_Load_1 && Date_Load_2)
            {
                Response.Write(@"<script language=javascript>alert('已新增計價單(計價期別：" + Session["Edition"] + ")，請點選編輯繼續操作')</script>");
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.SelectCommand = "Select * From OFund_Main Where PID = " + Session["PID"];
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script language=javascript>alert('新增失敗！')</script>");
            }
        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            TextBox34.Text = (Convert.ToDecimal(TextBox8.Text) + Convert.ToDecimal(TextBox20.Text) - Convert.ToDecimal(TextBox21.Text)).ToString();
            TextBox35.Text = (Convert.ToDecimal(TextBox34.Text) * Convert.ToDecimal(TextBox36.Text) / 100).ToString();
            TextBox30.Text = (Convert.ToDecimal(TextBox34.Text) + Convert.ToDecimal(TextBox35.Text) - Convert.ToDecimal(TextBox24.Text) - Convert.ToDecimal(TextBox25.Text) + Convert.ToDecimal(TextBox26.Text) + Convert.ToDecimal(TextBox27.Text) + Convert.ToDecimal(TextBox28.Text) + Convert.ToDecimal(TextBox29.Text)).ToString();
            TextBox42.Text = (Convert.ToDecimal(TextBox37.Text) + Convert.ToDecimal(TextBox38.Text) - Convert.ToDecimal(TextBox39.Text)).ToString();
            TextBox43.Text = (Convert.ToDecimal(TextBox42.Text) * Convert.ToDecimal(TextBox36.Text) / 100).ToString();
            TextBox50.Text = (Convert.ToDecimal(TextBox42.Text) + Convert.ToDecimal(TextBox43.Text) - Convert.ToDecimal(TextBox44.Text) - Convert.ToDecimal(TextBox45.Text) + Convert.ToDecimal(TextBox46.Text) + Convert.ToDecimal(TextBox47.Text) + Convert.ToDecimal(TextBox48.Text) + Convert.ToDecimal(TextBox49.Text)).ToString();

            Label21.Text = (Convert.ToDecimal(Label7.Text) + Convert.ToDecimal(TextBox37.Text)).ToString();
            Label22.Text = (Convert.ToDecimal(Label8.Text) + Convert.ToDecimal(TextBox38.Text)).ToString();
            Label23.Text = (Convert.ToDecimal(Label9.Text) + Convert.ToDecimal(TextBox39.Text)).ToString();
            Label24.Text = (Convert.ToDecimal(Label10.Text) + Convert.ToDecimal(TextBox40.Text)).ToString();
            Label25.Text = (Convert.ToDecimal(Label11.Text) + Convert.ToDecimal(TextBox41.Text)).ToString();
            Label26.Text = (Convert.ToDecimal(Label12.Text) + Convert.ToDecimal(TextBox42.Text)).ToString();
            Label27.Text = (Convert.ToDecimal(Label13.Text) + Convert.ToDecimal(TextBox43.Text)).ToString();
            Label28.Text = (Convert.ToDecimal(Label14.Text) + Convert.ToDecimal(TextBox44.Text)).ToString();
            Label29.Text = (Convert.ToDecimal(Label15.Text) + Convert.ToDecimal(TextBox45.Text)).ToString();
            Label30.Text = (Convert.ToDecimal(Label16.Text) + Convert.ToDecimal(TextBox46.Text)).ToString();
            Label31.Text = (Convert.ToDecimal(Label17.Text) + Convert.ToDecimal(TextBox47.Text)).ToString();
            Label32.Text = (Convert.ToDecimal(Label18.Text) + Convert.ToDecimal(TextBox48.Text)).ToString();
            Label33.Text = (Convert.ToDecimal(Label19.Text) + Convert.ToDecimal(TextBox49.Text)).ToString();
            Label34.Text = (Convert.ToDecimal(Label20.Text) + Convert.ToDecimal(TextBox50.Text)).ToString();

            if (Convert.ToDecimal(TextBox34.Text) < 0 || Convert.ToDecimal(TextBox30.Text) < 0 || Convert.ToDecimal(TextBox42.Text) < 0 || Convert.ToDecimal(TextBox50.Text) < 0)
            {
                Response.Write("<script language=javascript>alert('付款金額為負值！')</script>");
            }
        }

        protected void Button13_Click(object sender, EventArgs e)
        {
            Show_Date();
        }

        protected void Button14_Click(object sender, EventArgs e)
        {
            TextBox34.Text = (Convert.ToDecimal(TextBox8.Text) + Convert.ToDecimal(TextBox20.Text) - Convert.ToDecimal(TextBox21.Text)).ToString();
            TextBox35.Text = (Convert.ToDecimal(TextBox34.Text) * Convert.ToDecimal(TextBox36.Text) / 100).ToString();
            TextBox30.Text = (Convert.ToDecimal(TextBox34.Text) + Convert.ToDecimal(TextBox35.Text) - Convert.ToDecimal(TextBox24.Text) - Convert.ToDecimal(TextBox25.Text) + Convert.ToDecimal(TextBox26.Text) + Convert.ToDecimal(TextBox27.Text) + Convert.ToDecimal(TextBox28.Text) + Convert.ToDecimal(TextBox29.Text)).ToString();

            TextBox42.Text = (Convert.ToDecimal(TextBox37.Text) + Convert.ToDecimal(TextBox38.Text) - Convert.ToDecimal(TextBox39.Text)).ToString();
            TextBox43.Text = (Convert.ToDecimal(TextBox42.Text) * Convert.ToDecimal(TextBox36.Text) / 100).ToString();
            TextBox50.Text = (Convert.ToDecimal(TextBox42.Text) + Convert.ToDecimal(TextBox43.Text) - Convert.ToDecimal(TextBox44.Text) - Convert.ToDecimal(TextBox45.Text) + Convert.ToDecimal(TextBox46.Text) + Convert.ToDecimal(TextBox47.Text) + Convert.ToDecimal(TextBox48.Text) + Convert.ToDecimal(TextBox49.Text)).ToString();

            int k = 0;
            int kk = 34;
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OF_Code", TextBox1.Text);
            if (TextBox2.Text != "")
            {
                k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "StartDate", TextBox2.Text);
            }
            else
            {
                kk = kk - 1;
            }
            if (TextBox3.Text != "")
            {
                k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "FundDate", TextBox3.Text);
            }
            else
            {
                kk = kk - 1;
            }
            if (TextBox4.Text != "")
            {
                k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "EndDate", TextBox4.Text);
            }
            else
            {
                kk = kk - 1;
            }
            if (TextBox5.Text != "")
            {
                k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "PayDate", TextBox5.Text);
            }
            else
            {
                kk = kk - 1;
            }
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Note", TextBox32.Text);

            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem1", TextBox8.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem2", TextBox20.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem3", TextBox21.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem4", TextBox33.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem5", TextBox7.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem6", TextBox34.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem7", TextBox35.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem8", TextBox24.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem9", TextBox25.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem10", TextBox26.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem11", TextBox27.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem12", TextBox28.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem13", TextBox29.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OItem14", TextBox30.Text);

            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem1", TextBox37.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem2", TextBox38.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem3", TextBox39.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem4", TextBox40.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem5", TextBox41.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem6", TextBox42.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem7", TextBox43.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem8", TextBox44.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem9", TextBox45.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem10", TextBox46.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem11", TextBox47.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem12", TextBox48.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem13", TextBox49.Text);
            k += DAL.OFundMode.Update_OFund_Main(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AItem14", TextBox50.Text);

            Label21.Text = (Convert.ToDecimal(Label7.Text) + Convert.ToDecimal(TextBox37.Text)).ToString();
            Label22.Text = (Convert.ToDecimal(Label8.Text) + Convert.ToDecimal(TextBox38.Text)).ToString();
            Label23.Text = (Convert.ToDecimal(Label9.Text) + Convert.ToDecimal(TextBox39.Text)).ToString();
            Label24.Text = (Convert.ToDecimal(Label10.Text) + Convert.ToDecimal(TextBox40.Text)).ToString();
            Label25.Text = (Convert.ToDecimal(Label11.Text) + Convert.ToDecimal(TextBox41.Text)).ToString();
            Label26.Text = (Convert.ToDecimal(Label12.Text) + Convert.ToDecimal(TextBox42.Text)).ToString();
            Label27.Text = (Convert.ToDecimal(Label13.Text) + Convert.ToDecimal(TextBox43.Text)).ToString();
            Label28.Text = (Convert.ToDecimal(Label14.Text) + Convert.ToDecimal(TextBox44.Text)).ToString();
            Label29.Text = (Convert.ToDecimal(Label15.Text) + Convert.ToDecimal(TextBox45.Text)).ToString();
            Label30.Text = (Convert.ToDecimal(Label16.Text) + Convert.ToDecimal(TextBox46.Text)).ToString();
            Label31.Text = (Convert.ToDecimal(Label17.Text) + Convert.ToDecimal(TextBox47.Text)).ToString();
            Label32.Text = (Convert.ToDecimal(Label18.Text) + Convert.ToDecimal(TextBox48.Text)).ToString();
            Label33.Text = (Convert.ToDecimal(Label19.Text) + Convert.ToDecimal(TextBox49.Text)).ToString();
            Label34.Text = (Convert.ToDecimal(Label20.Text) + Convert.ToDecimal(TextBox50.Text)).ToString();

            if (Convert.ToDecimal(TextBox34.Text) < 0 || Convert.ToDecimal(TextBox30.Text) < 0 || Convert.ToDecimal(TextBox42.Text) < 0 || Convert.ToDecimal(TextBox50.Text) < 0)
            {
                Response.Write("<script language=javascript>alert('付款金額為負值！')</script>");
            }

            if (k == kk)
            {
                Response.Write("<script language=javascript>alert('資料更新成功！')</script>");
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.SelectCommand = "Select * From OFund_Main Where PID = " + Session["PID"];
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script language=javascript>alert('資料更新失敗！')</script>");
            }
        }

        protected void Button16_Click(object sender, EventArgs e)
        {
            bool Date_Load = false;
            Date_Load = DAL.OFundMode.Delete_OFund_Main_and_Item(Session["DatabaseName"].ToString(), DAL.Temp3.cc);
            if (Date_Load)
            {
                Response.Write("<script language=javascript>alert('刪除成功！')</script>");
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.SelectCommand = "Select * From OFund_Main Where PID = " + Session["PID"];
                GridView1.DataBind();
                Pnl_1.Visible = false;
            }
            else
            {
                Response.Write("<script language=javascript>alert('刪除失敗！')</script>");
            }
        }

        protected void Self_Click(object sender, EventArgs e)
        {
            Show_Date();
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
            Pnl_1.Visible = true;
            DAL.Temp3.cc = Convert.ToInt32(GridView1.DataKeys[GridView1.SelectedIndex].Value);
            Session["OFID"] = DAL.Temp3.cc;
            Show_Date();
        }
    }
}