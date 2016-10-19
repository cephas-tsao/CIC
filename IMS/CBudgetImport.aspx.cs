using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using DAL;
using Microsoft.Office.Interop.Excel;
using Microsoft.Office.Interop;

namespace IMS
{
    public partial class CBudgetImport : System.Web.UI.Page
    {
        string upload_excel_Dir = "";
        protected void Page_Load(object sender, EventArgs e)
        {
          
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["ProjectCode"] == null)
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請選擇專案');", true);

            }
            //SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
             upload_excel_Dir = DAL.SystemSet.savePath(Session["DatabaseName"].ToString());
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if ((Pnl_XML.Visible == false))
            {
                Pnl_XML.Visible = true;
                Pnl_EXCEL.Visible = false;
            }
            else
            {
                Pnl_XML.Visible = false;
            }
        }
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            if ((Pnl_EXCEL.Visible == false))
            {
                Pnl_EXCEL.Visible = true;
                Pnl_XML.Visible = false;
            }
            else
            {
                Pnl_EXCEL.Visible = false;
            }

        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if ((Panel1.Visible == false))
            {
                Panel1.Visible = true;
                Pnl_EXCEL.Visible = false;
            }
            else
            {
                Panel1.Visible = false;
            }
        }
        protected void LoadContent()
        {
           
            XmlDocument xd = new XmlDocument();

            //Load裡放xml的路徑就可去讀取
            xd.Load("ABC.xml");

            //可將xml裡的<Flash>元素都存到nodelist裡
            XmlNodeList nodelist = xd.SelectNodes("//Flash");

            //再用迴圈去跑出來
            for (int i = 0; i < nodelist.Count; i++)
            {
                //去讀第一個<Flash>元素裡的<XML_Sample>元素裡的內容
                //InnerText就是讀元素裡的內容<Flash>我是內容</Flash>
                //而InnerXml是讀元素裡的所有XML的樣子(包含元素，屬性，內容)
                //另外這裡是用SelectSingleNode去讀單一個Node
                //而上面的是用SelectNodes去讀多個Node
                StreamReader sr = new StreamReader(nodelist[i].SelectSingleNode("XML_Sample").InnerText, Encoding.UTF8);

                StringBuilder mysb = new StringBuilder();

                while (sr.Peek() != -1)
                {
                    mysb.Append(sr.ReadLine());
                    mysb.Append(Environment.NewLine);
                }



                sr.Dispose();

            }

            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load("檔案位置XMLFile.xml");
            //xmlDoc.LoadXml(""); 讀純文字xml格式
            for (int i = 0; i <= xmlDoc.SelectSingleNode("dataXML").ChildNodes.Count - 1; i++)
            {
                Response.Write("Name：" + xmlDoc.SelectNodes("//email")[i].Name + "<br/ >");
                Response.Write("InnerText：" + xmlDoc.SelectNodes("//email")[i].InnerText + "<br /><br />");
            }

            string SQLInsert = "RFQ_Code,Name,Type,Path";
            System.Data.DataTable DataTableBox = new System.Data.DataTable();
            foreach (string DataName in SQLInsert.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }

            DataRow DataTableDr = DataTableBox.NewRow();
            DataTableBox.Rows.Add(DataTableDr);
        }
        /// <summary>
        /// 得到Xml中每個XmlElement的值
        /// </summary>
        /// <param name="xnTopNodes"></param>
        static void XmlNavigator(XmlElement xnTopNodes)
        {
            /*
             原理：             
             循環每個XmlElement,如果有子XmlElement,則再次循環子XmlElement。
             判斷子XmlElement中的第一個值是否是最后一個子節點。如果是,說明已到最底層XmlElement，得到其值。
             如果不是，說明還有子XmlElement，繼續循環。
             */
            for (int iTopCou = 0; iTopCou < xnTopNodes.ChildNodes.Count; iTopCou++)
            {
                if (xnTopNodes.ChildNodes[iTopCou].NodeType == XmlNodeType.Element)
                {
                    XmlElement xeValue = (XmlElement)xnTopNodes.ChildNodes[iTopCou];
                    //判斷當有子node且子node的第一個值也是其最后一個值時。則表明為最最底層XmlElement，將值保存到泛型中
                    //不是則繼續遍歷
                    if (xeValue.HasChildNodes && xeValue.ChildNodes[0] != xeValue.LastChild)
                    {
                        XmlNavigator(xeValue);
                        string data = xeValue.GetAttribute("Description");
                     
                    }
                    else
                    {
                        //dNodeListValue.Add(xeValue.Name.Trim(), xeValue.InnerText.Trim());
                    }
                }
            }
        }
        protected void BtnImport_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                String fileName = Server.MapPath(FileUpload1.FileName); //Path.GetFullPath(FileUpload1.PostedFile.FileName); //FileUpload1.FileName;
                string database = Session["DatabaseName"].ToString();
                String savepath = DAL.SystemSet.savePath(Session["DatabaseName"].ToString());
                string DataType = "";
                XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.Load(fileName);
                XmlNavigator(xmlDoc.DocumentElement);
                XmlNamespaceManager nameSpace = new XmlNamespaceManager(xmlDoc.NameTable);
                nameSpace.AddNamespace("ns", "http://pcstd.pcc.gov.tw/2003/eTender"); //ns是自己取的，下面的Xpath再套上去 
                nameSpace.AddNamespace("mml", "http://www.w3.org/1998/Math/MathML"); //soapNs是自己取的 
                nameSpace.AddNamespace("location", "http://pcstd.pcc.gov.tw/2003/eTender eTender.1.J.2004.D.xsd");
                #region 新增datatable塞入匯入之值
                string SQLInsert = "PID,UpperWID,SortNum,ItemName,LayerNum,ItemKind,unit,CNumber,Notes";
                string SQLProRes = "PID,ItemName,Unit,Code,Complex,CPrice,Notes,ItemKind";
                System.Data.DataTable DataTableBox = new System.Data.DataTable();
                System.Data.DataTable DtRs = new System.Data.DataTable();

                foreach (string DataName in SQLProRes.Split(','))
                {
                    DataTableBox.Columns.Add(DataName, typeof(string));
                }

                foreach (string DataName in SQLInsert.Split(','))
                {
                    DtRs.Columns.Add(DataName, typeof(string));
                }
                DataRow DataTableDr = DataTableBox.NewRow();
                DataRow DrRs = DtRs.NewRow();
                #endregion
                XmlElement elm1 = xmlDoc.DocumentElement;
                for (int iTopCou = 0; iTopCou < elm1.ChildNodes.Count; iTopCou++)
                {
                    DataType = elm1.GetAttribute("documentType");
                    if (DataType != "budget")
                    {
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('來源XML檔並非預算書\n請重新選擇檔案');", true);
                        Response.Redirect("CBudgetImport.aspx");
                    }
                    string Item = elm1.GetAttribute("PayItem");
                    if (elm1.ChildNodes[iTopCou].NodeType == XmlNodeType.Element)
                    {
                        XmlElement xeValue = (XmlElement)elm1.ChildNodes[iTopCou];
                        //判斷當有子node且子node的第一個值也是其最后一個值時。則表明為最最底層XmlElement，將值保存到泛型中
                        //不是則繼續遍歷

                        if (xeValue.HasChildNodes && xeValue.ChildNodes[0] != xeValue.LastChild)
                        {

                            if (xeValue.Name == "CostBreakdownList")
                            {
                                #region 使用SelectSingleNode方式匯入xml資料
                                //XmlNavigator(xeValue);

                                //string ItemKind = xeValue.GetElementsByTagName("Description").ToString();
                                //XmlNode root = doc.DocumentElement;

                                XmlNode gpStatus = xeValue.SelectSingleNode("//ns:WorkItem", nameSpace);
                                XmlNodeList elemList = xeValue.GetElementsByTagName("book");
                                //for (int i = 0; i < gpStatus.ChildNodes.Count; i++)
                                //{

                                //XmlNode elemList1 = xeValue.SelectSingleNode("//ns:WorkItem/WorkItem", nameSpace);
                                //for (int j = 0; i < elemList1.ChildNodes.Count; j++)
                                //{
                                //    //string attrVal = elemList1[j].Attributes["lang"].Value;
                                //    //string attrVal1 = elemList1[j].Attributes["auth"].Value;

                                //    //}
                                //    //listView1.Items.Add(lvi);
                                //}
                                //}


                                //if (gpStatus.ChildNodes[i].Name == "Description")
                                //{

                                //    string ItemName = gpStatus.ChildNodes[i].InnerText;

                                //}
                                //if (gpStatus.ChildNodes[i].Name == "Unit")
                                //{

                                //    string Unit = gpStatus.ChildNodes[i].InnerText;

                                //}
                                //if (gpStatus.ChildNodes[i].Name == "Quantity")
                                //{

                                //    string Quantity = gpStatus.ChildNodes[i].InnerText;

                                //}
                                //if (gpStatus.ChildNodes[i].Name == "Price")
                                //{

                                //    string Price = gpStatus.ChildNodes[i].InnerText;

                                //}
                                //if (gpStatus.ChildNodes[i].Name == "Remark")
                                //{

                                //    string Remark = gpStatus.ChildNodes[i].InnerText;

                                //}

                                //}
                                #endregion
                                foreach (XmlNode node in xeValue.ChildNodes)
                                {

                                    string ItemKind = node.Attributes[2].InnerText == "analysis" ? "mainitem" : "workitem";
                                    string ItemName = node.ChildNodes[0].InnerText;
                                    string unit = node.ChildNodes[2].InnerText;
                                    string Quantity = node.ChildNodes[4].InnerText;
                                    string CPrice = node.ChildNodes[5].InnerText;
                                    string Notes = node.ChildNodes[6].InnerText;
                                    string ItemCode = node.Attributes[0].InnerText;
                                    string Code = ItemCode.Substring(0, 1);
                                    string CodeName = Code == "0" ? "工項" : Code == "L" ? "人力" : Code == "W" ? "機具" : Code == "E" ? "雜項" : "";
                                    DataTableDr["PID"] = Session["ProjectCode"].ToString();
                                    DataTableDr["ItemName"] = ItemName;
                                    //DataTableDr["ItemKind"] = ItemKind;
                                    DataTableDr["unit"] = unit;
                                    DataTableDr["CPrice"] = CPrice;
                                    DataTableDr["ItemKind"] = CodeName;
                                    DataTableDr["Notes"] = Notes;

                                    DataTableBox.Rows.Add(DataTableDr);
                                    WebModel.SaveAction(database, "Pro_Resource", DataTableBox);

                                    DataTableBox.Rows.Clear();
                                    //string ItemKind1= node.SelectNodes("a:wavetrack", nsman); 
                                    //XmlNode modelNode = applicianceNode.SelectSingleNode("Model").InnerText = SomeOtherValue;
                                    //string a= node.ChildNodes[0].SelectSingleNode("WorkItem").InnerText;
                                    foreach (XmlNode childNode in node.ChildNodes)
                                    {
                                        //string a=childNode.ChildNodes[0].InnerText;


                                        if (childNode.Name == "WorkItem")
                                        {
                                            string ItemKind1 = childNode.Attributes[1].InnerText == "analysis" ? "mainitem" : "workitem";
                                            string ItemName1 = childNode.ChildNodes[0].InnerText;
                                            string unit1 = childNode.ChildNodes[2].InnerText;
                                            string Quantity1 = childNode.ChildNodes[4].InnerText;
                                            string CPrice1 = childNode.ChildNodes[5].InnerText;
                                            string Amount1 = childNode.ChildNodes[6].InnerText;
                                            string Notes1 = childNode.ChildNodes[7].InnerText;
                                            string ItemCode1 = childNode.Attributes[0].InnerText;
                                            string Code1 = ItemCode1.Substring(0, 1);
                                            string CodeName1 = Code1 == "0" ? "工項" : Code1 == "L" ? "人力" : Code1 == "W" ? "機具" : Code1 == "E" ? "雜項" : "";
                                            DataTableDr["PID"] = Session["ProjectCode"].ToString();
                                            DataTableDr["ItemName"] = ItemName1;
                                            //DataTableDr["ItemKind"] = ItemKind1;
                                            DataTableDr["unit"] = unit1;
                                            DataTableDr["CPrice"] = CPrice1;
                                            DataTableDr["ItemKind"] = CodeName1;
                                            //DataTableDr["Amount"] = Amount1;
                                            DataTableDr["Notes"] = Notes1;
                                            DataTableBox.Rows.Add(DataTableDr);
                                            WebModel.SaveAction(database, "Pro_Resource", DataTableBox);
                                            DataTableBox.Rows.Clear();


                                        }
                                    }

                                }
                                //string event1 =  xeValue("WorkItem");
                                //String StrAttr = xeValue.Name.ToString();
                                ////String StrValue = elm1.Attributes[xeValue.Name.ToString()].Value;
                                //String StrInnerText = elm1.InnerText;

                            }

                            if (xeValue.Name == "DetailList")
                            {
                                int i = 0;
                                foreach (XmlNode node in xeValue.ChildNodes)
                                {

                                    string ItemKind = node.Attributes[3].InnerText;
                                    string ItemName = node.ChildNodes[0].InnerText;
                                    string unit = node.ChildNodes[2].InnerText;
                                    string Quantity = node.ChildNodes[4].InnerText;
                                    string CPrice = node.ChildNodes[5].InnerText;
                                    string Notes = node.ChildNodes[7].InnerText;
                                    int CWID = WebModel.MaxID(database, "CBudget_WBS");
                                    int SortNum = i + 1;
                                    DrRs["PID"] = Session["ProjectCode"].ToString();
                                    DrRs["ItemName"] = ItemName;
                                    DrRs["ItemKind"] = ItemKind;
                                    DrRs["unit"] = unit;
                                    DrRs["CNumber"] = Quantity;
                                    DrRs["LayerNum"] = "1";
                                    DrRs["Notes"] = Notes;
                                    DrRs["SortNum"] = SortNum;
                                    DtRs.Rows.Add(DrRs);
                                    WebModel.SaveAction(database, "CBudget_WBS", DtRs);
                                    WebModel.SaveAction(database, "EBudget_WBS", DtRs);
                                    DtRs.Rows.Clear();
                                    //if (node.Attributes[3].InnerText == "analysis" || node.Attributes[3].InnerText == "mainItem" )
                                    //{
                                    i++;
                                    int j = 0;
                                    foreach (XmlNode childNode in node.ChildNodes)
                                    {
                                        if (childNode.Name == "PayItem")
                                        {

                                            string ItemKind1 = childNode.Attributes[3].InnerText;
                                            string ItemName1 = childNode.ChildNodes[0].InnerText;
                                            string unit1 = childNode.ChildNodes[2].InnerText;
                                            string Quantity1 = childNode.ChildNodes[4].InnerText;
                                            string CPrice1 = childNode.ChildNodes[5].InnerText;
                                            string Notes1 = childNode.ChildNodes[7].InnerText;
                                            int SortNum1 = j + 1;
                                            int CWID1 = WebModel.MaxID(database, "CBudget_WBS");
                                            DrRs["UpperWID"] = CWID;
                                            DrRs["LayerNum"] = "2";
                                            DrRs["PID"] = Session["ProjectCode"].ToString();
                                            DrRs["ItemName"] = ItemName1;
                                            DrRs["ItemKind"] = ItemKind1;
                                            DrRs["unit"] = unit1;
                                            DrRs["CNumber"] = Quantity1;
                                            DrRs["LayerNum"] = "2";
                                            DrRs["Notes"] = Notes1;
                                            DrRs["SortNum"] = SortNum1;
                                            DtRs.Rows.Add(DrRs);
                                            WebModel.SaveAction(database, "CBudget_WBS", DtRs);
                                            WebModel.SaveAction(database, "EBudget_WBS", DtRs);
                                            DtRs.Rows.Clear();
                                            //if (childNode.Name == "PayItem")
                                            //        {
                                            j++;
                                            int k = 0;
                                            foreach (XmlNode child in childNode.ChildNodes)
                                            {
                                                if (child.Name == "PayItem")
                                                {

                                                    string ItemKind2 = child.Attributes[3].InnerText;
                                                    string ItemName2 = child.ChildNodes[0].InnerText;
                                                    string unit2 = child.ChildNodes[2].InnerText;
                                                    string Quantity2 = child.ChildNodes[4].InnerText;
                                                    string CPrice2 = child.ChildNodes[5].InnerText;
                                                    string Amount2 = child.ChildNodes[6].InnerText;
                                                    string Notes2 = child.ChildNodes[7].InnerText;
                                                    int SortNum2 = k + 1;
                                                    int CWID2 = WebModel.MaxID(database, "CBudget_WBS");
                                                    DrRs["PID"] = Session["ProjectCode"].ToString();
                                                    DrRs["UpperWID"] = CWID1;
                                                    DrRs["LayerNum"] = "3";
                                                    DrRs["ItemName"] = ItemName2;
                                                    DrRs["ItemKind"] = ItemKind2;
                                                    DrRs["unit"] = unit2;
                                                    DrRs["CNumber"] = Quantity2;
                                                    DrRs["LayerNum"] = "3";
                                                    DrRs["Notes"] = Notes2;
                                                    DrRs["SortNum"] = SortNum2;
                                                    DtRs.Rows.Add(DrRs);
                                                    WebModel.SaveAction(database, "CBudget_WBS", DtRs);
                                                    WebModel.SaveAction(database, "EBudget_WBS", DtRs);
                                                    DtRs.Rows.Clear();
                                                    k++;
                                                }

                                            }

                                            bool result = DAL.CBLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString());
                                            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "UpdtItemOrder();", true);//ajax 新增階層碼1

                                        }

                                    }
                                }
                            }
                        }

                    }
                }


                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 匯入完成');", true);
            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請先選擇檔案');", true);

            }
        }
        /*** Excel Interop reference ***/
        Microsoft.Office.Interop.Excel.Application xlApp = null;
        Workbook wb = null;
        Worksheet ws = null;
        Range aRange = null;
        string excel_filePath = "";
        //string upload_excel_Dir = @"D:\web\myWeb\";
      
        //*******************************/
        protected void BtnImportExcel_Click(object sender, EventArgs e)
        {
           
            //要上傳Excel檔的Server端 檔案總管目錄


            try
            {
                excel_filePath = SaveFileAndReturnPath();//先上傳EXCEL檔案給Server

                if (this.xlApp == null)
                {
                    this.xlApp = new Microsoft.Office.Interop.Excel.Application();
                }
                //打開Server上的Excel檔案
                this.xlApp.Workbooks.Open(excel_filePath, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
                this.wb = xlApp.Workbooks[1];//第一個Workbook
                this.wb.Save();
                if (FileUpload2.HasFile)
                {
                    if (!checkEcxelTitle((Worksheet)xlApp.Worksheets[1]) || !checkEcxelTitleRes((Worksheet)xlApp.Worksheets[2]))
                    {

                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' EXCEL表格式錯誤!!!');", true);
                    }
                    else if (!checkEcxelData((Worksheet)xlApp.Worksheets[1]) || !checkEcxelDataRes((Worksheet)xlApp.Worksheets[2]))
                    {
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' EXCEL表數字錯誤!!!');", true);
                    }
                    else if (!checkEcxelDataItemKind((Worksheet)xlApp.Worksheets[1]))
                    {
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('工項種類不能為空!!!');", true);
                    }
                    else
                    {

                        SaveOrInsertSheet(excel_filePath, (Worksheet)xlApp.Worksheets[1]);
                        ClientScript.RegisterClientScriptBlock(typeof(System.Web.UI.Page), "匯入完成", "alert('匯入完成');", true);
                    }

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                xlApp.Workbooks.Close();
                xlApp.Quit();
                try
                {
                    //刪除 Windows工作管理員中的Excel.exe 處理緒.
                    System.Runtime.InteropServices.Marshal.ReleaseComObject(this.xlApp);
                    //System.Runtime.InteropServices.Marshal.ReleaseComObject(this.ws);
                    System.Runtime.InteropServices.Marshal.ReleaseComObject(this.aRange);
                }
                catch { }
                this.xlApp = null;
                this.wb = null;
                this.ws = null;
                this.aRange = null;


                //是否刪除Server上的Excel檔
                bool isDeleteFileFromServer = true;
                if (isDeleteFileFromServer)
                {
                    System.IO.File.Delete(excel_filePath);
                }


                GC.Collect();
            }
           
        }
        #region 儲存EXCEL檔案給Server
        private string SaveFileAndReturnPath()
        {
            string return_file_path = "";//上傳的Excel檔在Server上的位置
            if (FileUpload2.FileName != "")
            {
                return_file_path = System.IO.Path.Combine(this.upload_excel_Dir, Guid.NewGuid().ToString() + ".xls");

                FileUpload2.SaveAs(return_file_path);
            }
            return return_file_path;
        }
        #endregion
        public bool checkEcxelData(Worksheet ws)
        {
            int rowIndex = 2;
            decimal n;
            bool result = false;
            //取得一列的範圍
            this.aRange = ws.get_Range("A" + rowIndex.ToString(), "K" + rowIndex.ToString());
            while (((object[,])this.aRange.Value2)[1, 1] != null)//用this.aRange.Cells[1, 1]來取值的方式似乎會造成無窮迴圈？
            {
                //範圍裡第1格的值
                string cell1 = ((object[,])this.aRange.Value2)[1, 1] != null ? ((object[,])this.aRange.Value2)[1, 1].ToString() : "";               
                string cell2 = ((object[,])this.aRange.Value2)[1, 2] != null ? ((object[,])this.aRange.Value2)[1, 2].ToString() : "";
                string cell3 = ((object[,])this.aRange.Value2)[1, 3] != null ? ((object[,])this.aRange.Value2)[1, 3].ToString() : "";
                string cell4 = ((object[,])this.aRange.Value2)[1, 4] != null ? ((object[,])this.aRange.Value2)[1, 4].ToString() : "";
                string cell5 = ((object[,])this.aRange.Value2)[1, 5] != null ? ((object[,])this.aRange.Value2)[1, 5].ToString() : "";
                string cell6 = ((object[,])this.aRange.Value2)[1, 6] != null ? ((object[,])this.aRange.Value2)[1, 6].ToString() : "";
                string cell7 = ((object[,])this.aRange.Value2)[1, 7] != null ? ((object[,])this.aRange.Value2)[1, 7].ToString() : "";
                string cell8 = ((object[,])this.aRange.Value2)[1, 8] != null ? ((object[,])this.aRange.Value2)[1, 8].ToString() : "";
                string cell9 = ((object[,])this.aRange.Value2)[1, 9] != null ? ((object[,])this.aRange.Value2)[1, 9].ToString() : "";
                string cell10 = ((object[,])this.aRange.Value2)[1, 10] != null ? ((object[,])this.aRange.Value2)[1, 10].ToString() : "";
                string cell11 = ((object[,])this.aRange.Value2)[1, 11] != null ? ((object[,])this.aRange.Value2)[1, 11].ToString() : "";

                if (cell6 != "")
                {

                    bool isNumeric = decimal.TryParse(cell6, out n);
                    if (isNumeric) { result = true; } else { result = false; return result; }


                }
                if (cell7 != "")
                {
                    bool isNumeric = decimal.TryParse(cell7, out n);
                    if (isNumeric) { result = true; } else 
                    { result = false; return result; }

                }
                if (cell8 != "")
                {

                    bool isNumeric = decimal.TryParse(cell8, out n);
                    if (isNumeric) { result = true; } else { result = false; return result; }
                }

                rowIndex++;
                this.aRange = ws.get_Range("A" + rowIndex.ToString(), "K" + rowIndex.ToString());
            }
            return result;
        }
        public bool checkEcxelDataItemKind(Worksheet ws)
        {
            int rowIndex = 2;           
            bool result = true;
            //取得一列的範圍
            this.aRange = ws.get_Range("A" + rowIndex.ToString(), "K" + rowIndex.ToString());
            while (((object[,])this.aRange.Value2)[1, 1] != null)//用this.aRange.Cells[1, 1]來取值的方式似乎會造成無窮迴圈？
            {
                //範圍裡第1格的值
             
                string cell9 = ((object[,])this.aRange.Value2)[1, 9] != null ? ((object[,])this.aRange.Value2)[1, 9].ToString() : "";
                string cell10 = ((object[,])this.aRange.Value2)[1, 10] != null ? ((object[,])this.aRange.Value2)[1, 10].ToString() : "";
                string cell11 = ((object[,])this.aRange.Value2)[1, 11] != null ? ((object[,])this.aRange.Value2)[1, 11].ToString() : "";

                if (cell9 == "")
                {

                   result = false; 
                    return result; 


                }
               

                rowIndex++;
                this.aRange = ws.get_Range("A" + rowIndex.ToString(), "K" + rowIndex.ToString());
            }
            return result;
        }
        public bool checkEcxelDataRes(Worksheet ws)
        {
            int rowIndex = 2;
            decimal n;
            bool result = false;
           
            this.aRange = ws.get_Range("A" + rowIndex.ToString(), "K" + rowIndex.ToString());
            while (((object[,])this.aRange.Value2)[1, 1] != null)
            {
               
                string cell3 = ((object[,])this.aRange.Value2)[1, 3] != null ? ((object[,])this.aRange.Value2)[1, 3].ToString() : "";              
                string cell7 = ((object[,])this.aRange.Value2)[1, 7] != null ? ((object[,])this.aRange.Value2)[1, 7].ToString() : "";
                string cell8 = ((object[,])this.aRange.Value2)[1, 8] != null ? ((object[,])this.aRange.Value2)[1, 8].ToString() : "";
                string cell9 = ((object[,])this.aRange.Value2)[1, 9] != null ? ((object[,])this.aRange.Value2)[1, 9].ToString() : "";
              

                if (cell3 != "")
                {

                    bool isNumeric = decimal.TryParse(cell3, out n);
                    if (isNumeric) { result = true; } else { result = false; return result; }


                }
                if (cell7 != "")
                {

                    bool isNumeric = decimal.TryParse(cell7, out n);
                    if (isNumeric) { result = true; } else { result = false; return result; }


                }
                if (cell8 != "")
                {
                    bool isNumeric = decimal.TryParse(cell8, out n);
                    if (isNumeric) { result = true; } else { result = false; return result; }

                }
                if (cell9 != "")
                {

                    bool isNumeric = decimal.TryParse(cell9, out n);
                    if (isNumeric) { result = true; } else { result = false; return result; }
                }

                rowIndex++;
                this.aRange = ws.get_Range("A" + rowIndex.ToString(), "K" + rowIndex.ToString());
            }
            return result;
        }
        public bool checkEcxelTitle(Worksheet ws)
        {
            bool result=false;
            this.aRange = ws.get_Range("A1", "K1");
            string layer = ((object[,])this.aRange.Value2)[1, 1] != null ? ((object[,])this.aRange.Value2)[1, 1].ToString() : "";
            string Order = ((object[,])this.aRange.Value2)[1, 2] != null ? ((object[,])this.aRange.Value2)[1, 2].ToString() : "";
            string UpItemName = ((object[,])this.aRange.Value2)[1, 3] != null ? ((object[,])this.aRange.Value2)[1, 3].ToString() : "";
            string ItemName = ((object[,])this.aRange.Value2)[1, 4] != null ? ((object[,])this.aRange.Value2)[1, 4].ToString() : "";
            string unit = ((object[,])this.aRange.Value2)[1, 5] != null ? ((object[,])this.aRange.Value2)[1, 5].ToString() : "";
            string CNumber = ((object[,])this.aRange.Value2)[1, 6] != null ? ((object[,])this.aRange.Value2)[1, 6].ToString() : "";
            string CUnitPrice = ((object[,])this.aRange.Value2)[1, 7] != null ? ((object[,])this.aRange.Value2)[1, 7].ToString() : "";
            string ItemKind = ((object[,])this.aRange.Value2)[1, 9] != null ? ((object[,])this.aRange.Value2)[1, 9].ToString() : "";
           
               if (layer == "階層數" && Order == "項次" && ItemName == "工項名稱" && unit == "單位" && CNumber == "數量" && CUnitPrice == "單價" && ItemKind == "工項種類" && UpItemName == "上層工項名稱")
               {
                   result = true;
               }
               else
               {
                   result = false;
                   return result;
               }          
          
            return result;
        }
        public bool checkEcxelTitleRes(Worksheet ws)
        {
            bool result = false;
            this.aRange = ws.get_Range("A1", "k1");
            string UpItem = ((object[,])this.aRange.Value2)[1, 1] != null ? ((object[,])this.aRange.Value2)[1, 1].ToString() : "";
            string UpUnit = ((object[,])this.aRange.Value2)[1, 2] != null ? ((object[,])this.aRange.Value2)[1, 2].ToString() : "";
            string AnaNumber = ((object[,])this.aRange.Value2)[1, 3] != null ? ((object[,])this.aRange.Value2)[1, 3].ToString() : "";
            string ItemName1 = ((object[,])this.aRange.Value2)[1, 4] != null ? ((object[,])this.aRange.Value2)[1, 4].ToString() : "";
            string unit = ((object[,])this.aRange.Value2)[1, 5] != null ? ((object[,])this.aRange.Value2)[1, 5].ToString() : "";
            string ReKind = ((object[,])this.aRange.Value2)[1, 6] != null ? ((object[,])this.aRange.Value2)[1, 6].ToString() : "";
            string QR = ((object[,])this.aRange.Value2)[1, 7] != null ? ((object[,])this.aRange.Value2)[1, 7].ToString() : "";
            string UnitPrice = ((object[,])this.aRange.Value2)[1, 8] != null ? ((object[,])this.aRange.Value2)[1, 8].ToString() : "";
            string ReCode = ((object[,])this.aRange.Value2)[1, 10] != null ? ((object[,])this.aRange.Value2)[1, 10].ToString() : "";


            if (UpItem == "連結所屬工項名稱" && UpUnit == "連結所屬工項單位" && ItemName1 == "工料名稱" && unit == "單位" && ReKind == "工料種類" && QR == "數量/工率" && UnitPrice == "單價" && ReCode == "資源編碼")
            {
                result = true;
            }
            else
            {
                result = false;
                return result;
            }

            return result;
        }
        #region 把Excel資料Insert into Table
        private void SaveOrInsertSheet(string excel_filename, Worksheet ws)
        {
            System.Data.DataTable DataTableBox = new System.Data.DataTable();
            System.Data.DataTable Dtvs = new System.Data.DataTable();
           string SQLString = "PID,LayerCode,LayerNum,UpperWID,SortNum,ItemOrder,ItemName,Unit,ItemKind,CNumber,CUnitPrice,Notes";
            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }
            foreach (string DataName in SQLString.Split(','))
            {
                Dtvs.Columns.Add(DataName, typeof(string));
            }

            //後台功能，必需要有的欄位名稱               
            string database = Session["DatabaseName"].ToString();
            DataRow DataTableDr = DataTableBox.NewRow();
            
            //要開始讀取的起始列(微軟Worksheet是從1開始算)
            
                string DelSQL = "Delete CBudget_WBS where pid=" + Session["ProjectCode"].ToString();
                string DelSQL1 = "Delete Pro_Resource where pid=" + Session["ProjectCode"].ToString();
                bool result = WebModel.SQLAction(database, DelSQL);
                bool result1 = WebModel.SQLAction(database, DelSQL1);
                
                int rowIndex = 2;
                int sort = 1;
                //取得一列的範圍
                this.aRange = ws.get_Range("A" + rowIndex.ToString(), "K" + rowIndex.ToString());

                //判斷Row範圍裡第1格有值的話，迴圈就往下跑
                while (((object[,])this.aRange.Value2)[1, 1] != null)//用this.aRange.Cells[1, 1]來取值的方式
                {
                    //範圍裡第1格的值
                    string cell1 = ((object[,])this.aRange.Value2)[1, 1] != null ? ((object[,])this.aRange.Value2)[1, 1].ToString() : "";

                    //範圍裡第2格的值
                    string cell2 = ((object[,])this.aRange.Value2)[1, 2] != null ? ((object[,])this.aRange.Value2)[1, 2].ToString() : "";

                    //範圍裡第3格的值
                    string cell3 = ((object[,])this.aRange.Value2)[1, 3] != null ? ((object[,])this.aRange.Value2)[1, 3].ToString() : "";
                    string cell4 = ((object[,])this.aRange.Value2)[1, 4] != null ? ((object[,])this.aRange.Value2)[1, 4].ToString() : "";
                    string cell5 = ((object[,])this.aRange.Value2)[1, 5] != null ? ((object[,])this.aRange.Value2)[1, 5].ToString() : "";
                    string cell6 = ((object[,])this.aRange.Value2)[1, 6] != null ? ((object[,])this.aRange.Value2)[1, 6].ToString() : "";
                    string cell7 = ((object[,])this.aRange.Value2)[1, 7] != null ? ((object[,])this.aRange.Value2)[1, 7].ToString() : "";
                    string cell8 = ((object[,])this.aRange.Value2)[1, 8] != null ? ((object[,])this.aRange.Value2)[1, 8].ToString() : "";
                    string cell9 = ((object[,])this.aRange.Value2)[1, 9] != null ? ((object[,])this.aRange.Value2)[1, 9].ToString() : "";
                    string cell10 = ((object[,])this.aRange.Value2)[1, 10] != null ? ((object[,])this.aRange.Value2)[1, 10].ToString() : "";
                    string cell11 = ((object[,])this.aRange.Value2)[1, 11] != null ? ((object[,])this.aRange.Value2)[1, 11].ToString() : "";

                    
                
                    //再對各Cell處理完商業邏輯後，Insert into Table
                    DataTableDr["PID"] = Session["ProjectCode"].ToString();
                    DataTableDr["LayerNum"] = cell1 !=""?int.Parse(cell1):0;
                    if(cell3 !="")
                    {
                        string search = "select * from CBudget_WBS where ItemName like '%" + cell3 + "%' and pid="+Session["ProjectCode"].ToString();
                        DataTableDr["UpperWID"] =int.Parse(WebModel.SItemName(database, search, "CWID"));
                    }
                 
                    DataTableDr["SortNum"] = sort;
                    DataTableDr["ItemOrder"] = cell2;
                    DataTableDr["ItemName"] = cell4;
                    DataTableDr["Unit"] = cell5;
                    DataTableDr["CNumber"] = cell6 !=""?decimal.Parse(cell6):0;
                    DataTableDr["CUnitPrice"] = cell7 != "" ? decimal.Parse(cell7) : 0;
                    DataTableDr["ItemKind"] = cell9;
                    DataTableDr["Notes"] = cell11;

                    DataTableBox.Rows.Add(DataTableDr);
                    //DataRow Dr = Dtvs.NewRow();
                    //Dr["PID"] = Session["ProjectCode"].ToString();
                    //Dr["LayerNum"] = cell1 != "" ? int.Parse(cell1) : 0;
                    //Dr["SortNum"] = sort;
                    //Dr["ItemOrder"] = cell2;
                    //Dr["ItemName"] = cell4;
                    //Dr["Unit"] = cell5;
                    //Dr["CNumber"] = cell6 != "" ? decimal.Parse(cell6) : 0;
                    //Dr["CUnitPrice"] = cell7 != "" ? decimal.Parse(cell7) : 0;
                    //Dr["ItemKind"] = cell9;
                    //Dr["Notes"] = cell11;

                    //Dtvs.Rows.Add(Dr);

                    string resultSave = WebModel.SaveAction(database, "CBudget_WBS", DataTableBox);
                    if (cell10.ToUpper() == "Y")
                    {

                        SaveOrInsertSheet1(excel_filePath, (Worksheet)xlApp.Worksheets[2], cell4, cell5);

                    }
                    //if (ViewState["layer"] == cell1)
                    //{

                    //    sort++;
                    //}



                    //往下抓一列Excel範圍
                    //ViewState["layer"] = cell1;
                    rowIndex++;
                   
                    DataTableBox.Clear();
                    this.aRange = ws.get_Range("A" + rowIndex.ToString(), "K" + rowIndex.ToString());
                }

                //bool result2 = CBLayerCodeSort.Update_SortNum(Dtvs);
                bool result3 = CBLayerCodeSort.Update_SortNum1(database,Session["ProjectCode"].ToString());
                bool result4 = DAL.CBLayerCodeSort.Update_order_num(database, Session["ProjectCode"].ToString());
          
        }
        #endregion
        private void SaveOrInsertSheet1(string excel_filename, Worksheet ws,string ItemName,string unit)
        {
            System.Data.DataTable DataTableBox = new System.Data.DataTable();
            System.Data.DataTable Dtvs = new System.Data.DataTable();
             string SQLString = "PID,Code,ItemName,Unit,ItemKind,CPrice,AnaNumber,CAmount,Notes";
             string SQLStringAna = "SortNum,ParentID,KidID,WorkRate";
            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }
            foreach (string DataName in SQLStringAna.Split(','))
            {
                Dtvs.Columns.Add(DataName, typeof(string));
            }
          
            string database = Session["DatabaseName"].ToString();
            DataRow DataTableDr = DataTableBox.NewRow();
            DataRow Dr = Dtvs.NewRow();        
           
            int rowIndex = 2;
            int sort = 1;
            int PriceID = 0;
          
            this.aRange = ws.get_Range("A" + rowIndex.ToString(), "K" + rowIndex.ToString());
            //string DelSQL = "Delete Pro_Analysis where ParentID=" + PriceID;
          
            while (((object[,])this.aRange.Value2)[1, 1] != null)
            {
              
                string cell1 = ((object[,])this.aRange.Value2)[1, 1] != null ? ((object[,])this.aRange.Value2)[1, 1].ToString() : "";

                string cell2 = ((object[,])this.aRange.Value2)[1, 2] != null ? ((object[,])this.aRange.Value2)[1, 2].ToString() : "";
                string cell3 = ((object[,])this.aRange.Value2)[1, 3] != null ? ((object[,])this.aRange.Value2)[1, 3].ToString() : "";
                string cell4 = ((object[,])this.aRange.Value2)[1, 4] != null ? ((object[,])this.aRange.Value2)[1, 4].ToString() : "";
                string cell5 = ((object[,])this.aRange.Value2)[1, 5] != null ? ((object[,])this.aRange.Value2)[1, 5].ToString() : "";
                string cell6 = ((object[,])this.aRange.Value2)[1, 6] != null ? ((object[,])this.aRange.Value2)[1, 6].ToString() : "";
                string cell7 = ((object[,])this.aRange.Value2)[1, 7] != null ? ((object[,])this.aRange.Value2)[1, 7].ToString() : "";
                string cell8 = ((object[,])this.aRange.Value2)[1, 8] != null ? ((object[,])this.aRange.Value2)[1, 8].ToString() : "";
                string cell9 = ((object[,])this.aRange.Value2)[1, 9] != null ? ((object[,])this.aRange.Value2)[1, 9].ToString() : "";
                string cell10 = ((object[,])this.aRange.Value2)[1, 10] != null ? ((object[,])this.aRange.Value2)[1, 10].ToString() : "";
                string cell11 = ((object[,])this.aRange.Value2)[1, 11] != null ? ((object[,])this.aRange.Value2)[1, 11].ToString() : "";

             
                    DataTableDr["PID"] = Session["ProjectCode"].ToString();                   
                    //DataTableDr["Unit"] = cell5;
                    DataTableDr["Code"] = cell10;
                    DataTableDr["ItemKind"] = cell6;
                    DataTableDr["CPrice"] = cell8 !=""?decimal.Parse(cell8):0;                 
                    //DataTableDr["AnaNumber"] = cell3 !=""?decimal.Parse(cell3):0;
                    DataTableDr["CAmount"] = cell9 !=""?decimal.Parse(cell9):0;
                    DataTableDr["Notes"] = cell11;
                    if (cell1 == ItemName && cell4 != "")
                    {
                       
                        DataTableDr["ItemName"] = cell4;
                        DataTableDr["Unit"] = cell5;
                        DataTableDr["AnaNumber"] = cell7 != "" ? decimal.Parse(cell7) : 0;
                        DataTableBox.Rows.Add(DataTableDr);
                        string result = WebModel.SaveAction(database, "Pro_Resource", DataTableBox);

                        Dr["SortNum"] = sort;
                        Dr["ParentID"] = PriceID;
                        Dr["KidID"] = WebModel.MaxAnyID(database, "Pro_Resource", Session["ProjectCode"].ToString(), "PriceID"); ;
                        Dr["WorkRate"] = cell7 != "" ? decimal.Parse(cell7) : 0;
                        Dtvs.Rows.Add(Dr);
                        string result4 = WebModel.SaveAction(database, "Pro_Analysis", Dtvs);
                        Dtvs.Clear();
                        sort++;
                    }
                    else if (cell1 == ItemName && cell4 == "")
                    {
                      
                        sort = 1;
                        DataTableDr["ItemName"] = cell1;
                        DataTableDr["Unit"] = cell2;
                        DataTableDr["AnaNumber"] = cell3 != "" ? decimal.Parse(cell3) : 0;
                        DataTableBox.Rows.Add(DataTableDr);
                        string result = WebModel.SaveAction(database, "Pro_Resource", DataTableBox);

                         PriceID = WebModel.MaxAnyID(database, "Pro_Resource", Session["ProjectCode"].ToString(), "PriceID");
                         //if (!flag)
                         //{
                         //    bool result1 = WebModel.SQLAction(database, DelSQL);
                         //}
                         string search = "select * from CBudget_WBS where ItemName like '%" + ItemName + "%' and unit like '%" + unit + "%' and pid=" + Session["ProjectCode"].ToString();
                        int CWID=int.Parse(WebModel.SItemName(database, search, "CWID"));

                        string UpdatWBSPriceID = "Update CBudget_WBS set PriceID="+PriceID+ "where CWID=" + CWID;
                        bool result3 = WebModel.SQLAction(database, UpdatWBSPriceID);
                    }                   

              
                rowIndex++;
                DataTableBox.Clear();
                this.aRange = ws.get_Range("A" + rowIndex.ToString(), "K" + rowIndex.ToString());
            }      

        }

        protected void Button6_Click(object sender, EventArgs e)
        {
           
            Response.ContentType = "Application/xlsx";
            Response.AppendHeader("Content-Disposition", "attachment; filename=DIY格式.xls");
            Response.TransmitFile(Server.MapPath("Uploads/DIY格式.xls"));
            Response.End();
        }
        //protected void BtnInsert_Click(object sender, EventArgs e)
        //{
        //    string SQLSelect = "Select * From CBudget_WBS where Pid=" + Session["ProjectCode"].ToString();
        //    string SQLSelect1 = "Select * From EBudget_WBS where Pid=" + Session["ProjectCode"].ToString();
        //    string SQLSelect2 = "Select * From Pro_Resource where Pid=" + Session["ProjectCode"].ToString();
        //    string database = Session["DatabaseName"].ToString();
        //    DataTable dt = WebModel.LoadSetContentData(database, SQLSelect);
        //    DataTable dt1 = WebModel.LoadSetContentData(database, SQLSelect1);
        //    DataTable dt2 = WebModel.LoadSetContentData(database, SQLSelect2);
        //    if(Session["ProjectCode"]=="")
        //    {
        //        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請先選擇欲匯入的專案');", true);

        //    }
        //  else  if (DropDownList3.SelectedIndex ==0)
        //    {
        //        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請先選擇標案');", true);

        //    }
        //   else if (dt != null && dt.Rows.Count > 0 && dt1 != null && dt1.Rows.Count > 0 && dt2 != null && dt2.Rows.Count > 0)
        //    {
        //        //ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請先選擇檔案');", true);
        //        //BtnInsert.Attributes.Add("onclick", "javascript:return window.confirm('合約預算、執行預算及專案工料已有資料，\n確認清除所有資料並匯入嗎?');");
        //        BtnInsert.Attributes.Add("onclick", "return confirm('合約預算、執行預算及專案工料已有資料，\n確認清除所有資料並匯入嗎');");
          
        //        string Bid = DropDownList3.SelectedValue;
        //        string DelCB = "Delete * from CBudget_WBS where Pid=" + Session["ProjectCode"].ToString();
        //        string DelEB = "Delete * from EBudget_WBS where Pid=" + Session["ProjectCode"].ToString();
        //        string DelProR = "Delete * from Pro_Resource where Pid=" + Session["ProjectCode"].ToString();
        //        WebModel.SQLAction(database, DelCB);
        //        WebModel.SQLAction(database, DelEB);
        //        WebModel.SQLAction(database, DelProR);
        //        string BIdSelect = "Select * from Bid_WBS where bid=" + Bid;
        //        string ResSelect = "Select * from Bid_Library where bid=" + Bid;
        //        DataTable dtbox = WebModel.LoadSetContentData(database, BIdSelect);
        //        DataTable dtRes = WebModel.LoadSetContentData(database, ResSelect);
        //        DataTable newCBudget = new DataTable();
        //        DataTable newEBudget = new DataTable();
        //        DataTable newRes = new DataTable();
        //        string SQLString = "PID,LayerCode,LayerNum,UpperWID,SortNum,ItemOrder,PriceID,ItemName,Unit,ItemKind,CNumber,LastCNumber,Notes";
        //        string SQLEBudget = "PID,LayerCode,LayerNum,UpperWID,SortNum,ItemOrder,PriceID,ItemName,Unit,ItemKind,ENumber,LastENumber,Notes";
        //        string SQLRes = "PID,ItemName,Unit,Complex,AnaNumber,Bid_RFQ_Code,CPrice,CAmount,Notes,ItemKind,Bid_PriceID,CResourceNY,EResourceNY";
        //           foreach (string DataName in SQLString.Split(','))
        //            {
        //                newCBudget.Columns.Add(DataName, typeof(string));
        //            }
        //           foreach (string DataName in SQLEBudget.Split(','))
        //           {
        //               newEBudget.Columns.Add(DataName, typeof(string));
        //           }
        //           foreach (string DataName in SQLRes.Split(','))
        //           {
        //               newRes.Columns.Add(DataName, typeof(string));
        //           }
        //    //後台功能，必需要有的欄位名稱               

        //           DataRow DtDr = newCBudget.NewRow();
        //           DataRow DtDr1 = newEBudget.NewRow();
        //           DataRow DtDr2 = newRes.NewRow();
        //        foreach (DataRow dr in dtbox.Rows)
        //        {
        //            string LayerCode = dr["LayerCode"].ToString();
        //            string LayerNum = dr["LayerNum"].ToString();
        //            string UpperUID = dr["UpperUID"].ToString();
        //            string SortNum = dr["SortNum"].ToString();
        //            string ItemOrder = dr["ItemOrder"].ToString();
        //            string ItemName = dr["ItemName"].ToString();
        //            string Unit = dr["Unit"].ToString();
        //            string ItemKind = dr["ItemKind"].ToString();
        //            string Number = dr["Number"].ToString();
        //            string PriceID = dr["PriceID"].ToString();
        //            string Notes = dr["Notes"].ToString();

        //            DtDr["Pid"] = Session["ProjectCode"].ToString();
        //            DtDr["LayerCode"] = LayerCode;
        //            DtDr["LayerNum"] = LayerNum;
        //            DtDr["UpperWID"] = UpperUID;
        //            DtDr["SortNum"] = SortNum;
        //            DtDr["ItemOrder"] = ItemOrder;
        //            DtDr["PriceID"] = PriceID;
        //            DtDr["ItemName"] = ItemName;
        //            DtDr["Unit"] = Unit;
        //            DtDr["ItemKind"] = ItemKind;
        //            DtDr["CNumber"] = Number !=""?decimal.Parse(Number):0;
        //            DtDr["LastCNumber"] = Number != "" ? decimal.Parse(Number) : 0;
        //            DtDr["Notes"] = Notes;
        //            newCBudget.Rows.Add(DtDr);
        //            WebModel.SaveAction(database, "CBudget_WBS", newCBudget);
        //            newCBudget.Rows.Clear();

        //            DtDr1["Pid"] = Session["ProjectCode"].ToString();
        //            DtDr1["LayerCode"] = LayerCode;
        //            DtDr1["LayerNum"] = LayerNum;
        //            DtDr1["UpperWID"] = UpperUID;
        //            DtDr1["SortNum"] = SortNum;
        //            DtDr1["ItemOrder"] = ItemOrder;
        //            DtDr1["PriceID"] = PriceID;
        //            DtDr1["ItemName"] = ItemName;
        //            DtDr1["Unit"] = Unit;
        //            DtDr1["ItemKind"] = ItemKind;
        //            DtDr1["ENumber"] = Number != "" ? decimal.Parse(Number) : 0;
        //            DtDr1["LastENumber"] = Number != "" ? decimal.Parse(Number) : 0;
        //            DtDr1["Notes"] = Notes;
        //            newEBudget.Rows.Add(DtDr1);
        //            WebModel.SaveAction(database, "EBudget_WBS", newEBudget);
        //            newEBudget.Rows.Clear();

                  
        //        }
        //        foreach (DataRow drRes in dtRes.Rows)
        //        {
        //            string ItemName = drRes["ItemName"].ToString();
        //            string Unit = drRes["Unit"].ToString();
        //            string Complex = drRes["Complex"].ToString();
        //            string AnaNumber = drRes["AnaNumber"].ToString();
        //            string RFQ_Code = drRes["RFQ_Code"].ToString();
        //            string Price = drRes["Price"].ToString();
        //            string Amount = drRes["Amount"].ToString();
        //            string PriceID = drRes["PriceID"].ToString();                  
        //            string Notes = drRes["Notes"].ToString();
        //            string ItemKind = drRes["ItemKind"].ToString();
        //            string ResourceNY = drRes["ResourceNY"].ToString();

        //            DtDr2["Pid"] = Session["ProjectCode"].ToString();
        //            DtDr2["ItemName"] = ItemName;
        //            DtDr2["Unit"] = Unit;
        //            DtDr2["Complex"] = Complex;
        //            DtDr2["AnaNumber"] = AnaNumber !=""?decimal.Parse(AnaNumber):0;
        //            DtDr2["Bid_RFQ_Code"] = RFQ_Code;
        //            DtDr2["CPrice"] = Price !=""?decimal.Parse(Price):0;
        //            DtDr2["CAmount"] = Amount!=""? decimal.Parse(Amount):0;
        //            DtDr2["Notes"] = Notes;
        //            DtDr2["ItemKind"] = ItemKind;
        //            DtDr2["Bid_PriceID"] = PriceID;
        //            DtDr2["CResourceNY"] = ResourceNY;
        //            DtDr2["EResourceNY"] = ResourceNY;

        //            newRes.Rows.Add(DtDr2);
        //            WebModel.SaveAction(database, "Pro_Resource", newRes);
        //            newRes.Rows.Clear();
                   

        //        }

        //        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 匯入完成');", true);

        //    }
        //    else
        //    {
        //        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('標案無資料');", true);

        //    }

        //}
    }
}