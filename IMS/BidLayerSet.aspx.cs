using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class BidLayerSet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["bid"] == null || Session["bid"] == "")
            {

                Response.Write("<script>alert('尚未選擇標案');self.close();</script>");


            }
          

            if (!IsPostBack)
            {
                ViewState["i"] = 0;
                ViewState["layer"] = 0;
                string database = Session["DatabaseName"].ToString();
                if (Session["bid"] != null && Session["bid"] != "")
                {
                    string SQLNumType = "Select * from BidM0 where bid=" + Session["Bid"].ToString();
                    string NumType = WebModel.SItemName(database, SQLNumType, "BidNumType");
                    if (NumType != "")
                    {
                        RadioButtonList2.SelectedValue = NumType;
                    }
                    string layer = "select max(LayerNum) as id from Bid_WBSLayer where bid=" + Session["Bid"].ToString();
                    string layernum = WebModel.SItemName(database, layer, "id");
                    if (layernum != "")
                    {
                        //ViewState["ADD"] = true;
                        ViewState["layer"] = layernum;
                        AddLayer();
                    }
                }
            }
            if (ViewState["ADD"] != null && (bool)this.ViewState["ADD"] == true)
            {

                AddLayer();
            }
            AddLayer();
            //if (ViewState["ADDView"] != null && (bool)this.ViewState["ADDView"] == true)
            //{
            //    //PlaceHolder2 = (PlaceHolder)Session["PlaceHolder2"];
            //    LoadContent();
            //}
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            Button1.Click += new EventHandler(Button1_Click);
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if ((Pnl_Note1.Visible == false))
            { Pnl_Note1.Visible = true; }
            else { Pnl_Note1.Visible = false; }
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if ((Pnl_Note2.Visible == false))
            { Pnl_Note2.Visible = true; }
            else { Pnl_Note2.Visible = false; }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            //if ((Button1.Text == "階層及編號設定並鎖定"))
            //{
            //    Button1.Text = "解除鎖定";
            //    Pnl_LayerSet.Enabled = false;
            //    Section1.Text = "階層及編號設定(已鎖定)";
                Pnl_Note1.Visible = false;
                Pnl_Note2.Visible = false;
                bool result1=false;
                bool result2 = false;
                string UpdateItemOrder="";
                string[] LayerKind = new string[int.Parse(ViewState["i"].ToString())];
                string database = Session["DatabaseName"].ToString();
                int maxLayer = WebModel.MaxValue(database, "Bid_WBSLayer", "LayerNum");
                string SQLDel = "Delete from  Bid_WBSLayer  where bid=" + Session["BID"].ToString() + "";
              bool result= WebModel.SQLAction(database, SQLDel);
                for (int i = 0; i < int.Parse(ViewState["i"].ToString()); i++)
                {
                    int Layernum = i + 1;
                    DropDownList drop = new DropDownList();
                    drop = (DropDownList)PlaceHolder1.FindControl(i.ToString());
                    DropDownList DDL1;
                    DDL1 = (DropDownList)PlaceHolder1.FindControl(i.ToString());
                    LayerKind[i] += DDL1.SelectedValue;
                    string SQLLayer = "Insert into Bid_WBSLayer ([bid],[LayerNum],[LayerKind]) Values (" + Session["BID"].ToString() + "," + Layernum + "," + LayerKind[i] + ")";
                   result1=  WebModel.SQLAction(database, SQLLayer);
                }
                if (RadioButtonList2.SelectedValue == "0")
                {
                    string SQLNumType = "Update BidM0 set BidNumType=0 where bid=" + Session["Bid"].ToString();
                    WebModel.SQLAction(database, SQLNumType);
                    result2 = DAL.BidLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["bid"].ToString());
                    UpdateItemOrder = "update Bid_WBS set Bid_WBS.ItemOrder = OrderName from Bid_WBSLayer join Bid_WBS on Bid_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on Bid_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.BID=" + Session["Bid"].ToString() + "";
                    result1 = WebModel.SQLAction(database, UpdateItemOrder);
                }
                else if (RadioButtonList2.SelectedValue == "1")
                {
                    string SQLNumType = "Update BidM0 set BidNumType=1 where bid=" + Session["bid"].ToString();
                    result1 = WebModel.SQLAction(database, SQLNumType);
                    result2 = DAL.BidLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["bid"].ToString());
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "addLayerCode();", true);//ajax 更新項次
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "UpdtItemOrder();", true);//ajax 更新項次
                }
                if (result1)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 階層新增成功');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 階層新增失敗');", true);
                }
                Session["Itemadd"] = Session["Bid"].ToString();
                Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_callback').click();</script>");
        }
     
        protected void AddLayer()
        {
            if (Session["Bid"] == null)
            {
                Response.Write("<script>alert('尚未選擇標案');self.close();</script>");
            }
            else
            {
                PlaceHolder1.Controls.Clear();  //先清除所有子控制項
                string[] data = WebModel.Get_WBS_LayerKind(Session["DatabaseName"].ToString(), Session["BID"].ToString());
                //string[] LayerNum = data[1].Split(',');
                //string[] LayerKind = data[2].Split(',');
                string[] LayerNum = new string[1];
                string[] LayerKind = new string[1];
                if (data[1] != null && data[2] != null)
                {
                    LayerNum = data[1].Split(',');
                    LayerKind = data[2].Split(',');
                    if (ViewState["ADD"] == null)
                    {
                        //Section1_Click(this, null);
                        //if (Session["layer"] != null && Session["layer"]!="")
                        //{
                        ViewState["i"] = int.Parse(ViewState["layer"].ToString());
                        //}

                    }

                    for (int i = 0; i < int.Parse(ViewState["i"].ToString()); i++)
                    {
                        DropDownList ddl = new DropDownList();
                        ddl.ID = i.ToString();

                        ddl.DataSourceID = "SqlDataSource1";
                        ddl.DataTextField = "OrderName";
                        ddl.DataValueField = "Kind";
                        //ddl.DataBind();
                        int y = i + 1;
                        //ddl.AutoPostBack = true;
                        ddl.SelectedIndexChanged += itemselect_indexchange;
                        //ddl.DataBind();
                        PlaceHolder1.Controls.Add(new LiteralControl("<tr><td class=\"auto-style13\">第 " + y + " 階</td><td class=\"auto-style14\">"));

                        PlaceHolder1.Controls.Add(ddl);

                        //ddl.Items.Insert(0, new ListItem("-請選擇-", "0"));
                        PlaceHolder1.Controls.Add(new LiteralControl("</td></tr>"));
                        //ddl = (DropDownList)PlaceHolder1.FindControl(i.ToString());

                    }

                    this.ViewState["ADD"] = true;


                    for (int i = 0; i < int.Parse(LayerNum.Max()); i++)
                    {
                        DropDownList DDL = (DropDownList)PlaceHolder1.FindControl(i.ToString());
                        if (DDL != null)
                        {
                            DDL.SelectedValue = LayerKind[i];
                        }
                    }
                    //}
                }
                else
                {
                    if (LayerNum[0] == null)
                    {
                        LayerNum = new string[1] { "1" };
                        LayerKind = new string[1] { "1" };
                    }
                    for (int i = 0; i < int.Parse(ViewState["i"].ToString()); i++)
                    {
                        DropDownList ddl = new DropDownList();
                        ddl.ID = i.ToString();

                        ddl.DataSourceID = "SqlDataSource1";
                        ddl.DataTextField = "OrderName";
                        ddl.DataValueField = "Kind";
                        //ddl.DataBind();
                        int y = i + 1;
                        // ddl.AutoPostBack = true;
                        ddl.SelectedIndexChanged += itemselect_indexchange;

                        PlaceHolder1.Controls.Add(new LiteralControl("<tr><td class=\"auto-style13\">第 " + y + " 階</td><td class=\"auto-style14\">"));

                        PlaceHolder1.Controls.Add(ddl);

                        //ddl.Items.Insert(0, new ListItem("-請選擇-", "0"));
                        PlaceHolder1.Controls.Add(new LiteralControl("</td></tr>"));


                    }




                    for (int i = 0; i < int.Parse(LayerNum.Max()); i++)
                    {
                        DropDownList DDL = (DropDownList)PlaceHolder1.FindControl(i.ToString());
                        if (DDL != null)
                        {
                            DDL.SelectedValue = LayerKind[i];
                        }
                    }
                }
            }
        }
        private void itemselect_indexchange(object sender, EventArgs e)
        {
            string[] LayerKind = new string[int.Parse(ViewState["i"].ToString())];
            for (int i = 0; i < int.Parse(ViewState["i"].ToString()); i++)
            {


                DropDownList DDL = (DropDownList)PlaceHolder1.FindControl(i.ToString());
                LayerKind[i] += DDL.SelectedValue;

            }


        }
        protected void AddLayer_Click(object sender, EventArgs e)
        {

            ViewState["i"] = ((int)ViewState["i"]) + 1;
            AddLayer();

        }
        protected void callback_Click(object sender, EventArgs e)
        {
            
            //Response.Redirect("BidBudgetEdit.aspx");
        }
    }
}