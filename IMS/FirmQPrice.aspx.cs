using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;

namespace IMS
{
    public partial class FirmQPrice : System.Web.UI.Page
    {
        int xxx = 0;
        public void MsgBox(string Message)
        {
            string sScript = "";
            string sMessage = "";
            sMessage = Message.Replace("'", "\'");
            sMessage = sMessage.Replace(Environment.NewLine, "\n");
            sScript = string.Format("alert('{0}');", sMessage);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", sScript, true);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["DatabaseName"] = "CICIMS";
            //Session["UserName"] = "admin";
            //Session["Name"] = "admin";
            //Session["CompanyName"] = "台科測試台";
            //Label Now = new Label();
            //Now = (Label)Master.FindControl("NowMode");
            //Now.Visible = true;
            //Now.Text = " 分包商管理模組-報價資料管理 ";
            //LB_Status.Text = "報價資料總覽";
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SQLadd3.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SQLadd4.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SQLadd1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
        }
        protected void Btn_HideSelect_Click(object sender, EventArgs e)
        {
            if (Btn_HideSelect.Text == "隱藏搜尋面板")
            {
                Btn_HideSelect.Text = "顯示搜尋面板";
                PanelSelect.Visible = false;
            }
            else
            {
                Btn_HideSelect.Text = "隱藏搜尋面板";
                PanelSelect.Visible = true;
            }
        }
        protected void IBtn_Select4_Click(object sender, EventArgs e)
        {
            string Tagstr = "<Script> window.open('Calendar.aspx?ClientID=" + TB_Select4.ClientID.ToString() + "','SelectDate','resizable=yes,scrollbars=no,top=200,left=240,height=350,width=400,status=no,toolbar=no,menubar=no,location=no','');</script>";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", Tagstr, false);
        }
        protected void DDL_Op4_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDL_Op3in.SelectedItem.Text == "之間")
            {
                TB_Select32.Visible = true;
            }
        }
        public void SelectEmpty()
        {
            DDL_Select1.SelectedValue = "";
            TB_Select21.Text = "";
            TB_Select22.Text = "";
            TB_Select31.Text = "";
            TB_Select32.Text = "";
            TB_Select4.Text = "";
            DDL_Op1.SelectedValue = "AND";
            DDL_Op2in.SelectedValue = "AND";
            DDL_Op2.SelectedValue = "AND";
            DDL_Op3in.SelectedValue = "<";
            DDL_Op3.SelectedValue = "AND";
            LB_EmptyData.Visible = false;
        }
        protected void IBtn_Add1_Click(object sender, ImageClickEventArgs e)
        {
            TextBox TB = (TextBox)DetailsView2.FindControl("TextBox3");
            string Tagstr = "<Script> window.open('Calendar.aspx?ClientID=" + TB.ClientID.ToString() + "','SelectDate','resizable=yes,scrollbars=no,top=200,left=240,height=350,width=400,status=no,toolbar=no,menubar=no,location=no','');</script>";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", Tagstr, false);
        }
        protected void Btn_Add_Click(object sender, EventArgs e)
        {
            DetailsView2.Visible = true;
            DetailsView1.Visible = false;
        }
        public void ReloadDDL()
        {
            DropDownList myDDL = (DropDownList)DetailsView2.FindControl("DropDownList2");
            myDDL.Items.Clear();
            SqlConnection Conn1 = new SqlConnection(Utility.DBconnection.connect_string(Session["DatabaseName"].ToString()));
            Conn1.Close();
            Conn1.Open();
            SqlDataAdapter MyAdapter1 = new SqlDataAdapter();
            SqlCommand MyCommand1 = new SqlCommand();
            DataSet MyDataset1 = new DataSet();
            MyCommand1.CommandText = "SELECT DISTINCT PriceID, PriceName, Unit FROM PriceAnalysis";
            MyCommand1.Connection = Conn1;
            MyAdapter1.SelectCommand = MyCommand1;
            MyAdapter1.Fill(MyDataset1, "DDL");
            MyDataset1.Tables["DDL"].Columns.Add("SUM");
            foreach (DataRow i in MyDataset1.Tables["DDL"].Rows)
            {
                i["SUM"] = i["PriceName"] + "(" + i["Unit"].ToString().Trim() + ")";
            }
            myDDL.DataTextField = MyDataset1.Tables["DDL"].Columns[3].ToString();
            myDDL.DataValueField = MyDataset1.Tables["DDL"].Columns[3].ToString();
            myDDL.DataSource = MyDataset1.Tables["DDL"].DefaultView;
            myDDL.DataBind();
            myDDL.AppendDataBoundItems = true;
            myDDL.Items.Insert(0, "請選擇");
        }
        protected void Btn_SelectEmpty_Click(object sender, EventArgs e)
        {
            SelectEmpty();
        }
        protected void Btn_AllView_Click(object sender, EventArgs e)
        {
            LB_Status.Text = "報價資料總覽";
            GridView1.DataSourceID = "SqlDataSource1";
            SelectEmpty();
            DetailsView1.Visible = false;
            DetailsView2.Visible = false;
        }
        protected void Btn_SelectGO_Click(object sender, EventArgs e)
        {
            string x = "select FirmQPrice.UID, FirmQPrice.FirmID, FirmQPrice.MItem, FirmQPrice.Price, FirmQPrice.ExpiretionDate, FirmQPrice.TransNum, FirmQPrice.Distance, FirmQPrice.PaymentCondition, FirmQPrice.Tax, FirmQPrice.Notes,  FirmM.Name FROM FirmM INNER JOIN FirmQPrice ON FirmM.UID = FirmQPrice.FirmID where ";
            string xx = "依 ";
            int[] SelectCondition = new int[5];
            int Price1 = 0;
            int Price2 = 0;
            for (int i = 0; i < 5; i++)
            {
                SelectCondition[i] = 0;
            }
            if (DDL_Select1.SelectedValue != "")
            {
                SelectCondition[1] = 1;
            }
            if (TB_Select21.Text.Trim() != "")
            {
                if (TB_Select22.Text.Trim() != "")
                {
                    SelectCondition[2] = 2;
                }
                else
                {
                    SelectCondition[2] = 1;
                }
            }
            else if (TB_Select22.Text.Trim() != "")
            {
                TB_Select21.Text = TB_Select22.Text.Trim();
                TB_Select22.Text = "";
                SelectCondition[2] = 1;
            }
            int result1, result2;
            if (DDL_Op3in.SelectedItem.Text != "之間")
            {
                if (TB_Select31.Text.Trim() != "")
                {
                    if (!(int.TryParse(TB_Select31.Text.Trim(), out result1)))
                    {
                        MsgBox("以價格搜尋請輸入整數!");
                        return;
                    }
                    SelectCondition[3] = 1;
                    Price1 = result1;
                }
            }
            else
            {
                if ((TB_Select31.Text.Trim() == "") | (TB_Select32.Text.Trim() == ""))
                {
                    MsgBox("以價格[之間]搜尋請輸入兩個數值!");
                    return;
                }
                if ((!(int.TryParse(TB_Select31.Text.Trim(), out result1))) | (!(int.TryParse(TB_Select32.Text.Trim(), out result2))))
                {
                    MsgBox("以價格搜尋請輸入整數!");
                    return;
                }
                SelectCondition[3] = 2;
                Price1 = result1;
                Price2 = result2;
            }
            if (TB_Select4.Text.Trim() != "")
            {
                SelectCondition[4] = 1;
            }
            for (int i = 1; i < 5; i++)
            {
                if (SelectCondition[i] != 0)
                {
                    if (SelectCondition[0] != 0)
                    {
                        DropDownList myDDL = (DropDownList)PanelSelect.FindControl("DDL_Op" + SelectCondition[0].ToString());
                        x += myDDL.SelectedValue + " ";
                        xx += myDDL.SelectedItem.Text + " ";
                    }
                    switch (i)
                    {
                        case 1:
                            x += "FirmQPrice.FirmID = '" + DDL_Select1.SelectedValue + "' ";
                            xx += "[報價廠商名稱]=" + DDL_Select1.SelectedItem.Text + " ";
                            break;
                        case 2:
                            x += "FirmQPrice.MItem like '%" + TB_Select21.Text.Trim() + "%' ";
                            xx += "[工料項目]=(關鍵字)" + TB_Select21.Text.Trim() + " ";
                            if (SelectCondition[2] == 2)
                            {
                                x += DDL_Op2in.SelectedValue + " ";
                                xx += DDL_Op2in.SelectedItem.Text + " ";
                                x += "FirmQPrice.MItem like '%" + TB_Select22.Text.Trim() + "%' ";
                                xx += "[工料項目]=(關鍵字)" + TB_Select22.Text.Trim() + " ";
                            }
                            break;
                        case 3:
                            if (SelectCondition[3] == 1)
                            {
                                x += "FirmQPrice.Price " + DDL_Op3in.SelectedValue + " " + Price1.ToString() + " ";
                                xx += "[價格]=" + Price1.ToString() + DDL_Op3in.SelectedItem.Text + " ";
                            }
                            else if (SelectCondition[3] == 2)
                            {
                                x += "FirmQPrice.Price Between " + Price1.ToString() + " And " + Price2.ToString() + " ";
                                xx += "[價格]=" + Price1.ToString() + "與" + Price2.ToString() + "之間 ";
                            }
                            break;
                        case 4:
                            x += "FirmQPrice.ExpiretionDate >'" + TB_Select4.Text.Trim() + "' ";
                            xx += "[報價有效期限]=" + TB_Select4.Text.Trim() + "之內 ";
                            break;
                    }
                    SelectCondition[0] = i;
                }
            }
            if (CB_Select5.Checked == true)
            {
                string Today = DateTime.Now.Year.ToString() + "/" + DateTime.Now.Month.ToString() + "/" + DateTime.Now.Day.ToString();
                if (SelectCondition[0] == 0)
                {
                    x += "FirmQPrice.ExpiretionDate >'" + Today + "' ";
                    xx += "過期之報價不顯示 ";
                }
                else
                {
                    x += "And FirmQPrice.ExpiretionDate >'" + Today + "' ";
                    xx += "且 過期之報價不顯示 ";
                }
                SelectCondition[0] = 5;
            }
            if (SelectCondition[0] == 0)
            {
                MsgBox("請至少輸入一種搜尋條件!");
                return;
            }
            xx += "之搜尋結果";
            LB_Status.Text = xx;
            SqlDataSourceSelect.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSourceSelect.SelectCommand = x;
            GridView1.DataSourceID = "SqlDataSourceSelect";
            GridView1.DataBind();
            if (GridView1.Rows.Count == 0)
            {
                LB_EmptyData.Visible = true;
            }
            else
            {
                LB_EmptyData.Visible = false;
            }
            DetailsView1.Visible = false;
            DetailsView2.Visible = false;
        }
        protected void IBtn_Update1_Click(object sender, EventArgs e)
        {
            TextBox TB = (TextBox)DetailsView1.FindControl("TextBox3");
            string Tagstr = "<Script> window.open('Calendar.aspx?ClientID=" + TB.ClientID.ToString() + "','SelectDate','resizable=yes,scrollbars=no,top=200,left=240,height=350,width=400,status=no,toolbar=no,menubar=no,location=no','');</script>";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", Tagstr, false);
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsView1.Visible = true;
            DetailsView2.Visible = false;
        }
        protected void Btn_AddNewMID_Click(object sender, EventArgs e)
        {
            Button myBtn = (Button)DetailsView2.FindControl("Button2");
            TextBox myTB = (TextBox)DetailsView2.FindControl("TextBox4");
            myBtn.Visible = true;
            string Tagstr = "<Script> window.open('AddNewMItem.aspx','新增工料項目','resizable=yes,scrollbars=no,top=200,left=240,height=350,width=400,status=no,toolbar=no,menubar=no,location=no','');</script>";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "", Tagstr, false);
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            xxx = 1;
            TextBox myTB = (TextBox)DetailsView2.FindControl("TextBox4");
            int ID = int.Parse(myTB.Text);
            ReloadDDL();
            DropDownList myDDL = (DropDownList)DetailsView2.FindControl("DropDownList2");
            myDDL.SelectedValue = ID.ToString();
            Button myBtn = (Button)DetailsView2.FindControl("Button2");
            myBtn.Visible = false;
        }
        protected void DropDownList2_Init(object sender, EventArgs e)
        {
            ReloadDDL();
        }

        protected void DetailsView2_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            MsgBox("報價資料已新增");
            // DetailsView2.Visible = false;
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.DataBind();
        }
        protected void DetailsView2_ItemInserting(object sender, DetailsViewInsertedEventArgs e)
        {
            try
            {
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {
            TextBox myTB = (TextBox)DetailsView2.FindControl("TextBox4");
            DropDownList myDDL = (DropDownList)DetailsView2.FindControl("DropDownList2");
            try
            {
                //myDDL.SelectedValue = int.Parse(myTB.Text);
                myDDL.SelectedValue = myTB.Text;
            }
            catch (Exception ex)
            {
                MsgBox(ex.Message);
            }
            Button myBtn = (Button)DetailsView2.FindControl("Button2");
            myBtn.Visible = false;
        }

    }
}