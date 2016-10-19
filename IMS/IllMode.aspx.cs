using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class IllMode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }

            if (Session["ProjectCode"] == null)
            {
                Response.Write("<script>alert('請先選擇專案');location.href='Main.aspx';</script>");
                //Response.Redirect("Main.aspx");
            }
            else
            {
                bool check = Utility.Access_check.check_project_access_by_Session(Session["LoginAccess"].ToString(), Request.FilePath.Substring(1), Session["ProjectCode"].ToString());
                if (!check)
                {
                    Response.Write("<script>alert('您的權限不足');location.href='UsualMode.aspx';</script>");
                }
                DocNameSelect.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                DocNameSelect.SelectCommand = "SELECT * FROM IllustratedDoc Where ProjectID='" + Session["ProjectCode"].ToString() + "'";
                //DDL_DocName.DataBind();
                Sql_Query.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                Sql_Query.SelectCommand = "SELECT * FROM IllustratedDoc Where ProjectID='" + Session["ProjectCode"].ToString() + "'";
                //Gv_Query.DataBind();
                Sql_Update.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                Sql_Update.SelectCommand = "SELECT * FROM [IllustratedDoc] Where ProjectID='" + Session["ProjectCode"].ToString() + "' and TheNewest=1";
                //Gv_Update.DataBind();
            }
        }

        protected void Btn_upload_Click(object sender, EventArgs e)
        {
            String savepath = DAL.IllMode.savePath(Session["DatabaseName"].ToString());
            string ProjectCode = Session["ProjectCode"].ToString();

            if (FileUpload1.HasFile)
            {
                String fileName = FileUpload1.FileName;

                int file_id = DAL.IllMode.Insert_IllDoc(Session["DatabaseName"].ToString(), TB_PCCNumber.Text, TB_DocNumber.Text, TB_DocName.Text, fileName, "", ProjectCode, TB_Type.Text, TB_Related.Text, TB_Remark.Text, Session["UserName"].ToString());

                fileName = file_id.ToString() + "_" + fileName;

                savepath += fileName;

                FileUpload1.SaveAs(savepath);

                bool secondstate = DAL.IllMode.UpdateNewDocName_IllDoc(Session["DatabaseName"].ToString(), file_id, fileName);

                if (secondstate)
                {
                    Response.Write("<script>alert('圖說" + TB_DocName.Text + "已上傳');</script>");
                }
                else
                {
                    Response.Write("<script>alert('圖說" + TB_DocName.Text + "已上傳，資料庫更新失敗');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('圖說" + TB_DocName.Text + "上傳失敗');</script>");
            }
        }

        protected void Btn_Add_Related_Click(object sender, EventArgs e)
        {
            if (TB_Related.Text.Length > 0)
            {
                TB_Related.Text += "," + DDL_DocName.SelectedValue.ToString();
                TB_RelatedDoc.Text += "," + DDL_DocName.SelectedItem.Text;
            }
            else
            {
                TB_Related.Text += DDL_DocName.SelectedValue.ToString();
                TB_RelatedDoc.Text += DDL_DocName.SelectedItem.Text;
            }
        }

        protected void Btn_Query_Click(object sender, EventArgs e)
        {
            string select_option = " and IllustratedDocName like '%" + TB_Query_DocName.Text + "%' and IllustratedDocNumber like '%" + TB_Query_DocNumber.Text + "%' and PCCNumber like '%" + TB_Query_PCCNumber.Text + "%'";
            Sql_Query.SelectCommand += select_option;
            Gv_Query.DataBind();
        }

        public string Show_Username_by_UID(object sender)
        {
            int oo = Convert.ToInt32(sender);
            string username = DAL.IllMode.Get_Username_by_UserID(oo);
            return username;
        }

        protected void Btn_Clear_Related_Click(object sender, EventArgs e)
        {
            TB_Related.Text = "";
            TB_RelatedDoc.Text = "";
        }

        public string Show_IllustratedDocName_by_IID(object sender)
        {
            string oo = Convert.ToString(sender);
            string[] allIID = oo.Split(',');
            string allName = "";
            if (allIID[0] == "")
            {
                return allName;
            }
            else
            {
                for (int i = 0; i < allIID.Length; i++)
                {
                    allName += DAL.IllMode.Get_IllustratedDocName_by_IllustratedDocID(Session["DatabaseName"].ToString(), int.Parse(allIID[i])) + "<br>";
                }
            }
            return allName;
        }

        public string ShowTB_IllustratedDocName_by_IID(object sender)
        {
            string oo = Convert.ToString(sender);
            string[] allIID = oo.Split(',');
            string allName = "";
            if (allIID[0] == "")
            {
                return allName;
            }
            else
            {
                for (int i = 0; i < allIID.Length; i++)
                {
                    allName += DAL.IllMode.Get_IllustratedDocName_by_IllustratedDocID(Session["DatabaseName"].ToString(), int.Parse(allIID[i])) + "\n";
                }
            }
            return allName;
        }

        protected void Gv_Update_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //int ID_class = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "FileUpdate")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow GVR = Gv_Update.Rows[index];
                FileUpload FU = (FileUpload)GVR.FindControl("Fu_UpdateFile");
                TextBox TB_UR = (TextBox)GVR.FindControl("TB_UpdateRemark");
                int NowID = (int)Gv_Update.DataKeys[index].Value;
                bool result = DAL.IllMode.Update_IllDoc_Status(Session["DatabaseName"].ToString(), NowID);
                string[] OldInformation = DAL.IllMode.Get_OldInformation_by_IllustratedDocID(Session["DatabaseName"].ToString(), NowID);

                String savepath = DAL.IllMode.savePath(Session["DatabaseName"].ToString());
                string ProjectCode = Session["ProjectCode"].ToString();

                if (FU.HasFile)
                {
                    String fileName = OldInformation[0];

                    int file_id = DAL.IllMode.Update_IllDoc(Session["DatabaseName"].ToString(), OldInformation[3], OldInformation[2], OldInformation[1], fileName, "", ProjectCode, OldInformation[5], OldInformation[6], TB_UR.Text, Session["UserName"].ToString(), int.Parse(OldInformation[7]), int.Parse(OldInformation[4]));

                    fileName = file_id.ToString() + "_" + fileName;

                    savepath += fileName;

                    FU.SaveAs(savepath);

                    bool secondstate = DAL.IllMode.UpdateNewDocName_IllDoc(Session["DatabaseName"].ToString(), file_id, fileName);

                    if (secondstate)
                    {
                        Response.Write("<script>alert('圖說" + TB_DocName.Text + "已上傳');</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('圖說" + TB_DocName.Text + "已上傳，資料庫更新失敗');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('圖說" + TB_DocName.Text + "上傳失敗');</script>");
                }
            }

            if (e.CommandName == "Clear")
            {
                int index = Convert.ToInt32(e.CommandArgument); 
                GridViewRow GVR = Gv_Update.Rows[index];
                TextBox TB_RelatedDoc = (TextBox)GVR.FindControl("TB_RelatedDoc");
                TextBox TB_RelatedDocID = (TextBox)GVR.FindControl("TB_RelatedDocID");
                TB_RelatedDoc.Text = "";
                TB_RelatedDocID.Text = "";
            }
            else if (e.CommandName == "Add_RelatedDoc")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow GVR = Gv_Update.Rows[index];
                DropDownList DDL_RelatedDoc = (DropDownList)GVR.FindControl("DDL_RelatedDoc");
                TextBox TB_RelatedDoc = (TextBox)GVR.FindControl("TB_RelatedDoc");
                TextBox TB_RelatedDocID = (TextBox)GVR.FindControl("TB_RelatedDocID");
                if (TB_RelatedDocID.Text.Length > 0)
                {
                    TB_RelatedDocID.Text += "," + DDL_RelatedDoc.SelectedValue.ToString();
                    TB_RelatedDoc.Text += "," + DDL_RelatedDoc.SelectedItem.Text;
                }
                else
                {
                    TB_RelatedDocID.Text += DDL_RelatedDoc.SelectedValue.ToString();
                    TB_RelatedDoc.Text += DDL_RelatedDoc.SelectedItem.Text;
                }
            }
        }

        protected void Gv_Update_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Gv_Update.Columns[8].Visible = true;
        }

        protected void Gv_Query_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            index = index % Gv_Query.PageSize;
            int NowKey = (int)Gv_Query.DataKeys[index].Value;
            if (e.CommandName == "Download")
            {
                Response.Redirect("Download.ashx?file=" + NowKey.ToString() + "&function=IllMode" + "&Company=" + Session["DatabaseName"].ToString());
            }
        }

        protected void Gv_Update_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            Gv_Update.Columns[8].Visible = false;
        }

    }
}