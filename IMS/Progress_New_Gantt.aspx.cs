using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class Progress_New_Gantt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            Session["ProjectCode"].ToString();
            Sql_DDL_ver.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            Sql_DDL_ver.SelectCommand = "select distinct Version From Progress_WIINF";
            //decimal[] ES_money = Make_BarChart_table(1);
            //decimal[] LS_money = Make_BarChart_table(2);
            //decimal[] empty_money = Make_BarChart_table(3);
         
            
        }

        public decimal[] Make_BarChart_table(int type)
        {
            string[] output = new string[9];
            int ver = 1;
            int.TryParse(DDL_ver.SelectedValue, out ver);
            if (ver < 1)
                ver = 1;
            DAL.ProgressMode.Get_progress_For_Table(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), out output, ver);
            string[] temp0 = output[0].Split(',');
            string[] WIName = output[1].Split('?');
            string[] temp2 = output[2].Split(',');
            string[] temp3 = output[3].Split(',');
            string[] temp4 = output[4].Split(',');
            string[] temp5 = output[5].Split(',');
            string[] temp6 = output[6].Split(',');
            string[] temp7 = output[7].Split(',');
            string[] temp8 = output[8].Split(',');
            int[] WID = new int[temp0.Length];
            int[] Duration = new int[temp2.Length];
            int[] ES = new int[temp3.Length];
            int[] EE = new int[temp4.Length];
            int[] LS = new int[temp5.Length];
            int[] LE = new int[temp6.Length];
            int[] WBSID = new int[temp7.Length];
            decimal[] WBSAmount = new decimal[temp8.Length];
            for (int i = 0; i < temp0.Length; i++)
            {
                WID[i] = 0;
                Duration[i] = 0;
                ES[i] = 0;
                EE[i] = 0;
                LS[i] = 0;
                LE[i] = 0;
                WBSID[i] = 0;
                WBSAmount[i] = 0.000M;
            }

            for (int i = 0; i < temp0.Length; i++)
            {
                int.TryParse(temp0[i], out WID[i]);
                int.TryParse(temp2[i], out Duration[i]);
                int.TryParse(temp3[i], out ES[i]);
                int.TryParse(temp4[i], out EE[i]);
                int.TryParse(temp5[i], out LS[i]);
                int.TryParse(temp6[i], out LE[i]);
                int.TryParse(temp7[i], out WBSID[i]);
                decimal.TryParse(temp8[i], out WBSAmount[i]);
            }
            int maxday = 0;
            for (int i = 0; i < LE.Length; i++)
            {
                if (LE[i] > maxday)
                    maxday = LE[i];
            }
            decimal[] daymoney = new decimal[maxday];

            Table Tbl_Progress = new Table();
            Tbl_Progress.BorderStyle = BorderStyle.Solid;
            Tbl_Progress.BorderColor = System.Drawing.Color.Black;
            Tbl_Progress.Attributes.Add("cellspacing", "0");
            Tbl_Progress.BorderWidth = 1;
            TableHeaderRow THR = new TableHeaderRow();
            TableHeaderCell THC1 = new TableHeaderCell();
            THC1.Text = "作業名稱";
            THC1.Width = 100;
            //THC1.BorderStyle = BorderStyle.Solid;
            THR.Controls.Add(THC1);

            TableHeaderCell THC2 = new TableHeaderCell();
            THC2.Text = "工期";
            THC2.Width = 40;
            //.BorderStyle = BorderStyle.Solid;
            THR.Controls.Add(THC2);

            TableHeaderCell THC3 = new TableHeaderCell();
            if (type == 1)
            {
                THC3.Text = "ES";
            }
            else if (type == 2)
            {
                THC3.Text = "LS";
            }
            else if (type == 3)
            {
                THC3.Text = "ES/LS";
            }
            THC3.Width = 50;
            //THC3.BorderStyle = BorderStyle.Solid;
            THR.Controls.Add(THC3);

            TableHeaderCell THC4 = new TableHeaderCell();
            if (type == 1)
            {
                THC4.Text = "EF";
            }
            else if (type == 2)
            {
                THC4.Text = "LF";
            }
            else if (type == 3)
            {
                THC4.Text = "EF/LF";
            }
            THC4.Width = 50;
            //THC4.BorderStyle = BorderStyle.Solid;
            THR.Controls.Add(THC4);

            TableHeaderCell THC5 = new TableHeaderCell();
            THC5.Text = "Budget";
            THC5.Width = 50;
            //THC5.BorderStyle = BorderStyle.Solid;
            THR.Controls.Add(THC5);

            for (int i = 1; i <= maxday; i++)
            {
                TableHeaderCell THCloop = new TableHeaderCell();
                THCloop.Text = i.ToString();
                THCloop.Width = 20;
                THR.Controls.Add(THCloop);
            }
            Tbl_Progress.Controls.Add(THR);

            if (type == 3)
            {
                for (int j = 0; j < WID.Length; j++)
                {
                    for (int k = 0; k < 2; k++)
                    {
                        TableRow TRLoop = new TableRow();
                        if (k == 0)
                        {
                            TableCell TC1 = new TableCell();
                            TC1.Text = WIName[j];
                            //TC1.BorderStyle = BorderStyle.Solid;
                            TC1.HorizontalAlign = HorizontalAlign.Center;
                            TC1.RowSpan = 2;
                            TRLoop.Controls.Add(TC1);

                            TableCell TC2 = new TableCell();
                            TC2.Text = Duration[j].ToString();
                            //TC2.BorderStyle = BorderStyle.Solid;
                            TC2.HorizontalAlign = HorizontalAlign.Center;
                            TC2.RowSpan = 2;
                            TRLoop.Controls.Add(TC2);

                            TableCell TC3 = new TableCell();
                            if (ES[j] == LS[j])
                            {
                                TC3.Text = ES[j].ToString();
                            }
                            else
                            {
                                TC3.Text = ES[j].ToString() + "/" + LS[j].ToString();
                            }
                            //TC3.BorderStyle = BorderStyle.Solid;
                            TC3.HorizontalAlign = HorizontalAlign.Center;
                            TC3.RowSpan = 2;
                            TRLoop.Controls.Add(TC3);

                            TableCell TC4 = new TableCell();
                            if (EE[j] == LE[j])
                            {
                                TC4.Text = EE[j].ToString();
                            }
                            else
                            {
                                TC4.Text = EE[j].ToString() + "/" + LE[j].ToString();
                            }
                            //TC4.BorderStyle = BorderStyle.Solid;
                            TC4.HorizontalAlign = HorizontalAlign.Center;
                            TC4.RowSpan = 2;
                            TRLoop.Controls.Add(TC4);

                            TableCell TC5 = new TableCell();
                            //TC5.BorderStyle = BorderStyle.Solid;
                            TC5.RowSpan = 2;
                            TC5.Text = (DAL.ProgressMode.Get_Price_By_WBSID(Session["DatabaseName"].ToString(), int.Parse(Session["ProjectCode"].ToString()), WBSID[j]) * WBSAmount[j]/100.000M).ToString();
                            TC5.Text = decimal.Parse(TC5.Text).ToString("N0");
                            TRLoop.Controls.Add(TC5);
                        }

                        for (int i = 1; i <= maxday; i++)
                        {
                            TableCell TCloop = new TableCell();
                            if (k == 0)
                            {
                                if ((i > ES[j]) & (i <= EE[j]))
                                {
                                    TCloop.BackColor = System.Drawing.Color.Blue;
                                }
                            }
                            else
                            {
                                if ((i > LS[j]) & (i <= LE[j]))
                                {
                                    TCloop.BackColor = System.Drawing.Color.Green;
                                }
                            }
                            TRLoop.Controls.Add(TCloop);
                        }
                        Tbl_Progress.Controls.Add(TRLoop);
                    }
                }
            }
            else
            {
                for (int j = 0; j < WID.Length; j++)
                {
                    TableRow TRLoop = new TableRow();
                    TableCell TC1 = new TableCell();
                    TC1.Text = WIName[j];
                    //TC1.BorderStyle = BorderStyle.Solid;
                    TC1.HorizontalAlign = HorizontalAlign.Center;
                    TRLoop.Controls.Add(TC1);

                    TableCell TC2 = new TableCell();
                    TC2.Text = Duration[j].ToString();
                    //TC2.BorderStyle = BorderStyle.Solid;
                    TC2.HorizontalAlign = HorizontalAlign.Center;
                    TRLoop.Controls.Add(TC2);

                    TableCell TC3 = new TableCell();
                    if (type == 1)
                    {
                        TC3.Text = ES[j].ToString();
                    }
                    else if (type == 2)
                    {
                        TC3.Text = LS[j].ToString();
                    }
                    //TC3.BorderStyle = BorderStyle.Solid;
                    TC3.HorizontalAlign = HorizontalAlign.Center;
                    TRLoop.Controls.Add(TC3);

                    TableCell TC4 = new TableCell();
                    if (type == 1)
                    {
                        TC4.Text = EE[j].ToString();
                    }
                    else if (type == 2)
                    {
                        TC4.Text = LE[j].ToString();
                    }
                    //TC4.BorderStyle = BorderStyle.Solid;
                    TC4.HorizontalAlign = HorizontalAlign.Center;
                    TRLoop.Controls.Add(TC4);

                    TableCell TC5 = new TableCell();
                    //TC5.BorderStyle = BorderStyle.Solid;
                    TC5.Text = (DAL.ProgressMode.Get_Price_By_WBSID(Session["DatabaseName"].ToString(), int.Parse(Session["ProjectCode"].ToString()), WBSID[j]) * WBSAmount[j]/100.000M).ToString();
                    TC5.Text = decimal.Parse(TC5.Text).ToString("N0");
                    TRLoop.Controls.Add(TC5);

                    for (int i = 1; i <= maxday; i++)
                    {
                        TableCell TCloop = new TableCell();
                        if (type == 1)
                        {
                            if ((i > ES[j]) & (i <= EE[j]))
                            {
                                TCloop.BackColor = System.Drawing.Color.Blue;
                                daymoney[i - 1] += decimal.Parse(TC5.Text) / decimal.Parse(TC2.Text);
                            }
                        }
                        else if (type == 2)
                        {
                            if ((i > LS[j]) & (i <= LE[j]))
                            {
                                TCloop.BackColor = System.Drawing.Color.Green;
                                daymoney[i - 1] += decimal.Parse(TC5.Text) / decimal.Parse(TC2.Text);
                            }
                        }
                        TRLoop.Controls.Add(TCloop);
                    }
                    Tbl_Progress.Controls.Add(TRLoop);
                }
                //TableRow TFR = new TableRow();
                //TableCell TFC1 = new TableCell();
                //TFC1.Text = "每日小計";
                //TFC1.ColumnSpan = 5;
                //TFR.Controls.Add(TFC1);
                //for (int i = 0; i < maxday; i++)
                //{
                //    TableCell TFCLoop = new TableCell();
                //    TFCLoop.Text = daymoney[i].ToString();
                //    TFR.Controls.Add(TFCLoop);
                //}
                //Tbl_Progress.Controls.Add(TFR);
            }

            PH1.Controls.Add(Tbl_Progress);
            return daymoney;
        }

        public string Gantt_String()
        {
            string result = "";
            string[] output = new string[6];
            int ver = 1;
            int.TryParse(DDL_ver.SelectedValue, out ver);
            bool status = DAL.ProgressMode.Get_Progress_For_Gantt(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), out output, ver);
            
            string[] WID = output[0].Split(',');
            string[] WName = output[1].Split(',');
            string[] Duration = output[2].Split(',');
            string[] SD = output[3].Split(',');
            string[] ED = output[4].Split(',');
            string[] PreWID = output[5].Split(';');
            int num = WID.Length;

            for (int i = 0; i < num; i++)
            {
                string[] SD_arr = new string[3];
                string[] ED_arr = new string[3];
                if (SD[i] == "")
                {
                    SD_arr[0] = "2000";
                    SD_arr[1] = "0";
                    SD_arr[2] = "1";
                }
                else
                {
                    SD_arr = SD[i].Split('/');
                }
                if (ED[i] == "")
                {
                    ED_arr[0] = "2000";
                    ED_arr[1] = "0";
                    ED_arr[2] = "1";
                }
                else
                {
                    ED_arr = ED[i].Split('/');
                }
                result += "['" + WID[i] + "','" + WName[i] + "', new Date(" + SD_arr[0] + "," + (int.Parse(SD_arr[1])-1).ToString() + "," + SD_arr[2] + "), new Date(" + ED_arr[0] + "," + (int.Parse(ED_arr[1])-1).ToString() + "," + ED_arr[2] + "), daysToMilliseconds(" + Duration[i] + "),0,"; // +"],";
                if (PreWID[i] == "")
                {
                    result += "null],";
                }
                else
                {
                    result += "'" + PreWID[i] + "'],";
                }
            }
            if (result.Length > 0)
            {
                result = result.Substring(0, result.Length - 1);
            }

            return result;
        }

        public string LString()
        {
            string result = "";
            decimal[] ES_money = Make_BarChart_table(1);
            PH1.Controls.Add(new LiteralControl("<br/>"));
            decimal[] LS_money = Make_BarChart_table(2);
            PH1.Controls.Add(new LiteralControl("<br/>"));
            decimal[] TT_money = Make_BarChart_table(3);
            PH1.Controls.Add(new LiteralControl("<br/>"));
            result = Line_string(ES_money, LS_money);
            return result;
        }

        public string Line_string(decimal[] Estart, decimal[] Lstart)
        {
            string result = "[";
            int num = Estart.Length;
            decimal sum_Estart = 0.000M;
            decimal sum_Lstart = 0.000M;
            for (int i = 0; i < num; i++)
            {
                sum_Estart += Estart[i];
                sum_Lstart += Lstart[i];
                result += i.ToString() + "," + sum_Estart.ToString() + "," + sum_Lstart.ToString() + "],[";
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