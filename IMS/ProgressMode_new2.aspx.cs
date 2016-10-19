using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class ProgressMode_new2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            Sql_version.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            Sql_version.SelectCommand = "select distinct Version From Progress_WIINF";

            if (!IsPostBack)
            {
                
                //TB_RSdate.Text = DateTime.Now.ToShortDateString();
                int temp_ver = 1;
                if (!int.TryParse(DDL_version.SelectedValue, out temp_ver))
                    temp_ver = 1;
                DateTime[] PSEDate = DAL.ProgressMode.Get_ProgressWIINF_By_ProgID_Version(Session["DatabaseName"].ToString(), int.Parse(Session["ProjectCode"].ToString()), temp_ver);
                if (PSEDate[1] != null)
                {
                    TB_RSdate.Text = PSEDate[1].ToShortDateString();
                }
                else
                {
                    TB_RSdate.Text = DateTime.Now.ToShortDateString();
                }

                string[] data = new string[10];
                bool getdata = DAL.ProgressMode.Get_Progress_AllData(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), out data, temp_ver);

                string[] ActivityNo = data[0].Split(',');
                string[] Item = data[1].Split(',');
                string[] temp = data[2].Split(',');
                int[] Duration = new int[temp.Length];
                for (int i = 0; i < temp.Length; i++)
                {
                    Duration[i] = int.Parse(temp[i]);
                }
                string[] temp3 = data[3].Split(',');
                string[] temp4 = data[4].Split(',');
                string[] temp5 = data[5].Split(',');
                string[] temp6 = data[6].Split(',');
                string[] temp7 = data[7].Split(',');
                int[] ES = new int[temp3.Length];
                int[] EE = new int[temp4.Length];
                int[] LS = new int[temp5.Length];
                int[] LE = new int[temp6.Length];
                bool[] CP = new bool[temp7.Length];
                for (int i = 0; i < temp3.Length; i++)
                {
                    ES[i] = int.Parse(temp3[i]);
                    EE[i] = int.Parse(temp4[i]);
                    LS[i] = int.Parse(temp5[i]);
                    LE[i] = int.Parse(temp6[i]);
                    CP[i] = bool.Parse(temp7[i]);
                }
                string[] SD = data[8].Split(',');
                string[] ED = data[9].Split(',');
                int AllNo = ActivityNo.Length;
                for (int i = 0; i < AllNo; i++)
                {
                    Make_result_row_with_data(ActivityNo[i], Item[i], Duration[i], ES[i], EE[i], LS[i], LE[i], CP[i], SD[i], ED[i]);
                }
            }
            else
            {
                Btn_Schedule_Click(null, null);
            }

        }

        protected void Update_date_Click(object sender, EventArgs e)
        {
            int num = Tbl_Output.Rows.Count-2;
            int[] WIID = new int[num];
            string[] SD = new string[num];
            string[] ED = new string[num];
            for (int i = 0; i < num; i++)
            {
                TextBox TBS = new TextBox();
                TextBox TBE = new TextBox();
                TBS = (TextBox)Tbl_Output.Rows[i].FindControl("TB_SD_" + (i+1).ToString());
                TBE = (TextBox)Tbl_Output.Rows[i].FindControl("TB_ED_" + (i+1).ToString());
                WIID[i] = i + 1;
                SD[i] = TBS.Text;
                ED[i] = TBE.Text;
            }
            int temp_ver = 1;
            if (!int.TryParse(DDL_version.SelectedValue, out temp_ver))
                temp_ver = 1;

            bool result = DAL.ProgressMode.Update_Progress_Date(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), WIID, SD, ED, temp_ver);
            if (result)
            {
                Response.Write("<script>alert('儲存成功');</script>");
            }
            else
            {
                Response.Write("<script>alert('儲存失敗');</script>");
            }
        }

        public void Make_result_row_with_data(string ActivityNum, string Item, int Duration, int ES, int EE, int LS, int LE, bool CP, string StartD, string EndD)
        {
            TableRow TR = new TableRow();

            TableCell cell1 = new TableCell();
            Label lbl_1 = new Label();
            lbl_1.ID = "Lbl_" + ActivityNum;
            lbl_1.Text = ActivityNum;
            cell1.Controls.Add(lbl_1);
            TR.Cells.Add(cell1);

            TableCell cell2 = new TableCell();
            Label lbl_2 = new Label();
            lbl_2.Text = Item;
            cell2.Controls.Add(lbl_2);
            TR.Cells.Add(cell2);

            TableCell cell3 = new TableCell();
            Label lbl_3 = new Label();
            lbl_3.Text = Duration.ToString();
            cell3.Controls.Add(lbl_3);
            TR.Cells.Add(cell3);

            TableCell cell4 = new TableCell();
            Label lbl_9 = new Label();
            DateTime DT;
            var isDate = DateTime.TryParse(TB_RSdate.Text, out DT);
            if (isDate)
            {
                lbl_9.Text = DT.AddDays(ES).ToString("yyyy/MM/dd");
            }

            cell4.Controls.Add(lbl_9);
            TR.Cells.Add(cell4);

            TableCell cell5 = new TableCell();
            Label lbl_92 = new Label();
            if (isDate)
            {
                lbl_92.Text = DT.AddDays(LS).ToString("yyyy/MM/dd");
            }
            cell5.Controls.Add(lbl_92);
            TR.Cells.Add(cell5);

            TableCell cell6 = new TableCell();
            Label lbl_91 = new Label();
            if (isDate)
            {
                lbl_91.Text = DT.AddDays(EE).ToString("yyyy/MM/dd");
            }
            cell6.Controls.Add(lbl_91);
            TR.Cells.Add(cell6);

            TableCell cell7 = new TableCell();
            Label lbl_10 = new Label();
            if (isDate)
            {
                lbl_10.Text = DT.AddDays(LE).ToString("yyyy/MM/dd");
            }

            cell7.Controls.Add(lbl_10);
            TR.Cells.Add(cell7);

            TableCell cell75 = new TableCell();
            Label lbl_75 = new Label();
            lbl_75.Text = (LE - EE).ToString();
            cell75.Controls.Add(lbl_75);
            TR.Cells.Add(cell75);

            TableCell cell8 = new TableCell();
            Label lbl_8 = new Label();
            if (CP)
            {
                lbl_8.Text = "*";
            }
            else
            {
                lbl_8.Text = "";
            }
            cell8.Controls.Add(lbl_8);
            TR.Cells.Add(cell8);

            TableCell cell11 = new TableCell();
            TextBox TB_11 = new TextBox();
            TB_11.ID = "TB_SD_" + ActivityNum;
            if (StartD != "")
            {
                TB_11.Text = StartD;
            }
            else
            {
                TB_11.Text = lbl_9.Text;
            }

            if (lbl_8.Text == "*")
            {
                TB_11.ReadOnly = true;
            }
            else
            {
                //TB_11.ReadOnly = true;
                TB_11.Attributes.Add("onclick", "WdatePicker(({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy/MM/dd',alwaysUseStartDate:true}));");
                TB_11.Attributes.Add("onchange", "alerttime(this.value,'" + lbl_9.Text + "','" + lbl_91.Text + "');");
            }

            cell11.Controls.Add(TB_11);
            TR.Cells.Add(cell11);

            TableCell cell12 = new TableCell();
            TextBox TB_12 = new TextBox();
            TB_12.ID = "TB_ED_" + ActivityNum;
            if (EndD != "")
            {
                TB_12.Text = EndD;
            }
            else
            {
                TB_12.Text = lbl_10.Text;
            }

            if (lbl_8.Text == "*")
            {
                TB_12.ReadOnly = true;
            }
            else
            {
                //TB_12.ReadOnly = true;
                TB_12.Attributes.Add("onclick", "WdatePicker(({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy/MM/dd',alwaysUseStartDate:true}));");
                TB_12.Attributes.Add("onchange", "alerttime(this.value,'" + lbl_92.Text + "','" + lbl_10.Text + "');");
            }

            cell12.Controls.Add(TB_12);
            TR.Cells.Add(cell12);

            TR.Cells[0].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[1].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[2].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[3].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[4].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[5].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[6].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[7].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[8].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[9].HorizontalAlign = HorizontalAlign.Center;

            //產生表格
            Tbl_Output.Rows.Add(TR);
        }

        public void make_tableheader()
        {
            TableHeaderRow THR = new TableHeaderRow();
            TableHeaderCell THC1 = new TableHeaderCell();
            TableHeaderCell THC2 = new TableHeaderCell();
            TableHeaderCell THC3 = new TableHeaderCell();
            TableHeaderCell THC4 = new TableHeaderCell();
            TableHeaderCell THC5 = new TableHeaderCell();
            TableHeaderCell THC6 = new TableHeaderCell();
            TableHeaderCell THC7 = new TableHeaderCell();
            TableHeaderCell THC75 = new TableHeaderCell();
            TableHeaderCell THC8 = new TableHeaderCell();
            TableHeaderCell THC9 = new TableHeaderCell();
            TableHeaderCell THC10 = new TableHeaderCell();
            THC1.Text = "作業編號";
            THC1.RowSpan = 2;
            THC2.Text = "作業名稱";
            THC2.RowSpan = 2;
            THC3.Text = "工期";
            THC3.RowSpan = 2;
            THC4.Text = "開始日期";
            THC4.ColumnSpan = 2;
            //THC5.Text = "最晚開始日期";
            THC6.Text = "結束日期";
            THC6.ColumnSpan = 2;
            //THC7.Text = "最晚結束日期";
            THC75.Text = "浮時";
            THC75.RowSpan = 2;
            THC8.Text = "要徑";
            THC8.RowSpan = 2;
            THC9.Text = "預計日期";
            THC9.ColumnSpan = 2;
            //THC10.Text = "預計結束日期";
            THC1.Width = 20;
            THC2.Width = 200;
            THC3.Width = 20;
            THR.Cells.Add(THC1);
            THR.Cells.Add(THC2);
            THR.Cells.Add(THC3);
            THR.Cells.Add(THC4);
            //THR.Cells.Add(THC5);
            THR.Cells.Add(THC6);
            //THR.Cells.Add(THC7);
            THR.Cells.Add(THC75);
            THR.Cells.Add(THC8);
            THR.Cells.Add(THC9);
            //THR.Cells.Add(THC10);

            Tbl_Output.Rows.Add(THR);
            TableHeaderRow THR2 = new TableHeaderRow();
            TableHeaderCell TH2C1 = new TableHeaderCell();
            TH2C1.Text = "最早";
            TableHeaderCell TH2C2 = new TableHeaderCell();
            TH2C2.Text = "最晚";
            TableHeaderCell TH2C3 = new TableHeaderCell();
            TH2C3.Text = "最早";
            TableHeaderCell TH2C4 = new TableHeaderCell();
            TH2C4.Text = "最晚";
            TableHeaderCell TH2C5 = new TableHeaderCell();
            TH2C5.Text = "開始";
            TableHeaderCell TH2C6 = new TableHeaderCell();
            TH2C6.Text = "結束";

            THR2.Controls.Add(TH2C1);
            THR2.Controls.Add(TH2C2);
            THR2.Controls.Add(TH2C3);
            THR2.Controls.Add(TH2C4);
            THR2.Controls.Add(TH2C5);
            THR2.Controls.Add(TH2C6);
            Tbl_Output.Rows.Add(THR2);
        }

        protected void Btn_Schedule_Click(object sender, EventArgs e)
        {
            Tbl_Output.Rows.Clear();
            make_tableheader();
            string[] data = new string[10];
            int temp_ver = 1;
            if (!int.TryParse(DDL_version.SelectedValue, out temp_ver))
                temp_ver = 1;
            bool getdata = DAL.ProgressMode.Get_Progress_AllData(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), out data, temp_ver);

            string[] ActivityNo = data[0].Split(',');
            string[] Item = data[1].Split(',');
            string[] temp = data[2].Split(',');
            int[] Duration = new int[temp.Length];
            for (int i = 0; i < temp.Length; i++)
            {
                Duration[i] = int.Parse(temp[i]);
            }
            string[] temp3 = data[3].Split(',');
            string[] temp4 = data[4].Split(',');
            string[] temp5 = data[5].Split(',');
            string[] temp6 = data[6].Split(',');
            string[] temp7 = data[7].Split(',');
            int[] ES = new int[temp3.Length];
            int[] EE = new int[temp4.Length];
            int[] LS = new int[temp5.Length];
            int[] LE = new int[temp6.Length];
            bool[] CP = new bool[temp7.Length];
            for (int i = 0; i < temp3.Length; i++)
            {
                ES[i] = int.Parse(temp3[i]);
                EE[i] = int.Parse(temp4[i]);
                LS[i] = int.Parse(temp5[i]);
                LE[i] = int.Parse(temp6[i]);
                CP[i] = bool.Parse(temp7[i]);
            }
            string[] SD = data[8].Split(',');
            string[] ED = data[9].Split(',');
            int AllNo = ActivityNo.Length;
            for (int i = 0; i < AllNo; i++)
            {
                Make_result_row_with_data(ActivityNo[i], Item[i], Duration[i], ES[i], EE[i], LS[i], LE[i], CP[i], "", "");
            }
        }

        protected void Show_Chart_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.open('Progress_New_Gantt.aspx','甘特圖',config='height=500,width=800,scrollbars=yes');</script>");
        }

        protected void DDL_version_SelectedIndexChanged(object sender, EventArgs e)
        {
            Btn_Schedule_Click(null, null);
        }

        protected void Insert_ActProg_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProgressMode_new3.aspx");
        }
    }
}