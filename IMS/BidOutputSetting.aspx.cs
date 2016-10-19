using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection;
using Microsoft.Office.Interop.Excel;
using DAL;

namespace IMS
{
        
    public partial class BidOutputSetting : System.Web.UI.Page
    {
         Microsoft.Office.Interop.Excel.Application excel;
        //Microsoft.Office.Interop.Excel.Workbook workBook;
        //Microsoft.Office.Interop.Excel.Worksheet workSheet;
        //Microsoft.Office.Interop.Excel.Range range;
      

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            TxDate.Text = System.DateTime.Today.ToString("d");
            if (Session["BID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            //DataTableToExcel(GetDataBox(),1,1);
            //excel = new Microsoft.Office.Interop.Excel.Application();

            //// for making Excel visible
            //excel.Visible = false;
            //excel.DisplayAlerts = false;
        }


  //匯出 Excel (直接從資料來源 DataTable 產生 Excel。 此種 Excel 可加入自訂記錄列) 
	    private void exportDataTableToExcel(System.Data.DataTable pDataTable) 
	    {
            string database = Session["DatabaseName"].ToString();
            string SelectSQL = "select * from BidM0 where bid=" +Session["bid"].ToString() + "";
            int tRowCount = pDataTable.Rows.Count; 
	        int tColumnCount = pDataTable.Columns.Count;
            int colspan = tColumnCount - 1;
            string filename = TxFileName.Text;
            string company = TxCompany.Text;
            string date = TxDate.Text;
            string BidName = WebModel.BidName(database, SelectSQL);
           
	        Response.Expires = 0; 
	        Response.Clear(); 
	        Response.Buffer = true; 
	        Response.Charset = "utf-8"; 
	        Response.ContentEncoding = System.Text.Encoding.UTF8; 
	        Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + filename + ".xls"); 
	        Response.Write("<meta http-equiv=Content-Type content=text/html;charset=utf-8>");
            //Response.Write("<Table borderColor=black border=1 font-family:'" + DDL_font.SelectedItem.Text + "'>");
            HttpContext.Current.Response.Write("<Table border='1' bgColor='#ffffff' " +
             "borderColor='#000000' cellSpacing='0' cellPadding='0' " +
             "style='font-size:10.0pt; font-family:" + DDL_font.SelectedItem.Text + "; background:white;'>");
            Response.Write("\n<th bgColor='lightblue' style='font-size:20.0pt;' colspan='" + colspan + "'  align=\"center\" x:num>");      //抬頭背景為淺黃色，文字橫向為置中對齊 
            Response.Write("機關/公司名稱:"+company+ " ");
            Response.Write("\n</th>");
            Response.Write("<TR ><td style='font-size:10.0pt;' colspan='" + colspan + "'  align=\"right\" x:num>");    
            Response.Write("日期:" + date+ "");
            Response.Write("</td>\n</TR>");
            Response.Write("<TR ><td style='font-size:16.0pt;' colspan='" + colspan + "'  align=\"Left\" x:num>");      
            Response.Write("工程名稱:" + BidName + "");
            Response.Write("</td>\n</TR>");
	        //Response.Write("<tr><td align='center' valign='middle'>自訂表頭訊息</td></tr>"); 
            Response.Write("\n<TR bgcolor=#fff8dc  align=\"center\" x:num>");     
            Response.Write("<td>項次</td><td>工項名稱</td><td>單位</td><td>單價分析</td><td>原標單數量</td><td>原標單單價</td><td>原標單複價</td><td>校核後數量</td><td>校核後複價</td><td>投標預算數量</td><td>投標預算單價</td><td>投標預算複價</td><td>新增項目</td><td>備註\n </td>");
            Response.Write("\n </TR>"); 
            //Response.Write("\n <TR>"); 
            //for (int i = 0; i < tColumnCount; i++) 
            //{ 
            //Response.Write("\n <TD bgcolor=#fff8dc  align=\"center\" x:num>");      //抬頭背景為淺黃色，文字橫向為置中對齊 
            //    Response.Write(pDataTable.Columns[i].ColumnName); 
            //    Response.Write("\n </TD>"); 
            //}
            string l_str2 = "";
            foreach (DataRow l_dr in pDataTable.Rows)  //滙出表格資料我
            {//若有數字或日期在滙出時要注意資料型態，我是在TABLE中就設定好了

                //l_str2 = "<tr><td>" + l_dr["UID"].ToString() + "";
                l_str2 = "<tr><td>" + l_dr["ItemOrder"].ToString() + "";              

                l_str2 += "</td><td>" + l_dr["Name"].ToString() + "";

                l_str2 += "</td><td>" + l_dr["Unit"].ToString() + "";

                l_str2 += "</td><td>" + (Convert.ToBoolean(l_dr["Complex"].ToString()) == true ? "有" : "無") + "";

                l_str2 += "</td><td>" + (l_dr["Number"]).ToString() + "";

                l_str2 += "</td><td>" + l_dr["UnitPrice"].ToString() + "";
                l_str2 += "</td><td>" + l_dr["Complexprice"].ToString() + "";
                l_str2 += "</td><td>" + (l_dr["CNumber"].ToString()) + "";
                l_str2 += "</td><td>" + (l_dr["CPrice"].ToString()) + "";
                l_str2 += "</td><td>" + (l_dr["BNumber"].ToString()) + "";
                l_str2 += "</td><td>" + (l_dr["BUnitPrice"].ToString()) + "";
                l_str2 += "</td><td>" + (l_dr["BCPrice"].ToString()) + "";
                //l_str2 += "</td><td>" + Convert.ToDouble(l_dr["BCPrice"]).ToString("#,0.00") + "";
                l_str2 += "</td><td>" + (Convert.ToInt16(l_dr["NewItem"].ToString()) == 1 ? "是" : "否") + "";
                l_str2 += "</td><td>" + l_dr["Notes"].ToString() + "";

                l_str2 += "</td></tr>";

                Response.Write(l_str2);

            }
          
              Response.Write("</Table>"); 
              Response.End(); 
                
	 
	        //Response.Write("<tr><td align='center' valign='middle'>自訂表尾訊息</td></tr>"); 



              if (pDataTable != null)
                  pDataTable.Dispose();       //註記已可釋放此 DataTable         
	    } 
        #region 匯出excel報表

        
        #endregion


        /// <summary>
        /// 将DataTable数据写入Excel文件（不分页）
        /// </summary>
        /// <param name="dt">DataTable</param>
        /// <param name="top">表格数据起始行索引</param>
        /// <param name="left">表格数据起始列索引</param>
        //public void DataTableToExcel(System.Data.DataTable dt, int top, int left)
        //{
        //    int rowCount = dt.Rows.Count;		//DataTable行数
        //    int colCount = dt.Columns.Count;	//DataTable列数

        //    //利用二维数组批量写入
        //    string[,] arr = new string[rowCount + 1, colCount + 1];
        //    for (int i = 0; i < colCount; i++)
        //    {
        //        arr[0, i] = dt.Columns[i].ColumnName.ToString();
        //    }

        //    for (int j = 0; j < rowCount; j++)
        //    {
        //        for (int k = 0; k < colCount; k++)
        //        {
        //            arr[j + 1, k] = dt.Rows[j][k].ToString();
        //        }
        //    }

        //    range = (Microsoft.Office.Interop.Excel.Range)workSheet.Cells[top, left];
        //    range = range.get_Resize(rowCount + 1, colCount + 1);
        //    range.Value = arr;
        //}

    

        //取得建入資料
        protected System.Data.DataTable GetDataBox()
        {
            System.Data.DataTable DataTableBox = new System.Data.DataTable();
            if (Session["PlaceHolder"] != null)
            {
             DataTableBox = (System.Data.DataTable)Session["PlaceHolder"];
           
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請重新選擇');", true);
            }
            return DataTableBox;
        }

        protected void Export_Click(object sender, EventArgs e)
        {
            exportDataTableToExcel(GetDataBox());
        }
    }
}