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
    public partial class PriceAnalysis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
               if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
              else
               {
                   DDL_Unit1.DataSource = Utility.Unitlist.UnitList();
                   //DDL_Unit2.DataSource = Utility.Unitlist.UnitList();
                   DDL_Unit1.DataBind();
                   //DDL_Unit2.DataBind();
                   //SqlDataSource1.SelectCommand = "Select * from PrivateResource";
                   GridView1.PageSize = int.Parse(DDL_Gv1_pagesize.SelectedValue);
                   //GridView2.PageSize = int.Parse(DDL_Gv2_pagesize.SelectedValue);
               }
           
            //SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.SelectCommand = Sql; 
            //SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
          
            if (Session["Pricename"] != null)
            {
                make_table(Session["DatabaseName"].ToString(), "0", Session["PriceName"].ToString(), Session["PriceNumber"].ToString());
            }
          
            //bool check = Utility.Access_check.project_access_check(Session["DatabaseName"].ToString(), Session["UserName"].ToString(), "單價分析", Session["ProjectCode"].ToString());
            //bool check = Utility.Access_check.common_access_check(Session["DatabaseName"].ToString(), Session["UserName"].ToString(), "單價分析");
            bool check = Utility.Access_check.check_common_access_by_Session(Session["LoginAccess"].ToString(), Request.FilePath.Substring(1));
            //if (!check)
            //{
            //    Response.Write("<script>alert('您的權限不足');location.href='Main.aspx';</script>");
            //}
            if (!IsPostBack)
            {
                List_Show();
                GridView1.DataBind();
                //GridView2.DataBind();
            }
           
        }
        protected string Sql
        {
            get
            {
                if (ViewState["Sql"] == null )
                {

                    //return "select * from  Bid_Library where  BID=" + Session["Bid"].ToString() + " AND PriceID not in (select KidID from Bid_AnaRelation where ParentID=" + Session["PriceID"].ToString() + ") and PriceID<>" + Session["PriceID"].ToString() + " ";
                    return "SELECT [PriceID],[ItemName],REPLACE(Unit,' ','') as Unit,[Complex],[AnaNumber],[Code],[Price],[Notes],REPLACE(ItemKind,' ','') as ItemKind FROM [PrivateResource] "; 
                }
                else
                {
                    return ViewState["Sql"].ToString();
                }
            }
            set
            {
                ViewState["Sql"] = value;
            }
        }
        public void List_Show()
        {
            LB_Private.Items.Clear();
            LB_Public.Items.Clear();
            int user_count = 0;
            //int PageID = 0;
            //int PID = 0;

           // LB_Private.HorizontalExtent = true;

            string[] Public = DAL.PriceAnalysis.Get_Public_Resource(Utility.DBconnection.connect_string("PublicDB"));

            string[] PriceId = Public[0].Split(',');
            string[] ItemName = Public[1].Split('|');
            string[] Unit = Public[2].Split(',');
            string[] Complex = Public[3].Split(',');
            string[] ItemKind = Public[5].Split(',');

            string[] Private = DAL.PriceAnalysis.Get_Private_Resource(Utility.DBconnection.connect_string(Session["DatabaseName"].ToString()));
            string[] PriceId1 = Private[0]!=null?Private[0].Split(','):null;
            string[] ItemName1 =Private[1]!=null? Private[1].Split('|'):null;
            string[] Unit1 =Private[2]!=null? Private[2].Split(','):null;
            string[] Complex1 = Private[3] !=null?Private[3].Split(','):null;
            string[] ItemKind1 =Private[5]!=null? Private[5].Split(','):null;
            string[] PublicId=Private[6]!=null?Private[6].Split(','):null;
            foreach (string item in ItemName)
            {
                bool flag = false;
                ListItem LI = new ListItem();
                LI.Text = ItemKind[user_count].ToString() + "-" + item + "[" + Unit[user_count].ToString() + "]";
                LI.Value = PriceId[user_count].ToString() + " | " + Unit[user_count].ToString() + " | " + Complex[user_count].ToString() + " | " + ItemKind[user_count].ToString();
                //使用for迴圈撈出陣列值
                if (PublicId != null)
                {
                    for (int id = 0; id < PublicId.Length; id++)
                    {

                        if (PublicId[id] != "")
                        {
                            int nowPublicId = (int.Parse(PublicId[id])).ToString() != "" ? int.Parse(PublicId[id]) : 0; ;
                            PriceId[user_count] = PriceId[user_count] != "" ? PriceId[user_count] : "0";
                            if (nowPublicId == int.Parse(PriceId[user_count]))
                            {
                                LB_Private.Items.Add(LI);
                                user_count++;
                                flag = true;
                                break;

                            }
                        }

                    }
                }
                if (!flag)
                {
                    LB_Public.Items.Add(LI);
                    user_count++;

                }

                # region 私有雲item須納進listbox時的作法
                //私有雲item須納進listbox時的作法
            //if (PriceId[0] != null)
            //{
            //    foreach (string item in ItemName)
            //    {
            //        bool flag = false;
            //        ListItem LI = new ListItem();
            //        LI.Text = ItemKind[user_count].ToString() + "-" + item + "[" + Unit[user_count].ToString() + "]";
            //        LI.Value = PriceId[user_count].ToString() + " | " + Unit[user_count].ToString() + " | " + Complex[user_count].ToString() + " | " + ItemKind[user_count].ToString();
                 
            //        for (int id = 0; id < PublicId.Length; id++)
            //        {

            //            if (PublicId[id] != "")
            //            {
            //                int nowPublicId = (int.Parse(PublicId[id])).ToString() != "" ? int.Parse(PublicId[id]) : 0; ;
            //                PriceId[user_count] = PriceId[user_count] != "" ? PriceId[user_count] : "0";
            //                if (nowPublicId == int.Parse(PriceId[user_count]))
            //                {
            //                    LI.Value += " | 私有雲";
            //                    LB_Private.Items.Add(LI);

            //                    user_count++;
            //                    flag = true;
            //                    break;

            //                }
            //            }

            //        }
            //        if (!flag)
            //        {
            //            LI.Value += " | 公有雲";
            //            LB_Public.Items.Add(LI);
            //            user_count++;

            //        }

            //    }
            //    if (PriceId1[0] != null)
            //    {
            //        //使用for迴圈撈出陣列值
            //        for (int id = 0; id < PriceId1.Length; id++)
            //        {
            //            ListItem LI1 = new ListItem();
            //            LI1.Text = ItemKind1[id].ToString() + "-" + ItemName1[id].ToString() + "[" + Unit1[id].ToString() + "]";
            //            LI1.Value = PriceId1[id].ToString() + " | " + Unit1[id].ToString() + " | " + Complex1[id].ToString() + " | " + ItemKind1[id].ToString() + " | " + "私有雲";

            //            if (PublicId[id] == "0" && PriceId1[id] != "")
            //            {
            //                LB_Private.Items.Add(LI1);
            //                //LB_Private.Items.Add(new ListItem(LI1.Text, LI1.Value));
            //            }

            //        }

                //    }
                #endregion 
                //string userlist;
                //int CID = DAL.SystemManage.Get_CompanyID_by_CompanyName(Session["CompanyName"].ToString());
                //string UIDs = DAL.SystemManage.Get_UserIDs_by_CompanyID(CID, out userlist);
                //string UPaccess = DAL.SystemManage.Get_UserID_Access_by_PageID_and_ProjectID(Session["DatabaseName"].ToString(), PageID, PID);
                //string[] Utemp = UIDs.Split(',');
                //int[] UIDarray = new int[Utemp.Length];
                //string[] UserNameList = userlist.Split(',');
                //for (int i = 0; i < Utemp.Length; i++)
                //{
                //    UIDarray[i] = int.Parse(Utemp[i]);
                //}

                //foreach (string ii in UserNameList)
                //{
                //    ListItem LI = new ListItem();
                //    LI.Text = ii;
                //    LI.Value = UIDarray[user_count].ToString();
                //    if (Array.IndexOf(UPaccess.Split(','), UIDarray[user_count].ToString()) != -1)
                //    {
                //        LB_Private.Items.Add(LI);
                //    }
                //    else
                //    {
                //        LB_Public.Items.Add(LI);
                //    }
                //    user_count++;
                //}
            }
        }
        protected void Btn_Price_Add_Click(object sender, EventArgs e)
        {
            string ErrorString = "";
            bool result = false;
            ErrorString += (DDL_Classification.SelectedValue) == "0" ? "請輸入單位!!\\n" : "";
            ErrorString += (TB_PriceName1.Text) == string.Empty ? "請輸入工料名稱!!\\n" : "";
            //ErrorString += (TB_Price1.Text) == string.Empty ? "請輸入工料價格!!\\n" : "";
            //ErrorString += (TB_Code2.Text) == string.Empty ? "請輸入資源編碼!!\\n" : "";
           

            if (ErrorString == "")
            {
                if (DDL_Classification.SelectedValue == "拆工拆料項")
                {
                    result = DAL.PriceAnalysis.Insert_PrivateResource(Session["DatabaseName"].ToString(), TB_PriceName1.Text,  DDL_Unit1.SelectedValue,TB_Code1.Text, DDL_Classification.SelectedValue, TB_Remark_Simple.Text);
                }
                else
                {
                    //bool result = DAL.PriceAnalysis.Insert_Simple(Session["DatabaseName"].ToString(), TB_PriceName1.Text, decimal.Parse(TB_Price1.Text), DDL_Unit1.SelectedValue, TB_Code1.Text);
                    result = DAL.PriceAnalysis.Insert_Simple2(Session["DatabaseName"].ToString(), TB_PriceName1.Text, decimal.Parse(TB_Price1.Text), DDL_Unit1.SelectedValue, TB_Code1.Text, DDL_Classification.SelectedValue, TB_Remark_Simple.Text);

                }
                if (result)
                {
                    TB_PriceName1.Text = "";
                    TB_Price1.Text = "";
                    TB_Code1.Text = "";
                    DDL_Classification.SelectedValue = "0";
                    TB_Remark_Simple.Text = "";
                    Response.Write("<script>alert('工料：" + TB_PriceName1.Text + " 新增成功');</script>");
                }
                else
                {
                    Response.Write("<script>alert('工料：" + TB_PriceName1.Text + " 新增失敗');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('" + ErrorString + "');</script>");

            }
        }

        public void make_table(string dbname, string ID, string PriceName, string PriceNumber)
        {
            ViewState["edit_count"] = 0;
            string[] PriceList = Utility.str_process.str2array(PriceName);
            string[] NumberList = Utility.str_process.str2array(PriceNumber);
            for (int i = 0; i < PriceList.Length; i++)
            {
                make_row(PriceList[i], NumberList[i]);
            }
        }

        public void make_row(string PriceName, string Number)
        {
            TableRow TR = new TableRow();
            TableCell TC1 = new TableCell();
            Button Btn = new Button();
            Btn.Text = "刪除";
            Btn.CommandName = "del";
            //Btn.Command += new CommandEventHandler(del_btn);
            ViewState["edit_count"] = Convert.ToInt32(ViewState["edit_count"]) + 1;
            Btn.ID = "TC1_ID_" + ViewState["edit_count"].ToString();
            Btn.CommandArgument = ViewState["edit_count"].ToString();

            TC1.Controls.Add(Btn);
            TR.Cells.Add(TC1);
            TableCell TC2 = new TableCell();
            DropDownList DDL = new DropDownList();
            DDL.DataSourceID = "SqlDataSource1";
            DDL.DataTextField = "ItemName";
            DDL.DataValueField = "PriceID";
            DDL.SelectedValue = PriceName;
            DDL.ID = "TC2_DDL_" + ViewState["edit_count"].ToString();
            DDL.SelectedIndexChanged += new EventHandler(DDL_change);

            TC2.Controls.Add(DDL);
            TR.Cells.Add(TC2);
            TableCell TC3 = new TableCell();
            TextBox TB = new TextBox();
            TB.Text = Number;
            TB.ID = "TC3_TB_" + ViewState["edit_count"].ToString();
            TB.TextChanged += new EventHandler(TB_change);

            TC3.Controls.Add(TB);
            TR.Cells.Add(TC3);
            //Tbl_Price.Rows.Add(TR);
        }

        //protected void Btn_ComplexPrice_Add_Click(object sender, EventArgs e)
        //{
        //    int num = 0;
        //    if (TB_RefNum.Text != "")
        //    {
        //        if (int.TryParse(TB_RefNum.Text, out num))
        //        {
        //            for (int i = 0; i < num; i++)
        //            {
        //                Session["PriceName"] += "1,";
        //                Session["PriceNumber"] += "0,";
        //                TableRow NewTR = new TableRow();
        //                TableCell NewTC1 = new TableCell();
        //                Button NewBtn1 = new Button();
        //                NewBtn1.Text = "刪除";
        //                NewBtn1.CommandName = "del";
        //                NewBtn1.Command += new CommandEventHandler(del_btn);
        //                ViewState["edit_count"] = Convert.ToInt32(ViewState["edit_count"]) + 1;
        //                NewBtn1.ID = "TC1_ID_" + ViewState["edit_count"].ToString();
        //                NewBtn1.CommandArgument = ViewState["edit_count"].ToString();

        //                NewTC1.Controls.Add(NewBtn1);
        //                NewTR.Cells.Add(NewTC1);

        //                TableCell NewTC2 = new TableCell();
        //                DropDownList DDL = new DropDownList();
        //                DDL.DataSourceID = "SqlDataSource1";
        //                DDL.DataTextField = "ItemName";
        //                DDL.DataValueField = "PriceID";
        //                //DDL.SelectedValue = "1";
        //                DDL.SelectedIndex = 0;
        //                DDL.ID = "TC2_DDL_" + ViewState["edit_count"].ToString();
        //                DDL.SelectedIndexChanged += new EventHandler(DDL_change);

        //                //DDL.Width = System.Web.UI.WebControls.Unit.Pixel(160);

        //                NewTC2.Controls.Add(DDL);
        //                NewTR.Cells.Add(NewTC2);

        //                TableCell NewTC3 = new TableCell();
        //                TextBox TB = new TextBox();
        //                //TB.Width = System.Web.UI.WebControls.Unit.Pixel(30);
        //                TB.Text = "0";
        //                TB.ID = "TC3_TB_" + ViewState["edit_count"].ToString();
        //                TB.TextChanged += new EventHandler(TB_change);

        //                NewTC3.Controls.Add(TB);
        //                NewTR.Cells.Add(NewTC3);

        //                Tbl_Price.Rows.Add(NewTR);
        //            }
        //        }
        //        Session["PriceName"] = Session["PriceName"].ToString().Substring(0, Session["PriceName"].ToString().Length - 1);
        //        Session["PriceNumber"] = Session["PriceNumber"].ToString().Substring(0, Session["PriceNumber"].ToString().Length - 1);
        //        ViewState["edit_count"] = num;
        //    }
        //    else
        //    {
        //        Response.Write("<script>alert('請輸入工料數量');</script>");

        //    }
            
        //}

        //protected void Btn_Save_Click(object sender, EventArgs e)
        //{
        //    string ErrorString = "";
        //    bool result = false;
        //    ErrorString += (DDL_Unit2.SelectedValue) == "0" ? "請輸入單位!!\\n" : "";                  
        //    ErrorString += (TB_PriceName2.Text) == string.Empty ? "請輸入工料名稱!!\\n" : "";
        //    ErrorString += (TB_ComplexAmount.Text) == string.Empty ? "請輸入分析數量!!\\n" : "";
        //    //ErrorString += (TB_Code2.Text) == string.Empty ? "請輸入資源編碼!!\\n" : "";
        //    ErrorString += (Session["PriceName"]) == null ? "請輸入參照工料!!\\n" : "";
            
        //    if (ErrorString == "")
        //    {
        //        //bool result = DAL.PriceAnalysis.Insert_Complex("CICIMS", TB_PriceName2.Text, DDL_Unit2.SelectedValue, TB_Code2.Text, Session["PriceName"].ToString(), Session["PriceNumber"].ToString());
        //         result = DAL.PriceAnalysis.Insert_Complex2(Session["DatabaseName"].ToString(), TB_PriceName2.Text, DDL_Unit2.SelectedValue, decimal.Parse(TB_ComplexAmount.Text), TB_Code2.Text, DDL_Classification2.SelectedValue, TB_Remark_Complex.Text, Session["PriceName"].ToString(), Session["PriceNumber"].ToString());
          
        //        if (result)
        //    {
        //        TB_PriceName2.Text = "";
        //        TB_ComplexAmount.Text = "";
        //        TB_Code2.Text = "";
        //        TB_Remark_Complex.Text = "";
        //        Session["PriceName"] = null;
        //        Session["PriceNumber"] = null;
        //        Response.Write("<script>alert('工料：" + TB_PriceName2.Text + " 新增成功');</script>");
        //    }
        //    else
        //    {
        //        Response.Write("<script>alert('工料：" + TB_PriceName2.Text + " 新增失敗');</script>");
        //    }
        //    }
        //    else
        //    {
        //        ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);

        //    }
        //}

        protected void TB_change(object sender, EventArgs e)
        {
            int rows = 0;
            TextBox tb = (TextBox)sender;
            string[] temp = tb.ID.Split('_');
            rows = Convert.ToInt32(temp[2]);
            string[] PNumber = Utility.str_process.str2array(Session["PriceNumber"].ToString());
            PNumber[rows - 1] = tb.Text;

            Session["PriceNumber"] = Utility.array_process.array2str(PNumber).Substring(0, Utility.array_process.array2str(PNumber).Length);
        }

        protected void DDL_change(object sender, EventArgs e)
        {
            int rows = 0;
            DropDownList ddl = (DropDownList)sender;
            string[] temp = ddl.ID.Split('_');
            rows = Convert.ToInt32(temp[2]);
            string[] PName = Utility.str_process.str2array(Session["PriceName"].ToString());
            PName[rows - 1] = ddl.SelectedValue;

            Session["PriceName"] = Utility.array_process.array2str(PName).Substring(0, Utility.array_process.array2str(PName).Length);
        }

        //protected void del_btn(object sender, CommandEventArgs e)
        //{
        //    int rows = Convert.ToInt32(e.CommandArgument);
        //    //int rows = 1;
        //    Tbl_Price.Rows.Remove(Tbl_Price.Rows[rows]);

        //    string[] PName = Utility.str_process.str2array(Session["PriceName"].ToString());
        //    string[] PNumber = Utility.str_process.str2array(Session["PriceNumber"].ToString());
        //    string[] NewPName = new string[PName.Length - 1];
        //    string[] NewPNumber = new string[PNumber.Length - 1];
        //    int count = 0;
        //    for (int i = 0; i < PName.Length; i++)
        //    {
        //        if (i != (rows - 1))
        //        {
        //            NewPName[count] = PName[i];
        //            NewPNumber[count] = PNumber[i];
        //            count++;
        //        }
        //    }
        //    Session["PriceName"] = Utility.array_process.array2str(NewPName).Substring(0, Utility.array_process.array2str(NewPName).Length - 1);
        //    Session["PriceNumber"] = Utility.array_process.array2str(NewPNumber).Substring(0, Utility.array_process.array2str(NewPNumber).Length - 1);
        //}

        //protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    int Row_ID = Convert.ToInt32(e.CommandArgument) % GridView2.PageSize;
        //    string PriceID = GridView2.DataKeys[Row_ID].Value.ToString();
        //    if (e.CommandName == "Ed")
        //    {
        //        Response.Write("<script>window.open('PriceAnalysis_Edit.aspx?ID=" + PriceID + "', 'window', config='height=500,width=1500');</script>");
        //    }
        //}

        public string Show_value(object o)
        {
            string value = "";
            string oo = Convert.ToString(o);
            if (!(String.IsNullOrEmpty(oo)))
            {
                DAL.PriceAnalysis PA = new DAL.PriceAnalysis();
                decimal vv = PA.Price_Output(Session["DatabaseName"].ToString(), int.Parse(oo));
                value = vv.ToString("0.00");
            }
            return value;
        }

        protected void Btn_OneToPrivate_Click(object sender, EventArgs e)
        {
            int[] indices = LB_Public.GetSelectedIndices();
          
            if (LB_Public.SelectedItem != null)
            {
                foreach (int i in LB_Public.GetSelectedIndices())
                {
                    LB_Private.Items.Add(LB_Public.Items[i]);
                  
                }
                 
                for (int i = indices.Length - 1; i >= 0; i--)
                {
                  
                  
                    LB_Public.Items.RemoveAt(indices[i]);
                  
                }
             
                 
            }
        }

        protected void Btn_AllToPrivate_Click(object sender, EventArgs e)
        {
            int Mv_times = LB_Public.Items.Count;

                for (int i = Mv_times - 1; i >= 0; i--)
                {

                   
                    
                    ListItem LI = new ListItem();
                    LI.Text = LB_Public.Items[i].Text;
                    LI.Value = LB_Public.Items[i].Value;
                    string lid=LI.Value.Split('|')[0];
                  
                        LB_Private.Items.Add(LI);
                        LB_Public.Items.Remove(LI);
                 
            }
        }

        protected void Btn_OneToPublic_Click(object sender, EventArgs e)
        {
            int Mv_times = LB_Private.Items.Count;
            int[] indices = LB_Private.GetSelectedIndices();
            if (LB_Private.SelectedItem != null)
            {
                foreach (int i in LB_Private.GetSelectedIndices())
                {
                    LB_Public.Items.Add(LB_Private.Items[i]);

                }

                for (int i = indices.Length - 1; i >= 0; i--)
                {


                    LB_Private.Items.RemoveAt(indices[i]);

                }
                //for (int i = indices.Length - 1; i >= 0; i--)
                //{
                //    LB_Private.Items.RemoveAt(indices[i]);
                //    LB_Public.Items.Add(LB_Public.Items[i]);
                //}
            }
        }

        protected void Btn_AllToPublic_Click(object sender, EventArgs e)
        {
            int Mv_times = LB_Private.Items.Count;

            for (int i = Mv_times - 1; i >= 0; i--)
            {



                ListItem LI = new ListItem();
                LI.Text = LB_Private.Items[i].Text;
                LI.Value = LB_Private.Items[i].Value;

                LB_Public.Items.Add(LI);
                LB_Private.Items.Remove(LI);

            }
        }

        protected void Btn_Allsave_Click(object sender, EventArgs e)
        {
            int Mv_times = LB_Private.Items.Count;
            string database = Session["DatabaseName"].ToString();
            bool result =false;
            int NextID = 0;
            int NextID1 = 0;
            for (int i = Mv_times - 1; i >= 0; i--)
            {

                ListItem LI = new ListItem();
                LI.Text = LB_Private.Items[i].Text;
                LI.Value = LB_Private.Items[i].Value;
                string ItemName = LI.Text;
                string PriceID = LI.Value.Split('|')[0];
                string Unit = LI.Value.Split('|')[1];
                string Complex = LI.Value.Split('|')[2];
                string ItemKind = LI.Value.Split('|')[3];
                //string clound = LI.Value.Split('|')[4];
                if (DAL.PriceAnalysis.checkPublicID(database, PriceID))
                {
                   //string SQLSelect="Select * from [PublicDB].[dbo].[PublicResource] where PriceID="+PriceID;
                   //string ItName = WebModel.SItemName(database, SQLSelect, "ItemName");
                   //string Insert = "insert into [PrivateResource] ([ItemName],[Unit],[Complex],[ItemKind],[PublicID]) VALUES('" + ItName + "','" + Unit + "','" + Complex + "','" + ItemKind + "','" + PriceID + "')";
                   //result = WebModel.SQLAction(Session["DatabaseName"].ToString(), Insert);
                   //NextID = WebModel.MaxID(database, "PrivateResource") - 1;

                    int[] uid = checkfun.Sort_PublicResource("PublicDB", int.Parse(PriceID));
                    foreach (int id in uid)
                    {
                        string SelectPublicResource = "Select * from PublicResource where PriceID=" + id;
                        string SelectPublicAnalysis = "Select * from PublicAnalysis where ParentID=" + PriceID + " and KidID=" + id + "";
                        DataTable Table = WebModel.LoadSetContentData("PublicDB", SelectPublicResource);
                        DataTable Table1 = WebModel.LoadSetContentData("PublicDB", SelectPublicAnalysis);
                        foreach (DataRow row in Table.Rows)
                        {
                            string ItemName1 = row["ItemName"].ToString();
                            string Unit1 = row["Unit"].ToString();
                            string Complex1 = row["Complex"].ToString();
                            string ItemKind1 = row["ItemKind"].ToString();
                            string Insert1 = "insert into [PrivateResource] ([ItemName],[Unit],[Complex],[ItemKind],[PublicID]) VALUES('" + ItemName1 + "','" + Unit1 + "','" + Complex1 + "','" + ItemKind1 + "','" + id + "')";
                            result = WebModel.SQLAction(Session["DatabaseName"].ToString(), Insert1);
                            NextID1 = WebModel.MaxID(database, "PrivateResource") - 1;
                        }

                        foreach (DataRow row in Table1.Rows)
                        {
                            string SortNum = row["SortNum"].ToString();
                            int ParentID = NextID;
                            string WorkRate = row["WorkRate"].ToString();

                            string Insert2 = "insert into [PrivateAnalysis] ([SortNum],[ParentID],[KidID],[WorkRate]) VALUES('" + SortNum + "','" + NextID + "','" + NextID1 + "','" + WorkRate + "')";
                            result = WebModel.SQLAction(Session["DatabaseName"].ToString(), Insert2);
                        }

                    }

                }
                //if (PriceID.Trim() != "")
                //{

            //    if (clound.Trim() == "公有雲")
            //    {
            //        if (DAL.PriceAnalysis.checkPublicID(database, PriceID))
            //        {
            //            string Insert = "insert into [PrivateResource] ([ItemName],[Unit],[Complex],[ItemKind],[PublicID]) VALUES('" + ItemName + "','" + Unit + "','" + Complex + "','" + ItemKind + "','" + PriceID + "')";
            //            result = WebModel.SQLAction(Session["DatabaseName"].ToString(), Insert);


            //        }
            //    }
              
            // }
               
            }
            if (result)
            {

                Response.Write("<script>alert('新增成功');</script>");

            }
            else
            {
                Response.Write("<script>alert('新增失敗');</script>");
            }
        }

        protected void BtnPrivateS_Click(object sender, EventArgs e)
        {
            LB_Private.Items.Clear();
            LB_Public.Items.Clear();
            int user_count = 0;
            //int PageID = 0;
            //int PID = 0;

            string keyword = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TextBox1.Text));

            string[] Public = DAL.PriceAnalysis.Get_Public_Resource(Utility.DBconnection.connect_string("PublicDB"));
            if (Public[0] != null)
            {
                string[] PriceId = Public[0].Split(',');
                string[] ItemName = Public[1].Split('|');
                string[] Unit = Public[2].Split(',');
                string[] Complex = Public[3].Split(',');
                string[] ItemKind = Public[5].Split(',');

                string[] Private = DAL.PriceAnalysis.Get_PrivateResource_Search(Utility.DBconnection.connect_string(Session["DatabaseName"].ToString()),keyword);
                string[] PriceId1 = Private[0].Split(',');
                string[] ItemName1 = Private[1].Split('|');
                string[] Unit1 = Private[2].Split(',');
                string[] Complex1 = Private[3].Split(',');
                string[] ItemKind1 = Private[5].Split(',');
                string[] PublicId = Private[6].Split(',');
                //if (PriceId1[0] != null)
                //{
                //    //使用for迴圈撈出陣列值
                //    for (int id = 0; id < PriceId1.Length; id++)
                //    {
                //        ListItem LI1 = new ListItem();
                //        LI1.Text = ItemKind1[id].ToString() + "-" + ItemName1[id].ToString() + "[" + Unit1[id].ToString() + "]";
                //        LI1.Value = PriceId1[id].ToString() + " | " + Unit1[id].ToString() + " | " + Complex1[id].ToString() + " | " + ItemKind1[id].ToString();

                //        if (PublicId[id] == "0" && PriceId1[id] != "")
                //        {
                //            LB_Private.Items.Add(LI1);
                //            //LB_Private.Items.Add(new ListItem(LI1.Text, LI1.Value));
                //        }

                //    }

                //}
                foreach (string item in ItemName)
                {
                    bool flag = false;
                    ListItem LI = new ListItem();
                    LI.Text = ItemKind[user_count].ToString() + "-" + item + "[" + Unit[user_count].ToString() + "]";
                    LI.Value = PriceId[user_count].ToString() + " | " + Unit[user_count].ToString() + " | " + Complex[user_count].ToString() + " | " + ItemKind[user_count].ToString();
                    //使用for迴圈撈出陣列值
                    for (int id = 0; id < PublicId.Length; id++)
                    {

                        if (PublicId[id] != "")
                        {
                            int nowPublicId = (int.Parse(PublicId[id])).ToString() != "" ? int.Parse(PublicId[id]) : 0; ;
                            PriceId[user_count] = PriceId[user_count] != "" ? PriceId[user_count] : "0";
                            if (nowPublicId == int.Parse(PriceId[user_count]))
                            {
                                LB_Private.Items.Add(LI);

                                user_count++;
                                flag = true;
                                break;

                            }
                        }

                    }
                    if (!flag)
                    {
                        LB_Public.Items.Add(LI);
                        user_count++;

                    }

                }
            }
            else
            {
                Response.Write("<script>alert('無此項目');</script>");

            }
        }

        protected void BtnPublicS_Click(object sender, EventArgs e)
        {
            LB_Private.Items.Clear();
            LB_Public.Items.Clear();
            int user_count = 0;
           
            string keyword=SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TextBox2.Text));

            string[] Public = DAL.PriceAnalysis.Get_PublicResource_Search(Utility.DBconnection.connect_string("PublicDB"), keyword);
            //string[] Public1 = DAL.PriceAnalysis.Get_Public_Resource(Utility.DBconnection.connect_string("PublicDB"));
            string[] Private = DAL.PriceAnalysis.Get_Private_Resource(Utility.DBconnection.connect_string(Session["DatabaseName"].ToString()));
            string[] PublicId = Private[6].Split(',');
            if (Private[0] != null)
            {
                string[] PriceId1 = Private[0].Split(',');
                string[] ItemName1 = Private[1].Split('|');
                string[] Unit1 = Private[2].Split(',');
                string[] Complex1 = Private[3].Split(',');
                string[] ItemKind1 = Private[5].Split(',');
                string[] PublicID1 = Private[6].Split(',');


                //foreach (string item1 in ItemName1)
                //{
                //bool flag = false;


                //使用for迴圈撈出陣列值
                for (int id = 0; id < PriceId1.Length; id++)
                {
                    ListItem LI1 = new ListItem();
                    LI1.Text = ItemKind1[id].ToString() + "-" + ItemName1[id].ToString() + "[" + Unit1[id].ToString() + "]";
                    LI1.Value = PriceId1[id].ToString() + " | " + Unit1[id].ToString() + " | " + Complex1[id].ToString() + " | " + ItemKind1[id].ToString();

                    if (PublicID1[id] != "0" && PublicID1[id] != "")
                    {


                        LB_Private.Items.Add(LI1);
                        //LB_Private.Items.Add(new ListItem(LI1.Text, LI1.Value));
                    }

                }


            }
            if (Public[0] != null)
            {
                string[] PriceId = Public[0].Split(',');
                string[] ItemName = Public[1].Split('|');
                string[] Unit = Public[2].Split(',');
                string[] Complex = Public[3].Split(',');
                string[] ItemKind = Public[5].Split(',');
                user_count = 0;
            

                foreach (string item in ItemName)
                {
                    bool flag = false;
                  
                    ListItem LI = new ListItem();
                    LI.Text = ItemKind[user_count].ToString() + "-" + item + "[" + Unit[user_count].ToString() + "]";
                    LI.Value = PriceId[user_count].ToString() + " | " + Unit[user_count].ToString() + " | " + Complex[user_count].ToString() + " | " + ItemKind[user_count].ToString();
                    //使用for迴圈撈出陣列值
                    for (int id = 0; id < PublicId.Length; id++)
                    {

                        if (PublicId[id] != "")
                        {
                            int nowPublicId = (int.Parse(PublicId[id])).ToString() != "" ? int.Parse(PublicId[id]) : 0; ;
                            PriceId[user_count] = PriceId[user_count] != "" ? PriceId[user_count] : "0";
                            if (int.Parse(PriceId[user_count]) == nowPublicId )
                            {
                                //LB_Public.Items.Add(LI);

                                user_count++;
                                flag = true;
                                break;

                            }
                        }

                    }
                    if (!flag)
                    {
                        LB_Public.Items.Add(LI);
                        user_count++;

                    }
                    //使用for迴圈撈出陣列值
                    //for (int id = 0; id < PublicId.Length; id++)
                    //{

                    //    if (PublicId[id] != "")
                    //    {
                    //        int nowPublicId = (int.Parse(PublicId[id])).ToString() != "" ? int.Parse(PublicId[id]) : 0; ;
                    //        PriceId[user_count] = PriceId[user_count] != "" ? PriceId[user_count] : "0";
                    //        if (nowPublicId != int.Parse(PriceId[user_count]))
                    //        {
                    //            LB_Public.Items.Add(LI);

                    //            user_count++;
                    //            flag = true;
                    //            break;

                    //        }
                    //    }

                    //}
                    //if (!flag)
                    //{
                    //    LB_Private.Items.Add(LI);
                    //    user_count++;

                    //}
                }
                
            }
            else
            {
                Response.Write("<script>alert('無此項目');</script>");

            }
            
        
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            TB_PriceName1.Text = "";
            TB_Price1.Text = "";
            TB_Code1.Text = "";
            DDL_Classification.SelectedValue = "連工帶料項";
            TB_Remark_Simple.Text = "";
        }

        protected void DDL_Classification_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDL_Classification.SelectedValue == "拆工拆料項")
            {
                TB_Price1.Enabled = false;

            }
            else
            {
                TB_Price1.Enabled = true;
            }
        }

        protected void Search_Click(object sender, ImageClickEventArgs e)
        {
            string Keyword = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TBSearch.Text));
            Sql = "SELECT [PriceID],[ItemName],REPLACE(Unit,' ','') as Unit,[Complex],[AnaNumber],[Code],[Price],[Notes],REPLACE(ItemKind,' ','') as ItemKind FROM [PrivateResource] WHERE ItemName like '%" + Keyword + "%' ";
            SqlDataSource2.SelectCommand = Sql;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int Row_ID = Convert.ToInt32(e.CommandArgument) % GridView1.PageSize;
            string PriceID = GridView1.DataKeys[Row_ID].Value.ToString();
            if (e.CommandName == "Ed")
            {
                Response.Write("<script>window.open('PublicAnalysisEdit.aspx?ID=" + PriceID + "', 'window', config='height=500,width=1500');</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label complex = (Label)e.Row.FindControl("complex");
                Button Analyst = (Button)e.Row.FindControl("Analyst");

                if (complex.Text == "1")
                {
                    Analyst.Visible = true;
                }
                else
                {
                    Analyst.Visible = false;

                }

            }
        }

    }
}