using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CriticalPathMethod;

namespace IMS
{
    public partial class ProgressMode1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }

            //bool check = Utility.Access_check.check_project_access_by_Session(Session["LoginAccess"].ToString(), Request.FilePath.Substring(1), Session["ProjectCode"].ToString());
            bool check = true;
            string QS = Request.QueryString["fun"];
            if (QS == null)
            {
                QS = "edit";
            }
            if (QS == "edit")
            {
                Btn_Save.Visible = true;
                Btn_Newversion.Visible = false;
            }
            else if (QS == "new")
            {
                Btn_Save.Visible = false;
                Btn_Newversion.Visible = true;
            }
            else
            {
                Btn_Save.Visible = false;
                Btn_Newversion.Visible = false;
            }
            Sql_version.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            Sql_version.SelectCommand = "select distinct Version From Progress_WIINF";
            //DDL_version.SelectedIndex = 0;
            int now_version = 1;
            int.TryParse(DDL_version.SelectedValue, out now_version);
            if (now_version < 1)
                now_version = 1;
            if (!check)
            {
                Response.Write("<script>alert('尚未選擇專案或是您的權限不足');location.href='Main.aspx';</script>");
            }
            else
            {
                string[] WItemp = DAL.ProgressMode.Get_WBS_ItemInformation(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString());
                if ((Session["Activities"] == null) & (DAL.ProgressMode.Get_Result_Number_New(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), now_version) == 0))
                {
                    Btn_Clear.Enabled = false;
                }
                else
                {
                    make_table_with_data();
                    //int ResultNum = DAL.ProgressMode.Get_Result_Number_New(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), now_version);
                    //int RealNum = ResultNum;
                    //if (Session["Activities"] == null)
                    //{
                    //    TB_Activity.Text = ResultNum.ToString();
                    //    Session["Activities"] = TB_Activity.Text;
                    //}
                    //else
                    //{
                    //    //TB_Activity.Text = Session["Activities"].ToString();
                    //    if (TB_Activity.Text != "")
                    //    {
                    //        Session["Activities"] = TB_Activity.Text;
                    //        int.TryParse(TB_Activity.Text, out ResultNum);
                    //        //ResultNum = int.Parse(Session["Activities"].ToString());
                    //    }
                    //    if (now_version<0)
                    //        ResultNum = int.Parse(Session["Activities"].ToString());
                    //}
                    //if (ResultNum > 0)
                    //{
                    //    Btn_Clear.Enabled = true;
                    //    // get data
                    //    string[] result = new string[11];

                    //    bool status = DAL.ProgressMode.Get_Progress_Data(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), out result, now_version);
                    //    string[] ActivitiesName = result[3].Split(',');
                    //    string[] Duration = result[4].Split(',');
                    //    string[] WBSID = result[0].Split(',');
                    //    string[] PreworkIDs = result[5].Split(';');
                    //    string[] PP = result[11].Split(',');
                    //    Tbl_Input.Rows.Clear();
                    //    for (int i = 0; i < ResultNum; i++)
                    //    {
                    //        if (i < RealNum)
                    //        {
                    //            Make_row(i, ActivitiesName[i], int.Parse(Duration[i]), int.Parse(WBSID[i]), PreworkIDs[i], WItemp[0].Split('?'), WItemp[1].Split(','), double.Parse(PP[i]));
                    //        }
                    //        else
                    //        {
                    //            Make_row(i, "", 0, -1, "", WItemp[0].Split('?'), WItemp[1].Split(','), 0.0);
                    //        }
                    //    }
                    //}
                    //else
                    //{
                    //    Btn_Clear.Enabled = false;
                    //    if (Session["Activities"].ToString() == "")
                    //    {

                    //    }
                    //    else
                    //    {
                    //        Btn_Clear.Enabled = true;
                    //        TB_Activity.Text = Session["Activities"].ToString();
                    //        int num = int.Parse(Session["Activities"].ToString());
                    //        for (int i = 0; i < num; i++)
                    //        {
                    //            Make_row(i, "", 0, -1, "", WItemp[0].Split('?'), WItemp[1].Split(','), 0);
                    //        }

                    //    }
                    //}

                }

            }
            if (DAL.ProgressMode.Check_Lock_By_ProjectID_Version(Session["DatabaseName"].ToString(), int.Parse(Session["ProjectCode"].ToString()), now_version))
            {
                Btn_Save.Enabled = false;
                //Btn_Newversion.Enabled = false;
                //Btn_Lock.Enabled = false;
            }
            else
            {
                Btn_Save.Enabled = true;
                Btn_Newversion.Enabled = true;
                //Btn_Lock.Enabled = true;
            }
        }

        protected void make_tableheader()
        {
            TableHeaderRow THR = new TableHeaderRow();
            TableHeaderCell THC1 = new TableHeaderCell();
            THC1.Text = "作業編號";
            THC1.Width = 20;
            THR.Controls.Add(THC1);
            TableHeaderCell THC2 = new TableHeaderCell();
            THC2.Text = "隸屬工項(WI)";
            THR.Controls.Add(THC2);
            TableHeaderCell THC3 = new TableHeaderCell();
            THC3.Text = "作業名稱(Activities)";
            THC3.Width = 200;
            THR.Controls.Add(THC3);
            TableHeaderCell THC4 = new TableHeaderCell();
            THC4.Text = "工期";
            THC4.Width = 20;
            THR.Controls.Add(THC4);
            TableHeaderCell THC5 = new TableHeaderCell();
            THC5.Text = "前置作業編號";
            THC5.Width = 100;
            THR.Controls.Add(THC5);
            TableHeaderCell THC55 = new TableHeaderCell();
            THC55.Text = "前置時間";
            THC55.Width = 20;
            THR.Controls.Add(THC55);
            TableHeaderCell THC6 = new TableHeaderCell();
            THC6.Text = "WI比重(%)";
            THC6.Width = 30;
            THR.Controls.Add(THC6);

            Tbl_Input.Controls.Add(THR);
        }

        protected void make_table_with_data()
        {
            string[] WItemp = DAL.ProgressMode.Get_WBS_ItemInformation(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString());
            int now_version = 1;
            int.TryParse(DDL_version.SelectedValue, out now_version);
            if (now_version < 1)
                now_version = 1;
            int ResultNum = DAL.ProgressMode.Get_Result_Number_New(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), now_version);
            int RealNum = ResultNum;
            if (Session["Activities"] == null)
            {
                TB_Activity.Text = ResultNum.ToString();
                Session["Activities"] = TB_Activity.Text;
            }
            else
            {
                //TB_Activity.Text = Session["Activities"].ToString();
                if (TB_Activity.Text != "")
                {
                    Session["Activities"] = TB_Activity.Text;
                    int.TryParse(TB_Activity.Text, out ResultNum);
                    //ResultNum = int.Parse(Session["Activities"].ToString());
                }
                if (now_version < 0)
                    ResultNum = int.Parse(Session["Activities"].ToString());
            }
            if (ResultNum > 0)
            {
                Btn_Clear.Enabled = true;
                // get data
                string[] result = new string[13];

                bool status = DAL.ProgressMode.Get_Progress_Data(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), out result, now_version);
                string[] ActivitiesName = result[3].Split(',');
                string[] Duration = result[4].Split(',');
                string[] WBSID = result[0].Split(',');
                string[] PreworkIDs = result[5].Split(';');
                string[] FTime = result[12].Split(';');
                string[] PP = result[11].Split(',');
                Tbl_Input.Rows.Clear();
                // make header row
                make_tableheader();

                for (int i = 0; i < ResultNum; i++)
                {
                    if (i < RealNum)
                    {
                        Make_row(i, ActivitiesName[i], int.Parse(Duration[i]), int.Parse(WBSID[i]), PreworkIDs[i], WItemp[0].Split('?'), WItemp[1].Split(','), double.Parse(PP[i]), FTime[i]);
                    }
                    else
                    {
                        Make_row(i, "", 0, -1, "", WItemp[0].Split('?'), WItemp[1].Split(','), 0.0, "0");
                    }
                }
            }
            else
            {
                Btn_Clear.Enabled = false;
                if (Session["Activities"].ToString() == "")
                {

                }
                else
                {
                    Btn_Clear.Enabled = true;
                    TB_Activity.Text = Session["Activities"].ToString();
                    int num = int.Parse(Session["Activities"].ToString());
                    for (int i = 0; i < num; i++)
                    {
                        Make_row(i, "", 0, -1, "", WItemp[0].Split('?'), WItemp[1].Split(','), 0, "0");
                    }

                }
            }
        }

        protected void Btn_Clear_Click(object sender, EventArgs e)
        {
            string DDLV = DDL_version.SelectedValue;
            if (DDLV == "")
                DDLV = "1";
            bool result = DAL.ProgressMode.Clear_Result_By_ProjectID(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), DDLV);
            Session["Activities"] = "";
            if (result)
            {
                Response.Write("<script>alert('資料清除成功');location.href='ProgressMode_new.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('資料清除失敗');location.href='ProgressMode_new.aspx';</script>");
            }
        }

        protected void Btn_Save_Click(object sender, EventArgs e)
        {
            Activity[] list = null;
            list = GetActivities(list);
            list = WalkListAhead(list);
            list = WalkListAback(list);

            int num = int.Parse(Session["Activities"].ToString());
            string[] WIID = new string[num];
            string[] WBSName = new string[num];
            string[] WIName = new string[num];
            string[] WBSID = new string[num];
            int[] Duration = new int[num];
            string[] PreworkIDs = new string[num];
            string[] FTime = new string[num];
            int[] ES = new int[num];
            int[] EE = new int[num];
            int[] LS = new int[num];
            int[] LE = new int[num];
            bool[] CP = new bool[num];
            decimal[] PP = new decimal[num];

            DateTime[] SD = new DateTime[num];
            DateTime[] ED = new DateTime[num];

            List<int> checkID = new List<int>();
            List<string> checkName = new List<string>();
            List<decimal> checkNum = new List<decimal>();

            for (int i = 0; i < num; i++)
            {
                WIID[i] = list[i].Id;
                DropDownList DDL11 = (DropDownList)Tbl_Input.Rows[i].FindControl("DDL_" + i.ToString() + "_11");
                DropDownList DDL5 = (DropDownList)Tbl_Input.Rows[i].FindControl("DDL_" + i.ToString() + "_5");
                //TextBox TB5 = (TextBox)Tbl_Input.Rows[i].FindControl("TB_" + i.ToString() + "_5");
                TextBox TB4 = (TextBox)Tbl_Input.Rows[i].FindControl("TB_" + i.ToString() + "_4");
                TextBox TB41 = (TextBox)Tbl_Input.Rows[i].FindControl("TB_" + i.ToString() + "_41");
                WBSID[i] = DDL11.SelectedValue;
                WBSName[i] = DDL11.SelectedItem.Text;
                WIName[i] = list[i].Description;
                Duration[i] = list[i].Duration;
                PreworkIDs[i] = TB4.Text;
                FTime[i] = TB41.Text;
                ES[i] = list[i].Est;
                EE[i] = list[i].Eet;
                LS[i] = list[i].Lst;
                LE[i] = list[i].Let;
                if ((EE[i] - LE[i] == 0) && (ES[i] - LS[i] == 0))
                {
                    CP[i] = true;
                }
                else
                {
                    CP[i] = false;
                }
                PP[i] = int.Parse(DDL5.SelectedValue);
                //PP[i] = decimal.Parse(TB5.Text);
                int temp = checkID.IndexOf(int.Parse(WBSID[i]));
                if (temp == -1)
                {
                    checkID.Add(int.Parse(WBSID[i]));
                    checkName.Add(WBSName[i]);
                    checkNum.Add(PP[i]);
                }
                else
                {
                    checkNum[temp] += PP[i];
                }
            }
            for (int i = 0; i < checkID.Count; i++)
            {
                if (checkNum[i] > 100)
                {
                    Response.Write("<script>alert('資源比重(" + checkName[i] + ")大於100，請修正');</script>");
                }
            }
            //儲存結果至資料庫
            //bool result = DAL.ProgressMode.Write_Progress_Result(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), LayerCode, ItemOrder, Item, Duration, Prework_LayerCode, ES, EE, LS, LE, CP);
            //bool result = DAL.ProgressMode.Write_Progress_Result(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), LayerCode, ItemOrder, Item, Duration, Prework_LayerCode, ES, EE, LS, LE, CP, IID);
            int temp_version = 1;
            if (!int.TryParse(DDL_version.SelectedValue, out temp_version))
                temp_version = 1;
            bool result = DAL.ProgressMode.Write_Progress_FirstPart(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), WBSID, WBSName, WIID, WIName, Duration, PreworkIDs, ES, EE, LS, LE, CP, PP, temp_version, FTime, SD, ED);

            if (result)
            {
                Response.Write("<script>alert('已成功儲存至資料庫');</script>");
            }
            else
            {
                Response.Write("<script>alert('儲存失敗');</script>");
            }
        }

        protected void Btn_make_Click(object sender, EventArgs e)
        {
            Session["Activities"] = TB_Activity.Text;
            make_table_with_data();
            //Response.Redirect("ProgressMode_new.aspx");
        }

        //public void Make_row(int RowID, string ActivityName, int Duration, int ItemSelected, string PreWorkIDs, string[] ItemName, string[] IID, double ResourceAmount)
        public void Make_row(int RowID, string ActivityName, int Duration, int ItemSelected, string PreWorkIDs, string[] ItemName, string[] IID, double ResourceAmount, string FTime)
        {
            TableRow TR = new TableRow();

            TableCell cell1 = new TableCell();
            TextBox TB_tmp1 = new TextBox();
            TB_tmp1.ID = "TB_" + RowID.ToString() + "_1";
            TB_tmp1.Text = (RowID + 1).ToString();
            TB_tmp1.Enabled = false;
            TB_tmp1.ReadOnly = true;
            TB_tmp1.Width = 20;
            cell1.Controls.Add(TB_tmp1);

            TR.Cells.Add(cell1);

            TableCell cell11 = new TableCell();
            DropDownList DDL_tmp11 = new DropDownList();
            DDL_tmp11.ID = "DDL_" + RowID.ToString() + "_11";
            for (int i = 0; i < ItemName.Length; i++)
            {
                ListItem LI = new ListItem();
                LI.Text = ItemName[i];
                LI.Value = IID[i];
                DDL_tmp11.Items.Add(LI);
            }
            DDL_tmp11.Width = 200;
            //DDL_tmp11.SelectedIndex = ItemSelected;
            if (ItemSelected == -1)
            {
                DDL_tmp11.SelectedIndex = 0;
            }
            else
            {
                DDL_tmp11.SelectedValue = ItemSelected.ToString();
            }
            DDL_tmp11.DataBind();
            cell11.Controls.Add(DDL_tmp11);
            TR.Cells.Add(cell11);

            TableCell cell2 = new TableCell();
            TextBox TB_tmp2 = new TextBox();
            TB_tmp2.ID = "TB_" + RowID.ToString() + "_2";
            TB_tmp2.Text = ActivityName;
            TB_tmp2.Width = 200;
            cell2.Controls.Add(TB_tmp2);
            TR.Cells.Add(cell2);

            TableCell cell3 = new TableCell();
            TextBox TB_tmp3 = new TextBox();
            TB_tmp3.ID = "TB_" + RowID.ToString() + "_3";
            TB_tmp3.Text = Duration.ToString();
            TB_tmp3.Width = 20;
            cell3.Controls.Add(TB_tmp3);
            TR.Cells.Add(cell3);

            TableCell cell4 = new TableCell();
            TextBox TB_tmp4 = new TextBox();
            TB_tmp4.ID = "TB_" + RowID.ToString() + "_4";
            TB_tmp4.Text = PreWorkIDs;
            TB_tmp4.Width = 100;
            cell4.Controls.Add(TB_tmp4);
            TR.Cells.Add(cell4);

            TableCell cell41 = new TableCell();
            TextBox TB_tmp41 = new TextBox();
            TB_tmp41.ID = "TB_" + RowID.ToString() + "_41";
            TB_tmp41.Text = FTime;
            TB_tmp41.Width = 20;
            cell41.Controls.Add(TB_tmp41);
            TR.Cells.Add(cell41);

            TableCell cell5 = new TableCell();
            //TextBox TB_tmp5 = new TextBox();
            //TB_tmp5.ID = "TB_" + RowID.ToString() + "_5";
            //TB_tmp5.Text = ResourceAmount.ToString();
            //cell5.Controls.Add(TB_tmp5);
            DropDownList DDL_tmp5 = new DropDownList();
            DDL_tmp5.ID = "DDL_" + RowID.ToString() + "_5";
            for (int i = 0; i <= 100; i++)
            {
                ListItem LI = new ListItem();
                LI.Text = i.ToString() + "%";
                LI.Value = i.ToString();
                DDL_tmp5.Items.Add(LI);
            }
            DDL_tmp5.SelectedValue = ResourceAmount.ToString();
            DDL_tmp5.DataBind();
            cell5.Controls.Add(DDL_tmp5);
            TR.Cells.Add(cell5);

            //產生表格
            Tbl_Input.Rows.Add(TR);
        }

        private Activity[] GetActivities(Activity[] list)
        {
            int na;
            do
            {
                if ((na = int.Parse(Session["Activities"].ToString())) < 2)
                {
                    Response.Write("<script>alert('作業項目需要大於2');</script>");
                    //Label2.Text = "作業項目需要大於2";
                }
            }
            while (na < 2);

            list = new Activity[na];

            for (int i = 0; i < na; i++)
            {
                Activity activity = new Activity();
                TextBox tt1 = (TextBox)Tbl_Input.Rows[i].FindControl("TB_" + i.ToString() + "_1");
                activity.Id = tt1.Text;

                TextBox tt2 = (TextBox)Tbl_Input.Rows[i].FindControl("TB_" + i.ToString() + "_2");
                activity.Description = tt2.Text;

                TextBox tt3 = (TextBox)Tbl_Input.Rows[i].FindControl("TB_" + i.ToString() + "_3");
                activity.Duration = int.Parse(tt3.Text);

                TextBox tt4 = (TextBox)Tbl_Input.Rows[i].FindControl("TB_" + i.ToString() + "_4");
                string[] preworkID = tt4.Text.Split(',');
                int np;
                if ((preworkID[0] == "") || (preworkID[0] == "0"))
                {
                    np = 0;
                }
                else
                {
                    np = preworkID.Length;
                }
                TextBox tt5 = (TextBox)Tbl_Input.Rows[i].FindControl("TB_" + i.ToString() + "_41");
                string[] prework_FLT = tt5.Text.Split(';');
                if (prework_FLT == null)
                {
                    activity.Flt[0] = 0;
                }
                else
                {
                    int[] FLT = new int[prework_FLT.Length];
                    for (int l = 0; l < prework_FLT.Length; l++)
                    {
                        if (prework_FLT[l] != null)
                        {
                            FLT[l] = int.Parse(prework_FLT[l]);
                        }
                        else
                        {
                            FLT[l] = 0;
                        }
                    }
                }
                if (np != 0)
                {
                    activity.Predecessors = new Activity[np];

                    string id;

                    for (int j = 0; j < np; j++)
                    {
                        id = preworkID[j];

                        Activity aux = new Activity();

                        if ((aux = aux.CheckActivity(list, id, i)) != null)
                        {
                            activity.Predecessors[j] = aux;

                            list[aux.GetIndex(list, aux, i)] = aux.SetSuccessors(aux, activity);
                        }
                        else
                        {
                            Response.Write("<script>alert('前置作業資料有誤');</script>");
                            //Label2.Text = "前置作業資料有誤";
                            j--;
                        }
                    }
                }
                list[i] = activity;
            }

            return list;
        }

        private Activity[] WalkListAhead(Activity[] list)
        {
            int na = int.Parse(Session["Activities"].ToString());
            //list[0].Eet = list[0].Est + list[0].Duration;

            for (int i = 0; i < na; i++)
            {
                if (list[i].Predecessors == null)
                {
                    list[i].Eet = list[i].Est + list[i].Duration -1;
                }
                else
                {
                    foreach (Activity activity in list[i].Predecessors)
                    {
                        if (list[i].Est < activity.Eet + 1)
                            list[i].Est = activity.Eet + 1;
                    }

                    list[i].Eet = list[i].Est + list[i].Duration -1;
                }
            }

            return list;
        }

        private Activity[] WalkListAback(Activity[] list)
        {
            int na = int.Parse(Session["Activities"].ToString());

            list[na - 1].Let = list[na - 1].Eet;
            list[na - 1].Lst = list[na - 1].Let - list[na - 1].Duration + 1;

            for (int i = na - 2; i >= 0; i--)
            {
                foreach (Activity activity in list[i].Successors)
                {
                    if (list[i].Let == 0)
                        list[i].Let = activity.Lst -1;
                    else
                        if (list[i].Let > activity.Lst - 1)
                            list[i].Let = activity.Lst - 1;
                }

                list[i].Lst = list[i].Let - list[i].Duration + 1;
            }

            return list;
        }

        protected void Btn_Set_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProgressMode_new2.aspx");
        }

        protected void DDL_version_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Session["Activities"] = DDL_version.SelectedValue;
            make_table_with_data();
        }

        protected void Btn_Newversion_Click(object sender, EventArgs e)
        {
            Activity[] list = null;
            list = GetActivities(list);
            list = WalkListAhead(list);
            list = WalkListAback(list);

            int num = int.Parse(Session["Activities"].ToString());
            string[] WIID = new string[num];
            string[] WBSName = new string[num];
            string[] WIName = new string[num];
            string[] WBSID = new string[num];
            int[] Duration = new int[num];
            string[] PreworkIDs = new string[num];
            string[] FTime = new string[num];
            int[] ES = new int[num];
            int[] EE = new int[num];
            int[] LS = new int[num];
            int[] LE = new int[num];
            bool[] CP = new bool[num];
            decimal[] PP = new decimal[num];

            DateTime[] SD = new DateTime[num];
            DateTime[] ED = new DateTime[num];

            List<int> checkID = new List<int>();
            List<string> checkName = new List<string>();
            List<decimal> checkNum = new List<decimal>();

            for (int i = 0; i < num; i++)
            {
                WIID[i] = list[i].Id;
                DropDownList DDL11 = (DropDownList)Tbl_Input.Rows[i].FindControl("DDL_" + i.ToString() + "_11");
                DropDownList DDL5 = (DropDownList)Tbl_Input.Rows[i].FindControl("DDL_" + i.ToString() + "_5");
                //TextBox TB5 = (TextBox)Tbl_Input.Rows[i].FindControl("TB_" + i.ToString() + "_5");
                TextBox TB4 = (TextBox)Tbl_Input.Rows[i].FindControl("TB_" + i.ToString() + "_4");
                TextBox TB41 = (TextBox)Tbl_Input.Rows[i].FindControl("TB_" + i.ToString() + "_41");
                WBSID[i] = DDL11.SelectedValue;
                WBSName[i] = DDL11.SelectedItem.Text;
                WIName[i] = list[i].Description;
                Duration[i] = list[i].Duration;
                PreworkIDs[i] = TB4.Text;
                FTime[i] = TB41.Text;
                ES[i] = list[i].Est;
                EE[i] = list[i].Eet;
                LS[i] = list[i].Lst;
                LE[i] = list[i].Let;
                if ((EE[i] - LE[i] == 0) && (ES[i] - LS[i] == 0))
                {
                    CP[i] = true;
                }
                else
                {
                    CP[i] = false;
                }
                PP[i] = int.Parse(DDL5.SelectedValue);
                //PP[i] = decimal.Parse(TB5.Text);
                int temp = checkID.IndexOf(int.Parse(WBSID[i]));
                if (temp == -1)
                {
                    checkID.Add(int.Parse(WBSID[i]));
                    checkName.Add(WBSName[i]);
                    checkNum.Add(PP[i]);
                }
                else
                {
                    checkNum[temp] += PP[i];
                }
            }
            for (int i = 0; i < checkID.Count; i++)
            {
                if (checkNum[i] > 100)
                {
                    Response.Write("<script>alert('資源比重(" + checkName[i] + ")大於100，請修正');</script>");
                }
            }
            //儲存結果至資料庫
            //bool result = DAL.ProgressMode.Write_Progress_Result(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), LayerCode, ItemOrder, Item, Duration, Prework_LayerCode, ES, EE, LS, LE, CP);
            //bool result = DAL.ProgressMode.Write_Progress_Result(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), LayerCode, ItemOrder, Item, Duration, Prework_LayerCode, ES, EE, LS, LE, CP, IID);
            int temp_version = DAL.ProgressMode.Get_MaxProgressVersion(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString()) + 1;
            
            bool result = DAL.ProgressMode.Write_Progress_FirstPart(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), WBSID, WBSName, WIID, WIName, Duration, PreworkIDs, ES, EE, LS, LE, CP, PP, temp_version, FTime,SD,ED);

            if (result)
            {
                Response.Write("<script>alert('已成功儲存至資料庫');</script>");
            }
            else
            {
                Response.Write("<script>alert('儲存失敗');</script>");
            }
        }

        protected void Btn_Lock_Click(object sender, EventArgs e)
        {
            int now_version = 1;
            int.TryParse(DDL_version.SelectedValue, out now_version);
            if (now_version < 1)
                now_version = 1;
            bool result = DAL.ProgressMode.Lock_ProgressData(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), now_version);
            if (result)
            {
                Response.Write("<script>alert('進度資料已鎖定');location.href='ProgressMode_new.aspx';</script>");
            }
            else
            {
                Response.Write("<script>alert('進度資料鎖定失敗');location.href='ProgressMode_new.aspx';</script>");
            }
        }


    }
}