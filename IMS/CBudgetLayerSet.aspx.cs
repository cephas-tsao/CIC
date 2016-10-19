using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class CBudgetLaterSet : System.Web.UI.Page
    {
        int y;
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["ProjectCode"] == null || Session["ProjectCode"] == "")
            {

                Response.Write("<script>alert('尚未選擇專案');self.close();</script>");


            }


            if (!IsPostBack)
            {
                ViewState["i"] = 0;
                ViewState["layer"] = 0;
                string database = Session["DatabaseName"].ToString();
                if (Session["ProjectCode"] != null && Session["ProjectCode"] != "")
                {
                    string SQLNumType = "Select * from ProjectM0 where pid=" + Session["ProjectCode"].ToString();
                    string NumType = WebModel.SItemName(database, SQLNumType, "CBudgetNumType");
                    if (NumType != "")
                    {
                        RadioButtonList2.SelectedValue = NumType;
                    }
                    string layer = "select max(LayerNum) as id from Bid_WBSLayer where pid=" + Session["ProjectCode"].ToString();
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
          
            Pnl_Note1.Visible = false;
            Pnl_Note2.Visible = false;
            bool result1 = false;
            bool result2 = false;
            string UpdateItemOrder = "";
            string[] LayerKind = new string[int.Parse(ViewState["i"].ToString())];
            string database = Session["DatabaseName"].ToString();
            int maxLayer = WebModel.MaxValue(database, "Bid_WBSLayer", "LayerNum");
            string SQLDel = "Delete from  Bid_WBSLayer  where pid=" + Session["ProjectCode"].ToString() + "";
            bool result = WebModel.SQLAction(database, SQLDel);
            for (int i = 0; i < int.Parse(ViewState["i"].ToString()); i++)
            {
                int Layernum = i + 1;
                DropDownList drop = new DropDownList();
                drop = (DropDownList)PlaceHolder1.FindControl(i.ToString());
                DropDownList DDL1;
                DDL1 = (DropDownList)PlaceHolder1.FindControl(i.ToString());
                LayerKind[i] += DDL1.SelectedValue;
                string SQLLayer = "Insert into Bid_WBSLayer ([Pid],[LayerNum],[LayerKind]) Values (" + Session["ProjectCode"].ToString() + "," + Layernum + "," + LayerKind[i] + ")";
                result1 = WebModel.SQLAction(database, SQLLayer);
            }
            if (RadioButtonList2.SelectedValue == "0")
            {
                string SQLNumType = "Update ProjectM0 set CBudgetNumType=0 where Pid=" + Session["ProjectCode"].ToString();
                WebModel.SQLAction(database, SQLNumType);
                 result2 = DAL.CBLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString());
                UpdateItemOrder = "update CBudget_WBS set CBudget_WBS.ItemOrder = OrderName from Bid_WBSLayer join CBudget_WBS on CBudget_WBS.LayerNum=Bid_WBSLayer.LayerNum join LayerOrder on CBudget_WBS.SortNum = LayerOrder.OrderNum and Bid_WBSLayer.LayerKind = LayerOrder.Kind where Bid_WBSLayer.PID=" + Session["ProjectCode"].ToString() + "";
                WebModel.SQLAction(database, UpdateItemOrder);
            }
            else if (RadioButtonList2.SelectedValue == "1")
            {
                string SQLNumType = "Update ProjectM0 set CBudgetNumType=1 where Pid=" + Session["ProjectCode"].ToString();
                WebModel.SQLAction(database, SQLNumType);
                 result2 = DAL.CBLayerCodeSort.Update_order_num(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString());
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
            Session["Itemadd"] = Session["ProjectCode"].ToString();
            Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_callback').click();</script>");
        }

        protected void AddLayer()
        {
            if (Session["ProjectCode"].ToString() != "")
            {
                PlaceHolder1.Controls.Clear();  //先清除所有子控制項
                string[] data = WebModel.Get_PWBS_LayerKind(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString());
                string[] LayerNum = new string[1];
                string[] LayerKind = new string[1];
                if (data[1] != null && data[2] != null)
                {
                    LayerNum = data[1].Split(',');
                    LayerKind = data[2].Split(',');

                    if (ViewState["ADD"] == null)
                    {
                        //Section1_Click(this, null);

                        if (LayerNum[0] != null)
                        {
                            ViewState["i"] = int.Parse(LayerNum.Max());
                        }
                        for (int i = 0; i < int.Parse(ViewState["i"].ToString()); i++)
                        {
                            DropDownList ddl = new DropDownList();
                            ddl.ID = i.ToString();

                            ddl.DataSourceID = "SqlDataSource1";
                            ddl.DataTextField = "OrderName";
                            ddl.DataValueField = "Kind";
                            //ddl.DataBind();
                            y = i + 1;
                            ddl.AutoPostBack = true;
                            ddl.SelectedIndexChanged += itemselect_indexchange;

                            PlaceHolder1.Controls.Add(new LiteralControl("<tr><td class=\"auto-style13\">第 " + y + " 階</td><td class=\"auto-style14\">"));

                            PlaceHolder1.Controls.Add(ddl);

                            //ddl.Items.Insert(0, new ListItem("-請選擇-", "0"));
                            PlaceHolder1.Controls.Add(new LiteralControl("</td></tr>"));
                            ViewState["layer"] = y;
                            Session["layer"] = y;
                        }
                                if (LayerNum[0] != null)
                                {

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
                            else
                            {

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

                                    this.ViewState["ADD"] = true;
                                    //Pnl_Layer.Visible = true;
                                    ViewState["layer"] = y;
                                    Session["layer"] = y;

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
                            //ViewState["layer"] = y;
                            //Session["layer"] = y;

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

                        this.ViewState["ADD"] = true;

                        ViewState["layer"] = y;
                        Session["layer"] = y;

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
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('請先選擇專案');", true);
            }
        }
        protected void BtnDelayer_Click(object sender, EventArgs e)
        {

            string[] data = WebModel.Get_PWBS_LayerKind(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString());
            string[] LayerNum = new string[1];
            string[] LayerKind;
            if (data[1] != null)
            {
                LayerNum = data[1].Split(',');
                LayerKind = data[2].Split(',');
            }
            int num = PlaceHolder1.Controls.Count - 1;
            int y = int.Parse(LayerNum.Max());
            string SQLSelect = "Select * from CBudget_WBS where LayerNum=" + y;
            DataTable layer = WebModel.LoadSetContentData(Session["DatabaseName"].ToString(), SQLSelect);


            if (int.Parse(ViewState["i"].ToString()) <= y)
            {
                if (layer != null && layer.Rows.Count > 0)
                {


                    Page.ClientScript.RegisterStartupScript(typeof(string), "BtnDelayer_Click", "var retValue=confirm('該階層有項目，是否刪除???');" + "if (retValue) {document.getElementById('" + Button3.ClientID + "').click();};", true);



                }
                else
                {

                    ViewState["i"] = int.Parse(LayerNum.Max());
                    //string SQLDel = "Delete from Bid_WBSLayer where Pid=" + Session["ProjectCode"].ToString() + " and LayerNum=" + y;
                    //WebModel.SQLAction(Session["DatabaseName"].ToString(), SQLDel);
                    for (int i = num; i > num - 3; i--)
                    {


                        PlaceHolder1.Controls.RemoveAt(i);


                    }
                    string SQLDel = "Delete from Bid_WBSLayer where Pid=" + Session["ProjectCode"].ToString() + " and LayerNum=" + y;

                    bool result = WebModel.SQLAction(Session["DatabaseName"].ToString(), SQLDel);
                    if (result)
                    {
                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('階層已刪除');", true);

                    }
                    else
                    {

                        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('階層刪除失敗');", true);
                    }

                }
            }
            else
            {
                ViewState["i"] = int.Parse(LayerNum.Max());
                //string SQLDel = "Delete from Bid_WBSLayer where Pid=" + Session["ProjectCode"].ToString() + " and LayerNum=" + y;
                //WebModel.SQLAction(Session["DatabaseName"].ToString(), SQLDel);
                for (int i = num; i > num - 3; i--)
                {


                    PlaceHolder1.Controls.RemoveAt(i);


                }
                string SQLDel = "Delete from Bid_WBSLayer where Pid=" + Session["ProjectCode"].ToString() + " and LayerNum=" + y;

                bool result = WebModel.SQLAction(Session["DatabaseName"].ToString(), SQLDel);
                if (result)
                {
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('階層已刪除');", true);

                }
                else
                {

                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('階層刪除失敗');", true);
                }
            }
            //Pnl_Layer.Visible = true;
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            string[] data = WebModel.Get_PWBS_LayerKind(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString());
            string[] LayerNum = data[1].Split(',');
            string[] LayerKind = data[2].Split(',');
            int num = PlaceHolder1.Controls.Count - 1;
            int y = int.Parse(LayerNum.Max());
            ViewState["i"] = int.Parse(LayerNum.Max());
            string SQLDel = "Delete from Bid_WBSLayer where Pid=" + Session["ProjectCode"].ToString() + " and LayerNum=" + y;
            string SQLDelLayer = "Delete from CBudget_WBS where Pid=" + Session["ProjectCode"].ToString() + " and LayerNum=" + y;
            bool result = WebModel.SQLAction(Session["DatabaseName"].ToString(), SQLDel);
            bool result1 = WebModel.SQLAction(Session["DatabaseName"].ToString(), SQLDelLayer);
            for (int i = num; i > num - 3; i--)
            {


                PlaceHolder1.Controls.RemoveAt(i);


            }
            if (result && result1)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('階層已刪除');", true);

            }
            else
            {

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('階層刪除失敗');", true);
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
            this.ViewState["ADD"] = true;
            ViewState["i"] = ((int)ViewState["i"]) + 1;
            AddLayer();

        }
        protected void callback_Click(object sender, EventArgs e)
        {

            //Response.Redirect("BidBudgetEdit.aspx");
        }
    }
}