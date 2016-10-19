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
    public partial class ExeBudgetView : System.Web.UI.Page
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
                Cedittion = WebModel.MaxAnyID(Session["DatabaseName"].ToString(), "EBudget_Change", Session["ProjectCode"].ToString(), "EEdition");
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

                    string SQLLayer = "Select max(LayerNum) as layer from EBudget_WBS where PID=" + Session["projectCode"].ToString();
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
        }
        protected void LoadContent()
        {
            string database = Session["DatabaseName"].ToString();
            string ListStr = "";
            string ListStr1 = "";
          
            ViewState["edition"] = true;
            StringBuilder tmpStr1 = new StringBuilder();
            StringBuilder tmpStr2 = new StringBuilder();

            //if (CheckBoxList2.SelectedValue == "")
            //{ <td class=""auto-style46"" rowspan=""2"">單價分析</td>
                ListStr = @"
                                <td class=""auto-style45"" colspan=""{0}"" rowspan=""2"">項次</td>
                                <td class=""auto-style45"" rowspan=""2"">工項名稱</td>
                                <td class=""auto-style45"" rowspan=""2"">單位</td>
                               
                                <td class=""auto-style45"" colspan=""3"">原執行預算&nbsp;<img src="" ../img/UNLock.jpg""  style=""visibility:{1};width:30px"" ><img src="" ../img/Lock.jpg""  style=""visibility:{2};width:30px"" ></td>";
                ListStr1 = @" <td class=""auto-style45"" rowspan=""2"">變更設計<br />
                                    追加減金額</td>
                        <td class=""auto-style45"" rowspan=""2"">備註</td></tr>
                        <tr class=""TableTop""> 
                                <td class=""auto-style90"">數量</td>
                                <td class=""auto-style90"">單價</td>
                                <td class=""auto-style90"">複價</td>";

                int LayerNum = WebModel.MaxLayerSNum(database, "EBudget_WBS", Session["ProjectCode"].ToString());
                int Lock = WebModel.BudgetLock(database, "ProjectM0", Session["ProjectCode"].ToString(), "EBudgetLock");

                string Img = Lock != 1 ? "visible" : "hidden";
                string Img1 = Lock == 1 ? "visible" : "hidden";


                tmpStr1.AppendLine(string.Format(ListStr, LayerNum, Img, Img1));
                tmpStr2.AppendLine(string.Format(ListStr1));

                Literal1.Text = tmpStr1.ToString();
                Literal2.Text = tmpStr2.ToString();
            //}
            //else
            //{




            //}
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
            string LbEPrice = "";
            string LbCComplex = "";
            string LbNotes = "";
            string NowLayer = "";
            string Orderlayer = "";
            string order = ""; 
            decimal LETotal = 0;
            decimal LECAL = 0;
            string LastENumber = "0";

            string layer = "";
            string UpperUID = "";
            string order_Num = "";
            string UID1 = "";
            string SortNum = "";
            string Find_order_Num = "";

            DataTable vsDt = new DataTable();
            //vsSql = @"Select * From EBudget_WBS a  left join Pro_Resource c on a.PriceID=c.PriceID Where a.PID=" + Session["ProjectCode"].ToString() + " order by order_Num";
            vsSql = @"Select * From EBudget_WBS  Where PID=" + Session["ProjectCode"].ToString() + " order by order_Num";
            vsDt = WebModel.LoadSetContentData(database, vsSql);
            int LayerNum = WebModel.MaxLayerSNum(database, "EBudget_WBS", Session["ProjectCode"].ToString());

            if (CheckBoxList2.SelectedValue == "")
            {
                StringBuilder tmpStr3 = new StringBuilder();
             
               
                if (vsDt.Rows.Count > 0)
                {
                    for (int i = 0; i < vsDt.Rows.Count; i++)
                    {
                        Orderlayer = "";
                        int sort = i + 1;
                        DataRow vsDr = vsDt.Rows[i];
                        LbWid = vsDr["EWid"].ToString();
                        LbPriceID = vsDr["PriceID"].ToString();
                        LbItemOrder = vsDr["ItemOrder"].ToString();
                        LbItemName = vsDr["ItemName"].ToString();
                        LbUnit = vsDr["Unit"].ToString();
                        LbCNumber = vsDr["ENumber"].ToString() != "" ? vsDr["ENumber"].ToString() : "0";
                        LastENumber = vsDr["LastENumber"].ToString() != "" ? vsDr["LastENumber"].ToString() : "0";
                        LbEPrice = vsDr["EUnitPrice"].ToString() != "" ? vsDr["EUnitPrice"].ToString() : "0";
                        LbCComplex = (decimal.Parse(LbCNumber) * decimal.Parse(LbEPrice)).ToString("N0");
                        LbNotes = vsDr["Notes"].ToString();
                        NowLayer = vsDr["LayerNum"].ToString() !=""?vsDr["LayerNum"].ToString():"0";
                        //string Img = vsDr["Complex"].ToString() == "1" ? "visible" : "hidden";
                        string Img1 = LbPriceID != "" && LbPriceID != "0" ? "" : "none";
                        string Link = LbPriceID != "" ?  LbPriceID  : "";
                        string Link1 = LbPriceID != "" ? "target=_blank" : "";
                    
                        string ChAmount = "";
                        int x = LayerNum - int.Parse(NowLayer) + 1;//- int.Parse(layer)
                        CToatal += Convert.ToDecimal(LbCComplex);
                        LECAL = (decimal.Parse(LastENumber) * decimal.Parse(LbEPrice));
                        LETotal += LECAL;
                        LECAL = (decimal.Parse(LastENumber) * decimal.Parse(LbEPrice));
                        ChAmount = (LECAL - decimal.Parse(LbCComplex)).ToString("N0");
                        //LETotal += LECAL;
                        if (decimal.Parse(ChAmount) > 0)
                        {
                            ChAmount = "+" + ChAmount + "";
                        }
                        for (int j = 1; j <= int.Parse(NowLayer) - 1; j++)
                        {
                            Orderlayer += "<td class='itemframe'  style='min-width:10px;border-left-style:none'></td>";

                        }
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
                        layer = vsDr["LayerNum"].ToString();
                        UpperUID = vsDr["UpperWID"].ToString();
                        order_Num = vsDr["order_Num"].ToString();
                        UID1 = vsDr["CWID"].ToString();
                        SortNum = vsDr["SortNum"].ToString();
                        Find_order_Num = EBudgetDisp.Get_Order(database, Session["ProjectCode"].ToString(), UID1, UpperUID, order_Num, SortNum);

                        if (layer=="1")
                        {
                        ListStr2 = @"<tr style=""background-color:white"" class=""treegrid-{13}""  id=""tr{13}"">
                 <Label ID=""LbWid""  Visible=""false"" Text=""{0}""></Label>
                                <Label ID=""LbPriceID"" Visible=""false"" Text=""{1}""></Label>
                                {2}{3}
                                <td class=""autoLeft"">{4}</td>
                                <td class=""auto-style80"">{5}</td>   
                             
                                <td class=""auto-style83"">{6}</td>
                                <td class=""auto-style83"">{7}</td>
                                <td class=""auto-style83"">{8}</td>
                                <td class=" + color +">{9}</td>"+
                                "<td class=\"auto-style83\">{10}</td>";
                        }
                        else
                        {
                            ListStr2 = @"<tr style=""background-color:white"" class=""treegrid-{13} treegrid-parent-{14}"" id=""tr{13}"">
                 <Label ID=""LbWid""  Visible=""false"" Text=""{0}""></Label>
                                <Label ID=""LbPriceID"" Visible=""false"" Text=""{1}""></Label>
                                {2}{3}
                                <td class=""autoLeft"">{4}</td>
                                <td class=""auto-style80"">{5}</td>   
                             
                                <td class=""auto-style83"">{6}</td>
                                <td class=""auto-style83"">{7}</td>
                                <td class=""auto-style83"">{8}</td>
                                <td class=" + color + ">{9}</td>" +
                             "<td class=\"auto-style83\">{10}</td>";
                        }
                        order = "<td  colspan= " + x + ">" + LbItemOrder + "</td>";
                        tmpStr3.AppendLine(string.Format(ListStr2, LbWid, LbPriceID, Orderlayer, order, LbItemName, LbUnit, LbCNumber, LbEPrice, LbCComplex, ChAmount, LbNotes, Link, Link1, order_Num, Find_order_Num));
                        //   <td class=""auto-style81""> <a href=""javascript:void(0)"" {13} onclick=""window.open('AnalysisV_EWBS.aspx?PriceId={12}&ewid={0}','subwin','width=1200,height=500');"" ><img src="" ../img/Ana.jpg"" ToolTip=""檢視單價分析""  style=""visibility:{11};padding-left:5px;"" ></a></td>
                    }

                    LbETotal.Text = LETotal.ToString("N0");
                }


                Literal3.Text = tmpStr3.ToString();


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
            if (CheckBoxList2.SelectedValue != "")
            {
                     
                string selectedValue = "";
                string SQLSelect = "";
                string Sum = "";
                string vsSql1 = "";
                //int max = Result.Max();
                //int min = Result.Min();
                string LbNotes1 = "";
                string ChAmount1 = "0";
                string LastENumber1 = "0";
                decimal LETotal1 = 0;
                decimal LECAL1 = 0;
                string LbEComplex1 = "";
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
                       
                        Sum += selectedValue;
                        SQLSelect += (selectedValue.Length > 1) ? "or b.CEdition= " + Sum.Substring(0, Sum.Length - 1) : "";
                        DataTable vsDt1 = new DataTable();
                        //vsSql1 = @"Select * From EBudget_WBS a  left join Pro_Resource c on a.PriceID=c.PriceID Where a.PID=" + Session["ProjectCode"].ToString() + " order by order_Num";
                        vsSql1 = @"Select * From EBudget_WBS  Where PID=" + Session["ProjectCode"].ToString() + " order by order_Num";
                        vsDt1 = WebModel.LoadSetContentData(database, vsSql1);

                        if (vsDt1.Rows.Count > 0)
                        {

                            for (int i = 0; i < vsDt1.Rows.Count; i++)
                            {
                                string Orderlayer1 = "";
                                int sort = i + 1;
                                DataRow vsDr = vsDt1.Rows[i];
                                string LbWid1 = vsDr["EWid"].ToString();
                                string LbPriceID1 = vsDr["PriceID"].ToString();
                                string LbItemOrder1 = vsDr["ItemOrder"].ToString();
                                string LbItemName1 = vsDr["ItemName"].ToString();
                                string LbUnit1 = vsDr["Unit"].ToString();
                                string LbCNumber1 = vsDr["ENumber"].ToString() != "" ? vsDr["ENumber"].ToString() : "0";
                                LastENumber1 = vsDr["LastENumber"].ToString() != "" ? vsDr["LastENumber"].ToString() : "0";
                                string LbEPrice1 = vsDr["EUnitPrice"].ToString() != "" ? vsDr["EUnitPrice"].ToString() : "0";
                                string LbCComplex1 = (decimal.Parse(LbCNumber1) * decimal.Parse(LbEPrice1)).ToString("N0");
                                LbNotes1 = vsDr["Notes"].ToString();
                                string NowLayer1 = vsDr["LayerNum"].ToString();
                                //string Img = vsDr["Complex"].ToString() == "1" ? "visible" : "hidden";
                                string Img1 = LbPriceID1 != "" && LbPriceID1 != "0" ? "" : "none";
                                //string Link = LbPriceID1 != "" ? "AnalysisV_BWBS.aspx?PriceId=" + LbPriceID1 + "" : "#";
                                string Link = LbPriceID1 != "" ?  LbPriceID1 : "";
                                string Link1 = LbPriceID1 != "" ? "target=_blank" : "";
                                string ItemKind = vsDr["ItemKind"].ToString();
                                int[] uid = checkfun.Sort_LayerCode(database, Session["ProjectCode"].ToString(), int.Parse(LbWid1));

                                if (ItemKind == "mainitem")
                                {
                                    LbCNumber1 = "1";

                                }
                                decimal Sum2 = 0;
                                foreach (int uuu in uid)//使用foreach迴圈撈出陣列值
                                {

                                    string SQLEBudget = "Select * from EBudget_WBS where EWID=" + uuu;
                                    string ENum = WebModel.SItemName(database, SQLEBudget, "ENumber") != "" ? WebModel.SItemName(database, SQLEBudget, "ENumber") : "0";
                                    string EUnitPrice = WebModel.SItemName(database, SQLEBudget, "EUnitPrice") != "" ? WebModel.SItemName(database, SQLEBudget, "EUnitPrice") : "0";
                                    Sum2 += decimal.Parse(ENum) * decimal.Parse(EUnitPrice);
                                    LbCComplex1 = Sum2.ToString("N0");
                                }

                                CToatal += Convert.ToDecimal(LbCComplex1);
                                //LbCTotal.Text = CToatal.ToString("N0");
                                //LECAL1 = (decimal.Parse(LastENumber1) * decimal.Parse(LbEPrice1));
                                //LETotal1 += LECAL1;
                                //ChAmount1 = (LECAL1 - decimal.Parse(LbCComplex1)).ToString("N0");
                                if (decimal.Parse(ChAmount1) > 0)
                                {
                                    ChAmount1 = "+" + ChAmount1 + "";
                                }
                              
                                int x = LayerNum - int.Parse(NowLayer1) + 1;//- int.Parse(layer)項次階層計算

                                for (int j = 1; j <= int.Parse(NowLayer1) - 1; j++)
                                {
                                    Orderlayer1 += "<td class='itemframe'  style='min-width:10px;border-left-style:none'></td>";

                                }

                                layer = vsDr["LayerNum"].ToString();
                                UpperUID = vsDr["UpperWID"].ToString();
                                order_Num = vsDr["order_Num"].ToString();
                                UID1 = vsDr["CWID"].ToString();
                                SortNum = vsDr["SortNum"].ToString();
                                Find_order_Num = EBudgetDisp.Get_Order(database, Session["ProjectCode"].ToString(), UID1, UpperUID, order_Num, SortNum);

                                string order1 = "<td  colspan= " + x + ">" + LbItemOrder1 + "</td>";
                                string ListStr3 = "";
                                if (layer=="1")
                                {
                                    ListStr3 = @"<tr style=""background-color:white"" class=""treegrid-{11} "" id=""tr{11}"">
                                 <Label ID=""LbWid""  Visible=""false"" Text=""{0}""></Label>
                                <Label ID=""LbPriceID"" Visible=""false"" Text=""{1}""></Label>
                                {2}{3}
                                <td class=""autoLeft"">{4}</td>
                                <td class=""auto-style80"">{5}</td>                               
                                <td class=""auto-style83"">{6}</td>
                                <td class=""auto-style83"">{7}</td>
                                <td class=""auto-style83"">{8}</td>";
                                }
                                else
                                {
                                    ListStr3 = @"<tr style=""background-color:white"" class=""treegrid-{11} treegrid-parent-{12}"" id=""tr{11}"">
                                 <Label ID=""LbWid""  Visible=""false"" Text=""{0}""></Label>
                                <Label ID=""LbPriceID"" Visible=""false"" Text=""{1}""></Label>
                                {2}{3}
                                <td class=""autoLeft"">{4}</td>
                                <td class=""auto-style80"">{5}</td>                               
                                <td class=""auto-style83"">{6}</td>
                                <td class=""auto-style83"">{7}</td>
                                <td class=""auto-style83"">{8}</td>";
                                }
                                tmpStr2.AppendLine(string.Format(ListStr3, LbWid1, LbPriceID1, Orderlayer1, order1, LbItemName1, LbUnit1, LbCNumber1, LbEPrice1, LbCComplex1, Link, Link1, order_Num, Find_order_Num));
                                // <td class=""auto-style81""> <a href=""javascript:void(0)"" {11} onclick=""window.open('AnalysisV_EWBS.aspx?PriceId={10}&ewid={0}','subwin','width=1200,height=500');"" ><img src=""../img/Ana.jpg"" ToolTip=""檢視單價分析"" style=""visibility:{9};padding-left:5px;""  ></a></td>
                            
                               // LbETotal.Text = LETotal1.ToString("N0");
                                
                                //for (int j = 1; j <= totalcount2; j++)
                                //{
                                    foreach (ListItem item2 in CheckBoxList2.Items)
                                    {
                                if (item2.Selected == true)                               {


                                    DataTable Addvalue = EBudgetDisp.LoadContentData_CB(database, Session["ProjectCode"].ToString(), selectedValue, LbWid1);
                                
                                    if (Addvalue.Rows.Count > 0)
                                    {
                                        DataRow vsDr1 = Addvalue.Rows[0];
                                      
                                        //string LbChNumber1 = vsDr1["ChNumber"].ToString() != "" ? vsDr1["ChNumber"].ToString() : "0";
                                        string LbChNumber1 = vsDr1["ChNumber" + item2.Value + ""].ToString() != "" ? vsDr1["ChNumber" + item2.Value + ""].ToString() : "0";
                                        //string LbEPrice1 = vsDr1["CPrice"].ToString() != "" ? vsDr1["CPrice"].ToString() : "0";
                                        //if (LbChNumber1 == "0")
                                        //{
                                      
                                            for (int k = int.Parse(item2.Value); k > 0; k--)
                                            {
                                                LbChNumber1 = vsDr1["ChNumber" + k + ""].ToString() != "" ? vsDr1["ChNumber" + k + ""].ToString() : "0";
                                                if (LbChNumber1 != "0")
                                                {
                                                    LbEComplex1 = (decimal.Parse(LbChNumber1) * decimal.Parse(LbEPrice1)).ToString("N0");
                                                    LECAL1 = (decimal.Parse(LastENumber1) * decimal.Parse(LbEPrice1));
                                                    //LETotal1 += LECAL1;
                                                    ChAmount1 = (LECAL1 - decimal.Parse(LbEComplex1)).ToString("N0");
                                                    break;
                                                }
                                                else
                                                {
                                                    //LbChNumber1 = vsDr1["Enumber"].ToString() != "" ? vsDr1["Enumber"].ToString() : "0";
                                                    LbChNumber1 = vsDr1["Enumber"].ToString() != "" ? vsDr1["Enumber"].ToString() : "0";
                                                    decimal Sum1 = 0;
                                                    foreach (int uuu in uid)//使用foreach迴圈撈出陣列值
                                                    {

                                                        string SQLEBudget = "Select * from EBudget_WBS where EWID=" + uuu;
                                                        string ENum = WebModel.SItemName(database, SQLEBudget, "ENumber") != "" ? WebModel.SItemName(database, SQLEBudget, "ENumber") : "0";
                                                        string EUnitPrice = WebModel.SItemName(database, SQLEBudget, "EUnitPrice") != "" ? WebModel.SItemName(database, SQLEBudget, "EUnitPrice") : "0";
                                                        Sum1 += decimal.Parse(ENum) * decimal.Parse(EUnitPrice);
                                                        LbEComplex1 = Sum1.ToString("N0");
                                                    }
                                                }
                                            }

                                        //}
                                        //string LbEComplex1 = (decimal.Parse(LbChNumber1 ) * decimal.Parse(LbEPrice1)).ToString("N0");
                                        //string LbRespond1 = vsDr1["Response"].ToString();
                                        //string LbReason1 = vsDr1["Reason"].ToString();
                                            if (ItemKind == "mainitem")
                                            {
                                                LbChNumber1 = "1";

                                            }
                                      
                                        if (CheckBoxList1.Items[0].Selected == true)
                                        {
                                            tmpStr2.AppendLine(string.Format("<td class=\"auto-style83\">{0}</td>", LbChNumber1));

                                        }
                                        if (CheckBoxList1.Items[1].Selected == true)
                                        {
                                            tmpStr2.AppendLine(string.Format("<td class=\"auto-style83\">{0}</td>", LbEPrice1));
                                        }
                                        if (CheckBoxList1.Items[2].Selected == true)
                                        {
                                            tmpStr2.AppendLine(string.Format("<td class=\"auto-style83\">{0}</td>", LbEComplex1));
                                        }
                                        //if (CheckBoxList1.Items[3].Selected == true)
                                        //{
                                        //    tmpStr2.AppendLine(string.Format("<td class=\"auto-style83\">{0}</td>", LbRespond1));
                                        //}
                                        //if (CheckBoxList1.Items[4].Selected == true)
                                        //{
                                        //    tmpStr2.AppendLine(string.Format("<td class=\"auto-style83\">{0}</td>", LbReason1));

                                    }
                                    }
                                    // }
                                }//tmpStr2.AppendLine(string.Format(ListStr2, LbWid1, LbPriceID1, Orderlayer1, order1, LbItemName1, LbUnit1, LbCNumber1, LbCPrice1, LbCComplex1, LbChNumber, LbEPrice, LbEComplex, LbRespond, LbReason, LbNotes));
                                string color="";
                              
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
                                tmpStr2.AppendLine(string.Format("<td class=\"" + color + "\">{0}</td>", ChAmount1));
                                tmpStr2.AppendLine(string.Format("<td class=\"auto-style83\">{0}</td></tr>", LbNotes1));
                                ChAmount1 = "0";
                                layer = vsDr["LayerNum"].ToString() != "" ? vsDr["LayerNum"].ToString() : "0";
                                if (layer == "1")
                                {

                                    //CToatal += Convert.ToDecimal(LbCComplex.Text);
                                    //LbCTotal.Text = CToatal.ToString("N0");
                                    ETotal += Convert.ToDecimal(LbEComplex1);
                                    LbETotal.Text = ETotal.ToString("N0");
                                }
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
        protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
        {
            OpenNewWindow("BudgetAnalysisV.aspx", "B", "1200", "800");
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
         

            Cedittion = WebModel.MaxAnyID(database, "EBudget_Change", Session["ProjectCode"].ToString(), "EEdition");

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
                        tmpListStr = @"<td class=""auto-style45"" colspan={1}>
                                    <a href=""EChangeSummaryV.aspx?ID={0}"" target=""_blank"">第{0}次變更設計</a>
                                </td>";
                      

                        tmpListStr1 += CheckBoxList1.Items[0].Selected == true ? @"<td class=""auto-style90"">數量</td>" : "";
                        tmpListStr1 += CheckBoxList1.Items[1].Selected == true ? @"<td class=""auto-style90"">單價</td>" : "";
                        tmpListStr1 += CheckBoxList1.Items[2].Selected == true ? @"<td class=""auto-style90"">複價</td>" : "";
                        //tmpListStr1 += CheckBoxList1.Items[3].Selected == true ? @"<td class=""auto-style90"">責任歸屬</td>" : "";
                        //tmpListStr1 += CheckBoxList1.Items[4].Selected == true ? @"<td class=""auto-style90"">原因</td>" : "";

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
            l_str2 += @"<table border=""1"" class=""Table1""><tr class=""TableTop"">";
            l_str2 += Literal1.Text;
            l_str2 += Literal4.Text;
            l_str2 += Literal2.Text;
            l_str2 += Literal5.Text;
            l_str2 += @"<tr class=""TableSingle"">";
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