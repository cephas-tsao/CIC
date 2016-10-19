using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data;

namespace IMS
{
    public partial class ActivitySetting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["ProjectCode"] == null || Session["ProjectCode"] == "")
            {

                Response.Write("<script>alert('請先選擇專案');location.href='Main.aspx';</script>");

            }
            string database = Session["DatabaseName"].ToString();
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
          
         
          
            if (!IsPostBack)
            {
                
                string SQLSelect = "Select * from ProjectM0 where Pid="+Session["ProjectCode"].ToString();
                string Lock = WebModel.SItemName(database, SQLSelect, "EBudgetLock")!=""?WebModel.SItemName(database, SQLSelect, "EBudgetLock"):"0";
                ViewState["Lock"] = Lock;
              
                //IBtn_Lock.TabIndex = 1;
                if ((Lock == "0"))
                {
                    IBtn_Lock.ImageUrl = "~/img/UnLock.jpg";
                    IBtn_Lock.ToolTip = "預定進度尚未鎖定，可自由修改作業項目";
                    IBtn_Save.Visible = true;
                    ImageBtn_Reload.Enabled = true;
                    Response.Write("<script language='javascript'>alert('執行預算尚未鎖定，不得進行進度管理！')</script>");
                }
                else if ((Lock == "1"))
                {
                    string SQLProgressLock = "Select * From ProjectM0 Where PID= "+Session["ProjectCode"];
                    string ProgressLock = WebModel.SItemName(database, "SQLProgressLock", "SProgressLock");
                    IBtn_Lock.ImageUrl = "~/img/Lock.jpg";
                    IBtn_Lock.ToolTip = "預定進度已鎖定，不可修改作業項目，如欲解鎖請至「排定預定進度」設定";
                    LockPageSetting();
                }
                //Repeater1.DataSourceID = "SqlDataSource1";
                //SqlDataSource1.SelectCommand = "Select * from Progress_WIINF a left join EBudget_WBS b on a.WBSID=b.EWID where  ProjectID=" + Session["ProjectCode"].ToString();
                //Repeater1.DataBind();
                string data = "Select * from Progress_WIINF a left join EBudget_WBS b on a.WBSID=b.EWID where  ProjectID=" + Session["ProjectCode"].ToString();
                DataTable Dtvs = WebModel.LoadSetContentData(database, data);
                if (Dtvs.Rows.Count != 0)
                {
                    ViewState["Dtvs"] = Dtvs;
                    Repeater1.DataSource = Dtvs;
                    Repeater1.DataBind();
                }
                //else
                //{
                //    Response.Write("<script language='javascript'>alert('請先至執行預算編輯設定進度引用，否則不得進行進度管理！');location.href='ExeBudgetEdit.aspx';</script>");
                //}
            }
        }
        public void LockPageSetting()
        {
            IBtn_Save.Visible = false;
            ImageBtn_Reload.Visible = false;
            IBtn_AddNew.Visible = false;
          
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string SQLSelect = "Select * from ProjectM0 where Pid=" + Session["ProjectCode"].ToString();
            string Lock = WebModel.SItemName(database, SQLSelect, "SProgressLock");
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;
                Label LbItemName = (Label)e.Item.FindControl("LbItemName");
                ImageButton IBtn_A1 = (ImageButton)e.Item.FindControl("IBtn_A1");
                ImageButton IBtn_D1 = (ImageButton)e.Item.FindControl("IBtn_D1");
                TextBox TB_N1 = (TextBox)e.Item.FindControl("TB_N1");
                TextBox TB_P1 = (TextBox)e.Item.FindControl("TB_P1");
                TB_N1.Text = LbItemName.Text;
                if (Lock == "1" )
                {

                    IBtn_A1.Visible = false;
                    IBtn_D1.Visible = false;
                    TB_P1.Enabled = false;
                    TB_N1.Enabled = false;

                }
                else
                {
                    IBtn_A1.Visible = true;
                    IBtn_D1.Visible = true;
                    TB_P1.Enabled = true;
                    TB_N1.Enabled = true;

                }


            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);
            DataTable Dtvs = (DataTable)ViewState["Dtvs"];
            if (e.CommandName == "Add")
            {
                
                DataRow DataTableDr = Dtvs.Rows[ID_class];
               
                string ItemOrder = DataTableDr["ItemOrder"].ToString();
                string ItemName = DataTableDr["ItemName"].ToString();
                string WIName = DataTableDr["WIName"].ToString();
                string EWID = DataTableDr["EWID"].ToString();
                DataRow dr = Dtvs.NewRow();
                //dr["EWID"] = EWID;
                dr["WBSID"] = EWID;
                dr["WIName"] = WIName;
                dr["ItemName"] = ItemName;
                //dr["PID"] = Session["ProjectCode"].ToString();
                dr["ProjectID"] = Session["ProjectCode"].ToString();
                dr["ItemOrder"] = ItemOrder;
                dr["WBSName"] = ItemName;
                dr["ActivityUseNY"] = "1";
                dr["WIID"] = ID_class + 2;
                int order = ID_class + 1;
                
                Dtvs.Rows.InsertAt(dr, order);
                for (int i = ID_class + 1; i < Dtvs.Rows.Count; i++)
                {

                    Dtvs.Rows[i]["WIID"] = order + 1;
                   
                    order++;
                }
                Repeater1.DataSource = Dtvs;
                Repeater1.DataBind();
                ViewState["Dtvs"] = Dtvs;
            }
            if (e.CommandName == "Del")
            {
                DataRow DataTableDr = Dtvs.Rows[ID_class];
                string ItemOrder = DataTableDr["ItemOrder"].ToString();
                string ItemName = DataTableDr["ItemName"].ToString();
                string EWID = DataTableDr["EWID"].ToString();
                DDL_EWBS.Items.Add(ItemName);

                Dtvs.Rows.RemoveAt(ID_class);
                Repeater1.DataSource = Dtvs;
                Repeater1.DataBind();

            
             
              

                ViewState["Dtvs"] = Dtvs;
            }
        }

        protected void IBtn_AddNew_Click(object sender, ImageClickEventArgs e)
        {
            if (DDL_EWBS.SelectedValue != "0")
            {
                DataTable Dtvs = (DataTable)ViewState["Dtvs"];
                DataRow dr = Dtvs.NewRow();

                dr["PID"] = Session["ProjectCode"].ToString();
                dr["ItemName"] = DDL_EWBS.SelectedValue;
                dr["ActivityUseNY"] = "1";
                Dtvs.Rows.Add(dr);
                Repeater1.DataSource = Dtvs;
                Repeater1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('請選擇執行預算工項!!');</script>");
            }
        }
        protected string examin()
        {
            string result="";
            bool output;
            foreach (RepeaterItem item in Repeater1.Items)
            {
                int sum = 0;
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    Label LbItemOrder = (Label)item.FindControl("LbItemOrder") as Label;
                    Label LbItemName = (Label)item.FindControl("LbItemName") as Label;
                    Label LbID = (Label)item.FindControl("LbID") as Label;

                    TextBox TB_N1 = (TextBox)item.FindControl("TB_N1") as TextBox;
                    TextBox TB_P1 = (TextBox)item.FindControl("TB_P1") as TextBox;
                   
                    for (int i = 0; i < Repeater1.Items.Count; i++)
                    {
                        Label tempLbID = Repeater1.Items[i].FindControl("LbID") as Label;
                        TextBox tempTB_P1 = Repeater1.Items[i].FindControl("TB_P1") as TextBox;
                        int Number = 0;
                        output = int.TryParse(tempTB_P1.Text, out Number);
                        if (LbID.Text == tempLbID.Text)
                        {
                            if (output)
                            {
                                sum += int.Parse(tempTB_P1.Text);
                            }
                            else
                            {
                                result = "3";
                            }

                        }

                    }

                    if (sum > 100)
                    {

                        result = "1";
                    }
                    else if (sum < 100)
                    {
                        //result = "2";

                    }

                }
            }
           return result;
        }
        protected void IBtn_Save_Click(object sender, ImageClickEventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            string SQLDel = "Delete Progress_WIINF where ProjectID="+Session["ProjectCode"].ToString();
            bool result = WebModel.SQLAction(database, SQLDel);
            string SQLDel1 = "Delete Progress_Real where ProjectID=" + Session["ProjectCode"].ToString();
            bool result1 = WebModel.SQLAction(database, SQLDel1);
            string SQLString = "WBSID,WBSName,WIID,WIName,ProjectID,Amount,Version";
            bool output = false;
            int num=1;
            string result2 = "";
            if (examin()=="")
            {
                DataTable Dtvs = new DataTable();

                foreach (string DataName in SQLString.Split(','))
                {
                    Dtvs.Columns.Add(DataName, typeof(string));
                }
                DataRow DataTableDr = Dtvs.NewRow();
                foreach (RepeaterItem item in Repeater1.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {
                       
                        Label LbID = (Label)item.FindControl("LbID") as Label;
                        Label LbItemOrder = (Label)item.FindControl("LbItemOrder") as Label;
                        Label LbItemName = (Label)item.FindControl("LbItemName") as Label;

                        TextBox TB_N1 = (TextBox)item.FindControl("TB_N1") as TextBox;
                        TextBox TB_P1 = (TextBox)item.FindControl("TB_P1") as TextBox;
                        int Number = 0;
                         output = int.TryParse(TB_P1.Text, out Number);

                        if (output)
                        {
                            DataTableDr["WBSID"] = LbID.Text;
                            DataTableDr["WBSName"] = LbItemOrder.Text + LbItemName.Text;
                            DataTableDr["WIName"] = TB_N1.Text;
                            DataTableDr["WIID"] = num;
                            DataTableDr["ProjectID"] = Session["ProjectCode"].ToString();
                            DataTableDr["Amount"] = TB_P1.Text;
                            DataTableDr["Version"] = 1;

                            Dtvs.Rows.Add(DataTableDr);
                            result2 = WebModel.SaveAction(database, "Progress_WIINF", Dtvs);
                            Dtvs.Rows.Clear();
                        }

                    }
                    num++;
                }
                if (!output)
                {

                    Response.Write("<script>alert('分攤工項比例請輸入數字');</script>");
                }
                if (result2 == "1")
                {

                    Response.Write("<script>alert('存檔成功');</script>");

                }
                else
                {
                    Response.Write("<script>alert('存檔失敗');</script>");

                }
            }
            else if (examin() == "1")
            {

                Response.Write("<script>alert('分攤工項比例超過100%');</script>");
               
            }
            else if (examin() == "3")
            {
                Response.Write("<script>alert('分攤工項比例請輸入數字');</script>");

            }
        }

        protected void ImageBtn_Reload_Click(object sender, ImageClickEventArgs e)
        {
            string database = Session["DatabaseName"].ToString();          
            string SQLDel = "Delete Progress_WIINF where ProjectID=" + Session["ProjectCode"].ToString();
            bool result = WebModel.SQLAction(database, SQLDel);
            string SQLDel1 = "Delete Progress_Real where ProjectID=" + Session["ProjectCode"].ToString();
            bool result1 = WebModel.SQLAction(database, SQLDel1);
            string SQLDel2 = "Delete Progress_RVersion where PID=" + Session["ProjectCode"].ToString();
            bool result2 = WebModel.SQLAction(database, SQLDel2);
            string data = "Select [EWID] ,[CWID],[PID],[LayerCode] ,[LayerNum],[UpperWID],[SortNum],[ItemOrder],[ItemName],[Unit],[ItemKind],[ExecuteKind],[ActivityUseNY] from EBudget_WBS where ActivityUseNY=1 and Pid=" + Session["ProjectCode"].ToString();
            DataTable Dtvs = WebModel.LoadSetContentData(database, data);
            if (Dtvs.Rows.Count != 0)
            {
                ViewState["Dtvs"] = Dtvs;
                Repeater1.DataSource = Dtvs;
                Repeater1.DataBind();
            }
            else
            {
                Response.Write("<script language='javascript'>alert('請先至執行預算編輯設定進度引用，否則不得進行進度管理！');location.href='ExeBudgetEdit.aspx';</script>");
            }
        }
    }
}