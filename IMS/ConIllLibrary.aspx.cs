using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using DAL;

namespace IMS
{
    public partial class ConIllLibrary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            Sql_Query.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            Sql_Manage.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            if (!IsPostBack)
            {
                RBL_Query_SelectedIndexChanged(null, null);
                Session["Image"] = null;
                List_Show();
            }
            //img.ImageUrl = "showImage.ashx";
            else
            {
                if (FileUpload2.HasFile)
                {
                    Session["FileUpload1"] = FileUpload2;
                    Lbfilename.Text = "檔名："+FileUpload2.FileName;
                }
                else if (Session["FileUpload1"] != null)
                {
                    FileUpload2 = (FileUpload)Session["FileUpload1"];
                    Lbfilename.Text = "檔名："+FileUpload2.FileName;
                }
                            

            }
          
        }

        protected void Btn_Upload_file_Click(object sender, EventArgs e)
        {
            String savepath = DAL.ConIllLibrary.savePath(Session["DatabaseName"].ToString());
            String savepath1 = DAL.ConIllLibrary.savePath(Session["DatabaseName"].ToString());
            Boolean FileOK = false;
            if (FileUpload2.FileName.Length > 0)
            {
                string fileExtension = System.IO.Path.GetExtension(FileUpload2.FileName).ToLower(); //如果副檔名有大寫則將他轉為小寫
                string[] allowExtensions = { ".gif", ".png", ".jpeg", ".jpg" }; //允許的檔案類型
                for (int i = 0; i < allowExtensions.Length; i++)
                {
                    if (fileExtension == allowExtensions[i])
                    {
                        FileOK = true;
                        break;
                    }
                }
            }
            if (FileUpload1.HasFile && FileOK)
            {
                String fileName = FileUpload1.FileName;
                String fileName1 = FileUpload2.FileName;
                int file_id = DAL.ConIllLibrary.Insert_ConIllLibrary(Session["DatabaseName"].ToString(), fileName, TB_Name.Text, Session["UserName"].ToString(), TB_Remark.Text, TB_Type.Text, fileName1);

                fileName = file_id.ToString() + "_" + fileName;
                fileName1 = file_id.ToString() + "_" + fileName1;

                savepath += fileName;
                savepath1 += fileName1;
                FileUpload1.SaveAs(savepath);
                FileUpload2.SaveAs(savepath1);
                Response.Write("<script>alert('元件" + TB_Name.Text + "已上傳. 圖檔預覽元件" + TB_Name.Text + "已上傳');</script>");
            }
            //if (FileOK)
            //{
            //    String fileName = FileUpload2.FileName;
            //    String savepath1 = DAL.ConIllLibrary.savePath(Session["DatabaseName"].ToString());
            //    int file_id = DAL.ConIllLibrary.Insert_ConIllLibrary(Session["DatabaseName"].ToString(), fileName, TB_Name.Text, Session["UserName"].ToString(), TB_Remark.Text, TB_Type.Text);

            //  string fileName1 = file_id.ToString() + "_" + fileName;

            //    savepath1 += fileName1;

            //    FileUpload2.SaveAs(savepath1);

            //    Response.Write("<script>alert('圖檔預覽元件" + TB_Name.Text + "已上傳');</script>");
            //}
            else
            {

                Response.Write("<script>alert('圖檔預覽元件需為圖檔格式 (gif, png, jpeg,jpg)');</script>");

            }
            TB_Name.Text = "";
            TB_Type.Text = "";
            TB_Remark.Text = "";
            Lbfilename.Text = "";
        }
       
        protected void Btn_Query_Click(object sender, EventArgs e)
        {
            if (RBL_Query.SelectedValue == "0")
            {
                Sql_Query.SelectCommand = "SELECT * FROM [ConstructionElement] WHERE ";
            }
            else if (RBL_Query.SelectedValue == "1")
            {
                Sql_Query.SelectCommand = "SELECT * FROM [ConstructionElement] WHERE TheNewest = 1 and ";
            }
            string select_option = "ElementName like '%" + TB_Query_Name.Text + "%' and Type like '%" + TB_Query_Type.Text + "%' and Remark like '%" + TB_Query_Remark.Text + "%'";
            Sql_Query.SelectCommand += select_option;
            Gv_Query.DataBind();
        }

        public string Show_Username_by_UID(object sender)
        {
          
            int oo = Convert.ToInt32(sender);
            string username = DAL.IllMode.Get_Username_by_UserID(oo);
            return username;
          
        }

        protected void Gv_Query_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            index = index % Gv_Query.PageSize;
            Boolean FileOK = false;
            string Savepath = @"/UploadFile/" + Session["DatabaseName"].ToString() + "/ConstructionLibrary/";
           
            if (e.CommandName == "Download")
            {
                int NowKey = (int)Gv_Query.DataKeys[index].Value;
                string database = Session["DatabaseName"].ToString();
                string SQLSelect="Select * from ConstructionElement where ElementID="+NowKey;
                string Publicid = WebModel.SItemName(database, SQLSelect, "PublicID");
                if (Publicid == "")
                {
                    Response.Redirect("Download.ashx?file=" + NowKey.ToString() + "&function=ConIllLibrary" + "&Company=" + Session["DatabaseName"].ToString());
                }
                else
                {
                    Response.Redirect("Download.ashx?file=" + Publicid + "&function=ConIllLibrary" + "&Company=" + "PublicDB");

                }
            }
           
            if (e.CommandName == "pview")
            {
                string path = Server.MapPath(".");
                int NowKey = (int)Gv_Query.DataKeys[index].Value;
                Label LbImgName = (Label)Gv_Query.Rows[index].FindControl("LbImgName");
                string fileExtension = System.IO.Path.GetExtension(LbImgName.Text).ToLower(); //如果副檔名有大寫則將他轉為小寫
                    string[] allowExtensions = { ".gif", ".png", ".jpeg", ".jpg" }; //允許的檔案類型
                    for (int i = 0; i < allowExtensions.Length; i++)
                    {
                        if (fileExtension == allowExtensions[i])
                        {
                            FileOK = true;
                            break;
                        }
                    }
                    if (FileOK)
                    {
                        //String savepath = DAL.ConIllLibrary.savePath(Session["DatabaseName"].ToString());

                        Savepath += NowKey.ToString() + "_" + LbImgName.Text;
                        path +="/UploadFile/" + Session["DatabaseName"].ToString() + "/ConstructionLibrary/"+ NowKey.ToString() + "_" + LbImgName.Text;
                        if (File.Exists(path))
                        {
                            PreImage.ImageUrl = Savepath;
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('元件無圖檔，無法預覽!!');</script>");

                    }
            }
        }

        protected void Gv_Manage_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            index = index % Gv_Manage.PageSize;
            int NowKey = (int)Gv_Manage.DataKeys[index].Value;
            if (e.CommandName == "UpdateFile")
            {
                GridViewRow GVR = Gv_Manage.Rows[index];
                FileUpload FU = (FileUpload)GVR.FindControl("FU");
                TextBox TB_UR = (TextBox)GVR.FindControl("TB_UpdateRemark");
                String savepath = DAL.ConIllLibrary.savePath(Session["DatabaseName"].ToString());
                bool result = DAL.ConIllLibrary.Update_ConIllLibrary_Status(Session["DatabaseName"].ToString(), NowKey);
                string[] information = DAL.ConIllLibrary.Get_OldInformation_by_Insert_ConIllLibraryID(Session["DatabaseName"].ToString(), NowKey);

                int UID = DAL.ConIllLibrary.Update_ConIllLibrary(Session["DatabaseName"].ToString(), Session["UserName"].ToString(), information[0], information[2], int.Parse(information[3]), int.Parse(information[1]), information[4], TB_UR.Text);
                string fileName = "";
                if (UID > 0)
                {
                    fileName = UID.ToString() + "_" + information[0];

                    savepath += fileName;

                    FU.SaveAs(savepath);

                    Response.Write("<script>alert('元件" + information[2] + "已更新');</script>");
                    
                }
                else
                {
                    Response.Write("<script>alert('元件" + information[2] + "更新失敗');</script>");
                }
                Gv_Manage.DataBind();
            }
            if (e.CommandName == "Delete")
            {
                //int NowKey = (int)Gv_Query.DataKeys[index].Value;
                Sql_Manage.DeleteCommand = "Delete ConstructionElement WHERE [ElementID] = " + NowKey;
                Gv_Manage.DataBind();
            }
        }

        protected void RBL_Query_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RBL_Query.SelectedValue == "0")
            {
                Sql_Query.SelectCommand = "SELECT * FROM [ConstructionElement]";
            }
            else if (RBL_Query.SelectedValue == "1")
            {
                Sql_Query.SelectCommand = "SELECT * FROM [ConstructionElement] WHERE TheNewest = 1";
            }
            Gv_Query.DataBind();
        }     

        protected void Preview_Click(object sender, EventArgs e)
        {
            Session["Image"] = FileUpload2.PostedFile;
           
            if (FileUpload2.HasFile && FileUpload2.FileName != null)
            {
                FileUpload2.Attributes["filename"] = FileUpload2.FileName;
                Lbfilename.Text ="檔名："+ FileUpload2.FileName;
            }
            HttpPostedFile myFile = FileUpload2.PostedFile;

            Session["myFile"] = myFile;

            // Set ImageUrl
            img.ImageUrl = "showImage.ashx";
        }
        public void List_Show()
        {
            LB_Private.Items.Clear();
            LB_Public.Items.Clear();
            int user_count = 0;


            string[] Public = DAL.ConIllLibrary.Get_Public_Resource(Utility.DBconnection.connect_string("PublicDB"));

            string[] ID = Public[0].Split('|');
            string[] FileName = Public[1].Split('|');
            string[] Name = Public[2].Split('|');
            string[] Version = Public[3].Split('|');
            //string[] UploadDatetime = Public[4].Split('|');
            //string[] UploadPerson = Public[5].Split('|');
            string[] ReferenceID = Public[6].Split('|');
            string[] TheNewest = Public[7].Split('|');
            string[] Remark = Public[8].Split('|');
            string[] Type = Public[9].Split('|');

            string[] Private = DAL.ConIllLibrary.Get_Private_Resource(Utility.DBconnection.connect_string(Session["DatabaseName"].ToString()));
            string[] ID1 = Public[0].Split('|');
            string[] FileName1 = Public[1].Split('|');
            string[] Name1 = Public[2].Split('|');
            string[] Version1 = Public[3].Split('|');
            string[] UploadDatetime1 = Public[4].Split('|');
            string[] UploadPerson1 = Public[5].Split('|');
            string[] ReferenceID1 = Public[6].Split('|');
            string[] TheNewest1 = Public[7].Split('|');
            string[] Remark1 = Public[8].Split('|');
            string[] Type1 = Public[9].Split('|');
            string[] PublicId =Private[10]!=null? Private[10].Split('|'):null;
            foreach (string item in Name)
            {
                bool flag = false;
                ListItem LI = new ListItem();
                LI.Text = Type[user_count].ToString() + "-" + item;
                LI.Value = ID[user_count].ToString() + " | " + FileName[user_count].ToString() + " | " + Version[user_count].ToString() + " | " + Remark[user_count].ToString() + " | " + ReferenceID[user_count].ToString();
                //使用for迴圈撈出陣列值
                if(PublicId!=null)
                for (int id = 0; id < PublicId.Length; id++)
                {

                    if (PublicId[id] != "")
                    {
                        int nowPublicId = (int.Parse(PublicId[id])).ToString() != "" ? int.Parse(PublicId[id]) : 0; ;
                        ID[user_count] = ID[user_count] != "" ? ID[user_count] : "0";
                        if (nowPublicId == int.Parse(ID[user_count]))
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
                string lid = LI.Value.Split('|')[0];

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
            bool result = false;
            int UID = DAL.SystemManage.Get_UserID_by_UserName(Session["UserName"].ToString());
            for (int i = Mv_times - 1; i >= 0; i--)
            {

                ListItem LI = new ListItem();
                LI.Text = LB_Private.Items[i].Text;
                LI.Value = LB_Private.Items[i].Value;
                string Type = LI.Text.Split('-')[0];
                string ElementName = LI.Text.Split('-')[1];
                string ID = LI.Value.Split('|')[0];
                string ElementFileName = LI.Value.Split('|')[1];
                string Version = LI.Value.Split('|')[2];
                string Remark = LI.Value.Split('|')[3];
                string ReferenceID = LI.Value.Split('|')[4];
                if (DAL.ConIllLibrary.checkPublicID(database, ID))
                {
                    string Insert = "insert into [ConstructionElement] ([ElementFileName],[ElementName],[ElementVersion],[UploadDatetime],[UploadPerson],[ReferenceID],[TheNewest],[Remark],[Type],[PublicID]) VALUES('" + ElementFileName + "','" + ElementName + "','" + Version + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "','" + UID + "','" + ReferenceID + "','" + true + "','" + Remark + "','" + Type + "','" + ID + "')";
                    result = WebModel.SQLAction(Session["DatabaseName"].ToString(), Insert);
                    
                }


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
          
            string keyword = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TextBox1.Text));

            string[] Public = DAL.ConIllLibrary.Get_Public_Resource(Utility.DBconnection.connect_string("PublicDB"));
            if (Public[0] != null)
            {
                string[] ID = Public[0].Split('|');
                string[] FileName = Public[1].Split('|');
                string[] Name = Public[2].Split('|');
                string[] Version = Public[3].Split('|');
                //string[] UploadDatetime = Public[4].Split('|');
                //string[] UploadPerson = Public[5].Split('|');
                string[] ReferenceID = Public[6].Split('|');
                string[] TheNewest = Public[7].Split('|');
                string[] Remark = Public[8].Split('|');
                string[] Type = Public[9].Split('|');

                string[] Private = DAL.ConIllLibrary.Get_PrivateResource_Search(Utility.DBconnection.connect_string(Session["DatabaseName"].ToString()), keyword);
                string[] ID1 = Public[0].Split('|');
                string[] FileName1 = Public[1].Split('|');
                string[] Name1 = Public[2].Split('|');
                string[] Version1 = Public[3].Split('|');
                string[] UploadDatetime1 = Public[4].Split('|');
                string[] UploadPerson1 = Public[5].Split('|');
                string[] ReferenceID1 = Public[6].Split('|');
                string[] TheNewest1 = Public[7].Split('|');
                string[] Remark1 = Public[8].Split('|');
                string[] Type1 = Public[9].Split('|');
                string[] PublicId = Private[10].Split('|');

                foreach (string item in Name)
                {
                    bool flag = false;
                    ListItem LI = new ListItem();
                    LI.Text = Type[user_count].ToString() + "-" + item;
                    LI.Value = ID[user_count].ToString() + " | " + FileName[user_count].ToString() + " | " + Version[user_count].ToString() + " | " + Remark[user_count].ToString() + " | " + Remark[user_count].ToString();
                    //使用for迴圈撈出陣列值
                    for (int id = 0; id < PublicId.Length; id++)
                    {

                        if (PublicId[id] != "")
                        {
                            int nowPublicId = (int.Parse(PublicId[id])).ToString() != "" ? int.Parse(PublicId[id]) : 0; ;
                            ID[user_count] = ID[user_count] != "" ? ID[user_count] : "0";
                            if (nowPublicId == int.Parse(ID[user_count]))
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

            string keyword = SystemSet.CheckMSSQLLike(SystemSet.ReplaceBlank(TextBox2.Text));

            string[] Public = DAL.ConIllLibrary.Get_PublicResource_Search(Utility.DBconnection.connect_string("PublicDB"), keyword);
            //string[] Public1 = DAL.PriceAnalysis.Get_Public_Resource(Utility.DBconnection.connect_string("PublicDB"));
            string[] Private = DAL.ConIllLibrary.Get_Private_Resource(Utility.DBconnection.connect_string(Session["DatabaseName"].ToString()));
            string[] PublicId = Private[10].Split('|');
            if (Private[0] != null)
            {
                string[] ID1 = Private[0].Split('|');
                string[] FileName1 = Private[1].Split('|');
                string[] Name1 = Private[2].Split('|');
                string[] Version1 = Private[3].Split('|');
                string[] UploadDatetime1 = Private[4].Split('|');
                string[] UploadPerson1 = Private[5].Split('|');
                string[] ReferenceID1 = Private[6].Split('|');
                string[] TheNewest1 = Private[7].Split('|');
                string[] Remark1 = Private[8].Split('|');
                string[] Type1 = Private[9].Split('|');
                string[] PublicId1 = Private[10].Split('|');




                //使用for迴圈撈出陣列值
                for (int id = 0; id < ID1.Length; id++)
                {
                    ListItem LI1 = new ListItem();
                    LI1.Text = Type1[id].ToString() + "-" + Name1[id].ToString();
                    LI1.Value = ID1[user_count].ToString() + " | " + FileName1[user_count].ToString() + " | " + Version1[user_count].ToString() + " | " + Remark1[user_count].ToString() + " | " + Remark1[user_count].ToString();
                   
                    if (PublicId1[id] != "0" && PublicId1[id] != "")
                    {


                        LB_Private.Items.Add(LI1);
                        //LB_Private.Items.Add(new ListItem(LI1.Text, LI1.Value));
                    }

                }


            }
            if (Public[0] != null)
            {
                string[] ID = Public[0].Split('|');
                string[] FileName = Public[1].Split('|');
                string[] Name = Public[2].Split('|');
                string[] Version = Public[3].Split('|');
                //string[] UploadDatetime = Public[4].Split('|');
                //string[] UploadPerson = Public[5].Split('|');
                string[] ReferenceID = Public[6].Split('|');
                string[] TheNewest = Public[7].Split('|');
                string[] Remark = Public[8].Split('|');
                string[] Type = Public[9].Split('|');
                user_count = 0;


                foreach (string item in Name)
                {
                    bool flag = false;

                    ListItem LI = new ListItem();
                    LI.Text = Type[user_count].ToString() + "-" + item;
                    LI.Value = ID[user_count].ToString() + " | " + FileName[user_count].ToString() + " | " + Version[user_count].ToString() + " | " + Remark[user_count].ToString() + " | " + Remark[user_count].ToString();
                    //使用for迴圈撈出陣列值
                    for (int id = 0; id < PublicId.Length; id++)
                    {

                        if (PublicId[id] != "")
                        {
                            int nowPublicId = (int.Parse(PublicId[id])).ToString() != "" ? int.Parse(PublicId[id]) : 0; ;
                            ID[user_count] = ID[user_count] != "" ? ID[user_count] : "0";
                            if (int.Parse(ID[user_count]) == nowPublicId)
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

                }

            }
            else
            {
                Response.Write("<script>alert('無此項目');</script>");

            }


        }
    }
}