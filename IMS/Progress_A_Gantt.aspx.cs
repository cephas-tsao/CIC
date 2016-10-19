using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;


namespace IMS
{
    public partial class Progress_A_Gantt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
           
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["ProjectCode"] == null || Session["ProjectCode"] == "")
            {

                Response.Write("<script>alert('請先選擇專案');location.href='Main.aspx';</script>");

            }
            else
            {
               
            }
            if(!IsPostBack)
            {
                string database = Session["DatabaseName"].ToString();
                var SQLSelect = "Select max(Version)Version From Progress_WIINF where ProjectID=" + Session["ProjectCode"].ToString();
                var version = WebModel.SItemName(database, SQLSelect, "Version");
                if (version != "")
                {
                    for (int i = 1; i <= int.Parse(version); i++)
                    {
                        DDL_PreVersion.Items.Add(i.ToString());
                        DDL_PreVersion.SelectedValue = version;
                    }

                }
                var SQLSelect1 = "Select max(Version)Version From Progress_Real where ProjectID=" + Session["ProjectCode"].ToString();
                var version1 = WebModel.SItemName(database, SQLSelect1, "Version");
                if (version1!="")
                {
                    for (int i = 1; i <= int.Parse(version1); i++)
                    {
                        DDL_Version.Items.Add(i.ToString());
                        DDL_Version.SelectedValue = version1;
                    }
                }
                DDL_Version.SelectedValue = "1";
            }
           
            string[] output = new string[9];
            int ver = 1;
            //int.TryParse(DDL_Version.SelectedValue, out ver);
            //if (ver < 1)
            //    ver = 1;
            bool result1 = DAL.ProgressMode.Get_Progress_For_Gantt_Check(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), out output, ver);
            if (!result1)
            {
                Response.Write("<script>alert('預定進度規劃資訊不完全，請至『預定進度規劃』填寫相關資訊');self.close();</script>");
            }
               
            
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Visible = true;
            Label2.Visible = true;
            //Image1.Visible = true;
            //Image2.Visible = true;
        }
        public string LString()
        {
            Label1.Visible = true;
            Label2.Visible = true;
            string result = "";
            string[] output = new string[9];
            int ver = 1;
            int.TryParse(DDL_Version.SelectedValue, out ver);
            if (ver < 1)
                ver = 1;
            bool result1 = DAL.ProgressMode.Get_Progress_For_Gantt_Check(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), out output, ver);
            //if (!result1)
            //{
            //    Response.Write("<script>alert('預定進度規劃資訊不完全，請至『預定進度規劃』填寫相關資訊');self.close();</script>");
            //}
            //else
            //{
                make_header_row();
                make_date_row();
                make_compare_header_row();
              
                decimal[] PlanC;
                decimal[] RealC;
                make_compare_row(out PlanC, out RealC);
                result = Line_string(PlanC, RealC);
            //}
            return result;
        }
        public void make_header_row()
        {
            Tbl_RP.Rows.Clear();
            Tbl_RP.Attributes.Add("cellspacing", "0");
            Tbl_RP.BorderStyle = BorderStyle.Solid;
            int ver = 1;
            int.TryParse(DDL_Version.SelectedValue, out ver);
            if (ver < 1)
                ver = 1;
            DateTime[] SEDate = DAL.ProgressMode.Get_ProgressRealDate_By_ProgID_Version(Session["DatabaseName"].ToString(), int.Parse(Session["ProjectCode"].ToString()), ver);
            int allday = (SEDate[0] - SEDate[1]).Days;
            TableHeaderRow THR = new TableHeaderRow();
            //THR.Style.Add("border", "1");
           
            TableHeaderCell THC1 = new TableHeaderCell();
            THC1.Text = "作業名稱";
            THR.Controls.Add(THC1);

            THC1.Width = 150;
            TableHeaderCell THC2 = new TableHeaderCell();
            THC2.Text = "目前完成度(%)";
            THC2.Width = 100;
            THR.Controls.Add(THC2);
            int startYear = SEDate[1].Year;
            int startMonth = SEDate[1].Month;
            int endYear = SEDate[0].Year;
            int endMonth = SEDate[0].Month;
            DateTime NowDate = new DateTime(startYear, startMonth, 1);
            while ((SEDate[0] - NowDate).Days >= 0)
            {
                int span = (NowDate.AddMonths(1) - NowDate).Days;
                TableHeaderCell THCLoop = new TableHeaderCell();
                THCLoop.Text = NowDate.Year.ToString() +"/"+ NowDate.Month.ToString();
                THCLoop.ColumnSpan = span;
                THR.Controls.Add(THCLoop);
                NowDate = NowDate.AddMonths(1);
            }

            //for (int i = 0; i <= allday; i++)
            //{
            //    TableHeaderCell THCLoop = new TableHeaderCell();
            //    THCLoop.Text = SEDate[1].AddDays(i).ToShortDateString();
            //    THR.Controls.Add(THCLoop);
            //}
            Tbl_RP.Controls.Add(THR);
        }
        public void make_date_row()
        {
            int ver = 1;
            int.TryParse(DDL_Version.SelectedValue, out ver);
            if (ver < 1)
                ver = 1;
            DateTime[] SEDate = DAL.ProgressMode.Get_ProgressRealDate_By_ProgID_Version(Session["DatabaseName"].ToString(), int.Parse(Session["ProjectCode"].ToString()), ver);
            int allday = (SEDate[0] - SEDate[1]).Days;

            string[] resultdata = DAL.ProgressMode.Get_Progress_Real_Information(Session["DatabaseName"].ToString(), int.Parse(Session["ProjectCode"].ToString()), ver);
            string[] temp_0 = resultdata[0].Split(',');
            string[] temp_1 = resultdata[1].Split(',');
            string[] temp_2 = resultdata[2].Split(',');
            int[] ProgID = new int[temp_0.Length];
            int[] Amount = new int[temp_2.Length];
            for (int i = 0; i < ProgID.Length; i++)
            {
                ProgID[i] = int.Parse(temp_0[i]);
                Amount[i] = int.Parse(temp_2[i]);
            }
            int[] UniProgID = ProgID.Distinct().ToArray();



            foreach (int upid in UniProgID)
            {
                List<string> ListDate = new List<string>();
                for (int i = 0; i < ProgID.Length; i++)
                {
                    if (ProgID[i] == upid)
                    {
                        ListDate.Add(temp_1[i]);
                    }
                }
                TableRow TR = new TableRow();
                string xx = DAL.ProgressMode.Get_WIName_By_ProgressID(Session["DatabaseName"].ToString(), upid);

                int yy = 0;
                int cindex = Array.IndexOf(ProgID, upid);

                while (cindex != -1)
                {
                    yy += Amount[cindex];
                    cindex = Array.IndexOf(ProgID, upid, cindex + 1);
                }
                TableCell TC1 = new TableCell();
                TC1.Text = xx;
                TC1.Width = 100;
                TC1.Style.Add("text-align", "Left");
                //TR.BorderStyle = BorderStyle.Solid;
                TC1.BorderStyle = BorderStyle.Ridge;
               
                TR.Controls.Add(TC1);
               
                TableCell TC2 = new TableCell();
                TC2.Text = yy.ToString();
                TC2.Width = 100;
                TC2.Style.Add("text-align", "center");
                TC2.BorderStyle = BorderStyle.Ridge;
                TR.Controls.Add(TC2);
                TR.BorderStyle = BorderStyle.Ridge;

                int startYear = SEDate[1].Year;
                int startMonth = SEDate[1].Month;
                int endYear = SEDate[0].Year;
                int endMonth = SEDate[0].Month;
                DateTime NowDate = new DateTime(startYear, startMonth, 1);

                while ((SEDate[0] - NowDate).Days >= 0)
                {
                    int looptimes = (NowDate.AddMonths(1) - NowDate).Days;
                    for (int i = 0; i < looptimes; i++)
                    {
                        TableCell TCLoop = new TableCell();
                        string nowday = NowDate.Year + "/" + NowDate.Month + "/" + (i + 1).ToString();
                        if (nowday == DateTime.Now.ToShortDateString())
                        {
                            TCLoop.BackColor = System.Drawing.Color.Gold;
                        }
                        else if (ListDate.IndexOf(nowday) != -1)
                        {
                            TCLoop.BackColor = System.Drawing.Color.Navy;
                           
                        }
                        
                        //TR.BorderStyle = BorderStyle.Ridge;
                        //TR.BorderWidth = 1;
                        TR.Controls.Add(TCLoop);
                    }
                    NowDate = NowDate.AddMonths(1);
                }
            
                Tbl_RP.Controls.Add(TR);
            }

        }

        public void make_compare_header_row()
        {
            Tbl_Compare.Rows.Clear();
            Tbl_Compare.Attributes.Add("cellspacing", "0");
            Tbl_Compare.BorderStyle = BorderStyle.Solid;
            int ver = 1;
            int.TryParse(DDL_Version.SelectedValue, out ver);
            if (ver < 1)
                ver = 1;
            DateTime[] SEDate = DAL.ProgressMode.Get_ProgressRealDate_By_ProgID_Version(Session["DatabaseName"].ToString(), int.Parse(Session["ProjectCode"].ToString()), ver);
            DateTime[] PSEDate = DAL.ProgressMode.Get_ProgressWIINF_By_ProgID_Version(Session["DatabaseName"].ToString(), int.Parse(Session["ProjectCode"].ToString()), ver);
            int allday = (SEDate[0] - SEDate[1]).Days;
            TableHeaderRow THR = new TableHeaderRow();
            TableHeaderCell THC1 = new TableHeaderCell();
            THC1.Text = "作業名稱";
            THC1.Width = 150;
            THR.Controls.Add(THC1);

            int startYear = 2000;
            int startMonth = 1;
            int endYear = 2000;
            int endMonth = 1;
            DateTime Fday;
            if (SEDate[1] < PSEDate[1])
            {
                startYear = SEDate[1].Year;
                startMonth = SEDate[1].Month;
            }
            else
            {
                startYear = PSEDate[1].Year;
                startMonth = PSEDate[1].Month;
            }
            if (SEDate[0] > PSEDate[0])
            {
                endYear = SEDate[0].Year;
                endMonth = SEDate[0].Month;
                Fday = SEDate[0];
            }
            else
            {
                endYear = PSEDate[0].Year;
                endMonth = PSEDate[0].Month;
                Fday = PSEDate[0];
            }
            DateTime NowDate = new DateTime(startYear, startMonth, 1);
            while ((Fday - NowDate).Days >= 0)
            {
                int span = (NowDate.AddMonths(1) - NowDate).Days;
                TableHeaderCell THCLoop = new TableHeaderCell();
                THCLoop.Text = NowDate.Year.ToString() + "/" + NowDate.Month.ToString();
                THCLoop.ColumnSpan = span;
                THR.Controls.Add(THCLoop);
                NowDate = NowDate.AddMonths(1);
            }

            Tbl_Compare.Controls.Add(THR);
        }

        public void make_compare_row(out decimal[] daymoney1, out decimal[] daymoney2)
        {
            string[] pre_output = new string[7];
            int ver = 1;
            int.TryParse(DDL_PreVersion.SelectedValue, out ver);
            if (ver < 1)
                ver = 1;
            DAL.ProgressMode.Get_Progress_For_Gantt(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), out pre_output, ver);
            string[] WID = pre_output[0].Split(',');
            string[] WName = pre_output[1].Split(',');
            string[] Duration = pre_output[2].Split(',');
            string[] SD = pre_output[3].Split(',');
            string[] ED = pre_output[4].Split(',');
            string[] PreWID = pre_output[5].Split(';');
            string[] ProgressID = pre_output[6].Split(',');
            int[] Progress_Index = new int[ProgressID.Length];
            DateTime[] PSD = new DateTime[SD.Length];
            DateTime[] PED = new DateTime[ED.Length];
            for (int i = 0; i < ProgressID.Length; i++)
            {
                Progress_Index[i] = int.Parse(ProgressID[i]);
                PSD[i] = DateTime.Parse(SD[i]);
                PED[i] = DateTime.Parse(ED[i]);
            }


            DateTime[] SEDate = DAL.ProgressMode.Get_ProgressRealDate_By_ProgID_Version(Session["DatabaseName"].ToString(), int.Parse(Session["ProjectCode"].ToString()), ver);
            DateTime[] PSEDate = DAL.ProgressMode.Get_ProgressWIINF_By_ProgID_Version(Session["DatabaseName"].ToString(), int.Parse(Session["ProjectCode"].ToString()), ver);
            int allday = (SEDate[0] - SEDate[1]).Days;

            string[] resultdata = DAL.ProgressMode.Get_Progress_Real_Information(Session["DatabaseName"].ToString(), int.Parse(Session["ProjectCode"].ToString()), ver);
            string[] temp_0 = resultdata[0].Split(',');
            string[] temp_1 = resultdata[1].Split(',');
            string[] temp_2 = resultdata[2].Split(',');
            int[] ProgID = new int[temp_0.Length];
            int[] Amount = new int[temp_2.Length];
            for (int i = 0; i < ProgID.Length; i++)
            {
                ProgID[i] = int.Parse(temp_0[i]);
                Amount[i] = int.Parse(temp_2[i]);
            }
            int[] UniProgID = ProgID.Distinct().ToArray();

            //
            int precount = 0;
            string[] output = new string[9];
            DAL.ProgressMode.Get_progress_For_Table(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), out output, ver);
            string[] temp7 = output[7].Split(',');
            string[] temp8 = output[8].Split(',');
            int[] WBSID = new int[temp7.Length];
            decimal[] WBSAmount = new decimal[temp8.Length];
            for (int i = 0; i < temp7.Length; i++)
            {
                WBSID[i] = 0;
                WBSAmount[i] = 0.000M;
            }
            for (int i = 0; i < temp7.Length; i++)
            {
                int.TryParse(temp7[i], out WBSID[i]);
                decimal.TryParse(temp8[i], out WBSAmount[i]);
            }
            int temp_days = (new DateTime(Math.Max(PSEDate[0].Year, SEDate[0].Year), Math.Max(PSEDate[0].Month, SEDate[0].Month), 1).AddMonths(1).AddDays(-1) - new DateTime(Math.Min(PSEDate[1].Year, SEDate[1].Year), Math.Min(PSEDate[1].Month, SEDate[1].Month), 1)).Days;
            daymoney1 = new decimal[temp_days];
            daymoney2 = new decimal[temp_days];
            for (int i = 0; i < temp_days; i++)
            {
                daymoney1[i] = 0.000M;
                daymoney2[i] = 0.000M;
            }

            for (int z = 0; z < Progress_Index.Length; z++)
            //foreach (int upid in Progress_Index)
            {
                int upid = Progress_Index[z];
                for (int kk = 0; kk < 2; kk++)
                {
                    List<string> ListDate = new List<string>();
                    List<int> ListAmount = new List<int>();
                    for (int i = 0; i < ProgID.Length; i++)
                    {
                        if (ProgID[i] == upid)
                        {
                            ListDate.Add(temp_1[i]);
                            ListAmount.Add(Amount[i]);
                        }
                    }
                    TableRow TR = new TableRow();
                    string xx = DAL.ProgressMode.Get_WIName_By_ProgressID(Session["DatabaseName"].ToString(), upid);
                    int yy = 0;
                    int cindex = Array.IndexOf(ProgID, upid);

                    while (cindex != -1)
                    {
                        yy += Amount[cindex];
                        cindex = Array.IndexOf(ProgID, upid, cindex + 1);
                    }

                    int startYear = 2000;
                    int startMonth = 1;
                    int endYear = 2000;
                    int endMonth = 1;
                    if (SEDate[1] < PSEDate[1])
                    {
                        startYear = SEDate[1].Year;
                        startMonth = SEDate[1].Month;
                    }
                    else
                    {
                        startYear = PSEDate[1].Year;
                        startMonth = PSEDate[1].Month;
                    }
                    if (SEDate[0] > PSEDate[0])
                    {
                        endYear = SEDate[0].Year;
                        endMonth = SEDate[0].Month;
                    }
                    else
                    {
                        endYear = PSEDate[0].Year;
                        endMonth = PSEDate[0].Month;
                    }
                    int nowYear = startYear;
                    int nowMonth = startMonth;


                    if (kk == 0)
                    {
                        TableCell TC1 = new TableCell();
                        TC1.Text = xx;
                        TC1.RowSpan = 2;
                        TC1.Width = 100;                    
                        TC1.Style.Add("text-align", "center");
                        TC1.BorderWidth = 1;
                        TR.Controls.Add(TC1);
                        int tempcount = 0;
                        DateTime NowDate = new DateTime(nowYear, nowMonth, 1);
                        while ((SEDate[0] - NowDate).Days >= 0)
                        {
                            int looptimes = (NowDate.AddMonths(1) - NowDate).Days;


                            for (int i = 0; i < looptimes; i++)
                            {
                                TableCell TCLoop = new TableCell();
                                TCLoop.Width = 2;
                                DateTime nowday = new DateTime(nowYear, nowMonth, i + 1);
                                if ((nowday.Year == DateTime.Now.Year) && (nowday.Month == DateTime.Now.Month) && (nowday.Day == DateTime.Now.Day))
                                {
                                    TCLoop.BackColor = System.Drawing.Color.Gold;
                                }
                                else if ((nowday >= PSD[z]) && (nowday <= PED[z]))
                                {
                                    TCLoop.BackColor = System.Drawing.Color.Gray;
                                    daymoney1[tempcount] += (DAL.ProgressMode.Get_Price_By_WBSID(Session["DatabaseName"].ToString(), int.Parse(Session["ProjectCode"].ToString()), WBSID[z]) * WBSAmount[z] / 100.000M) / decimal.Parse(Duration[z]);
                                }
                                tempcount++;
                                TR.Controls.Add(TCLoop);
                            }
                            NowDate = NowDate.AddMonths(1);
                            nowYear = NowDate.Year;
                            nowMonth = NowDate.Month;
                        }
                        Tbl_Compare.Controls.Add(TR);
                        precount++;
                    }
                    else
                    {
                        DateTime NowDate = new DateTime(startYear, startMonth, 1);
                        int tempcount2 = 0;
                        while ((SEDate[0] - NowDate).Days >= 0)
                        {
                            int looptimes = (NowDate.AddMonths(1) - NowDate).Days;
                            for (int i = 0; i < looptimes; i++)
                            {
                                TableCell TCLoop = new TableCell();
                                TCLoop.Width = 2;
                                string nowday = NowDate.Year + "/" + NowDate.Month + "/" + (i + 1).ToString();
                                if (nowday == DateTime.Now.ToShortDateString())
                                {
                                    TCLoop.BackColor = System.Drawing.Color.Gold;
                                }
                                else if (ListDate.IndexOf(nowday) != -1)
                                {
                                    TCLoop.BackColor = System.Drawing.Color.Navy;
                                    daymoney2[tempcount2] += (DAL.ProgressMode.Get_Price_By_WBSID(Session["DatabaseName"].ToString(), int.Parse(Session["ProjectCode"].ToString()), WBSID[z]) * WBSAmount[z] / 100.000M * decimal.Parse(ListAmount[ListDate.IndexOf(nowday)].ToString()) / 100.000M);
                                }
                                TR.Controls.Add(TCLoop);
                                tempcount2++;
                            }
                            NowDate = NowDate.AddMonths(1);
                        }
                        Tbl_Compare.Controls.Add(TR);
                    }
                }
            }
        }
        public string Line_string(decimal[] Estart, decimal[] Lstart)
        {
            string result = "[";
            int num = Estart.Length;
            decimal sum_Estart = 0.000M;
            decimal sum_Lstart = 0.000M;
            decimal final_Estart = Estart.Sum();
            int cc = 0;
            //decimal final_Lstart = Lstart.Sum();
            for (int i = 0; i < num; i++)
            {
                sum_Estart += Estart[i];
                sum_Lstart += Lstart[i];
                if (sum_Estart == final_Estart && final_Estart != 0)
                {
                    if (cc == 0)
                    {
                        result += i.ToString() + "," + (sum_Estart / final_Estart * 100).ToString() + "," + (sum_Lstart / final_Estart * 100).ToString() + ",0],[";
                        cc++;
                        result += i.ToString() + "," + (sum_Estart / final_Estart * 100).ToString() + "," + (sum_Lstart / final_Estart * 100).ToString() + ",100],[";
                    }
                    else
                    {
                        result += i.ToString() + "," + (sum_Estart / final_Estart * 100).ToString() + "," + (sum_Lstart / final_Estart * 100).ToString() + ",100],[";
                    }
                }
                else if (final_Estart != 0)
                {
                    result += i.ToString() + "," + (sum_Estart / final_Estart * 100).ToString() + "," + (sum_Lstart / final_Estart * 100).ToString() + ",0],[";
                }
            }
            if (result == "[")
            {
                result += "]";
            }
            else
            {
                result = result.Substring(0, result.Length - 2);
            }
            //[1, 100, 100],
            //    [2, 200, 400],
            //    [3, 500, 500]
            return result;
        }
    }
}