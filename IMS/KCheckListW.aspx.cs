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
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.Data;

namespace IMS
{
    public partial class KCheckListW : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["ProjectCode"] == null || Session["ProjectCode"] == "")
            {
                // Response.Redirect("Main.aspx");
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請選擇專案');", true);

            }
            else
            {

                String Name = Session["DatabaseName"].ToString();
                String Projectid = Session["ProjectCode"].ToString();


                //String DBName = "Private_Com1";
                SqlCheckList.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                //SqlCheckList.SelectCommand = "SELECT * FROM KCheckList INNER JOIN KEngineeringList ON KCheckList.KCheckListEngineeringList = KEngineeringList.KEngineeringListId where  KCheckList.KCheckListProject ='" + Projectid + "'";
                SqlCheckList.SelectCommand = "select * from KCheckList  where  KCheckListProject ='" + Projectid + "'";

            }


               
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            
            ID_class = ID_class % GridView1.PageSize;

            if (e.CommandName == "Update")
            {
                int UID = (int)GridView1.DataKeys[ID_class].Value;

                //TextBox LbForecastBiddingDate = (TextBox)GridView1.Rows[ID_class].FindControl("LbForecastBiddingDate");
                //LbForecastBiddingDate.Text = (LbForecastBiddingDate.Text != "") ? DateTime.Parse(LbForecastBiddingDate.Text).ToString("yyyy-MM-dd") : "";
                SqlCheckList.UpdateCommand = "UPDATE [KCheckList] SET [KCheckListEngineeringList] = @KCheckListEngineeringList  WHERE [KCheckListId] = @KCheckListId";
            }

            if (e.CommandName == "Delete")
            {
                //SqlDataSource1.DeleteCommand = "UPDATE [Bid_PreData] SET [status] = 1 WHERE [UID] = @UID";


                //SqlAll.DeleteCommand = "delete from [KEngineeringListItem] where [KEngineeringListId] = @KEngineeringListId";

                SqlCheckList.DeleteCommand = "delete from [KCheckList] where [KCheckListId] = @KCheckListId";



                String dataName = Session["DatabaseName"].ToString();
                SqlConnection connStrr = new SqlConnection(Utility.DBconnection.connect_string(dataName));
                connStrr.Open();
                String selectaa = "delete from [KCheckListItemSt] where [CheckList] =@KCheckListId";  //宣告SQL語法的字串，這邊可依照自行需求修改
                SqlCommand cmdaa = new SqlCommand(selectaa, connStrr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                //cmdaa.Parameters.Add("@KEngineeringListId", System.Data.SqlDbType.VarChar).Value = "KEngineeringListId";
                cmdaa.Parameters.Add("@KCheckListId", SqlDbType.Int);
                cmdaa.Parameters["@KCheckListId"].Value = Convert.ToInt32(GridView1.DataKeys[ID_class].Value);
                cmdaa.ExecuteNonQuery();


                String selectaaa = "delete from [KCheckListLost] where [CheckList] =@KCheckListId";  //宣告SQL語法的字串，這邊可依照自行需求修改
                SqlCommand cmdaaa = new SqlCommand(selectaaa, connStrr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                //cmdaa.Parameters.Add("@KEngineeringListId", System.Data.SqlDbType.VarChar).Value = "KEngineeringListId";
                cmdaaa.Parameters.Add("@KCheckListId", SqlDbType.Int);
                cmdaaa.Parameters["@KCheckListId"].Value = Convert.ToInt32(GridView1.DataKeys[ID_class].Value);
                cmdaaa.ExecuteNonQuery();

                String selectaaaa = "delete from [KCheckListTime] where [CheckList] =@KCheckListId";  //宣告SQL語法的字串，這邊可依照自行需求修改
                SqlCommand cmdaaaa = new SqlCommand(selectaaaa, connStrr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                //cmdaa.Parameters.Add("@KEngineeringListId", System.Data.SqlDbType.VarChar).Value = "KEngineeringListId";
                cmdaaaa.Parameters.Add("@KCheckListId", SqlDbType.Int);
                cmdaaaa.Parameters["@KCheckListId"].Value = Convert.ToInt32(GridView1.DataKeys[ID_class].Value);
                cmdaaaa.ExecuteNonQuery();




                connStrr.Close();





                //SqlAll.DeleteCommand = "delete from [KEngineeringList] INNER JOIN [KEngineeringListItem] ON [KEngineeringList].[KEngineeringListId] = [KEngineeringListItem].[KEngineeringListId]  where [KEngineeringList].[KEngineeringListId] = @KEngineeringListId";
                //INNER JOIN KEngineeringList ON KCheckList.KCheckListEngineeringList = KEngineeringList.KEngineeringListId
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 已刪除');", true);
                GridView1.DataBind();
            }

           
            if (e.CommandName == "itemedit")
            {
                string ID = ((Label)GridView1.Rows[ID_class].FindControl("ID")).Text.Trim();
                Session["KCheckListId"] = ID;
                OpenNewWindow("KCheckListWItemEdit.aspx", "700", "900");
            }

            if (e.CommandName == "createPDF")
            {
                int UID = (int)GridView1.DataKeys[ID_class].Value;
                string ID = ((Label)GridView1.Rows[ID_class].FindControl("ID")).Text.Trim();
                Session["KCheckListId"] = UID.ToString();
                CreatePDF(UID.ToString());
            }



        }

        public void CreatePDF(string CheckListId)
        {
            String CompanyName = Session["CompanyName"].ToString();
            String DBName = Session["DatabaseName"].ToString();
            String Projectid = Session["ProjectCode"].ToString();
            String projectname;
            String Engineeringid;
            String Location;
            String Engineering;

            SqlConnection connStr = new SqlConnection(Utility.DBconnection.connect_string(DBName));

            SqlDataReader reader;   //宣告一個DataReader

            connStr.Open(); //開啟資料庫的連結
            String selectproject = "select* from ProjectM0 where PID = '" + Projectid + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmdproject = new SqlCommand(selectproject, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmdproject.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                                   //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                Label1.Text = reader.GetString(7);
            }
            reader.Close();

            //查位置跟自主檢查表ID
            String selectt = "select * from KCheckList where  KCheckListId = '" + CheckListId + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmdt = new SqlCommand(selectt, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmdt.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                             //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                //int KCheckListProjectid = (int)reader["KCheckListProject"];
                //ProjectidLabel.Text = KCheckListProjectid.ToString();

                //int KCheckListEngineeringListid = (int)reader["KCheckListEngineeringList"];
                //EngineeringidLabel.Text = KCheckListEngineeringListid.ToString();
                //Label2.Text = reader.GetString(3); //id
                Label4.Text = reader.GetString(3);
                //Label3.Text = reader.GetString(1); //位置
            }
            reader.Close();
            //查位置跟自主檢查表ID
            
            /** 查自主檢查表名稱
            String selectEngineering = "select * from KEngineeringList where  KEngineeringListId = '" + Label2.Text + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmdEngineering = new SqlCommand(selectEngineering, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmdEngineering.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                                       //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                Label4.Text = reader.GetString(1);
            }
            reader.Close();
            **/

            var doc1 = new Document(PageSize.A4, 50, 50, 80, 50);

            MemoryStream Memory = new MemoryStream();
            PdfWriter PdfWriter = PdfWriter.GetInstance(doc1, Memory);

            BaseFont btchinese = BaseFont.CreateFont(@"C:\Windows\Fonts\kaiu.ttf", BaseFont.IDENTITY_H, BaseFont.NOT_EMBEDDED);
            Font ChFont = new Font(btchinese, 12);
            Font ChFontt = new Font(btchinese, 18);

            doc1.Open();
            //doc1.Add(new Paragraph(10f, "test", ChFont));
            Chunk cc = new Chunk("" + CompanyName + "" + " \n", ChFontt);
            Paragraph pp = new Paragraph(cc);
            pp.Alignment = 1;
            doc1.Add(pp);

            Chunk c = new Chunk("自主檢查表 \n", ChFontt);
            Paragraph p = new Paragraph(c);
            p.Alignment = 1;
            doc1.Add(p);

            c = new Chunk("專案表單名稱：" + Label4.Text + "\n", ChFont);
            p = new Paragraph(c);
            doc1.Add(p);

          

            c = new Chunk("檢查位置：\n", ChFont);
            p = new Paragraph(c);
            doc1.Add(p);

            c = new Chunk("日期：\n", ChFont);
            p = new Paragraph(c);
            doc1.Add(p);


            PdfPTable table = new PdfPTable(3);
            table.TotalWidth = 475f;
            //fix the absolute width of the table
            table.LockedWidth = true;

            //relative col widths in proportions - 1/3 and 2/3
            float[] widths = new float[] { 20f, 4f, 4f };
            table.SetWidths(widths);
            table.HorizontalAlignment = 0;
            //leave a gap before and after the table
            table.SpacingBefore = 20f;
            table.SpacingAfter = 30f;
            /**
            PdfPCell cell = new PdfPCell(new Phrase("檢核表", ChFontt));
            cell.Colspan = 3;
            cell.Rowspan = 3;
            cell.HorizontalAlignment = 1; //0=Left, 1=Centre, 2=Right
            table.AddCell(cell);
            **/


            //表頭
            PdfPCell cell2 = new PdfPCell(new Phrase("檢查項目", ChFont));
            table.AddCell(cell2);

            cell2 = new PdfPCell(new Phrase("完成度", ChFont));
            table.AddCell(cell2);

           
            cell2 = new PdfPCell(new Phrase("備註", ChFont));
            table.AddCell(cell2);
            //表頭

            //施工前
            PdfPCell cell = new PdfPCell(new Phrase("施工前", ChFont));
            cell.Colspan = 3;
            cell.HorizontalAlignment = 1;
            table.AddCell(cell);



            int i = 1;

            String select1 = "select * from KCheckListItem where KCheckListId ='" + CheckListId + "' and KCheckListItemPhase='施工前'";
            //String select1 = "SELECT * FROM  chitemst INNER JOIN items ON chitemst.checkitemid = items.itemid where cplaceid ='" + Label8.Text + "' and phasee='施工前' ";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd1 = new SqlCommand(select1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd1.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                             //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法


            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                String itemname = reader.GetString(1);

                Label Label = new Label();
                Label.ID = "labl" + i;
                Label.Visible = false;

                int KCheckListItemId = (int)reader["KCheckListItemId"];
                Label.Text = KCheckListItemId.ToString();
                this.Form.Controls.Add(Label);

               

               


                Label labell = new Label();
                labell.ID = "labll" + i;

                Label labellc = new Label();
                labellc.ID = "labllc" + i;

                Label labelld = new Label();
                labelld.ID = "lablld" + i;

                Label labelle = new Label();
                labelle.ID = "lablle" + i;

            
              


                PdfPCell cell3 = new PdfPCell(new Phrase(itemname, ChFont));
                table.AddCell(cell3);


                cell3 = new PdfPCell(new Phrase(labell.Text, ChFont));
                table.AddCell(cell3);

                cell3 = new PdfPCell(new Phrase(labelle.Text, ChFont));
                table.AddCell(cell3);

               


                i = i + 1;

            }
            reader.Close();



            //施工前

            //施工中
            cell = new PdfPCell(new Phrase("施工中", ChFont));
            cell.Colspan = 3;
            cell.HorizontalAlignment = 1;
            table.AddCell(cell);

            String select3 = "select * from KCheckListItem where KCheckListId ='" + CheckListId + "' and KCheckListItemPhase='施工中'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd3 = new SqlCommand(select3, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd3.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                String itemname = reader.GetString(1);

                Label Label = new Label();
                Label.ID = "labl" + i;
                Label.Visible = false;

                int KCheckListItemId = (int)reader["KCheckListItemId"];
                Label.Text = KCheckListItemId.ToString();
                this.Form.Controls.Add(Label);

                Label labell = new Label();
                labell.ID = "labll" + i;

                Label labellc = new Label();
                labellc.ID = "labllc" + i;

                Label labelld = new Label();
                labelld.ID = "lablld" + i;

                Label labelle = new Label();
                labelle.ID = "lablle" + i;

             

                PdfPCell cell3 = new PdfPCell(new Phrase(itemname, ChFont));
                table.AddCell(cell3);


                cell3 = new PdfPCell(new Phrase(labell.Text, ChFont));
                table.AddCell(cell3);

                cell3 = new PdfPCell(new Phrase(labelle.Text, ChFont));
                table.AddCell(cell3);

           


                i = i + 1;


            }

            reader.Close();
            //施工中

            //施工後
            cell = new PdfPCell(new Phrase("施工後", ChFont));
            cell.Colspan = 3;
            cell.HorizontalAlignment = 1;
            table.AddCell(cell);

            String select4 = "select * from KCheckListItem where KCheckListId ='" + CheckListId + "' and KCheckListItemPhase='施工後'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd4 = new SqlCommand(select4, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd4.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                String itemname = reader.GetString(1);

                Label Label = new Label();
                Label.ID = "labl" + i;
                Label.Visible = false;

                int KCheckListItemId = (int)reader["KCheckListItemId"];
                Label.Text = KCheckListItemId.ToString();
                this.Form.Controls.Add(Label);


                Label labell = new Label();
                labell.ID = "labll" + i;

                Label labellc = new Label();
                labellc.ID = "labllc" + i;

           

                


                PdfPCell cell3 = new PdfPCell(new Phrase(itemname, ChFont));
                table.AddCell(cell3);


                cell3 = new PdfPCell(new Phrase(labell.Text, ChFont));
                table.AddCell(cell3);


                cell3 = new PdfPCell(new Phrase(labellc.Text, ChFont));
                table.AddCell(cell3);


                i = i + 1;

            }

            reader.Close();
            //施工後




            doc1.Add(table);

            c = new Chunk("檢查人員簽名：", ChFontt);
            p = new Paragraph(c);
            doc1.Add(p);



            doc1.Close();
            string fileName = Label1.Text + Label4.Text  + "空白單.pdf";

            Response.Clear();
            Response.AddHeader("content-disposition", "attachment;filename=" + fileName);
            Response.ContentType = "application/octet-stream";
            Response.OutputStream.Write(Memory.GetBuffer(), 0, Memory.GetBuffer().Length);
            Response.OutputStream.Flush();
            Response.OutputStream.Close();
            Response.Flush();
            Response.End();





        }

        public void OpenNewWindow(string url, string height, string width)
        {

            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=" + height + ",width=" + width + "";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}', 'yourWin', '{1}');</script>", url, winFeatures));

        }

        protected void Reload_Click(object sender, ImageClickEventArgs e)
        {
            Response.AddHeader("Refresh", "0");
        }

    }



}