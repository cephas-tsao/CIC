using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;
using System.Xml;
using Pechkin;
using System.Web.UI.HtmlControls;


namespace IMS
{
    public partial class ExeBudgetPEdit : System.Web.UI.Page
    {
        int count = 1;
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
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            //SqlDataSource1.SelectCommand = "Select * From Pro_Resource a left join Bid_Library b on a.Bid_PriceID=b.PriceID Where A.PID=" + Session["ProjectCode"].ToString() + " And CResourceNY=1 And EResourceNY=1";
            //SqlDataSource1.SelectCommand = "Select * From Pro_Resource a left join Bid_Library b on a.Bid_PriceID=b.PriceID Where A.PID= " + Session["ProjectCode"].ToString() + "  And EResourceNY=1";
            SqlDataSource1.SelectCommand = "Select * From EBudget_WBS a left join CBudget_WBS b on a.CWID=b.CWID left join Pro_Resource c on b.PriceID=c.PriceID left join Bid_Library d on c.Bid_PriceID=d.PriceID Where A.PID= " + Session["ProjectCode"].ToString() + "  And a.ResourceNY=1";
        }
        public void OpenNewWindow(string url, string Tgr, string width, string height)
        {
            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=" + height + ",width=" + width + "";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
        }
        protected void ImageButton41_Click(object sender, ImageClickEventArgs e)
        {
            OpenNewWindow("RFQAdd.aspx", "A", "1500", "400");
        }
        protected void ImageButton39_Click(object sender, ImageClickEventArgs e)
        {
            OpenNewWindow("RFQQuery.aspx", "A", "1500", "400");
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            OpenNewWindow("HistoryEPrice.aspx", "A", "1500", "400");
        }
        
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            
            string database = Session["DatabaseName"].ToString();
            decimal Price=0;
            decimal TotalPrice = 0;
            decimal EAmount = 0;
            string Amount = "";
            bool first=false;
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {


                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;

                HtmlTableRow tr = (HtmlTableRow)e.Item.FindControl("trID"); 
                Label LbResourceCode = (Label)e.Item.FindControl("LbResourceCode");
                Label LbPriceID = (Label)e.Item.FindControl("LbPriceID");
                Label LbEWID = (Label)e.Item.FindControl("LbEWID");
                //Label LbReCode = (Label)e.Item.FindControl("LbReCode");             
                Label LbItemName = (Label)e.Item.FindControl("LbItemName");
                Label LbUnit = (Label)e.Item.FindControl("LbUnit");
                Label LbCAmount = (Label)e.Item.FindControl("LbCAmount");
                Label LbEAmount = (Label)e.Item.FindControl("LbEAmount");
                Label LbCPrice = (Label)e.Item.FindControl("LbCPrice");
                TextBox TxEPrice = (TextBox)e.Item.FindControl("TxEPrice");
                Label LbBPrice = (Label)e.Item.FindControl("LbBPrice");
                LinkButton LinkBtnAPrice = (LinkButton)e.Item.FindControl("LinkBtnAPrice");


                TxEPrice.Style.Add("text-align", "right");
                LbPriceID.Text = vsDr["PriceID"].ToString();
                LbEWID.Text = vsDr["EWID"].ToString();
                //LbReCode.Text = vsDr["Code"].ToString();                                                    
                LbItemName.Text = vsDr["ItemName"].ToString();
                LbUnit.Text = vsDr["Unit"].ToString();
                LbCAmount.Text = vsDr["CAmount"].ToString() != "" ? vsDr["CAmount"].ToString() : "0";
                LbEAmount.Text = vsDr["ENumber"].ToString() != "" ? vsDr["ENumber"].ToString() : "0";
                LbCPrice.Text = vsDr["CPrice"].ToString() != "" ? decimal.Parse(vsDr["CPrice"].ToString()).ToString("N0") : "0";
                TxEPrice.Text = (vsDr["EUnitPrice"].ToString() != "") ? decimal.Parse(vsDr["EUnitPrice"].ToString()).ToString("N0") : "0";
                LbBPrice.Text = vsDr["BPrice"].ToString() != "" ? vsDr["BPrice"].ToString() : "";
                LbResourceCode.Text = vsDr["ResourceCode"].ToString();
                string sqlselect = "select * FROM Pro_Resource where PriceID='" + LbPriceID.Text + "'";
                DataTable DT = WebModel.LoadSetContentData(database, sqlselect);
                DataTable DT1 = WebModel.LoadSetContentData(database, SqlDataSource1.SelectCommand);

                
                for (int i = 0; i < DT1.Rows.Count; i++)
                {

                    string ResourceCode = DT1.Rows[i]["ResourceCode"].ToString();
                    if (ResourceCode == LbResourceCode.Text && ResourceCode!="")
                  {
                      string SQLSelect = "Select count (*) as sum from EBudget_WBS where ResourceCode ='"+ResourceCode+"'";
                      string num = WebModel.SItemName(database, SQLSelect, "sum");
                        Amount = DT1.Rows[i]["ENumber"].ToString()!=""?DT1.Rows[i]["ENumber"].ToString():"0";
                        Amount = Amount != "" ? Amount : "0";
                        EAmount += decimal.Parse(Amount);
                        LbEAmount.Text = EAmount.ToString();
                        //ViewState[LbResourceCode.Text] = false;
                       
                      
                  }
                  
                }
                if (LbResourceCode.Text != "")
                {
                    if (ViewState[LbResourceCode.Text] == null)
                    {
                        tr.Visible = true;
                        ViewState[LbResourceCode.Text] = true;
                        //break;
                    }
                    else
                    {
                        tr.Visible = false;
                    }
                }
                for (int i = 0; i < DT.Rows.Count; i++)
                {

                    string ProPriceID = DT.Rows[i]["PriceID"].ToString();
                     Price = WebModel.calPrice(database, ProPriceID);
                     TotalPrice += Price;
                }
                LinkBtnAPrice.Text = TotalPrice.ToString("N0");
            }
         
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                string PriceID = ((Label)e.Item.FindControl("LbPriceID")).Text;

                OpenNewWindow("HistoryEPrice.aspx?PriceID=" + PriceID + "", "B", "1500", "400");
            }
        }

        protected void ImgSAve_Click(object sender, ImageClickEventArgs e)
        {
            foreach (RepeaterItem item in Repeater1.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    Label LbEWID = (Label)item.FindControl("LbEWID") as Label;
                    Label LbResourceCode = (Label)item.FindControl("LbResourceCode") as Label;
                    
                    TextBox TxEPrice = (TextBox)item.FindControl("TxEPrice") as TextBox;
                    int Number = 0;
                    //強制轉換為數字
                    if (TxEPrice.Text != "" && TxEPrice.Text !="0")
                    {
                        bool output = int.TryParse(TxEPrice.Text, out Number);
                        if (output)
                        {


                            SqlDataAdapter adp = new SqlDataAdapter("UPDATE EBudget_WBS SET EUnitPrice= @EUnitPrice  WHERE [ResourceCode] ='" + LbResourceCode.Text + "'", Utility.DBconnection.connect_string(Session["DatabaseName"].ToString()));

                            adp.SelectCommand.Parameters.AddWithValue("@EUnitPrice", Number);

                            DataSet ds = new DataSet();
                            adp.Fill(ds);

                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 檔案已儲存');", true);

                        }
                    }
                }
            }
            Repeater1.DataSourceID = "SqlDataSource1";
            Repeater1.DataBind();
        }

        protected void ImgRecovery_Click(object sender, ImageClickEventArgs e)
        {
            Repeater1.DataSourceID = "SqlDataSource1";
            Repeater1.DataBind();
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
            HttpContext.Current.Response.Write("<Table><tr><td  align=\"center\" colspan=\"9\" style='font-size:16.0pt;'>" + ProjectName + "</td></tr><TR ></Table>" +
         "<Table border='1' bgColor='#ffffff' " +
         "borderColor='#000000' cellSpacing='0' cellPadding='0' " +
         "style='font-size:10.0pt; background:white;'>");

            //Response.Write("\n</th>");
            Response.Write("\n<tr bgcolor=#fff8dc  align=\"center\" x:num>");
            Response.Write("<tr >"+
                                //"<td >資源編碼</td>"+
                                "<td >資源名稱</td>"+
                                "<td >單位</td>"+
                                "<td >合約預算<br /> 工程用量</td>"+
                                "<td >執行預算<br /> 工程用量</td>"+
                                "<td >合約預算<br />單價</td>"+
                                "<td >投標預算<br /> 詢價單價</td>"+
                                "<td >歷史發包<br />平均單價</td>"+
                                "<td >執行預算<br />單價</td>"+
                                "</tr>");
            //Response.Write("\n </TR>");
            string l_str2 = "";
            foreach (RepeaterItem item in Repeater1.Items)  //滙出表格資料
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    //Label LbPriceID = (Label)item.FindControl("LbPriceID");
                    //Label LbReCode = (Label)item.FindControl("LbReCode");
                    Label LbItemName = (Label)item.FindControl("LbItemName");
                    Label LbUnit = (Label)item.FindControl("LbUnit");
                    Label LbCAmount = (Label)item.FindControl("LbCAmount");
                    Label LbEAmount = (Label)item.FindControl("LbEAmount");
                    Label LbCPrice = (Label)item.FindControl("LbCPrice");
                    TextBox TxEPrice = (TextBox)item.FindControl("TxEPrice");
                    Label LbBPrice = (Label)item.FindControl("LbBPrice");
                    LinkButton LinkBtnAPrice = (LinkButton)item.FindControl("LinkBtnAPrice");




                    //l_str2 = "<tr><td>" + LbReCode.Text + "";
                    l_str2 = "<tr><td>" + LbItemName.Text + "";
                    l_str2 += "</td><td>" + LbUnit.Text + "";                   
                    l_str2 += "</td><td>" + LbCAmount.Text + "";
                    l_str2 += "</td><td>" + LbEAmount.Text + "";
                    l_str2 += "</td><td>" + LbCPrice.Text + "";                   
                    l_str2 += "</td><td>" + LbBPrice.Text + "";
                    l_str2 += "</td><td>" + LinkBtnAPrice.Text + "";
                    l_str2 += "</td><td>" + TxEPrice.Text + "";
                    l_str2 += "</td></tr>";


                    Response.Write(l_str2);
                }
               
            }
            Response.Write("</Table>");
            Response.End(); 
        }

        protected void ImgPDF_Click(object sender, ImageClickEventArgs e)
        {
            string ProjectName = WebModel.PidName(Session["DatabaseName"].ToString(), "ProjectM0", Session["ProjectCode"].ToString());
            string l_str2 = "";
            l_str2 += "<Table><tr><td  align=\"center\" colspan=\"9\" style='font-size:16.0pt;'>" + ProjectName + "</td></tr><TR ></Table>" +
       "<Table border='1' bgColor='#ffffff' " +
       "borderColor='#000000' cellSpacing='0' cellPadding='0' " +
       "style='font-size:10.0pt; background:white;'>";

            //Response.Write("\n</th>");
          
           l_str2 +="<tr >" +
                                //"<td >資源編碼</td>" +
                                "<td >資源名稱</td>" +
                                "<td >單位</td>" +
                                "<td >合約預算<br /> 工程用量</td>" +
                                "<td >執行預算<br /> 工程用量</td>" +
                                "<td >合約預算<br />單價</td>" +
                                "<td >投標預算<br /> 詢價單價</td>" +
                                "<td >歷史發包<br />平均單價</td>" +
                                "<td >執行預算<br />單價</td>" +
                                "</tr>";
          
            
            foreach (RepeaterItem item in Repeater1.Items)  //滙出表格資料
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    //Label LbPriceID = (Label)item.FindControl("LbPriceID");
                    //Label LbReCode = (Label)item.FindControl("LbReCode");
                    Label LbItemName = (Label)item.FindControl("LbItemName");
                    Label LbUnit = (Label)item.FindControl("LbUnit");
                    Label LbCAmount = (Label)item.FindControl("LbCAmount");
                    Label LbEAmount = (Label)item.FindControl("LbEAmount");
                    Label LbCPrice = (Label)item.FindControl("LbCPrice");
                    TextBox TxEPrice = (TextBox)item.FindControl("TxEPrice");
                    Label LbBPrice = (Label)item.FindControl("LbBPrice");
                    LinkButton LinkBtnAPrice = (LinkButton)item.FindControl("LinkBtnAPrice");




                    //l_str2 += "<tr><td>" + LbReCode.Text + "";
                    l_str2 += "<tr><td>" + LbItemName.Text + "";
                    l_str2 += "</td><td>" + LbUnit.Text + "";
                    l_str2 += "</td><td>" + LbCAmount.Text + "";
                    l_str2 += "</td><td>" + LbEAmount.Text + "";
                    l_str2 += "</td><td>" + LbCPrice.Text + "";
                    l_str2 += "</td><td>" + LbBPrice.Text + "";
                    l_str2 += "</td><td>" + LinkBtnAPrice.Text + "";
                    l_str2 += "</td><td>" + TxEPrice.Text + "";
                    l_str2 += "</td></tr>";


                    Response.Write(l_str2);
                }

            }
            Response.Write("</Table>");
            string html = l_str2.ToString();
           

            string url = html;


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

        protected void ImgWorkItem_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ExeBudgetEdit.aspx");
        }
    }
}