using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace IMS
{
    public partial class CalendarSetting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                    SqlDataSource1.SelectCommand = "select * from ProjectM0 where PID in (select distinct ProjectID from UserProjectPageAccess where UserID=(select UID from USER_Information.dbo.UserDB where Username='" + Session["Username"].ToString() + "' and CompanyID='" + Session["CompanyID"].ToString() + "'))";
                    Ddl_Project.DataSourceID = "SqlDataSource1";
                    Ddl_Project.DataBind();
                    ListItem LI = new ListItem();
                    LI.Text = "--請選擇--";
                    LI.Value = "0";

                    Ddl_Project.Items.Insert(0, LI);
                    Ddl_Project.SelectedIndex = 0;
                   

                }
            }
        }
    
        protected void Ddl_Project_SelectedIndexChanged(object sender, EventArgs e)
        {
            LbNonWorkdate.Text = "";
            LbWorkDate.Text = "";
            TxStart.Text = "";
            TxEnd.Text = "";
            RadioButtonList1.SelectedIndex=-1;

            Session["ProjectCode"] = Ddl_Project.SelectedValue;
            Session["ProjectName"] = Ddl_Project.SelectedItem.Text;
            string database = Session["DatabaseName"].ToString();
            string sqlselect = "select * from ProjectM0 where PID=" + Ddl_Project.SelectedValue;
            TxStart.Text = WebModel.SItemName(database, sqlselect, "SProgressSDate");
            TxEnd.Text = WebModel.SItemName(database, sqlselect, "SProgressEDate");
            Session["date"] = WebModel.SItemName(database, sqlselect, "ExcludeDays");
            LbNonWorkdate.Text = Session["date"].ToString();
            LbWorkDate.Text = WebModel.SItemName(database, sqlselect, "workdays");
            RadioButtonList1.SelectedValue = WebModel.SItemName(database, sqlselect, "Holidays") !=""?WebModel.SItemName(database, sqlselect, "Holidays"):"-1";
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            LbNonWorkdate.Text = "您選擇的日期是： " + "<br />";
            SelectedDatesCollection dates = Calendar1.SelectedDates;
       
            Session["date"] += Calendar1.SelectedDate.ToShortDateString() + ",";
            //for (int i = 0; i <= Calendar1.SelectedDates.Count - 1; i++)
            //{
            //    Label1.Text += Calendar1.SelectedDates[i].ToShortDateString() + "<br />";
            //}
            LbNonWorkdate.Text += Session["date"].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            if (TxStart.Text != "" && TxEnd.Text != "")
            {
                int count = 0;
                int day = GetBusinessDays(DateTime.Parse(TxStart.Text), DateTime.Parse(TxEnd.Text));
                if (Session["date"] != null)
                {

                    foreach (string DataName in Session["date"].ToString().Split(','))
                    {
                        
                        count++;
                    }
                    LbWorkDate.Text = ((day - count) + 1).ToString() + "天";
                }
                else
                {
                    LbWorkDate.Text = day.ToString() + "天";
                }
                if (Session["ProjectCode"] != "")
                {
                    string UpDateWorkDays = "Update ProjectM0 set SProgressSDate='" + DateTime.Parse(TxStart.Text).ToShortDateString() + "',SProgressEDate='" + DateTime.Parse(TxEnd.Text).ToShortDateString() + "', workdays='" + LbWorkDate.Text + "',ExcludeDays='" + Session["date"].ToString() + "',Holidays='" + RadioButtonList1.SelectedValue + "' where pid=" + Session["ProjectCode"].ToString() + "";
                    string database = Session["DatabaseName"].ToString();
                    bool result1 = WebModel.SQLAction(database, UpDateWorkDays);
                    if (result1)
                    {
                        Response.Write("<script>alert('設定成功!!');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('寫入資料庫設定失敗!!');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('請選擇專案!!');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('請輸入起始日設定及結束日設定');</script>");

            }
        }
        public int GetBusinessDays(DateTime start, DateTime end)
        {
            if (start.DayOfWeek == DayOfWeek.Saturday)
            {
                start = start.AddDays(2);
            }
            else if (start.DayOfWeek == DayOfWeek.Sunday)
            {
                start = start.AddDays(1);
            }

            if (end.DayOfWeek == DayOfWeek.Saturday)
            {
                end = end.AddDays(-1);
            }
            else if (end.DayOfWeek == DayOfWeek.Sunday)
            {
                end = end.AddDays(-2);
            }

            double diff = (int)end.Subtract(start).TotalDays;
            int result = 0;
            int holiday = 0;
            int time = Convert.ToInt16(Math.Floor(diff / 356));
            holiday = 9 * time;
            if (RadioButtonList1.SelectedValue == "0")
            {              
                result = Convert.ToInt16(diff / 7 * 6 + diff % 7) - holiday;
            }
            else
            {
                result = Convert.ToInt16(diff / 7 * 5 + diff % 7) - holiday;

            }
           

            if (end.DayOfWeek < start.DayOfWeek)
            {
                return result - 2;
            }
            else
            {
                return result;
            }
        }
        public static DateTime AddBusinessDays(DateTime date, int days)
        {
            if (days < 0)
            {
                throw new ArgumentException("days cannot be negative", "days");
            }

            if (days == 0) return date;

            if (date.DayOfWeek == DayOfWeek.Saturday)
            {
                date = date.AddDays(2);
                days -= 1;
            }
            else if (date.DayOfWeek == DayOfWeek.Sunday)
            {
                date = date.AddDays(1);
                days -= 1;
            }

            date = date.AddDays(days / 5 * 7);
            int extraDays = days % 5;

            if ((int)date.DayOfWeek + extraDays > 5)
            {
                extraDays += 2;
            }

            return date.AddDays(extraDays);

        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            Session["date"] = null;
            Calendar1.SelectedDates.Clear();
            LbNonWorkdate.Text = "";
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (RadioButtonList1.SelectedValue == "0")
            {
                if (e.Day.Date.DayOfWeek == DayOfWeek.Sunday)
                    e.Cell.BackColor = System.Drawing.Color.Aqua;
            }
            else if (RadioButtonList1.SelectedValue == "1")
            {
                if (e.Day.IsWeekend)
                {
                    e.Cell.BackColor = System.Drawing.Color.Aqua;
                }

            }
                  
           
            if (Session["date"] != null)
            {
              
                foreach (string DataName in Session["date"].ToString().Split(','))
                {
                   
                    if(DataName!="")
                   {
                       DateTime csTime = DateTime.Parse(DataName);
                       if (e.Day.Date.ToShortDateString() == String.Format("{0:yyyy/M/d}", csTime))
                       {   
                           e.Cell.BackColor = System.Drawing.Color.Beige;
                           e.Cell.Controls.Add(new LiteralControl("<br />非工作日"));
                       }
                   
                } 
                }
               
            }
        }
      
    }
}