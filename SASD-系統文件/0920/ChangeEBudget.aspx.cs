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
using System.Web.UI.HtmlControls;


namespace IMS
{
    public partial class ChangeBudget : System.Web.UI.Page
    {
        protected string LbLayerNum;
        protected string ChNum;
        protected int Cedittion;
        decimal CToatal = 0;
        decimal ETotal = 0;
        string ListStr2 = "";
        protected HtmlInputSubmit hezuolianxisubmit;
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
                string SQLSelect = "Select * from EBudget_Change where pid=" + Session["ProjectCode"].ToString();
                string change = WebModel.SItemName(Session["DatabaseName"].ToString(), SQLSelect, "EEdition");
                if (change == "")
                {
                    ImageButton175.Visible = false;

                }
                else
                {
                    ImageButton175.Visible = true;

                }
                LoadContent();
            }
        }
        protected void LoadContent()
        {
            string database = Session["DatabaseName"].ToString();
            string ListStr = "";
            string ListStr1 = "";

            string SQLTotal = "select SUM(CTotal) as total from CBUDGET where Pid="+Session["ProjectCode"].ToString();
            DataTable sum = WebModel.LoadSetContentData(database, SQLTotal);
            if (sum.Rows.Count > 0)
            {
                for (int i = 0; i < sum.Rows.Count; i++)
                {
                    DataRow vsDr = sum.Rows[i];
                    LbCTotal.Text =vsDr["total"].ToString()!=""? decimal.Parse(vsDr["total"].ToString()).ToString("N0"):"0";

                }

            }
            string SQLETotal = "select SUM(ETotal) as total from EBUDGET where Pid=" + Session["ProjectCode"].ToString();
            DataTable sumE = WebModel.LoadSetContentData(database, SQLETotal);
            if (sumE.Rows.Count > 0)
            {
                for (int i = 0; i < sumE.Rows.Count; i++)
                {
                    DataRow vsDr = sumE.Rows[i];
                    LbETotal.Text = vsDr["total"].ToString()!=""?decimal.Parse(vsDr["total"].ToString()).ToString("N0"):"0";

                }

            }
          
            ViewState["edition"] = true;

            StringBuilder tmpStr1 = new StringBuilder();
            StringBuilder tmpStr2 = new StringBuilder();

            // <td class=""auto-style46"" rowspan=""2"">單價分析</td>
            ListStr = @"<td class=""ShtCellCC"" rowspan=""2"">編輯</td>
                                <td class=""ShtCellCC"" colspan=""{0}"" rowspan=""2"">項次</td>
                                <td class=""ShtCellCC"" rowspan=""2"">工項名稱</td>
                                <td class=""ShtCellCC"" rowspan=""2"">單位</td>
                                
                                <td class=""ShtCellCC"" colspan=""3"">原執行預算</td>";
            ListStr1 = @" <td class=""ShtCellCC"" rowspan=""2"">變更設計<br />
                                    追加減金額</td>
                        <td class=""ShtCellCC"" rowspan=""2"">備註</td>
                        <td class=""ShtCellCC"" rowspan=""2"">進度排程<br />引用項目</td></tr>
                        <tr class=""ShtRowTop""> 
                                <td class=""ShtCellCC"">數量</td>
                                <td class=""ShtCellCC"">單價</td>
                                <td class=""ShtCellCC"">複價</td>";

            int LayerNum = WebModel.MaxLayerSNum(database, "EBudget_WBS", Session["ProjectCode"].ToString());
            tmpStr1.AppendLine(string.Format(ListStr, LayerNum));
            tmpStr2.AppendLine(string.Format(ListStr1));

            Literal1.Text = tmpStr1.ToString();
            Literal2.Text = tmpStr2.ToString();
            DataContent();
            Reload_Click(this, null);
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
            DataTable vsDt = new DataTable();
            //vsSql = @"Select * From EBudget_WBS a  left join Pro_Resource c on a.PriceID=c.PriceID Where a.PID=" + Session["ProjectCode"].ToString() + " order by order_Num";
            vsSql = @"Select * From EBudget_WBS  Where PID=" + Session["ProjectCode"].ToString() + " order by order_Num";
            vsDt = WebModel.LoadSetContentData(database, vsSql);
            int LayerNum = WebModel.MaxLayerSNum(database, "EBudget_WBS", Session["ProjectCode"].ToString());
            string SQLSelect = "Select * from EBudget_Change where pid=" + Session["ProjectCode"].ToString();
            string change = "";
            change = WebModel.SItemName(database, SQLSelect, "EEdition");
            string NewItem = "";
            if (CheckBoxList2.SelectedValue == "")
            {
                StringBuilder tmpStr3 = new StringBuilder();
           
              
                if (vsDt.Rows.Count > 0)
                {
                    for (int i = 0; i < vsDt.Rows.Count; i++)
                    {
                        Orderlayer = "";
                        DataRow vsDr = vsDt.Rows[i];
                        LbWid = vsDr["EWid"].ToString();
                        string LbPriceID1 = vsDr["PriceID"].ToString();
                        LbItemOrder = vsDr["ItemOrder"].ToString();
                        LbItemName = vsDr["ItemName"].ToString();
                        LbUnit = vsDr["Unit"].ToString();
                        LbCNumber = vsDr["ENumber"].ToString() != "" ? vsDr["ENumber"].ToString() : "0";
                        LastENumber = vsDr["LastENumber"].ToString() != "" ? vsDr["LastENumber"].ToString() : "0";
                        LbEPrice = vsDr["EUnitPrice"].ToString() != "" ? vsDr["EUnitPrice"].ToString() : "0";
                        LbCComplex = (decimal.Parse(LbCNumber) * decimal.Parse(LbEPrice)).ToString("N0");
                        LbNotes = vsDr["Notes"].ToString();
                        NowLayer = vsDr["LayerNum"].ToString();
                        //string Img = vsDr["Complex"].ToString() == "1" ? "visible" : "hidden";
                        string Img1 = vsDr["ItemKind"].ToString() == "workitem" ? "" : "none";
                        //string Link = LbWid != "" ? "EChangeDetail.aspx?EWID=" + LbWid + "" : "#";
                        string Link = LbWid != "" ?  LbWid  : "";
                        string Link1 = vsDr["ItemKind"].ToString() == "workitem" ? "target=_blank" : "";
                        //string Link2 = LbPriceID1 != "" ? "AnalysisV_BWBS.aspx?PriceId=" + LbPriceID1 + "" : "#";
                        string Link2 = LbPriceID1 != "" ?  LbPriceID1  : "";
                        NewItem = vsDr["NewItem"].ToString();
                        //CheckBox ActivityUseNY = new CheckBox();                   
                        int[] uid = checkfun.Sort_LayerCode(database, Session["ProjectCode"].ToString(), int.Parse(LbWid));
                        string ItemKind = vsDr["ItemKind"].ToString();
                        if (ItemKind == "mainitem")
                        {
                            LbCNumber = "1";

                        }
                        decimal Sum = 0;
                        foreach (int uuu in uid)//使用foreach迴圈撈出陣列值
                        {

                            string SQLEBudget = "Select * from EBudget_WBS where EWID=" + uuu;
                            string ENum = WebModel.SItemName(database, SQLEBudget, "ENumber") != "" ? WebModel.SItemName(database, SQLEBudget, "ENumber") : "0";
                            string EUnitPrice = WebModel.SItemName(database, SQLEBudget, "EUnitPrice") != "" ? WebModel.SItemName(database, SQLEBudget, "EUnitPrice") : "0";
                            Sum += decimal.Parse(ENum) * decimal.Parse(EUnitPrice);
                            LbCComplex = Sum.ToString("N0");
                        }
                        LECAL = (decimal.Parse(LastENumber) * decimal.Parse(LbEPrice));
                        string ChAmount = (LECAL - decimal.Parse(LbCComplex)).ToString("N0");
                        LETotal += LECAL;
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
                            color = "auto-style83";
                        }
                        else if (decimal.Parse(ChAmount) < 0)
                        {
                            color = "auto-style87";
                        }
                      
                        ListStr2 = @"<tr class=""ShtRowSingle""> <td>";
                        if (change != "")
                        {
                            ListStr2 += @"
                                 <a href=""javascript:void(0)"" {13} onclick=""window.open('EChangeDetail.aspx?EWID={12}','subwin','width=1500,height=500');"" > <img src=""../img/Edit.png"" ToolTip=""逐項編輯"" Width=""25px""  style=""visibility:{11}""  /></a>";
                               
                        }
                        else
                        {
                            ListStr2 += @"<tr class=""ShtRowSingle""> <td style=""width: 8px"">";
//                                </td>
//                                 <Label ID=""LbWid""  Visible=""false"" Text=""{0}""></Label>
//                                <Label ID=""LbPriceID"" Visible=""false"" Text=""{1}""></Label>
//                                {2}{3}
//                                <td class=""autoLeft"">{4}</td>
//                                <td class=""auto-style80"">{5}</td>
//                              <td class=""auto-style81""> <a href=""javascript:void(0)"" {13} onclick=""window.open('AnalysisV_BWBS.aspx?PriceId={14}&ewid={0}','subwin','width=1200,height=500');"" ><img src="" ../img/Ana.jpg"" ToolTip=""檢視單價分析""  style=""visibility:{11};padding-left:5px"" ></a></td>
//                                <td class=""auto-style83"">{6}</td>
//                                <td class=""auto-style83"">{7}</td>
//                                <td class=""auto-style83"">{8}</td>
//                               <td class=" + color + ">{9}</td>" +
//                                  "<td class=\"auto-style83\">{10}</td>";

                        }
                        if (NewItem == "1")
                        {
                            ListStr2 += @" <a href=""javascript:void(0)"" {13} onclick=""BtnDel_Click()"" ><img src="" ../img/Delete.png"" ToolTip=""刪除項目"" Width=""25px""  style=""padding-left:5px"" ></a>";

                        }
                        ListStr2 += @"   </td> <Label ID=""LbWid""  Visible=""false"" Text=""{0}""></Label>
                                <Label ID=""LbPriceID"" Visible=""false"" Text=""{1}""></Label>
                                {2}{3}
                                <td class=""autoLeft"">{4}</td>
                                <td class=""auto-style80"">{5}</td>
                            
                                <td class=""auto-style83"">{6}</td>
                                <td class=""auto-style83"">{7}</td>
                                <td class=""auto-style83"">{8}</td>
                               <td class=" + color + ">{9}</td>" +
                                    "<td class=\"auto-style83\">{10}</td>";
                        //  <td class=""auto-style81""> <a href=""javascript:void(0)"" {13} onclick=""window.open('AnalysisV_EWBS.aspx?PriceId={14}&ewid={0}','subwin','width=1200,height=500');"" ><img src="" ../img/Ana.jpg"" ToolTip=""檢視單價分析""  style=""visibility:{11};padding-left:5px"" ></a></td>
                        tmpStr3.AppendLine(string.Format(ListStr2, LbWid, LbPriceID, Orderlayer, order, LbItemName, LbUnit, LbCNumber, LbEPrice, LbCComplex, ChAmount, LbNotes, Link, Link1, Link2));
                        if (vsDr["ActivityUseNY"].ToString() == "1")
                        {
                            //tmpStr3.Append("<input type=\"checkbox\" name=\"CheckDel").Append(vsDr["id"]).Append("\">");
                            tmpStr3.Append("<td class=\"auto-style80\"><input type=\"checkbox\" ID='").Append(i).Append("'").Append(" runat='server' style='zoom: 1.6'  checked='checked' AutoWidth='true' /></td></tr>");

                        }
                        else
                        {
                            tmpStr3.Append("<td class=\"auto-style80\" ><input type=\"checkbox\" ID='").Append(i).Append("'").Append(" runat='server' style='zoom: 1.6'  AutoWidth='true' /></td></tr>");
                        }
                        LECAL = (decimal.Parse(LastENumber) * decimal.Parse(LbEPrice));
                        CToatal += Convert.ToDecimal(LbCComplex);
                        LETotal += LECAL;
                    }

                  
                }

                Literal3.Text = tmpStr3.ToString();

          
            }
            Stopwatch stopwatch = new Stopwatch();
            stopwatch.Start();
            string ListStr3 = "";
          if (CheckBoxList2.SelectedValue != "")
            {

                 string selectedValue = "";             
                string vsSql1 = "";              
                string LbNotes1 = "";
                string ChAmount1 = "0";
                string LastENumber1 = "0";
                decimal LETotal1 = 0;
                decimal LECAL1 = 0;
                decimal CToatal1 = 0;
                
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
                  
                        DataTable vsDt1 = new DataTable();
                        //vsSql1 = @"Select * From EBudget_WBS a  left join Pro_Resource c on a.PriceID=c.PriceID Where a.PID=" + Session["ProjectCode"].ToString() + " order by order_Num";
                        vsSql1 = @"Select * From EBudget_WBS  Where PID=" + Session["ProjectCode"].ToString() + " order by order_Num";
                        vsDt1 = WebModel.LoadSetContentData(database, vsSql1);

                        if (vsDt1.Rows.Count > 0)
                        {

                            for (int i = 0; i < vsDt1.Rows.Count; i++)
                            {
                                string Orderlayer1 = "";
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
                                //string Img = vsDr["ItemKind"].ToString() == "workitem" ? "visible" : "hidden";
                                string Img = change != "" && vsDr["ItemKind"].ToString() == "workitem" ? "visible" : "hidden";
                                string Img1 = vsDr["ItemKind"].ToString() == "workitem" ? "" : "none";
                                string Img2 = vsDr["ItemKind"].ToString() == "workitem" ? "visible" : "hidden";
                                //string Link = LbWid1 != "" ? "EChangeDetail.aspx?EWID=" + LbWid1 + "" : "#";
                                string Link = LbWid1 != "" ?  LbWid1  : "";
                                string Link1 = vsDr["ItemKind"].ToString() == "workitem" ? "target=_blank" : "";
                               // string Link2 = LbPriceID1 != "" ? "AnalysisV_BWBS.aspx?PriceId=" + LbPriceID1 + "" : "#";
                                NewItem = vsDr["NewItem"].ToString();
                                string Link2 = LbPriceID1 != "" ?  LbPriceID1  : "";
                                string ItemKind = vsDr["ItemKind"].ToString();
                                int[] uid = checkfun.Sort_LayerCode(database, Session["ProjectCode"].ToString(), int.Parse(LbWid1));
                              
                                if (ItemKind == "mainitem")
                                {
                                    LbCNumber1 = "1";
                                   
                                }
                                decimal Sum = 0;
                                foreach (int uuu in uid)//使用foreach迴圈撈出陣列值
                                {

                                    string SQLEBudget = "Select * from EBudget_WBS where EWID=" + uuu;
                                    string ENum = WebModel.SItemName(database, SQLEBudget, "ENumber") != "" ? WebModel.SItemName(database, SQLEBudget, "ENumber") : "0";
                                    string EUnitPrice = WebModel.SItemName(database, SQLEBudget, "EUnitPrice") != "" ? WebModel.SItemName(database, SQLEBudget, "EUnitPrice") : "0";
                                    Sum += decimal.Parse(ENum) * decimal.Parse(EUnitPrice);
                                    LbCComplex1 = Sum.ToString("N0");
                                }
                                //CToatal1 += Convert.ToDecimal(LbCComplex1);
                                string layer = vsDr["LayerNum"].ToString() != "" ? vsDr["LayerNum"].ToString() : "0";
                                //if (layer == "1")
                                //{

                                //    CToatal1 += Convert.ToDecimal(LbCComplex1);
                                //    LbCTotal.Text = CToatal.ToString("N0");
                                //    //ETotal += Convert.ToDecimal(LbEComplex1);
                                //    //LbETotal.Text = ETotal.ToString("N0");
                                //}
                                //LbCTotal.Text = CToatal1.ToString("N0");
                              
                                int x = LayerNum - int.Parse(NowLayer1) + 1;//- int.Parse(layer)項次階層計算

                                for (int j = 1; j <= int.Parse(NowLayer1) - 1; j++)
                                {
                                    Orderlayer1 += "<td class='itemframe'  style='min-width:10px;border-left-style:none'></td>";

                                }

                                tmpStr2.AppendLine("<tr class=\"ShtRowSingle\"> <td class=\"auto-style80\">");
                                if (change != "")
                                {
                                    tmpStr2.AppendLine(" <a href=\"javascript: void(0);\" " + Link1 + " onclick=\"window.open('EChangeDetail.aspx?EWID=" + Link + "','subwin','width=1500,height=500');\" ><img src=\"../img/Edit.png\" ToolTip=\"逐項編輯\" Width=\"25px\"  style=\"visibility:" + Img2 + "\"></a>");
                                    
                                }
                                else
                                {
                                    //ListStr3 += @"<tr class=""ShtRowSingle""> <td style=""width: 8px"">";


                                }
                                if (NewItem == "1")
                                {
                                    tmpStr2.AppendLine("<div class=\"myButton\"><input type=\"image\" img  src=\"../img/Delete.png\" Width=\"25px\" onclick=\"button2('" + LbWid1 + "');\" /></div>");                                
                                    tmpStr2.AppendLine(" <a href=\"javascript: void(0);\"  onclick=\"window.open('ENumberBD.aspx?CWID=" + Link + "','subwin','width=1500,height=500');\" ><img src=\"../img/NumBD.png\" ToolTip=\"拆數量\" Width=\"25px\"  ></a>");
                                    tmpStr2.AppendLine(" <a href=\"javascript: void(0);\"  onclick=\"window.open('EReallocation.aspx?CWID=" + Link + "','subwin','width=1500,height=800');\" ><img src=\"../img/Reallocation.png\" ToolTip=\"拆工料\" Width=\"25px\"  ></a>");
                                   
                                }
                                   //"<td width=\"20%\" id=\"Video_Preview_" + Set_Order + "\" name=\"Video_Preview_" + Set_Order + "\" style=\"display:none\">" +
                                string order1 = "<td  colspan= '" + x + "'>" + LbItemOrder1 + "</td>";
                                //tmpStr2.AppendLine("</td><Label ID=\"LbWid\"  Visible=\"false\" Text=\""+LbWid1+"\"></Label>" +
                                //"<Label ID=\"LbPriceID\" Visible=\"false\" Text="+LbPriceID1+"\"></Label>"+
                                //Orderlayer1 + "\""+order1+"\""+
                                //"<td class=\"autoLeft\">" + LbItemName1 + "</td>" +
                                //"<td class=\"auto-style83\">"+LbUnit1+ "</td>"+
                                //"<td class=\"auto-style83\">" + LbCNumber1 + "</td>" +
                                //"<td class=\"auto-style83\">"+LbEPrice1+ "</td>"+
                                //"<td class=\"auto-style83\">"+LbCComplex1+"</td>");


                              ListStr3 = @"
                                <Label ID=""LbWid""  Visible=""false"" Text=""{0}""></Label>
                                <Label ID=""LbPriceID"" Visible=""false"" Text=""{1}""></Label>
                                {2}{3}
                                <td class=""autoLeft"">{4}</td>
                                <td class=""auto-style80"">{5}</td>
                                
                                                          
                                <td class=""auto-style83"">{6}</td>
                                <td class=""auto-style83"">{7}</td>
                                <td class=""auto-style83"">{8}</td>
                                ";
                                tmpStr2.AppendLine(string.Format(ListStr3, LbWid1, LbPriceID1, Orderlayer1, order1, LbItemName1, LbUnit1, LbCNumber1, LbEPrice1, LbCComplex1, Img, Link, Link1, Link2, Img2));
                              

                                //LbETotal.Text = LETotal1.ToString("N0");
                                string LbEComplex1 = "";
                            foreach (ListItem item2 in CheckBoxList2.Items)
                                    {
                                if (item2.Selected == true)
                                {
                                    DataTable Addvalue = EBudgetDisp.LoadContentData_CB(database, Session["ProjectCode"].ToString(), selectedValue, LbWid1);
                                    if (Addvalue.Rows.Count > 0)
                                    {
                                        DataRow vsDr1 = Addvalue.Rows[0];
                                        //string LbChNumber1 = vsDr1["ChNumber"].ToString() != "" ? vsDr1["ChNumber"].ToString() : "0";
                                        string LbChNumber1 = vsDr1["ChNumber" + item2.Value + ""].ToString() != "" ? vsDr1["ChNumber" + item2.Value + ""].ToString() : "0";
                                        //string LbEPrice1 = vsDr1["CPrice"].ToString() != "" ? decimal.Parse(vsDr1["CPrice"].ToString()).ToString("N0") : "0";
                                       
                                        //if (LbChNumber1=="0")
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
                                                     LbChNumber1 = vsDr1["Enumber"].ToString() !=""?vsDr1["Enumber"].ToString():"0";
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
                                        if (ItemKind == "mainitem")
                                        {
                                            LbChNumber1 = "1";

                                        }
                                       
                                        //LbEComplex1 = (decimal.Parse(LbChNumber1) * decimal.Parse(LbEPrice1)).ToString("N0");
                                       
                                        if (decimal.Parse(ChAmount1) > 0)
                                        {
                                            ChAmount1 = "+" + ChAmount1 + "";
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
                                    color = "auto-style83";
                                }
                                else if (decimal.Parse(ChAmount1) < 0)
                                {
                                    color = "auto-style87";
                                }
                                tmpStr2.AppendLine(string.Format("<td class=\"" + color +" \">{0}</td>", ChAmount1));
                                tmpStr2.AppendLine(string.Format("<td class=\"auto-style83\">{0}</td>", LbNotes1));
                                if (vsDr["ActivityUseNY"].ToString() == "1")
                                {
                                    //tmpStr3.Append("<input type=\"checkbox\" name=\"CheckDel").Append(vsDr["id"]).Append("\">");
                                    tmpStr2.Append("<td class=\"auto-style80\" ><input type=\"checkbox\" ID='").Append(i).Append("'").Append(" runat='server' style='zoom: 1.6' checked='checked' AutoWidth='true' /></td></tr>");

                                }
                                else
                                {
                                    tmpStr2.Append("<td class=\"auto-style80\" ><input type=\"checkbox\" ID='").Append(i).Append("'").Append(" runat='server' style='zoom: 1.6' AutoWidth='true' /></td></tr>");
                                }
                                //tmpStr2.AppendLine(string.Format("<td class=\"auto-style83\">{0}</td></tr>", ActivityUseNY));
                                //string layer = vsDr["LayerNum"].ToString() != "" ? vsDr["LayerNum"].ToString() : "0";
                                if (layer == "1")
                                {

                                    //CToatal += Convert.ToDecimal(LbCComplex.Text);
                                    //LbCTotal.Text = CToatal.ToString("N0");
                                    ETotal += Convert.ToDecimal(LbEComplex1);
                                    LbETotal.Text = ETotal.ToString("N0");
                                }
                                ChAmount1 = "0";
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
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangeEBudget.aspx");
        }
        
        protected void BtnDel_Click()
        {
            string SQLUpdateSort = "";
            string SQLLayerNum = "";
            string UpperWID = "";
            string LayerNum = "";

            //int SortNum = 0; 
            //string database = Session["DatabaseName"].ToString();
            //string WID = "";
            ////string WID = ((Label)e.Item.FindControl("LbWid")).Text;
            //    string ExecuteKind = WebModel.ExecuteKind(database, "EBudget_WBS", WID);
            //    string DelEBudget = "Delete FROM [EBudget_WBS] WHERE [EWID] = " + WID + "";
            //    UpperWID = WebModel.UpperWID(database, "EBudget_WBS", WID);
            //    string SQLSelectUpperUID = "Select * from CBudget_WBS where UpperWID=" + WID;
            //    string SelectUpperUID = WebModel.SItemName(database, SQLSelectUpperUID, "UpperWID");
            //    SQLLayerNum = "Select * From EBudget_WBS where EWID=" + WID;
            //    LayerNum = WebModel.SItemName(database, SQLLayerNum, "LayerNum");
            //    SortNum =int.Parse(WebModel.SItemName(database, SQLLayerNum, "SortNum"));
            //    string SQLSelectUpperWID = "Select * from EBudget_WBS where EWID=" + WID;
            //    string SelectUpperwid = WebModel.SItemName(database, SQLSelectUpperWID, "UpperWID");
            //    string SQLSel = "Select count(EWID) as EWID from EBudget_WBS where UpperWID=" + SelectUpperwid;
            //    string UpperNY = WebModel.SItemName(database, SQLSel, "EWID");
            //    if (SelectUpperUID != "")
            //    {
            //        Page.ClientScript.RegisterStartupScript(typeof(string), "BtnDelayer_Click", "var retValue=confirm('該階層有項目，是否刪除???');" + "if (retValue) {document.getElementById('" + LinkButtonDel.ClientID + "').click();};", true);
            //    }
            //    else
            //    {
            //        if (UpperNY == "1")
            //        {
            //            string SQLUpdate = "Update EBudget_WBS set ExecuteKind=null where EWID=" + UpperWID;
            //            WebModel.SQLAction(database, SQLUpdate);

            //        }
            //        if (ExecuteKind == "NP" || ExecuteKind == "RP")
            //        {
            //            string priceid = WebModel.EPriceId(database, "EBudget_WBS", WID);
            //            string DelRes = "Delete From Pro_Resource Where PriceID=" + priceid + "";
            //            string DelAna = "Delete From Pro_Analysis where ParentID=" + UpperWID + "";
            //            string SQLUpdate = "Update EBudget_WBS set ExecuteKind=null where EWID=" + UpperWID;
            //            WebModel.SQLAction(database, DelRes);
            //            WebModel.SQLAction(database, DelAna);
            //            WebModel.SQLAction(database, SQLUpdate);
            //        }
            //        else if (ExecuteKind == "NKRP")
            //        {
            //            string priceid = WebModel.EPriceId(database, "EBudget_WBS", WID);
            //            string DelRes = "Delete From Pro_Resource Where PriceID=" + priceid + "";
            //            string DelAna = "Delete From Pro_Analysis where ParentID=" + UpperWID + "";
            //            string SQLUpdate = "Update EBudget_WBS set ExecuteKind='NK' where EWID=" + UpperWID;
            //            WebModel.SQLAction(database, DelRes);
            //            WebModel.SQLAction(database, DelAna);
            //            WebModel.SQLAction(database, SQLUpdate);

            //        }
            //        if (SortNum == 1)
            //        {
            //            SQLUpdateSort = "update EBudget_WBS set sortnum= (SortNum -1) where LayerNum=" + LayerNum + " and UpperWID=" + UpperWID + " and SortNum > " + SortNum + "  and Pid=" + Session["ProjectCode"].ToString();
            //        }
            //        else
            //        {
            //            SQLUpdateSort = "update EBudget_WBS set sortnum= (SortNum -1) where LayerNum=" + LayerNum + " and UpperWID=" + UpperWID + " and SortNum >= " + SortNum + " and sortnum<>1 and Pid=" + Session["ProjectCode"].ToString();

            //        }
            //        //SQLUpdateSort = "update EBudget_WBS set sortnum=SortNum-1 where LayerNum=" + LayerNum + " and UpperWID=" + UpperWID + " and SortNum >=" + (SortNum-1) + "";
            //        WebModel.SQLAction(database, DelEBudget);
            //        WebModel.SQLAction(database, SQLUpdateSort);

            //        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('已刪除');", true);
            //        Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);//ajax 新增階層碼
            //        //Repeater1_ItemDataBound(this, null);
            //        //Repeater1.DataSourceID = "SqlDataSource1";
            //        //Repeater1.DataBind();
            //    }
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
                        tmpListStr = @"<td class=""ShtCellCC"" colspan={1}>
                                   <a href=""javascript:void(0)"" target=""_blank"" onclick=""window.open('EChangeSummaryE.aspx?ID={0}','subwin','width=1200,height=500');"" >
                                    第{0}次變更設計</a>
                                </td>";
                    

                        tmpListStr1 += CheckBoxList1.Items[0].Selected == true ? @"<td class=""ShtCellCC"">數量</td>" : "";
                        tmpListStr1 += CheckBoxList1.Items[1].Selected == true ? @"<td class=""ShtCellCC"">單價</td>" : "";
                        tmpListStr1 += CheckBoxList1.Items[2].Selected == true ? @"<td class=""ShtCellCC"">複價</td>" : "";
                        //tmpListStr1 += CheckBoxList1.Items[3].Selected == true ? @"<td class=""ShtCellCC"">責任歸屬</td>" : "";
                        //tmpListStr1 += CheckBoxList1.Items[4].Selected == true ? @"<td class=""ShtCellCC"">原因</td>" : "";

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
        //if there is a upperUID ,delete all
        protected void LinkButtonDel_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();

            bool result = false;
            string SQLUpdateSort = "";
            int UPPID = int.Parse(ViewState["uid"].ToString());
            string[] uid = EBudgetDisp.check_Enum(database, UPPID);
            foreach (string uuu in uid)//使用foreach迴圈撈出陣列值
            {
                string Select = "Select * from EBudget_WBS where CWID=" + uuu;
                string LayerNum = WebModel.SItemName(database, Select, "LayerNum");
                string UpperWID = WebModel.SItemName(database, Select, "UpperWID");
                string SortNum = WebModel.SItemName(database, Select, "SortNum");

                string DelSQL = "Delete EBudget_WBS where CWID=" + uuu;


                result = WebModel.SQLAction(database, DelSQL);
                if (SortNum == "1")
                {
                    SQLUpdateSort = "update EBudget_WBS set sortnum= (SortNum -1) where LayerNum=" + LayerNum + " and UpperWID=" + UpperWID + " and SortNum > " + SortNum + "  and Pid=" + Session["ProjectCode"].ToString();
                }
                else
                {
                    SQLUpdateSort = "update EBudget_WBS set sortnum= (SortNum -1) where LayerNum=" + LayerNum + " and UpperWID=" + UpperWID + " and SortNum >= " + SortNum + " and sortnum<>1 and Pid=" + Session["ProjectCode"].ToString();

                }
                //string SQLUpdateSort = "update CBudget_WBS set sortnum= (SortNum -1) where LayerNum=" + LayerNum + " and UpperWID=" + UpperUID + " and SortNum >= " + SortNum + " and sortnum<>1 and Pid=" + Session["ProjectCode"].ToString();
                result = WebModel.SQLAction(database, SQLUpdateSort);
            }
            string DelSQL1 = "Delete EBudget_WBS where EWID=" + ViewState["uid"].ToString();
            result = WebModel.SQLAction(database, DelSQL1);
            //Response.Write("<script>window.open('BidItemEdit.aspx?UId=" + UUID.Text + "','window','height=300,width=1200')</script>");
            string select1 = "Select * from ProjectM0 where Pid=" + Session["ProjectCode"].ToString();
            string CBudgetNumType = WebModel.SItemName(database, select1, "CBudgetNumType");
            string UpdateItemOrder;
            if (CBudgetNumType == "0")
            {
                bool result3 = DAL.BidLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["bid"].ToString());
                UpdateItemOrder = "update EBudget_WBS set EBudget_WBS.ItemOrder = OrderName from Bid_WBSLayer join EBudget_WBS on EBudget_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on EBudget_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.PID=" + Session["ProjectCode"].ToString() + "";
                bool update = WebModel.SQLAction(database, UpdateItemOrder);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);//ajax 新增階層碼
            }
            else if (CBudgetNumType == "1")
            {
                bool result3 = DAL.BidLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["bid"].ToString());
                UpdateItemOrder = "update EBudget_WBS set EBudget_WBS.ItemOrder = OrderName from Bid_WBSLayer join EBudget_WBS on EBudget_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on EBudget_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.PID=" + Session["ProjectCode"].ToString() + "";
                result = WebModel.SQLAction(database, UpdateItemOrder);
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode1();", true);//ajax 新增階層碼
            }
            if (result)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 刪除成功');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 刪除失敗');", true);
            }


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
            l_str2 += @"<table class=""Sht100""><tr class=""ShtRowTop"">";
            l_str2 += Literal1.Text;
            l_str2 += Literal4.Text;
            l_str2 += Literal2.Text;
            l_str2 += Literal5.Text;
            l_str2 += @"<tr class=""ShtRowSingle"">";
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