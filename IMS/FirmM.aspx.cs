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
    public partial class FirmM1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                SqlDataSource5.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource6.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource7.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource8.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource9.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource10.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource11.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            }

        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if ((Pnl_Search.Visible == true))
            { Pnl_Search.Visible = false; }
            else { Pnl_Search.Visible = true; }
        }
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if ((Pnl_Insert.Visible == true))
            { Pnl_Insert.Visible = false; }
            else { Pnl_Insert.Visible = true; }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Pnl_Edit.Visible = true;
        }
        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string KeyWord = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxFirmName.Text));
            string KeyWord1 = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TxSpecialty.Text));

            #region 搜尋條件


            string x = "select * from FirmM where ";
            string xx = "依 ";
            int[] SelectCondition = new int[5];
            for (int i = 0; i < 5; i++)
            {
                SelectCondition[i] = 0;
            }
            if (KeyWord.Trim() != "")
            {
                SelectCondition[1] = 1;
            }
            if (DDL_Select2.SelectedValue.ToString() != "0")
            {
                SelectCondition[2] = 1;
            }
            if (KeyWord1.Trim() != "")
            {
                
                SelectCondition[3] = 1;
               
            }

            if (DDL_Select4.SelectedValue.ToString() != "0")
            {
                SelectCondition[4] = 1;
            }
            for (int i = 1; i < 5; i++)
            {
                if (SelectCondition[i] != 0)
                {
                    if (SelectCondition[0] != 0)
                    {
                        DropDownList myDDL = (DropDownList)Pnl_Search.FindControl("DDL_Op" + SelectCondition[0].ToString());
                        //MsgBox(myDDL.ID);
                        x += myDDL.SelectedValue + " ";
                        xx += myDDL.SelectedItem.Text + " ";
                    }
                    switch (i)
                    {
                        case 1:
                            x += "Name like '%" + KeyWord.Trim() + "%' ";
                            xx += "[廠商名稱]=(關鍵字)" + KeyWord.Trim() + " ";
                            break;
                        case 2:
                            x += "Type ='" + DDL_Select2.SelectedValue.ToString() + "' ";
                            xx += "[廠商類型]=" + DDL_Select2.SelectedValue.ToString() + " ";
                            break;
                        case 3:
                            x += "SupportItem like '%" + KeyWord1.Trim() + "%' ";
                            xx += "[廠商專長/供給材料]=(關鍵字)" + KeyWord1.Trim() + " ";

                            break;
                        case 4:
                            x += "Location ='" + DDL_Select4.SelectedValue.ToString() + "' ";
                            xx += "[所在縣市]=" + DDL_Select4.SelectedValue.ToString() + " ";
                            break;
                    }
                    SelectCondition[0] = i;
                }
            }

            xx += "之搜尋結果";

            if (SelectCondition[0] != 0)
            {
                SqlDataSource6.SelectCommand = x;
            }
            else
            {
                SqlDataSource6.SelectCommand = "select * from FirmM ";
            }


            GridView4.DataBind();


            #endregion
        }
        protected void BtnClear_Click(object sender, EventArgs e)
        {
            TxFirmName.Text = "";
            DDL_Select2.SelectedValue = "0";
            TxSpecialty.Text = "";
            DDL_Select4.SelectedValue = "0";

        }

        protected void BtnAll_Click(object sender, EventArgs e)
        {
            GridView4.DataBind();
        }
        //取得建入資料
        protected DataTable GetDataBox()
        {
            string ErrorString = "";
            string SQLString = "Name,EIN,Type,SupportItem,Owner,OwnerMobile,Capital,StaffAmount,Location,Tel1,Tel2,Fax1,Fax2,Email,ContectAddress,RegisteredAddress,Notes";
            DataTable DataTableBox = new DataTable();

            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }

         
            //後台功能，必需要有的欄位名稱               

            DataRow DataTableDr = DataTableBox.NewRow();

         
            string FirmName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TB_FirmName.Text));
            string SupportItem = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TB_SupportItem.Text));
            string EIN = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TB_No.Text));
            string Owner = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TB_Owner.Text));
            string OwnerMobile = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TB_OwnerMobile.Text));
            bool Capital = SystemSet.IsNumber(TB_Capital.Text);
            bool Staff = SystemSet.IsNumber(TB_Staff.Text);
            string Tel1 = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TB_Tel1.Text));
            string Tel2 = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TB_Tel2.Text));

            string Fax1 = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TB_Fax1.Text));
            string Fax2 = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TB_Fax2.Text));
            string Email = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TB_Email.Text));
            string Caddress = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TB_Caddress.Text));
            string Notes = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TB_Notes.Text));
            string RAddress = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TB_RAddress.Text));

            ErrorString += (FirmName) == "" ? "請輸入廠商名稱!!\\n" : "";
            ErrorString += (DDL_Select5.SelectedValue) == "0" ? "請輸入廠商類型!!\\n" : "";
            //ErrorString += (DDL_Select6.SelectedValue) == "0" ? "請輸入所在縣市!!\\n" : "";
            //ErrorString += (Capital) != true ? "請輸入數字!!\\n" : "";
            //ErrorString += (Staff) != true ? "請輸入數字!!\\n" : "";
            #region 內容設定
            if (ErrorString == "")
            {
              

                DataTableDr["Name"] = FirmName;
                DataTableDr["SupportItem"] = SupportItem;
                DataTableDr["EIN"] = EIN;
                DataTableDr["Type"] = DDL_Select5.SelectedValue;
                DataTableDr["Owner"] = Owner;
                DataTableDr["OwnerMobile"] = OwnerMobile;
                DataTableDr["Capital"] = TBE_Capital.Text != "" ? decimal.Parse(TBE_Capital.Text) : 0;
                DataTableDr["StaffAmount"] = TBE_Staff.Text != "" ? decimal.Parse(TBE_Staff.Text) : 0;
                DataTableDr["Location"] = DDL_Select6.SelectedValue;
                DataTableDr["Tel1"] = Tel1;
                DataTableDr["Tel2"] = Tel2;
                DataTableDr["Fax1"] = Fax1;
                DataTableDr["Fax2"] = Fax2;
                DataTableDr["Email"] = Email;
                DataTableDr["ContectAddress"] = Caddress;
                DataTableDr["RegisteredAddress"] = RAddress;
                DataTableDr["Notes"] = Notes;
                DataTableDr["Type"] = DDL_Select7.SelectedValue;
                DataTableDr["Location"] = DDL_Select8.SelectedValue;
                DataTableBox.Rows.Add(DataTableDr);
            #endregion

              
            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);
            }
            return DataTableBox;
        }
        protected void BtnAdd_Click(object sender, EventArgs e)
        {
         string database = Session["DatabaseName"].ToString();
         string Result = "";
         if (GetDataBox() != null && GetDataBox().Rows.Count > 0)
         {
             Result = WebModel.SaveAction(database, "FirmM", GetDataBox());

         }
         if (Result != "1")
         {
             Response.Write("<script>alert('存檔失敗');</script>");

         }
         else
         {
             TB_FirmName.Text = "";
             TB_SupportItem.Text = "";
             TB_No.Text = "";
             TB_Owner.Text = "";
             TB_OwnerMobile.Text = "";
             TB_Capital.Text = "";
             TB_Staff.Text = "";
             TB_Tel1.Text = "";
             TB_Tel2.Text = "";
             TB_Fax1.Text = "";
             TB_Fax2.Text = "";
             TB_Email.Text = "";
             TB_Caddress.Text = "";
             TB_Notes.Text = "";
             TB_RAddress.Text = "";
             DDL_Select5.SelectedValue = "0";
             DDL_Select6.SelectedValue = "0";
             Response.Write("<script>alert('存檔成功');</script>");
             LinkButton3_Click(this, null);
         }
         GridView4.DataBind();
        }

        protected void BtnClear_Click1(object sender, EventArgs e)
        {
            TB_FirmName.Text = "";
            TB_SupportItem.Text = "";
            TB_No.Text = "";
            TB_Owner.Text = "";
            TB_OwnerMobile.Text = "";
            TB_Capital.Text = "";
            TB_Staff.Text = "";
            TB_Tel1.Text = "";
            TB_Tel2.Text = "";
            TB_Fax1.Text = "";
            TB_Fax2.Text = "";
            TB_Email.Text = "";
            TB_Caddress.Text = "";
            TB_Notes.Text = "";
            TB_RAddress.Text = "";
            DDL_Select5.SelectedValue = "0";
            DDL_Select6.SelectedValue = "0";
        }

        protected void GridView4_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = 0;
            //if (Session["ID_class"] ==null)
            //{
             
                ID_class = Convert.ToInt32(e.CommandArgument);
                ID_class = ID_class % GridView4.PageSize;
            //}
            //else
            //{
            //    ID_class = int.Parse(Session["ID_class"].ToString());
                
            //}
            string database = Session["DatabaseName"].ToString();
           
            if (e.CommandName == "select")
            {
                Pnl_Edit.Visible = true;
                string UID = ((Label)GridView4.Rows[ID_class].FindControl("UID")).Text.Trim();
                Session["UID"] = UID;
                string SQLselect = "Select * from FirmM where UID=" + UID;
            
                DataTable Dtvs = WebModel.LoadSetContentData(database, SQLselect);
             
                if (Dtvs != null && Dtvs.Rows.Count > 0)
                {
                    foreach (DataRow row in Dtvs.Rows)
                    {
                        TBE_FirmName.Text = row["Name"].ToString();
                        TBE_SupportItem.Text = row["SupportItem"].ToString();
                        TBE_EIN.Text = row["EIN"].ToString();
                        TBE_Owner.Text = row["Owner"].ToString();
                        TBE_OwnerMobile.Text = row["OwnerMobile"].ToString();
                        TBE_Capital.Text = row["Capital"].ToString();
                        TBE_Staff.Text = row["StaffAmount"].ToString();
                        TBE_Tel1.Text = row["Tel1"].ToString();
                        TBE_Tel2.Text = row["Tel2"].ToString();
                        TBE_Fax1.Text = row["Fax1"].ToString();
                        TBE_Fax2.Text = row["Fax2"].ToString();
                        TBE_Email.Text = row["Email"].ToString();
                        TBE_CAddress.Text = row["ContectAddress"].ToString();
                        TBE_Notes.Text = row["Notes"].ToString();
                        TBE_RAddress.Text = row["RegisteredAddress"].ToString();
                        DDL_Select8.DataBind();
                        DDL_Select7.DataBind();
                        DDL_Select7.SelectedValue = row["Type"].ToString();
                        DDL_Select8.SelectedValue = row["Location"].ToString();
                        UID1.Text = row["UID"].ToString();
                    }
                }


                }
        }
        //取得建入資料
        protected DataTable GetDataBox1()
        {
            string ErrorString = "";
            string SQLString = "Name,EIN,Type,SupportItem,Owner,OwnerMobile,Capital,StaffAmount,Location,Tel1,Tel2,Fax1,Fax2,Email,ContectAddress,RegisteredAddress,Notes";
            DataTable DataTableBox = new DataTable();

            foreach (string DataName in SQLString.Split(','))
            {
                DataTableBox.Columns.Add(DataName, typeof(string));
            }


            //後台功能，必需要有的欄位名稱               

            DataRow DataTableDr = DataTableBox.NewRow();


            string FirmName = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TBE_FirmName.Text));
            string SupportItem = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TBE_SupportItem.Text));
            string EIN = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TBE_EIN.Text));
            string Owner = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TBE_Owner.Text));
            string OwnerMobile = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TBE_OwnerMobile.Text));
            bool Capital = SystemSet.Float(TBE_Capital.Text);
            bool Staff = SystemSet.IsNumber(TBE_Staff.Text);
            string Tel1 = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TBE_Tel1.Text));
            string Tel2 = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TBE_Tel2.Text));

            string Fax1 = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TBE_Fax1.Text));
            string Fax2 = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TBE_Fax2.Text));
            string Email = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TBE_Email.Text));
            string Caddress = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TBE_CAddress.Text));
            string Notes = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TBE_Notes.Text));
            string RAddress = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TBE_RAddress.Text));

            ErrorString += (DDL_Select7.SelectedValue) == "0" ? "請輸入廠商類型!!\\n" : "";
            ErrorString += (DDL_Select8.SelectedValue) == "0" ? "請輸入所在縣市!!\\n" : "";
            ErrorString += (Capital) != true ? "請輸入數字!!\\n" : "";
            ErrorString += (Staff) != true ? "請輸入數字!!\\n" : "";
            #region 內容設定
            if (ErrorString == "")
            {
                DataTableDr["Name"] = FirmName;
                DataTableDr["SupportItem"] = SupportItem;
                DataTableDr["EIN"] = EIN;
                DataTableDr["Type"] = DDL_Select5.SelectedValue;
                DataTableDr["Owner"] = Owner;
                DataTableDr["OwnerMobile"] = OwnerMobile;
                DataTableDr["Capital"] = TBE_Capital.Text != "" ? decimal.Parse(TBE_Capital.Text) : 0;
                DataTableDr["StaffAmount"] = TBE_Staff.Text != "" ? decimal.Parse(TBE_Staff.Text) : 0;
                DataTableDr["Location"] = DDL_Select6.SelectedValue;
                DataTableDr["Tel1"] = Tel1;
                DataTableDr["Tel2"] = Tel2;
                DataTableDr["Fax1"] = Fax1;
                DataTableDr["Fax2"] = Fax2;
                DataTableDr["Email"] = Email;
                DataTableDr["ContectAddress"] = Caddress;
                DataTableDr["RegisteredAddress"] = RAddress;
                DataTableDr["Notes"] = Notes;
                DataTableDr["Type"] = DDL_Select7.SelectedValue;
                DataTableDr["Location"] = DDL_Select8.SelectedValue;
                DataTableBox.Rows.Add(DataTableDr);
            #endregion


            }
            else
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('" + ErrorString + "');", true);
            }
            return DataTableBox;
        }
        protected void BtnSaveEdit_Click(object sender, EventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            bool Result = WebModel.EditAction_Anyid(database, "FirmM", UID1.Text,"UID", GetDataBox1());
            if (Result)
            {
                Response.Write("<script>alert('存檔成功');</script>");

            }
            else
            {
                Response.Write("<script>alert('存檔失敗');</script>");

            }
            GridView4.DataBind();
        }

        protected void BtnReEdit_Click(object sender, EventArgs e)
        {
            Pnl_Edit.Visible = true;
            string database = Session["DatabaseName"].ToString();
            if (Session["UID"] !=null)
            {
            string SQLselect = "Select * from FirmM where UID=" + Session["UID"].ToString();

            DataTable Dtvs = WebModel.LoadSetContentData(database, SQLselect);

            if (Dtvs != null && Dtvs.Rows.Count > 0)
            {
                foreach (DataRow row in Dtvs.Rows)
                {
                    TBE_FirmName.Text = row["Name"].ToString();
                    TBE_SupportItem.Text = row["SupportItem"].ToString();
                    TBE_EIN.Text = row["EIN"].ToString();
                    TBE_Owner.Text = row["Owner"].ToString();
                    TBE_OwnerMobile.Text = row["OwnerMobile"].ToString();
                    TBE_Capital.Text = row["Capital"].ToString();
                    TBE_Staff.Text = row["StaffAmount"].ToString();
                    TBE_Tel1.Text = row["Tel1"].ToString();
                    TBE_Tel2.Text = row["Tel2"].ToString();
                    TBE_Fax1.Text = row["Fax1"].ToString();
                    TBE_Fax2.Text = row["Fax2"].ToString();
                    TBE_Email.Text = row["Email"].ToString();
                    TBE_CAddress.Text = row["ContectAddress"].ToString();
                    TBE_Notes.Text = row["Notes"].ToString();
                    TBE_RAddress.Text = row["RegisteredAddress"].ToString();
                    DDL_Select8.DataBind();
                    DDL_Select7.DataBind();
                    DDL_Select7.SelectedValue = row["Type"].ToString();
                    DDL_Select8.SelectedValue = row["Location"].ToString();
                    UID1.Text = row["UID"].ToString();
                }
            }
            }
        }
    }
}