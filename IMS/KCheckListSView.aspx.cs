using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;
using System.Data.SqlClient;
using System.Web.Configuration;
using DAL;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
using System.Web.UI.DataVisualization.Charting; 	//Chart Web 伺服器控制項的方法和屬性
using System.Drawing;   //繪圖功能的存取


namespace IMS
{
    public partial class KCheckListSView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CreateColumnChart();

        }
        private void CreateColumnChart()
        {
            //sqlstr = "SELECT DATEPART(month,OrderDate) as month,count(DATEPART(month,OrderDate)) as count FROM Orders WHERE DATEPART(year,OrderDate) ='1996' GROUP BY DATEPART(month,OrderDate) order by month";        
            //SqlDataReader reader = null;
            //reader = GetDRConn(sqlstr);
            String KCheckListId = Session["KCheckListId"].ToString();
            String DBName = Session["DatabaseName"].ToString();
            String Projectid = Session["ProjectCode"].ToString();

            String Name = Session["Name"].ToString();
           

            SqlConnection connStr = new SqlConnection(Utility.DBconnection.connect_string(DBName));
            
            SqlDataReader reader2;   //宣告一個DataReader

            connStr.Open(); //開啟資料庫的連結

            
            int x = 0;
            int y = 0;
            int z = 0;
            int i = 0;
            String select12 = "SELECT * FROM  KCheckListEngineeringItemSt INNER JOIN KCheckList ON KCheckListEngineeringItemSt.CheckList = KCheckList.KCheckListId where KCheckList.KCheckListProject= '" + Projectid + "' and Grade='合格' and KCheckListEngineeringItemSt.CheckList='" + KCheckListId + "' ";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd12 = new SqlCommand(select12, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader2 = cmd12.ExecuteReader();
            while (reader2.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                x = x + 1;
            }
            reader2.Close();

            String select13 = "SELECT * FROM  KCheckListEngineeringItemSt INNER JOIN KCheckList  ON KCheckListEngineeringItemSt.CheckList = KCheckList.KCheckListId where KCheckList.KCheckListProject= '" + Projectid + "' and Grade='不合格'and KCheckListEngineeringItemSt.CheckList='" + KCheckListId + "' ";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd13 = new SqlCommand(select13, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader2 = cmd13.ExecuteReader();
            while (reader2.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                y = y + 1;
            }
            reader2.Close();

            String select14 = "SELECT * FROM  KCheckListEngineeringItemSt INNER JOIN KCheckList  ON KCheckListEngineeringItemSt.CheckList = KCheckList.KCheckListId where KCheckList.KCheckListProject= '" + Projectid + "' and Grade='未檢查'and KCheckListEngineeringItemSt.CheckList='" + KCheckListId + "' ";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd14 = new SqlCommand(select14, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader2 = cmd14.ExecuteReader();
            while (reader2.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                z = z + 1;
            }
            reader2.Close();
           


            /**
              Label charttest = new Label();
              charttest.ID = "test0";
              charttest.Text =x.ToString();
              this.Form.Controls.Add(charttest);
             **/

            List<string> xvals = new List<string>();
            List<string> yvals = new List<string>();
            xvals.Add("合格");
            xvals.Add("不合格");
            xvals.Add("未檢查");

            yvals.Add(x.ToString());
            yvals.Add(y.ToString());
            yvals.Add(z.ToString());


            //將讀取資料加入至繪圖圖表中
            // ColumnChart.Series["Column"].Points.DataBindXY(, "month",, "ordercount");
            ColumnChart.Series["Column"].Points.DataBindXY(xvals.ToArray(), "month", yvals.ToArray(), "ordercount");

            //圖形呈現樣式
            // ColumnChart.Series["Column"]["DrawingStyle"] = "Cylinder";

            //圖形線條粗細
            ColumnChart.Series["Column"]["PointWidth"] = "0.2";

            //圖形樣式
            ColumnChart.Series["Column"].ChartType = SeriesChartType.Column;

            //坐標軸說明文字
            ColumnChart.ChartAreas["ColumnChartArea"].AxisX.Title = "狀態";
            ColumnChart.ChartAreas["ColumnChartArea"].AxisY.Title = "數量";

            //坐標軸說明文字格式
            ColumnChart.ChartAreas["ColumnChartArea"].AxisX.TitleFont = new System.Drawing.Font("細明體", 10f);
            ColumnChart.ChartAreas["ColumnChartArea"].AxisY.TitleFont = new System.Drawing.Font("細明體", 10f);

            //坐標軸說明文字位置
            ColumnChart.ChartAreas["ColumnChartArea"].AxisX.TitleAlignment = StringAlignment.Far;
            ColumnChart.ChartAreas["ColumnChartArea"].AxisY.TitleAlignment = StringAlignment.Far;

            //坐標尺規的間距
            ColumnChart.ChartAreas["ColumnChartArea"].AxisY.Interval = 30;

        }
    }
}