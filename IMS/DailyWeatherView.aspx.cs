using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Excel = Microsoft.Office.Interop.Excel;
using System.Drawing;
using System.Net;

namespace IMS
{
    public partial class DailyWeatherView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                DDL_Year.SelectedValue = (DateTime.Now.ToString("yyyy")).ToString();
            }
            Output();
        }

        private void Output()
        {
            string TmpStr="";
            TmpStr = @"<table class=""Table100"">
                           <tr>
                               <td class=""SR_Left""></td>";
            for (int i = 1; i <= 31; i++)
            { 
                TmpStr += @"<td class=""SR_Up"">" + i + "</td>";
            }
            TmpStr += @"</tr>";

            //一月份
            TmpStr += @"<tr>
                            <td class=""SR_Left"" rowspan=""2"">一月</td>";
            for (int i = 1; i <= 31; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "1/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownSingle'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherAM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>
                        <tr>";
            for (int i = 1; i <= 31; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "1/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownSingle'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherPM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>";
            //二月份
            TmpStr += @"<tr>
                            <td class=""SR_Left"" rowspan=""2"">二月</td>";
            int dd;
            if (DateTime.IsLeapYear(Convert.ToInt16(DDL_Year.SelectedValue)))
            {
                dd = 29;
            }
            else 
            {
                dd = 28;
            }
            for (int i = 1; i <= dd; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "2/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "align='center'; style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownDouble'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherAM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>
                        <tr>";
            for (int i = 1; i <= dd; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "2/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "align='center'; style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownDouble'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherPM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>";
            //三月份
            TmpStr += @"<tr>
                            <td class=""SR_Left"" rowspan=""2"">三月</td>";
            for (int i = 1; i <= 31; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "3/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "align='center'; style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownSingle'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherAM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>
                        <tr>";
            for (int i = 1; i <= 31; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "3/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "align='center'; style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownSingle'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherPM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>";
            //四月份
            TmpStr += @"<tr>
                            <td class=""SR_Left"" rowspan=""2"">四月</td>";
            for (int i = 1; i <= 30; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "4/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "align='center'; style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownDouble'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherAM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>
                        <tr>";
            for (int i = 1; i <= 30; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "4/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "align='center'; style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownDouble'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherPM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>";
            //五月份
            TmpStr += @"<tr>
                            <td class=""SR_Left"" rowspan=""2"">五月</td>";
            for (int i = 1; i <= 31; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "5/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "align='center'; class='SR_DownSingle'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherAM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>
                        <tr>";
            for (int i = 1; i <= 31; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "5/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "align='center'; style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownSingle'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherPM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>";
            //六月份
            TmpStr += @"<tr>
                            <td class=""SR_Left"" rowspan=""2"">六月</td>";
            for (int i = 1; i <= 30; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "6/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "align='center'; style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownDouble'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherAM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>
                        <tr>";
            for (int i = 1; i <= 30; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "6/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "align='center'; style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownDouble'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherPM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>";
            //七月份
            TmpStr += @"<tr>
                            <td class=""SR_Left"" rowspan=""2"">七月</td>";
            for (int i = 1; i <= 31; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "7/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "align='center'; class='SR_DownSingle'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherAM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>
                        <tr>";
            for (int i = 1; i <= 31; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "7/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "align='center'; style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownSingle'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherPM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>";
            //八月份
            TmpStr += @"<tr>
                            <td class=""SR_Left"" rowspan=""2"">八月</td>";
            for (int i = 1; i <= 31; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "8/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "align='center'; style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownDouble'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherAM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>
                        <tr>";
            for (int i = 1; i <= 31; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "8/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "align='center'; style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownDouble'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherPM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>";
            //九月份
            TmpStr += @"<tr>
                            <td class=""SR_Left"" rowspan=""2"">九月</td>";
            for (int i = 1; i <= 30; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "9/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "align='center'; style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownSingle'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherAM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>
                        <tr>";
            for (int i = 1; i <= 30; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "9/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "align='center'; style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownSingle'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherPM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>";
            //十月份
            TmpStr += @"<tr>
                            <td class=""SR_Left"" rowspan=""2"">十月</td>";
            for (int i = 1; i <= 31; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "10/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "align='center'; style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownDouble'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherAM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>
                        <tr>";
            for (int i = 1; i <= 31; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "10/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "align='center'; style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownDouble'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherPM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>";
            //十一月份
            TmpStr += @"<tr>
                            <td class=""SR_Left"" rowspan=""2"">十一月</td>";
            for (int i = 1; i <= 30; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "11/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "align='center'; style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownSingle'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherAM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>
                        <tr>";
            for (int i = 1; i <= 30; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "11/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "align='center'; style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownSingle'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherPM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>";
            //十二月份
            TmpStr += @"<tr>
                            <td class=""SR_Left"" rowspan=""2"">十二月</td>";
            for (int i = 1; i <= 31; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "12/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "align='center'; style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownDouble'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherAM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>
                        <tr>";
            for (int i = 1; i <= 31; i++)
            {
                string aa = DDL_Year.SelectedValue + "/" + "12/";
                aa += i.ToString();
                string cc;
                DateTime Try_Date = Convert.ToDateTime(aa);
                if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                {
                    cc = "align='center'; style = 'background-color:#FFB7DD'";
                }
                else
                {
                    cc = "class='SR_DownDouble'";
                }
                string ss = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherPM");
                if (ss == "")
                {
                    TmpStr += @"<td " + cc + " ></td>";
                }
                else
                {
                    if (ss == "晴")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Sun.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "陰")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Cloud.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雨")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Rain.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "颱風")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Typhoon.jpg"" height=""25"" width=""35""></td>";
                    }
                    else if (ss == "雪")
                    {
                        TmpStr += @"<td " + cc + @" ><img src=""../img/Snow.jpg"" height=""25"" width=""35""></td>";
                    }
                }
            }
            TmpStr += @"</tr>";

            TmpStr += @"</table>";
            Literal1.Text = TmpStr.ToString();
        }

        protected void DDL_Year_SelectedIndexChanged(object sender, EventArgs e)
        {
            Output();
        }

        protected void ImageButton133_Click(object sender, ImageClickEventArgs e)
        {
            DAL.Temp2.Check_Button_Type = 1;
            Save_Excel();
        }

        void Save_Excel()
        {
            Excel.Application excelApp;
            Excel._Workbook wBook;
            Excel._Worksheet wSheet;
            Excel.Range wRange;
            excelApp = new Excel.Application();
            excelApp.Visible = true;
            excelApp.DisplayAlerts = false;
            excelApp.Workbooks.Add(Type.Missing);
            wBook = excelApp.Workbooks[1];
            wBook.Activate();
            try
            {
                wSheet = (Excel._Worksheet)wBook.Worksheets[1];
                wRange = wSheet.Range[wSheet.Cells[1, 1], wSheet.Cells[1, 1]];
                wRange.ColumnWidth = 8.38;
                wRange = wSheet.Range[wSheet.Cells[1, 2], wSheet.Cells[1, 32]];
                wRange.ColumnWidth = 3.25;
                wSheet.Name = "晴雨表";
                wSheet.Activate();
                wRange = wSheet.Range[wSheet.Cells[1, 1], wSheet.Cells[1, 32]];
                wRange.Merge(0);
                excelApp.Cells[1, 1] = "晴雨表";
                excelApp.Cells[2, 1] = "年度：";
                wRange = wSheet.Range[wSheet.Cells[2, 2], wSheet.Cells[2, 4]];
                wRange.Merge(0);
                excelApp.Cells[2, 2] = DDL_Year.SelectedValue.ToString();
                wRange = wSheet.Range[wSheet.Cells[2, 5], wSheet.Cells[2, 7]];
                wRange.Merge(0);                
                excelApp.Cells[2, 5] = "專案編號：";
                wRange = wSheet.Range[wSheet.Cells[2, 8], wSheet.Cells[2, 12]];
                wRange.Merge(0);
                excelApp.Cells[2, 8] = Convert.ToInt32(Session["ProjectCode"]);
                wRange = wSheet.Range[wSheet.Cells[2, 13], wSheet.Cells[2, 15]];
                wRange.Merge(0);
                excelApp.Cells[2, 13] = "專案名稱：";
                wRange = wSheet.Range[wSheet.Cells[2, 16], wSheet.Cells[2, 26]];
                wRange.Merge(0);
                excelApp.Cells[2, 16] = DAL.DailyMode.PID_Name_Search(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["ProjectCode"]));
                wRange = wSheet.Range[wSheet.Cells[2, 27], wSheet.Cells[2, 29]];
                wRange.Merge(0);
                excelApp.Cells[2, 27] = "列印日期：";
                wRange = wSheet.Range[wSheet.Cells[2, 30], wSheet.Cells[2, 32]];
                wRange.Merge(0);
                excelApp.Cells[2, 30] = (DateTime.Now.ToString("yyyy-mm-dd")).ToString(); ;
                for (int i=1; i<32; i++)
                {
                    excelApp.Cells[3, i + 1] = i;
                }
                for (int j = 1; j <= 12; j++)
                {
                    int dd = 31;
                    if (j == 1 || j == 3 || j == 5 || j == 7 || j == 8 || j == 10 || j == 12)
                    {
                        dd = 31;
                    }
                    else if (j == 4 || j == 6 || j == 9 || j == 11)
                    {
                        dd = 30;
                        wRange = wSheet.Range[wSheet.Cells[3 + j * 2 - 1, 32], wSheet.Cells[3 + j * 2, 32]];
                        wRange.Merge(0);
                        excelApp.Cells[3 + j * 2 - 1, 32] = "-";
                    }
                    else if (j == 2)
                    {
                        if (DateTime.IsLeapYear(Convert.ToInt16(DDL_Year.SelectedValue)))
                        {
                            dd = 29;
                            wRange = wSheet.Range[wSheet.Cells[3 + j * 2 - 1, 31], wSheet.Cells[3 + j * 2, 32]];
                            wRange.Merge(0);
                            excelApp.Cells[3 + j * 2 - 1, 31] = "-";
                        }
                        else
                        {
                            dd = 28;
                            wRange = wSheet.Range[wSheet.Cells[3 + j * 2 - 1, 30], wSheet.Cells[3 + j * 2, 32]];
                            wRange.Merge(0);
                            excelApp.Cells[3 + j * 2 - 1, 30] = "-";
                        }
                    }
                    for (int i = 1; i <= dd; i++)
                    {
                        wRange = wSheet.Range[wSheet.Cells[3 + j * 2 - 1, 1], wSheet.Cells[3 + j * 2, 1]];
                        wRange.Merge(0);
                        excelApp.Cells[3 + j * 2 - 1, 1] = j + "月";
                        string aa = DDL_Year.SelectedValue + "/" + j + "/";
                        aa += i.ToString();
                        DateTime Try_Date = Convert.ToDateTime(aa);
                        if ((int)Try_Date.DayOfWeek == 0 || (int)Try_Date.DayOfWeek == 6)
                        {
                            wRange = wSheet.Range[wSheet.Cells[3 + j * 2 - 1, i + 1], wSheet.Cells[3 + j * 2, i + 1]];
                            wRange.Interior.Color = ColorTranslator.ToOle(Color.Gray);
                        }
                        string ss1 = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherAM");
                        if (!(ss1 == ""))
                        {
                            excelApp.Cells[3 + j * 2 - 1, i + 1] = ss1;
                        }
                        string ss2 = DAL.DailyMode.Weather_Search(Session["DatabaseName"].ToString(), aa, "WeatherPM");
                        if (!(ss2 == ""))
                        {
                            excelApp.Cells[3 + j * 2, i + 1] = ss2;
                        }
                    }
                    //wRange = wSheet.Range[wSheet.Cells[3 + j * 2 - 1, 1], wSheet.Cells[3 + j * 2, 32]];
                    //wRange.Borders.get_Item((Microsoft.Office.Interop.Excel.XlBordersIndex)1).Weight = 3;
                }
                wRange = wSheet.Range[wSheet.Cells[1, 1], wSheet.Cells[27, 32]];
                wRange.Select();
                wRange.Borders.LineStyle = 1;
                wRange.Borders.Weight = 2;
                wRange.Font.Size = 10;
                wRange.Borders.Color = ColorTranslator.ToOle(Color.Black);
                wRange.Font.Name = "微軟正黑體";
                wRange.VerticalAlignment = Excel.XlVAlign.xlVAlignCenter;
                wRange.HorizontalAlignment = Excel.XlHAlign.xlHAlignCenter;
                if (DAL.Temp2.Check_Button_Type == 1)
                {
                }
                else if (DAL.Temp2.Check_Button_Type == 2)
                {
                    string pathFile = Server.MapPath("Uploads/Output.xlsx");
                    try
                    {
                        wBook.SaveAs(pathFile, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Excel.XlSaveAsAccessMode.xlNoChange, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
                        Response.Write("<script language=javascript>alert('資料儲存成功！')</script>");
                        wBook.Close(false, Type.Missing, Type.Missing);
                        excelApp.Quit();
                        System.Runtime.InteropServices.Marshal.ReleaseComObject(excelApp);
                        Excel2Pdf(Server.MapPath("Uploads/Output.xlsx"), Server.MapPath("Uploads/Output.pdf"));
                        WebClient myWebClient = new WebClient();
                        Response.ContentType = "pdf";
                        Response.AppendHeader("Content-Disposition", "Attachment; FileName=Output.pdf");
                        Response.TransmitFile(Server.MapPath("Uploads/Output.pdf"));
                        Response.End();
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script language=javascript>alert('儲存檔案出錯，檔案可能正在使用！')</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("產生報表時出錯！" + Environment.NewLine + ex.Message);
            }
        }

        public static bool Excel2Pdf(string source, string target)
        {
            try
            {
                var ExcelApp = new Microsoft.Office.Interop.Excel.Application();
                Microsoft.Office.Interop.Excel.Workbook book = ExcelApp.Workbooks.Open(source);
                Microsoft.Office.Interop.Excel.XlFileFormat xlFormatPDF = (Microsoft.Office.Interop.Excel.XlFileFormat)57;
                book.SaveAs(target, xlFormatPDF);
                ExcelApp.Visible = false;
                ExcelApp.Quit();
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return false;
        }

        protected void ImageButton132_Click(object sender, ImageClickEventArgs e)
        {
            DAL.Temp2.Check_Button_Type = 2;
            Save_Excel();
        }
    }
}