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
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


namespace IMS
{
    public partial class CBudgetView : System.Web.UI.Page
    {
        protected string LbLayerNum;
        protected string ChNum;
        protected int  Cedittion;
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
                
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請選擇專案');", true);
                Response.Redirect("Main.aspx");
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
                LoadContent();
                Reload_Click(this, null);
                if (Session["projectCode"] != null)
                {
                    string database = Session["DatabaseName"].ToString();
                    string SQLLayer = "Select max(LayerNum) as layer from CBudget_WBS where PID=" + Session["projectCode"].ToString();
                    string Layer = WebModel.SItemName(database, SQLLayer, "layer");
                    if (Layer != "")
                    {
                        //DDL_LayerSelect.Items.Add("-請選擇-");
                        for (int i = 1; i <= int.Parse(Layer); i++)
                        {
                            DDL_LayerSelect.Items.Add(i.ToString());
                        }
                    }
                    else
                    {
                        DDL_LayerSelect.Items.Clear();

                    }
                }
            }
            //else
            //{
            //    SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            //    SqlDataSource1.SelectCommand = "Select * From CBudget_WBS a  left join Pro_Resource c on a.PriceID=c.PriceID Where a.PID=" + Session["ProjectCode"].ToString() + "";
            //}
            if (Session["LbLayerNum"] != null)
            {
                LbLayerNum = Session["LbLayerNum"].ToString();
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
           

            ListStr = @"
                                <td class=""ShtCellCC"" colspan=""{0}"" rowspan=""2"">項次</td>
                                <td class=""ShtCellCC"" rowspan=""2"">工項名稱</td>
                                <td class=""ShtCellCC"" rowspan=""2"">單位</td>
                                <td class=""ShtCellCC"" rowspan=""2"">單價分析</td>
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
            //Reload_Click(this, null);
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
            decimal LCTotal = 0;
            decimal LCCAL = 0;
            string ChAmount = "";
            CToatal = 0;
            string ListStr3 = "";

            string layer = "";
            string UpperUID = "";
            string order_Num = "";
            string UID1 = "";
            string SortNum = "";
            string Find_order_Num = "";
            int LayerNum = WebModel.MaxLayerSNum(database, "CBudget_WBS", Session["ProjectCode"].ToString());
            if (CheckBoxList2.SelectedValue == "")
            {
                StringBuilder tmpStr3 = new StringBuilder();
             

                DataTable vsDt = new DataTable();
                vsSql = @"Select * From CBudget_WBS a  left join Pro_Resource c on a.PriceID=c.PriceID Where a.PID=" + Session["ProjectCode"].ToString() + " order by order_Num";
                vsDt = WebModel.LoadSetContentData(database, vsSql);

                if (vsDt.Rows.Count > 0)
                {
                    for (int i = 0; i < vsDt.Rows.Count; i++)
                    {
                        Orderlayer = "";
                        int sort = i + 1;
                        DataRow vsDr = vsDt.Rows[i];
                        LbWid = vsDr["CWid"].ToString();
                        LbPriceID = vsDr["PriceID"].ToString();
                        LbItemOrder = vsDr["ItemOrder"].ToString();
                        LbItemName = vsDr["ItemName"].ToString();
                        LbUnit = vsDr["Unit"].ToString();
                        LbCNumber = vsDr["CNumber"].ToString() != "" ? vsDr["CNumber"].ToString() : "0";
                        LbCPrice = vsDr["CPrice"].ToString() != "" ? vsDr["CPrice"].ToString() : "0";
                        LbCComplex = (decimal.Parse(LbCNumber) * decimal.Parse(LbCPrice)).ToString("N0");
                        LbNotes = vsDr["Notes"].ToString();
                        NowLayer = vsDr["LayerNum"].ToString() !=""?vsDr["LayerNum"].ToString():"0";
                        string LastCNumber = vsDr["LastCNumber"].ToString() != "" ? vsDr["LastCNumber"].ToString() : "0";
                        LCCAL = (decimal.Parse(LastCNumber) * decimal.Parse(LbCPrice));
                        string Img = LbPriceID != "" ? "visible" : "hidden";
                        string Img1 = LbPriceID != "" ? "" : "none";
                        string Link = LbPriceID != "" ? "AnalysisV_BWBS.aspx?PriceId=" + LbPriceID + " " : "#";
                        string Link1 = LbPriceID != "" ? "target=_blank" : "";
                        
                      
                        ChAmount = (LCCAL - decimal.Parse(LbCComplex)).ToString("N0");
                        if (decimal.Parse(ChAmount) > 0)
                        {
                            ChAmount = "+" + ChAmount + "";
                        }
                        int x=0;
                        if (LayerNum !=null)
                        {
                        x = LayerNum - int.Parse(NowLayer) + 1;//- int.Parse(layer)
                        }
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
                            color = "auto-style83";
                        }
                        else if (decimal.Parse(ChAmount) < 0)
                        {
                            color = "auto-style87";
                        }


                        //show ladder information need
                         layer = vsDr["LayerNum"].ToString();
                         UpperUID = vsDr["UpperWID"].ToString();
                         order_Num = vsDr["order_Num"].ToString();
                         UID1 = vsDr["CWID"].ToString();
                         SortNum = vsDr["SortNum"].ToString();
                         Find_order_Num = CBLayerCodeSort.Get_Order(database, Session["ProjectCode"].ToString(), UID1, UpperUID, order_Num, SortNum);

                        if (layer == "1")
                        {
                          
                            ListStr2 = @"<tr style=""background-color:white"" class=""treegrid-{14}"" id=tr""{14}"">
                                <Label ID=""LbWid""  Visible=""false"" Text=""{0}""></Label> 
                                <Label ID=""LbPriceID"" Visible=""false"" Text=""{1}""></Label>
                                {2}{3}
                                <td class=""autoLeft"">{4}</td>
                                <td class=""auto-style83"">{5}</td>
                                <td class=""auto-style81"" style=""width:3%""> <a href=""{12}"" {13}  ><img src="" ../img/Ana.jpg"" ToolTip=""檢視單價分析""  style=""visibility:{11};padding-left:5px;"" ></a></td>
                                <td class=""auto-style83"" style=""text-align:right"">{6}</td>
                                <td class=""auto-style83"" style=""text-align:right"">{7}</td>
                                <td class=""auto-style83"" style=""text-align:right"">{8}</td>
                                <td style=""text-align:right"" class=" + color + "  >{9}</td>" +
                             "<td style=\"text-align:left\" class=\"auto-style83\"  >{10}</td>";

                        }
                        else
                        {


                            ListStr2 = @"<tr class=""treegrid-{14}  treegrid-parent-{15}"" id=tr""{14}"">
                                <Label ID=""LbWid""  Visible=""false"" Text=""{0}""></Label>
                                <Label ID=""LbPriceID"" Visible=""false"" Text=""{1}""></Label>
                                {2}{3}
                                <td class=""autoLeft"">{4}</td>
                                <td class=""auto-style83"">{5}</td>
                                <td class=""auto-style81"" style=""width:3%""> <a href=""{12}"" {13}  ><img src="" ../img/Ana.jpg"" ToolTip=""檢視單價分析""  style=""visibility:{11};padding-left:5px;"" ></a></td>
                                <td class=""auto-style83"" style=""text-align:right"">{6}</td>
                                <td class=""auto-style83"" style=""text-align:right"">{7}</td>
                                <td class=""auto-style83"" style=""text-align:right"">{8}</td>
                                <td style=""text-align:right"" class=" + color + "  >{9}</td>" +
                               "<td style=\"text-align:left\" class=\"auto-style83\"  >{10}</td>";
                        }


                        tmpStr3.AppendLine(string.Format(ListStr2, LbWid, LbPriceID, Orderlayer, order, LbItemName, LbUnit, LbCNumber, LbCPrice, LbCComplex, ChAmount, LbNotes, Img, Link, Link1, sort, Find_order_Num));
                        CToatal += Convert.ToDecimal(LbCComplex);
                        LCTotal += LCCAL;
                    }

                    LbCTotal.Text = CToatal.ToString("N0");
                    LbETotal.Text = LCTotal.ToString("N0");
                    LbSTotal.Text = (LCTotal - CToatal).ToString("N0");
                }
                Literal3.Text = tmpStr3.ToString();
//                // string count="";
//                //int num = tmpStr3.ToString().LastIndexOf(count);

//                //var lines = tmpStr3.ToString().Split(new string[] {System.Environment.NewLine },StringSplitOptions.None).Length;
             
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
                //}
            } 
                 Stopwatch stopwatch = new Stopwatch();
                 stopwatch.Start();
            if(CheckBoxList2.SelectedValue!="")
            {

              

                ListStr3 = @"<tr class=""ShtRowSingle"">
                 <Label ID=""LbWid""  Visible=""false"" Text=""{0}""></Label>
                                <Label ID=""LbPriceID"" Visible=""false"" Text=""{1}""></Label>
                                {2}{3}
                                <td class=""autoLeft"" style=""width:300px"">{4}</td>
                                <td class=""auto-style83"">{5}</td>
                                <td class=""auto-style81"" style=""width:3%""> <a href=""{10}"" {11} ><img src=""../img/Ana.jpg"" ToolTip=""檢視單價分析"" style=""visibility:{9};padding-left:5%;""  ></a></td>
                                <td class=""auto-style83"" style=""text-align:right"">{6}</td>
                                <td class=""auto-style83"" style=""text-align:right"">{7}</td>
                                <td class=""auto-style83"" style=""text-align:right"">{8}</td>";

            string selectedValue = "";
            string SQLSelect = "";
            string Sum = "";      
            string vsSql1 = "";
            //ListStr2 = "";
            //int max = Result.Max();
            //int min = Result.Min();
            string LbNotes1 = "";
            string ChAmount1 = "";
            StringBuilder tmpStr2 = new StringBuilder();
            List<ListItem> selected = new List<ListItem>();
            //Literal3.Text = "";
            CToatal = 0;
            LCTotal = 0;
            var totalcount1 = CheckBoxList1.Items.Cast<ListItem>().Where(item => item.Selected).Count();//CheckBoxList1被選擇之數量(欄位選擇)
            var totalcount2 = CheckBoxList2.Items.Cast<ListItem>().Where(item => item.Selected).Count();//CheckBoxList2被選擇之數量(變更次別)
            DataTable vsDt1 = new DataTable();
            vsSql1 = @"Select * From CBudget_WBS a  left join Pro_Resource c on a.PriceID=c.PriceID Where a.PID=" + Session["ProjectCode"].ToString() + " order by order_Num";
            vsDt1 = WebModel.LoadSetContentData(database, vsSql1);
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
                   
                    Sum += selectedValue;
                    SQLSelect += (selectedValue.Length > 1) ? "or b.CEdition= " + Sum.Substring(0, Sum.Length - 1) : "";
                 
                 
                    if (vsDt1.Rows.Count > 0)
                    {
                      
                        for (int i = 0; i < vsDt1.Rows.Count; i++)
                        {
                           string Orderlayer1 = "";
                           int sort = i + 1;
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
                            string Img = LbPriceID1 != "" ? "visible" : "hidden";
                            string Img1 = LbPriceID1 != "" ? "" : "none";
                            string Link = LbPriceID1 != "" ? "AnalysisV_BWBS.aspx?PriceId=" + LbPriceID1 + "" : "#";
                            string Link1= LbPriceID1 != "" ?"target=_blank":"";
                            string LastCNumber1 = vsDr["LastCNumber"].ToString() != "" ? vsDr["LastCNumber"].ToString() : "0";
                            LCCAL = (decimal.Parse(LastCNumber1) * decimal.Parse(LbCPrice1));
                            CToatal += Convert.ToDecimal(LbCComplex1);
                            LbCTotal.Text = CToatal.ToString("N0");
                            LCTotal += LCCAL;
                            LbETotal.Text = LCTotal.ToString("N0");
                            ChAmount1 = (LCCAL - decimal.Parse(LbCComplex1)).ToString("N0");
                            if ( decimal.Parse( ChAmount1 )> 0)
                            {
                                ChAmount1 = "+" + ChAmount1 + "";
                            }
                           
                            int x = LayerNum - int.Parse(NowLayer1) + 1;//- int.Parse(layer)項次階層計算
                            
                            for (int j = 1; j <= int.Parse(NowLayer1) - 1; j++)
                            {
                                Orderlayer1 += "<td class='itemframe'  style='min-width:10px;border-left-style:none'></td>";

                            }
                            string order1 = "<td  colspan= " + x + ">" + LbItemOrder1 + "</td>";
                           
                            //show ladder information need
                            layer = vsDr["LayerNum"].ToString();
                            UpperUID = vsDr["UpperWID"].ToString();
                            order_Num = vsDr["order_Num"].ToString();
                            UID1 = vsDr["CWID"].ToString();
                            SortNum = vsDr["SortNum"].ToString();
                            Find_order_Num = CBLayerCodeSort.Get_Order(database, Session["ProjectCode"].ToString(), UID1, UpperUID, order_Num, SortNum);
                            
                            if (layer == "1")
                            {

                                ListStr3 = @"<tr style=""background-color:white"" class=""treegrid-{12}"" id=tr""{12}"">
                                <Label ID=""LbWid""  Visible=""false"" Text=""{0}""></Label>
                                <Label ID=""LbPriceID"" Visible=""false"" Text=""{1}""></Label>
                                {2}{3}
                                <td class=""autoLeft"" style=""width:280px"">{4}</td>
                                <td class=""auto-style83"">{5}</td>
                                <td class=""auto-style81"" style=""width:3%""> <a href=""{10}"" {11} ><img src=""../img/Ana.jpg"" ToolTip=""檢視單價分析"" style=""visibility:{9};padding-left:5%;""  ></a></td>
                                <td class=""auto-style83"" style=""text-align:right"">{6}</td>
                                <td class=""auto-style83"" style=""text-align:right"">{7}</td>
                                <td class=""auto-style83"" style=""text-align:right"">{8}</td>";

                            }
                            else
                            {
                                ListStr3 = @"<tr class=""treegrid-{12}  treegrid-parent-{13}"" id=tr""{12}"">
                                <Label ID=""LbWid""  Visible=""false"" Text=""{0}""></Label>
                                <Label ID=""LbPriceID"" Visible=""false"" Text=""{1}""></Label>
                                {2}{3}
                                <td class=""autoLeft"" style=""width:280px"">{4}</td>
                                <td class=""auto-style83"">{5}</td>
                                <td class=""auto-style81"" style=""width:3%""> <a href=""{10}"" {11} ><img src=""../img/Ana.jpg"" ToolTip=""檢視單價分析"" style=""visibility:{9};padding-left:5%;""  ></a></td>
                                <td class=""auto-style83"" style=""text-align:right"">{6}</td>
                                <td class=""auto-style83"" style=""text-align:right"">{7}</td>
                                <td class=""auto-style83"" style=""text-align:right"">{8}</td>";
                            }
                            tmpStr2.AppendLine(string.Format(ListStr3, LbWid1, LbPriceID1, Orderlayer1, order1, LbItemName1, LbUnit1, LbCNumber1, LbCPrice1, LbCComplex1, Img, Link, Link1, sort, Find_order_Num));
                            DataTable Addvalue = CBudgetDisp.LoadContentData_CB(database, Session["ProjectCode"].ToString(), selectedValue);
                           
                             foreach (ListItem item2 in CheckBoxList2.Items)
                                    {
                                if (item2.Selected == true)
                                {
                         
                            if (Addvalue.Rows.Count > 0)
                            {
                                DataRow vsDr1 = Addvalue.Rows[i];
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
                                string LbEPrice1 = vsDr1["CPrice"].ToString() != "" ? vsDr1["CPrice"].ToString() : "0";
                              
                                string LbRespond1 = vsDr1["Response" + item2.Value + ""].ToString();
                                string LbReason1 = vsDr1["Reason" + item2.Value + ""].ToString();
                                //ETotal += Convert.ToDecimal(LbEComplex1);
                                //LbETotal.Text = ETotal.ToString("N0");

                                string LbEComplex1 = (decimal.Parse(LbChNumber1) * decimal.Parse(LbEPrice1)).ToString("N0");
                                //    for(int j=0; j<int.Parse(item1.Value); j++)
                                //{
                                    if (CheckBoxList1.Items[0].Selected == true)
                                    {
                                        tmpStr2.AppendLine(string.Format("<td class=\"auto-style83\" style=\"width:5%;text-align:right\">{0}</td>", LbChNumber1));

                                    }
                                    if (CheckBoxList1.Items[1].Selected == true)
                                    {
                                        tmpStr2.AppendLine(string.Format("<td class=\"auto-style83\" style=\"width:5%;text-align:right\">{0}</td>", LbEPrice1));
                                    }
                                    if (CheckBoxList1.Items[2].Selected == true)
                                    {
                                        tmpStr2.AppendLine(string.Format("<td class=\"auto-style83\" style=\"width:5%;text-align:right\">{0}</td>", LbEComplex1));
                                    }
                                    if (CheckBoxList1.Items[3].Selected == true)
                                    {
                                        tmpStr2.AppendLine(string.Format("<td class=\"auto-style83\" style=\"width:5%;text-align:right\">{0}</td>", LbRespond1));
                                    }
                                    if (CheckBoxList1.Items[4].Selected == true)
                                    {
                                        tmpStr2.AppendLine(string.Format("<td class=\"auto-style83\" style=\"width:5%;text-align:right\">{0}</td>", LbReason1));

                                    }
                                }
                                }
                            }//tmpStr2.AppendLine(string.Format(ListStr2, LbWid1, LbPriceID1, Orderlayer1, order1, LbItemName1, LbUnit1, LbCNumber1, LbCPrice1, LbCComplex1, LbChNumber, LbEPrice, LbEComplex, LbRespond, LbReason, LbNotes));
                            string color = "";

                            if (decimal.Parse(ChAmount1) > 0)
                            {
                                color = "auto-style85";
                            }
                            else if (decimal.Parse(ChAmount1) == 0)
                            {
                                color = "auto-style83";
                            }
                            else if (decimal.Parse(ChAmount1) < 0)
                            {
                                color = "auto-style87";
                            }
                            tmpStr2.AppendLine(string.Format("<td class=\"" + color + "\" style=\"width:5%;text-align:right\">{0}</td>", ChAmount1));
                            tmpStr2.AppendLine(string.Format("<td class=\"auto-style83\" style=\"width:5%;text-align:left\">{0}</td></tr>", LbNotes1));
                         
                        }
                        tmpStr2.AppendLine(string.Format("<tr><td>小計</td><td colspan=\"4\" >1234</td><td colspan=\"4\">1234<td></tr>", LbNotes1));
                    }
                }
               
            }
            Literal3.Text = tmpStr2.ToString();
            stopwatch.Stop();

            // Write result.
            Console.WriteLine("Time elapsed: {0}", stopwatch.Elapsed);
            }
         
        
        }
        protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
        {
            OpenNewWindow("BudgetAnalysisV.aspx", "B", "1200", "800");
        }
        public void OpenNewWindow(string url, string Tgr, string width, string height)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=" + height + ",width=" + width + "";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
        }
        #region
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
           
            int maxlayer = WebModel.MaxValue(database, "EBudget_WBS", "LayerNum");
            LbLayerNum = maxlayer.ToString();
            Session["LbLayerNum"] = LbLayerNum;
         
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {


                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;

                Label Lbwid = (Label)e.Item.FindControl("Lbwid");
                Label LbPriceID = (Label)e.Item.FindControl("LbPriceID");
                Label LbItemOrder = (Label)e.Item.FindControl("LbItemOrder");
                Label LbItemName = (Label)e.Item.FindControl("LbItemName");
                Label LbUnit = (Label)e.Item.FindControl("LbUnit");
                Label LbCNumber = (Label)e.Item.FindControl("LbCNumber");
                Label LbCPrice = (Label)e.Item.FindControl("LbCPrice");
                Label LbCComplex = (Label)e.Item.FindControl("LbCComplex");
               
                Label LbNotes = (Label)e.Item.FindControl("LbNotes");
                Literal Literal1 = (Literal)e.Item.FindControl("Literal1");
                HtmlControl html_lihead = e.Item.FindControl("html_lihead") as HtmlControl;
                ImageButton ImageButtonAna = (ImageButton)e.Item.FindControl("ImageButtonAna");
              

                Lbwid.Text = vsDr["CWID"].ToString();
                LbPriceID.Text = vsDr["PriceID"].ToString();
                string Order = vsDr["ItemOrder"].ToString();
                //LbItemOrder.Text = vsDr["ItemOrder"].ToString();                           
                LbItemName.Text = vsDr["ItemName"].ToString();
                LbUnit.Text = vsDr["Unit"].ToString();
                LbCNumber.Text = vsDr["CNumber"].ToString() != "" ? vsDr["CNumber"].ToString() : "0";
                LbCPrice.Text = vsDr["CPrice"].ToString() != "" ? vsDr["CPrice"].ToString() : "0";
                LbCComplex.Text = (decimal.Parse(LbCNumber.Text) * decimal.Parse(LbCPrice.Text)).ToString("N0");
             
                LbNotes.Text = vsDr["Notes"].ToString();
                //ImageButtonAdd.Visible = (vsDr["ItemKind"].ToString() != "variableSumPercentage") ? true : false;
                ImageButtonAna.Visible = (vsDr["PriceID"].ToString() != "") ? true : false;
              

                //EToatal += Convert.ToDecimal(LbCComplex.Text);
                LbCTotal.Text = CToatal.ToString("N0");
                //ETotal += Convert.ToDecimal(LbEComplex.Text);
                LbETotal.Text = ETotal.ToString("N0");
                string layer = vsDr["LayerNum"].ToString();
                int x = int.Parse(LbLayerNum) - int.Parse(layer) + 1;//- int.Parse(layer)

                for (int i = 1; i <= int.Parse(layer) - 1; i++)
                {
                    Literal1.Text += @"<td class='itemframe'  style='min-width:10px;border-left-style:none'></td>";

                }

                Literal1.Text += @"<td  colspan= " + x + ">" + Order + "</td>";


            }
        }
        #endregion
        protected void Reload_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string selectedValue = "";
            var totalcount = CheckBoxList2.Items.Cast<ListItem>().Where(item => item.Selected).Count();
            var totalcount1 = CheckBoxList1.Items.Cast<ListItem>().Where(item => item.Selected).Count();
            string tmpListStr = "";
//            string tmpListStr2 = "";
//            StringBuilder tmpStr2 = new StringBuilder();
//            tmpListStr2 = @"<td class=""auto-style45"" colspan=""5"">
//                                    <asp:HyperLink ID=""HyperLink1"" runat=""server"" Font-Underline=""True"" ForeColor=""#0066FF"" ToolTip=""變更摘要編輯"" NavigateUrl=""~/CChangeSummary2.aspx"">第{0}次變更設計</asp:HyperLink>
//                                </td>";
//            tmpListStr2 += @"<td class=""auto-style45"" rowspan=""2"">變更設計<br />
//                                    追加減金額</td>";
//            tmpStr2.AppendLine(string.Format(tmpListStr2, totalcount));

            Cedittion = WebModel.MaxAnyID(database, "CBudget_Change", Session["ProjectCode"].ToString(), "CEdition");

            if (ViewState["chblstAdd"] == null)
            {
                if (CheckBoxList2.Items.Count !=0)
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
                        tmpListStr = @"<td class=""auto-style45"" colspan={1}>
                                    <a href=""CChangeSummaryV.aspx?ID={0}"" target=""_blank"">第{0}次變更設計</a>
                                </td>";
//                        tmpListStr += int.Parse(item1.Value) >= totalcount ? @"<td class=""auto-style45"" rowspan=""2"">變更設計<br />
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
            LoadContent();

            //SqlDataSource1.SelectCommand = "Select * From CBudget_WBS a left join CBudget_Change_Detail b on a.CWID=b.CWID left join Pro_Resource c on a.PriceID=c.PriceID Where a.PID=" + Session["ProjectCode"].ToString() + " " + SQLSelect + "";

        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Analyst")
            {
                string PriceID = ((Label)e.Item.FindControl("LbPriceID")).Text;

                OpenNewWindow("AnalysisV_EWBS.aspx?PriceID=" + PriceID + "", "A", "1200", "800");
            }
        }

      
        protected void CheckBoxList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //var totalcount2 = CheckBoxList2.Items.Cast<ListItem>().Where(item => item.Selected).Count();//CheckBoxList2被選擇之數量(變更次別)
            //if (totalcount2>=2)
            //{
            //    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('最多選擇一項');", true);
            //    foreach (ListItem item1 in CheckBoxList2.Items)
            //    {
            //        item1.Selected = false;
            //    }
            //}
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
            l_str2 +=@"<table border=""1"" class=""Table1""><tr class=""TableTop"">";
            l_str2 += Literal1.Text;
            l_str2 += Literal4.Text;
            l_str2 += Literal2.Text;
            l_str2 += Literal5.Text;
            l_str2 += @"<tr class=""TableSingle"">";
            l_str2 += Literal3.Text;
            l_str2 +=@"</tr></table>";
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
        protected void DDL_LayerSelect_SelectedIndexChanged(object sender, EventArgs e)
        {

            Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "Select(" + DDL_LayerSelect.SelectedValue + ");", true);//ajax 新增階層碼


        }
    }
}