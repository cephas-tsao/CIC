using DAL;
using Pechkin;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class ChangeCBudget : System.Web.UI.Page
    {
        protected string LbLayerNum;
        protected string ChNum;
        protected int Cedittion;
        decimal CToatal = 0;
        decimal ETotal = 0;
        string ListStr2 = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["ProjectCode"] == null || Session["ProjectCode"] == "")
            {

                Response.Write("<script>alert('尚未選擇專案或是您的權限不足');location.href='Main.aspx';</script>");
            }
         
            if (Session["LbLayerNum"] != null)
            {
                LbLayerNum = Session["LbLayerNum"].ToString();
            }
            if (!IsPostBack)
            {
                Cedittion = WebModel.MaxAnyID(Session["DatabaseName"].ToString(), "CBudget_Change", Session["ProjectCode"].ToString(), "CEdition");
                if (ViewState["edition"] == null)
                {
                    for (int i = 1; i <= Cedittion; i++)
                    {
                        CheckBoxList2.Items.Add(new ListItem("第" + i.ToString() + "次", i.ToString()));

                    }
                }
                string SQLSelect = "Select * from CBudget_Change where pid=" + Session["ProjectCode"].ToString();
                string change = WebModel.SItemName(Session["DatabaseName"].ToString(), SQLSelect, "CEdition");
                if (change == "")
                {
                    ImageButton175.Visible = false;

                }

                LoadContent();
                Reload_Click(this, null);
            }
        }
        protected void LoadContent()
        {
            string database = Session["DatabaseName"].ToString();
            string ListStr = "";
            string ListStr1 = "";


         
            ViewState["edition"] = true;
            StringBuilder tmpStr1 = new StringBuilder();
            StringBuilder tmpStr2 = new StringBuilder();


            ListStr = @"<td class=""ShtCellCC"" rowspan=""2"">編輯</td>
                                <td class=""ShtCellCC"" colspan=""{0}"" rowspan=""2"">項次</td>
                                <td class=""ShtCellCC"" rowspan=""2"">工項名稱</td>
                                <td class=""ShtCellCC"" rowspan=""2"">單位</td>
                                
                                <td class=""ShtCellCC"" colspan=""3"">原合約預算</td>";
            ListStr1 = @" <td class=""ShtCellCC"" rowspan=""2"">變更設計<br />
                                    追加減金額</td>
                        <td class=""ShtCellCC"" rowspan=""2"">備註</td></tr>
                        <tr class=""ShtRowTop""> 
                                <td class=""ShtCellCC"">數量</td>
                                <td class=""ShtCellCC"">單價</td>
                                <td class=""ShtCellCC"">複價</td>";

            int LayerNum = WebModel.MaxLayerSNum(database, "CBudget_WBS", Session["ProjectCode"].ToString());
            tmpStr1.AppendLine(string.Format(ListStr, LayerNum));
            tmpStr2.AppendLine(string.Format(ListStr1));

            Literal1.Text = tmpStr1.ToString();
            Literal2.Text = tmpStr2.ToString();
            DataContent();
          
        }
        protected void DataContent()
        {
            string database = Session["DatabaseName"].ToString();
            string vsSql = "";
            string LbWid = "";
            string LbPriceID = "";
            string LbItemOrder = "";
            string LbItemName = "";
            string LbUnit = "";
            string LbCNumber = "";
            string LbCPrice = "";
            string LbCComplex = "";
            string LbNotes = "";
            string NowLayer = "";
            string Orderlayer = "";
            string order = "";
            string ListStr3 = "";
            decimal LCTotal = 0;
            decimal LCCAL=0;
            string ChAmount = "";
            CToatal = 0;
            StringBuilder tmpStr3 = new StringBuilder();
            int LayerNum = WebModel.MaxLayerSNum(database, "CBudget_WBS", Session["ProjectCode"].ToString());
            DataTable vsDt = new DataTable();
            vsSql = @"Select * From CBudget_WBS a  left join Pro_Resource c on a.PriceID=c.PriceID Where a.PID=" + Session["ProjectCode"].ToString() + " order by order_Num";
            vsDt = WebModel.LoadSetContentData(database, vsSql);

            if (CheckBoxList2.SelectedValue == "")
            {
              
            
                if (vsDt.Rows.Count > 0)
                {
                    for (int i = 0; i < vsDt.Rows.Count; i++)
                    {
                        Orderlayer = "";
                    
                        DataRow vsDr = vsDt.Rows[i];
                        LbWid = vsDr["CWid"].ToString();
                        LbPriceID = vsDr["PriceID"].ToString();
                        LbItemOrder = vsDr["ItemOrder"].ToString();
                        LbItemName = vsDr["ItemName"].ToString();
                        LbUnit = vsDr["Unit"].ToString();
                        LbCNumber = vsDr["CNumber"].ToString() != "" ? vsDr["CNumber"].ToString() : "0";                       
                        LbCPrice = vsDr["CPrice"].ToString() != "" ? vsDr["CPrice"].ToString() : "0";
                        LbCComplex = (decimal.Parse(LbCNumber) * decimal.Parse(LbCPrice)).ToString("N0");
                        string LastCNumber = vsDr["LastCNumber"].ToString() != "" ? vsDr["LastCNumber"].ToString() : "0";
                        LCCAL=(decimal.Parse(LastCNumber)*decimal.Parse(LbCPrice));
                        LbNotes = vsDr["Notes"].ToString();
                        NowLayer = vsDr["LayerNum"].ToString();
                        string Img = vsDr["ItemKind"].ToString() == "workitem" ? "visible" : "hidden";
                        string Img1 = vsDr["ItemKind"].ToString() == "workitem" ? "" : "none";
                        string Link = vsDr["ItemKind"].ToString() == "workitem" ? "CChangeDetail.aspx?CWID=" + LbWid + " " : "#";
                        string Link1 = vsDr["ItemKind"].ToString() == "workitem" ? "target=_blank" : "";
                       
                       ChAmount = (LCCAL - decimal.Parse(LbCComplex)).ToString("N0");
                        if (decimal.Parse(ChAmount) > 0)
                        {
                            ChAmount = "+" + ChAmount + "";
                        }
                       
                        int x = LayerNum - int.Parse(NowLayer) + 1;//- int.Parse(layer)
                        //int x = int.Parse(LbLayerNum) - int.Parse(layer) + 1;//- int.Parse(layer)
                        for (int j = 1; j <= int.Parse(NowLayer) - 1; j++)
                        {
                            Orderlayer += "<td class='itemframe'  style='min-width:10px;border-left-style:none'></td>";

                        }
                        order = "<td  colspan= " + x + ">" + LbItemOrder + "</td>";
                        string color = "";

                        if (decimal.Parse(ChAmount) > 0)
                        {
                            color = "auto-style85";
                        }
                        else if (decimal.Parse(ChAmount) == 0)
                        {
                            color = "ShtCellCC";
                        }
                        else if (decimal.Parse(ChAmount) < 0)
                        {
                            color = "auto-style87";
                        }
                        string SQLSelect="Select * from CBudget_Change where pid="+Session["ProjectCode"].ToString();
                        string change = WebModel.SItemName(database, SQLSelect, "CEdition");
                        if (change != "")
                        {
                            ListStr2 = @"<tr class=""ShtRowSingle""> <td style=""width: 30px"">
                 <a href=""{12}"" {13}> <img src=""../img/Edit.png"" ToolTip=""逐項編輯"" Width=""40px""  style=""visibility:{11}""  /></a></td>
                 <Label ID=""LbWid""  Visible=""false"" Text=""{0}""></Label>
                                <Label ID=""LbPriceID"" Visible=""false"" Text=""{1}""></Label>
                                {2}{3}
                                <td class=""ShtCellCL"">{4}</td>
                                <td class=""ShtCellCC"">{5}</td>
                             
                                <td class=""ShtCellCR"">{6}</td>
                                <td class=""ShtCellCR"">{7}</td>
                                <td class=""ShtCellCR"">{8}</td>                              
                                <td style=""text-align:right"" class=" + color + ">{9}</td>" +
                                    "<td class=\"ShtCellCC\">{10}</td>";

                        }
                        else
                        {
                            ListStr2 = @"<tr class=""ShtRowSingle""> <td style=""width: 3px"">
                    </td>
                 <Label ID=""LbWid""  Visible=""false"" Text=""{0}""></Label>
                                <Label ID=""LbPriceID"" Visible=""false"" Text=""{1}""></Label>
                                {2}{3}
                                <td class=""ShtCellCL"">{4}</td>
                                <td class=""ShtCellCC"">{5}</td>
                             
                                <td class=""ShtCellCC"" style=""text-align:right"">{6}</td>
                                <td class=""ShtCellCC"" style=""text-align:right"">{7}</td>
                                <td class=""ShtCellCC"" style=""text-align:right"">{8}</td>                              
                                <td style=""text-align:right"" class=" + color + ">{9}</td>" +
                                   "<td class=\"ShtCellCC\">{10}</td>";


                        }
                        tmpStr3.AppendLine(string.Format(ListStr2, LbWid, LbPriceID, Orderlayer, order, LbItemName, LbUnit, LbCNumber, LbCPrice, LbCComplex, ChAmount, LbNotes, Img, Link, Link1));
                        CToatal += Convert.ToDecimal(LbCComplex);
                        LCTotal += LCCAL;
                    }
                   
                    LbCTotal.Text = CToatal.ToString("N0");
                    LbETotal.Text = LCTotal.ToString("N0");
                    LbSTotal.Text = (LCTotal - CToatal).ToString("N0");

                }
                Literal3.Text = tmpStr3.ToString();
                // string count="";
                //int num = tmpStr3.ToString().LastIndexOf(count);

                //var lines = tmpStr3.ToString().Split(new string[] {System.Environment.NewLine },StringSplitOptions.None).Length;
              
                //int k = 0;
                //int L = 0;
                //var myList = new List<int>();
                //var myList1 = new List<int>();


                //while ((k = ListStr3.IndexOf('{', k)) != -1)
                //{

                //    myList.Add(k);

                //    k++;
                //}
                //while ((L = ListStr3.IndexOf('}', L)) != -1)
                //{

                //    myList1.Add(L);
                //    // Increment the index.
                //    L++;
                //}
                //var Result = new List<int>();

                //int m = 0;
                //int at = 0;


                //while ((m = ListStr3.IndexOf('{', m)) != -1)
                //{
                //    at = (int.Parse(ListStr3.Substring(m + 1, ListStr2.IndexOf('}') - (ListStr2.IndexOf('{')) - 1)));

                //    //at = int.Parse(ListStr2.Substring(ListStr2.IndexOf('{') + 1, ListStr2.IndexOf('}') - (ListStr2.IndexOf('{') + 1)));
                //    Result.Add(at);

                //    m++;
                //}javascript:window.open('http://tw.yahoo.com/','window')"{11}
            }
                Stopwatch stopwatch = new Stopwatch();
                stopwatch.Start();
            if (CheckBoxList2.SelectedValue != "")
            //else
            {
                ListStr3 = @"<tr class=""ShtRowSingle"">
                 <td style=""width: 30px"">
                 <a href=""javascript:window.open('{10}','window','height=500,width=950')"" > <img src=""../img/Edit.png"" ToolTip=""逐項編輯"" Width=""50px""  style=""visibility:{9}"" /></a></td>
                 <Label ID=""LbWid""  Visible=""false"" Text=""{0}""></Label>
                                <Label ID=""LbPriceID"" Visible=""false"" Text=""{1}""></Label>
                                {2}{3}
                                <td class=""ShtCellCL"">{4}</td>
                                <td class=""ShtCellCC"">{5}</td>
                               
                                <td class=""ShtCellCR"">{6}</td>
                                <td class=""ShtCellCR"">{7}</td>
                                <td class=""ShtCellCR"">{8}</td>                               
                                    ";
                string selectedValue = "";
                //string SQLSelect = "";
                //string Sum = "";
                string vsSql1 = "";
                //int max = Result.Max();
                //int min = Result.Min();
                string LbNotes1 = "";
                string ChAmount1 = "";
                CToatal = 0;
                LCTotal = 0;
                StringBuilder tmpStr2 = new StringBuilder();
                List<ListItem> selected = new List<ListItem>();
                Literal3.Text = "";

                var totalcount1 = CheckBoxList1.Items.Cast<ListItem>().Where(item => item.Selected).Count();//CheckBoxList1被選擇之數量(欄位選擇)
                var totalcount2 = CheckBoxList2.Items.Cast<ListItem>().Where(item => item.Selected).Count();//CheckBoxList2被選擇之數量(變更次別)
                foreach (ListItem item1 in CheckBoxList2.Items)
                {

                    if (item1.Selected == true)
                    {
                        selectedValue += item1.Value + ",";
                    }
                }

                foreach (ListItem item1 in CheckBoxList2.Items)
                {
                  
                    if (item1.Selected == true)
                    {
                        //selectedValue = item1.Value + ",";

                        //Sum += selectedValue;
                        //SQLSelect += (selectedValue.Length > 1) ? "or b.CEdition= " + Sum.Substring(0, Sum.Length - 1) : "";
                        DataTable vsDt1 = new DataTable();
                        vsSql1 = @"Select * From CBudget_WBS a  left join Pro_Resource c on a.PriceID=c.PriceID Where a.PID=" + Session["ProjectCode"].ToString() + " order by order_Num";
                        vsDt1 = WebModel.LoadSetContentData(database, vsSql1);

                        if (vsDt1.Rows.Count > 0)
                        {

                            for (int i = 0; i < vsDt1.Rows.Count; i++)
                            {
                                string Orderlayer1 = "";
                                DataRow vsDr = vsDt1.Rows[i];
                                string LbWid1 = vsDr["CWid"].ToString();
                                string LbPriceID1 = vsDr["PriceID"].ToString();
                                string LbItemOrder1 = vsDr["ItemOrder"].ToString();
                                string LbItemName1 = vsDr["ItemName"].ToString();
                                string LbUnit1 = vsDr["Unit"].ToString();
                                string LbCNumber1 = vsDr["CNumber"].ToString() != "" ? vsDr["CNumber"].ToString() : "0";
                                string LbCPrice1 = vsDr["CPrice"].ToString() != "" ? vsDr["CPrice"].ToString() : "0";
                                string LbCComplex1 = (decimal.Parse(LbCNumber1) * decimal.Parse(LbCPrice1)).ToString("N0");
                                LbNotes1 = vsDr["Notes"].ToString();
                                string NowLayer1 = vsDr["LayerNum"].ToString();
                                string Img = vsDr["ItemKind"].ToString() == "workitem" ? "visible" : "hidden";
                                string Img1 = vsDr["ItemKind"].ToString() == "workitem" ? "" : "none";
                                string Link = vsDr["ItemKind"].ToString() == "workitem" ? "CChangeDetail.aspx?CWID=" + LbWid1 + " " : "#";
                                string Link1 = vsDr["ItemKind"].ToString() == "workitem" ? "target=_blank" : "";
                                string LastCNumber1 = vsDr["LastCNumber"].ToString() != "" ? vsDr["LastCNumber"].ToString() : "0";
                                LCCAL = (decimal.Parse(LastCNumber1) * decimal.Parse(LbCPrice1));
                                CToatal += Convert.ToDecimal(LbCComplex1);
                                LbCTotal.Text = CToatal.ToString("N0");
                                LCTotal += LCCAL;
                                LbETotal.Text = LCTotal.ToString("N0");
                                ChAmount1 = (LCCAL - decimal.Parse(LbCComplex1)).ToString("N0");
                                if (decimal.Parse(ChAmount1) > 0)
                                {
                                    ChAmount1 = "+" + ChAmount1 + "";
                                }
                                int x = LayerNum - int.Parse(NowLayer1) + 1;//- int.Parse(layer)項次階層計算

                                for (int j = 1; j <= int.Parse(NowLayer1) - 1; j++)
                                {
                                    Orderlayer1 += "<td class='itemframe'  style='min-width:10px;border-left-style:none'></td>";

                                }
                                string order1 = "<td  colspan= " + x + ">" + LbItemOrder1 + "</td>";
                                
                                tmpStr2.AppendLine(string.Format(ListStr3, LbWid1, LbPriceID1, Orderlayer1, order1, LbItemName1, LbUnit1, LbCNumber1, LbCPrice1, LbCComplex1, Img, Link, Link1));
                                DataTable Addvalue = CBudgetDisp.LoadContentData_CB(database, Session["ProjectCode"].ToString(), selectedValue);

                                  foreach (ListItem item2 in CheckBoxList2.Items)
                                    {
                                if (item2.Selected == true)
                                {
                                  
                                    if (Addvalue.Rows.Count > 0)
                                    {
                                        DataRow vsDr1 = Addvalue.Rows[i];
                                        //string LbChNumber1 = vsDr1["ChNumber"].ToString() != "" ? vsDr1["ChNumber"].ToString() : "0";
                                        string LbChNumber1 = vsDr1["ChNumber" + item2.Value + ""].ToString() != "" ? vsDr1["ChNumber" + item2.Value + ""].ToString() : "0";
                                        if (LbChNumber1 == "0")
                                        {
                                            for (int k = int.Parse(item2.Value); k > 0; k--)
                                            {
                                                LbChNumber1 = vsDr1["ChNumber" + k + ""].ToString() != "" ? vsDr1["ChNumber" + k + ""].ToString() : "0";
                                                if (LbChNumber1 != "0")
                                                {
                                                    break;
                                                }
                                                else
                                                {
                                                    LbChNumber1 = vsDr1["CNumber"].ToString() != "" ? vsDr1["CNumber"].ToString() : "0";
                                                }
                                            }

                                        }
                                        string LbEPrice1 = vsDr1["CPrice"].ToString() != "" ? decimal.Parse(vsDr1["CPrice"].ToString()).ToString("N0") : "0";
                                        string LbEComplex1 = (decimal.Parse(LbChNumber1) * decimal.Parse(LbEPrice1)).ToString("N0");
                                        string LbRespond1 = vsDr1["Response" + item2.Value + ""].ToString();
                                        string LbReason1 = vsDr1["Reason" + item2.Value + ""].ToString();
                                     
                                        if (CheckBoxList1.Items[0].Selected == true)
                                        {
                                            tmpStr2.AppendLine(string.Format("<td class=\"ShtCellCR\">{0}</td>", LbChNumber1));

                                        }
                                        if (CheckBoxList1.Items[1].Selected == true)
                                        {
                                            tmpStr2.AppendLine(string.Format("<td class=\"ShtCellCR\">{0}</td>", LbEPrice1));
                                        }
                                        if (CheckBoxList1.Items[2].Selected == true)
                                        {
                                            tmpStr2.AppendLine(string.Format("<td class=\"ShtCellCR\">{0}</td>", LbEComplex1));
                                        }
                                        if (CheckBoxList1.Items[3].Selected == true)
                                        {
                                            tmpStr2.AppendLine(string.Format("<td class=\"ShtCellCC\" >{0}</td>", LbRespond1));
                                        }
                                        if (CheckBoxList1.Items[4].Selected == true)
                                        {
                                            tmpStr2.AppendLine(string.Format("<td class=\"ShtCellCC\">{0}</td>", LbReason1));

                                        }
                                    }
                                }
                                }
                                string color = "";

                                if (decimal.Parse(ChAmount1) > 0)
                                {
                                    color = "auto-style85";
                                }
                                else if (decimal.Parse(ChAmount1) == 0)
                                {
                                    color = "ShtCellCC";
                                }
                                else if (decimal.Parse(ChAmount1) < 0)
                                {
                                    color = "auto-style87";
                                }
                                tmpStr2.AppendLine(string.Format("<td style=\"text-align:right\" class=\"" + color + "\">{0}</td>", ChAmount1));
                                tmpStr2.AppendLine(string.Format("<td class=\"ShtCellCL\">{0}</td></tr>", LbNotes1));

                            }
                        }
                    }

                }

                Literal3.Text = tmpStr2.ToString();
                stopwatch.Stop();

                // Write result.
                Console.WriteLine("Time elapsed: {0}", stopwatch.Elapsed);
            }
        }
        public void OpenNewWindow(string url, string Tgr, string width, string height)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=" + height + ",width=" + width + "";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
        }
        protected void Reload_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string selectedValue = "";
            var totalcount = CheckBoxList2.Items.Cast<ListItem>().Where(item => item.Selected).Count();
            var totalcount1 = CheckBoxList1.Items.Cast<ListItem>().Where(item => item.Selected).Count();
            string tmpListStr = "";
            //            string tmpListStr2 = "";
            //            StringBuilder tmpStr2 = new StringBuilder();
            //            tmpListStr2 = @"<td class=""ShtCellCC"" colspan=""5"">
            //                                    <asp:HyperLink ID=""HyperLink1"" runat=""server"" Font-Underline=""True"" ForeColor=""#0066FF"" ToolTip=""變更摘要編輯"" NavigateUrl=""~/CChangeSummary2.aspx"">第{0}次變更設計</asp:HyperLink>
            //                                </td>";
            //            tmpListStr2 += @"<td class=""ShtCellCC"" rowspan=""2"">變更設計<br />
            //                                    追加減金額</td>";
            //            tmpStr2.AppendLine(string.Format(tmpListStr2, totalcount));
            Cedittion = WebModel.MaxAnyID(database, "CBudget_Change", Session["ProjectCode"].ToString(), "CEdition");

            if (ViewState["chblstAdd"] == null)
            {
                if (CheckBoxList2.Items.Count > 0)
                {
                    CheckBoxList2.Items[Cedittion - 1].Selected = true;
                    ViewState["chblstAdd"] = true;
                }
            }
            if (CheckBoxList2.SelectedValue != "")
            {
                StringBuilder tmpStr = new StringBuilder();
                StringBuilder tmpStr1 = new StringBuilder();
                foreach (ListItem item1 in CheckBoxList2.Items)
                {
                    //tmpStr2.Clear();

                    string tmpListStr1 = "";
                    if (item1.Selected == true)
                    {
                        Literal4.Text = "";
                        Literal5.Text = "";


                        selectedValue = item1.Value + ",";
                        tmpListStr = @"<td class=""ShtCellCC"" colspan={1}>
                                    <a href=""javascript:void(0)"" target=""_blank"" onclick=""window.open('CChangeSummaryE.aspx?ID={0}','subwin','width=1200,height=500');"" >第{0}次變更設計</a>
                                </td>";
                        //                        tmpListStr += int.Parse(item1.Value) >= totalcount ? @"<td class=""ShtCellCC"" rowspan=""2"">變更設計<br />
                        //                                    追加減金額</td>" : "";

                        //foreach (ListItem item in CheckBoxList1.Items)
                        //{

                        tmpListStr1 += CheckBoxList1.Items[0].Selected == true ? @"<td class=""ShtCellCC"">數量</td>" : "";
                        tmpListStr1 += CheckBoxList1.Items[1].Selected == true ? @"<td class=""ShtCellCC"">單價</td>" : "";
                        tmpListStr1 += CheckBoxList1.Items[2].Selected == true ? @"<td class=""ShtCellCC"">複價</td>" : "";
                        tmpListStr1 += CheckBoxList1.Items[3].Selected == true ? @"<td class=""ShtCellCC"">責任歸屬</td>" : "";
                        tmpListStr1 += CheckBoxList1.Items[4].Selected == true ? @"<td class=""ShtCellCC"">原因</td>" : "";

                        tmpListStr1 += int.Parse(item1.Value) >= CheckBoxList2.Items.Count ? "</tr>" : "";
                        tmpStr.AppendLine(string.Format(tmpListStr, selectedValue.Substring(0, selectedValue.Length - 1), totalcount1));
                        tmpStr1.AppendLine(string.Format(tmpListStr1));

                    }

                }
                Literal3.Text = "";
                Literal4.Text += tmpStr.ToString();
                Literal5.Text += tmpStr1.ToString();
                //Literal3.Text += tmpStr2.ToString();
            }
            else
            {
                Literal4.Text = "";
                Literal5.Text = "";
            }
            DataContent();

        }
        protected void CheckBoxList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //var totalcount2 = CheckBoxList2.Items.Cast<ListItem>().Where(item => item.Selected).Count();//CheckBoxList2被選擇之數量(變更次別)
            //if (totalcount2 >= 2)
            //{
            //    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('最多選擇一項');", true);
            //    foreach (ListItem item1 in CheckBoxList2.Items)
            //    {
            //        item1.Selected = false;
            //    }
            //}
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangeCBudget.aspx");
        }
        protected void ImgExcel_Click(object sender, ImageClickEventArgs e)
        {
            string ProjectName = WebModel.PidName(Session["DatabaseName"].ToString(), "ProjectM0", Session["ProjectCode"].ToString());
            Response.Expires = 0;
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "utf-8";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + ProjectName + ".xls");
            Response.Write("<meta http-equiv=Content-Type content=text/html;charset=utf-8>");

            string l_str2 = "";
            l_str2 += @"<table border=""1"" class=""Table1""><tr class=""TableTop"">";
            l_str2 += Literal1.Text;
            l_str2 += Literal4.Text;
            l_str2 += Literal2.Text;
            l_str2 += Literal5.Text;
            l_str2 += @"<tr class=""TableSingle"">";
            l_str2 += Literal3.Text;
            l_str2 += @"</tr></table>";
            Response.Write(l_str2);
            Response.End();
        }

        protected void ImgPDF_Click(object sender, ImageClickEventArgs e)
        {
            string ProjectName = WebModel.PidName(Session["DatabaseName"].ToString(), "ProjectM0", Session["ProjectCode"].ToString());
            string l_str2 = "";
            l_str2 += @"<table class=""Sht100""><tr class=""ShtRowTop"">";
            l_str2 += Literal1.Text;
            l_str2 += Literal4.Text;
            l_str2 += Literal2.Text;
            l_str2 += Literal5.Text;
            l_str2 += @"<tr class=""ShtRowSingle"">";
            l_str2 += Literal3.Text;
            l_str2 += @"</tr></table>";
            string html = l_str2.ToString();

            using (IPechkin pechkin = Factory.Create(new GlobalConfig()))
            {

                var pdf = pechkin.Convert(new ObjectConfig()
                        .SetLoadImages(true).SetZoomFactor(1.5)
                        .SetPrintBackground(true)
                        .SetScreenMediaType(true)
                        .SetAffectPageCounts(true)
                        .SetCreateExternalLinks(true), html);




                Response.Clear();

                Response.ClearContent();
                Response.ClearHeaders();

                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", string.Format("attachment;filename=" + ProjectName + ".pdf; size={0}", pdf.Length));
                Response.BinaryWrite(pdf);

                Response.Flush();
                Response.End();

            }
        }
    }
}