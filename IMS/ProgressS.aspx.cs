using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CriticalPathMethod;
using System.Data.SqlTypes;

namespace IMS
{
    public partial class ProgressS : System.Web.UI.Page
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
            else
            {
                SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
                SqlDataSource1.SelectCommand = "Select * from Progress_WIINF where ProjectID=" + Session["ProjectCode"].ToString();

            }
            if (!IsPostBack)
            {
                string database = Session["DatabaseName"].ToString();
                string SQLSelect = "Select * from ProjectM0 where Pid=" + Session["ProjectCode"].ToString();
                string Lock = WebModel.SItemName(database, SQLSelect, "EBudgetLock")!=""?WebModel.SItemName(database, SQLSelect, "EBudgetLock"):"0";
                ViewState["Lock"] = Lock;
                string SQLDate = "Select * from ProjectM0 where Pid="+Session["ProjectCode"].ToString();
                TB_RSdate.Text = WebModel.SItemName(database, SQLDate, "SProgressSDate");
                //IBtn_Lock.TabIndex = 1;
                if ((Lock == "0"))
                {
                    IBtn_Lock.ImageUrl = "~/img/UnLock.jpg";
                    IBtn_Lock.ToolTip = "預定進度尚未鎖定，可自由修改作業項目";
                    IBtn_Save.Visible = true;
                    Response.Write("<script language='javascript'>alert('執行預算尚未鎖定，不得進行進度管理！')</script>");
                }
                else if ((Lock == "1"))
                {
                    string SQLProgressLock = "Select * From ProjectM0 Where PID= " + Session["ProjectCode"];
                    string ProgressLock = WebModel.SItemName(database, "SQLProgressLock", "SProgressLock");
                    IBtn_Lock.ImageUrl = "~/img/Lock.jpg";
                    IBtn_Lock.ToolTip = "預定進度已鎖定，不可修改作業項目，如欲解鎖請至「排定預定進度」設定";
                    LockPageSetting();
                }
            }
            if (EmptyCheck())
            {
                make_table_with_data();
            }
            else
            {
                Response.Write("<script language='javascript'>alert('請先填入工期、前置時間！')</script>");

            }
        }

        public  bool EmptyCheck()
        {
            bool result=true;
            for (int i = 0; i < Repeater1.Items.Count; i++)
            {
               
                TextBox TB_T1 = Repeater1.Items[i].FindControl("TB_T1") as TextBox;
                //TextBox TB_F1 = Repeater1.Items[i].FindControl("TB_F1") as TextBox;
                TextBox TB_D1 = Repeater1.Items[i].FindControl("TB_D1") as TextBox;
                if (TB_T1.Text == "" || TB_D1.Text == "")
                {
                    result=false;
                    break;

                }
            }

            return result;

        }
        public bool AllEmptyCheck()
        {
            bool result = true;
            for (int i = 0; i < Repeater1.Items.Count; i++)
            {

                TextBox TB_T1 = Repeater1.Items[i].FindControl("TB_T1") as TextBox;
                //TextBox TB_F1 = Repeater1.Items[i].FindControl("TB_F1") as TextBox;
                TextBox TB_D1 = Repeater1.Items[i].FindControl("TB_D1") as TextBox;
                TextBox TB_S1 = Repeater1.Items[i].FindControl("TB_D1") as TextBox;
                TextBox TB_E1 = Repeater1.Items[i].FindControl("TB_D1") as TextBox;
                Label LbES = Repeater1.Items[i].FindControl("LbES") as Label;
                Label LbLS = Repeater1.Items[i].FindControl("LbLS") as Label;
                Label LbEF = Repeater1.Items[i].FindControl("LbEF") as Label;
                Label LbLF = Repeater1.Items[i].FindControl("LbLF") as Label;
                Label LbFTime = Repeater1.Items[i].FindControl("LbES") as Label;
                if (TB_T1.Text == "" || TB_D1.Text == "" || TB_S1.Text == "" || TB_E1.Text == "" || LbES.Text == "" || LbLS.Text == "" || LbEF.Text == "" || LbLF.Text=="")
                {
                    result = false;
                    break;

                }
            }

            return result;

        }
        public void LockPageSetting()
        {
            IBtn_Save.Visible = false;           
            IBtn_CPM.Visible = false;
            for (int i = 0; i < Repeater1.Items.Count; i++)
            {

                TextBox TB_D1 = Repeater1.Items[i].FindControl("TB_D1") as TextBox;
                TextBox TB_T1 = Repeater1.Items[i].FindControl("TB_T1") as TextBox;
                TextBox TB_F1 = Repeater1.Items[i].FindControl("TB_F1") as TextBox;
                TextBox TB_S1 = Repeater1.Items[i].FindControl("TB_S1") as TextBox;
                TextBox TB_E1 = Repeater1.Items[i].FindControl("TB_E1") as TextBox;
                TB_D1.Enabled = false;
                TB_T1.Enabled = false;
                TB_F1.Enabled = false;
                TB_S1.Enabled = false;
                TB_E1.Enabled = false;
            }
           
        }

        public void UNLockPageSetting()
        {
            IBtn_Save.Visible = true;
            IBtn_CPM.Visible = true;
            for (int i = 0; i < Repeater1.Items.Count; i++)
            {

                TextBox TB_D1 = Repeater1.Items[i].FindControl("TB_D1") as TextBox;
                TextBox TB_T1 = Repeater1.Items[i].FindControl("TB_T1") as TextBox;
                TextBox TB_F1 = Repeater1.Items[i].FindControl("TB_F1") as TextBox;
                TextBox TB_S1 = Repeater1.Items[i].FindControl("TB_S1") as TextBox;
                TextBox TB_E1 = Repeater1.Items[i].FindControl("TB_E1") as TextBox;
                TB_D1.Enabled = true;
                TB_T1.Enabled = true;
                TB_F1.Enabled = true;
                TB_S1.Enabled = true;
                TB_E1.Enabled = true;
            }

        }
        protected void IBtn_Lock_Click(object sender, ImageClickEventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            if ((IBtn_Lock.ImageUrl == "~/img/UnLock.jpg"))
            {
                string SQLProgressLock = "Update ProjectM0 set SProgressLock=1 Where PID= " + Session["ProjectCode"];
                bool result = WebModel.SQLAction(database, SQLProgressLock);
                if (result)
                {
                    IBtn_Lock.ImageUrl = "~/img/Lock.jpg";
                    IBtn_Lock.ToolTip = "預定進度已鎖定，可點擊解鎖";
                    LockPageSetting();
                }
            }
            else //if ((IBtn_Lock.ImageUrl == "~/img/Lock.jpg"))
            {
                string SQLProgressLock = "Update ProjectM0 set SProgressLock=0 Where PID= " + Session["ProjectCode"];
                bool result = WebModel.SQLAction(database, SQLProgressLock);
                if (result)
                {
                    IBtn_Lock.ImageUrl = "~/img/UnLock.jpg";
                    IBtn_Lock.ToolTip = "預定進度尚未鎖定，可自由修改";
                    UNLockPageSetting();
                }
               
            }
        }
        protected void make_table_with_data()
        {
            if (Session["DatabaseName"] != null && Session["ProjectCode"] != null)
            {
                string[] WItemp = DAL.ProgressMode.Get_WBS_ItemInformation(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString());
                if (WItemp[0] != null)
                {
                    int now_version = 1;
                    //int.TryParse(DDL_version.SelectedValue, out now_version);
                    if (now_version < 1)
                        now_version = 1;
                    int ResultNum = DAL.ProgressMode.Get_Result_Number_New(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), now_version);
                    if (ResultNum != 0)
                    {
                        int RealNum = ResultNum;
                        Session["Activities"] = ResultNum;
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
                        //    if (now_version < 0)
                        //        ResultNum = int.Parse(Session["Activities"].ToString());
                        //}
                        //if (ResultNum > 0)
                        //{
                        //    //Btn_Clear.Enabled = true;
                        //    // get data
                        //    string[] result = new string[13];

                        //    bool status = DAL.ProgressMode.Get_Progress_Data(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), out result, now_version);
                        //    if (status)
                        //    {
                        //        string[] ActivitiesName = result[3].Split(',');
                        //        string[] Duration = result[4].Split(',');
                        //        string[] WBSID = result[0].Split(',');
                        //        string[] PreworkIDs = result[5].Split(';');
                        //        string[] FTime = result[12].Split(';');
                        //        string[] PP = result[11].Split(',');

                        //        Tbl_Input.Rows.Clear();
                        //        // make header row
                        //        make_tableheader();

                        //        for (int i = 0; i < ResultNum; i++)
                        //        {
                        //            if (i < RealNum)
                        //            {
                        //                Make_row(i, ActivitiesName[i], int.Parse(Duration[i]), int.Parse(WBSID[i]), PreworkIDs[i], WItemp[0].Split('?'), WItemp[1].Split(','), double.Parse(PP[i]), FTime[i]);
                        //            }
                        //            else
                        //            {
                        //                Make_row(i, "", 0, -1, "", WItemp[0].Split('?'), WItemp[1].Split(','), 0.0, "0");
                        //            }
                        //        }
                        //    }
                        //    else
                        //    {
                        //        Btn_Clear.Enabled = false;
                        //        if (Session["Activities"].ToString() == "")
                        //        {

                        //        }
                        //        else
                        //        {
                        //            Btn_Clear.Enabled = true;
                        //            TB_Activity.Text = Session["Activities"].ToString();
                        //            int num = int.Parse(Session["Activities"].ToString());
                        //            for (int i = 0; i < num; i++)
                        //            {
                        //                Make_row(i, "", 0, -1, "", WItemp[0].Split('?'), WItemp[1].Split(','), 0, "0");
                        //            }

                        //        }
                        //    }
                        //}
                        //else
                        //{

                        //    //Response.Write("<script>alert('請重新選擇專案!!!');location.href='Main.aspx';</script>");
                    }
                    else
                    {

                        Response.Write("<script>alert('請先至進度管理頁面設定進度並存檔!!!');</script>");
                    }
                    //}
                }
                else
                {

                    Response.Write("<script>alert('此專案無選定的引用工項!!!');</script>");
                }

            }

        }
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;
                Label LbCP = (Label)e.Item.FindControl("LbCP");
                Label LbLS = (Label)e.Item.FindControl("LbLS");
                Label LbES = (Label)e.Item.FindControl("LbES");
                Label LbEF = (Label)e.Item.FindControl("LbEF");
                Label LbLF = (Label)e.Item.FindControl("LbLF");
                
                Label LbFTime = (Label)e.Item.FindControl("LbFTime");
                Label LbRate = (Label)e.Item.FindControl("LbRate");
                TextBox TB_D1 = (TextBox)e.Item.FindControl("TB_D1");
                TextBox TB_F1 = (TextBox)e.Item.FindControl("TB_F1");
                TextBox TB_T1 = (TextBox)e.Item.FindControl("TB_T1");
                TextBox TB_S1 = (TextBox)e.Item.FindControl("TB_S1");
                TextBox TB_E1 = (TextBox)e.Item.FindControl("TB_E1");
                
                TB_S1.Text = TB_S1.Text!=""?DateTime.Parse(TB_S1.Text).ToShortDateString():"";
                TB_E1.Text =TB_E1.Text!=""? DateTime.Parse(TB_E1.Text).ToShortDateString():"";

                double value =double.Parse(LbRate.Text);
                LbRate.Text = (Math.Round(value, 0)).ToString();
                if (LbCP.Text == "True")
                {
                    LbCP.Text = "是";

                }
                else
                {
                    LbCP.Text = "否";

                }
                if (LbLS.Text != "" && LbES.Text !="")
                {
                    LbFTime.Text = (decimal.Parse(LbLS.Text) - decimal.Parse(LbES.Text)).ToString();

                }
                if (ViewState["Lock"].ToString() == "1")
                {
                    TB_D1.Enabled = false;
                    TB_F1.Enabled = false;
                    TB_T1.Enabled = false;
                    TB_S1.Enabled = false;
                    TB_E1.Enabled = false;


                }
                else
                {
                    TB_D1.Enabled = true;
                    TB_F1.Enabled = true;
                    TB_T1.Enabled = true;
                    TB_S1.Enabled = true;
                    TB_E1.Enabled = true;


                }
                //LbFTime.Text = (DateTime.Parse(LbLS.Text) - DateTime.Parse(LbES.Text)).ToString();
                DateTime DT;
                var isDate = DateTime.TryParse(TB_RSdate.Text, out DT);
               
                if (isDate)
                {
                    LbES.Text =LbES.Text!=""? DT.AddDays(int.Parse(LbES.Text)).ToString("yy/MM/dd"):"";
                    LbEF.Text = LbEF.Text!=""?DT.AddDays(int.Parse(LbEF.Text)).ToString("yy/MM/dd"):"";
                    LbLS.Text = LbLS.Text!=""?DT.AddDays(int.Parse(LbLS.Text)).ToString("yy/MM/dd"):"";
                    LbLF.Text = LbLF.Text!=""?DT.AddDays(int.Parse(LbLF.Text)).ToString("yy/MM/dd"):"";
                }
            }
        }

        protected void IBtn_CPM_Click(object sender, ImageClickEventArgs e)
        {
            if (EmptyCheck())
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

                for (int i = 0; i < Repeater1.Items.Count; i++)
                {
                    Label LbWBSID = Repeater1.Items[i].FindControl("LbWBSID") as Label;
                    Label LbWIName = Repeater1.Items[i].FindControl("LbWIName") as Label;
                    Label LbWBSName = Repeater1.Items[i].FindControl("LbWBSName") as Label;
                    Label LbRate = Repeater1.Items[i].FindControl("LbRate") as Label;
                    TextBox TB_T1 = Repeater1.Items[i].FindControl("TB_T1") as TextBox;
                    TextBox TB_F1 = Repeater1.Items[i].FindControl("TB_F1") as TextBox;
                    TextBox TB_S1 = Repeater1.Items[i].FindControl("TB_S1") as TextBox;
                    TextBox TB_E1 = Repeater1.Items[i].FindControl("TB_E1") as TextBox;
                    WIID[i] = list[i].Id;

                    WBSID[i] = LbWBSID.Text;
                    WBSName[i] = LbWBSName.Text;
                    WIName[i] = list[i].Description;
                    Duration[i] = list[i].Duration;
                    PreworkIDs[i] = TB_F1.Text;
                    FTime[i] = TB_T1.Text;
                    ES[i] = list[i].Est;
                    EE[i] = list[i].Eet;
                    LS[i] = list[i].Lst;
                    LE[i] = list[i].Let;

                    if (TB_S1.Text != "")
                    {
                        SD[i] = DateTime.Parse(TB_S1.Text);

                    }
                    else
                    {


                    }
                    if (TB_E1.Text != "")
                    {
                        ED[i] = DateTime.Parse(TB_E1.Text);

                    }
                   
                    if ((EE[i] - LE[i] == 0) && (ES[i] - LS[i] == 0))
                    {
                        CP[i] = true;
                    }
                    else
                    {
                        CP[i] = false;
                    }
                    PP[i] = int.Parse(LbRate.Text);
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
                //for (int i = 0; i < num; i++)
                //{
                //    WIID[i] = list[i].Id;
                //    DropDownList DDL11 = (DropDownList)Tbl_Input.Rows[i].FindControl("DDL_" + i.ToString() + "_11");
                //    DropDownList DDL5 = (DropDownList)Tbl_Input.Rows[i].FindControl("DDL_" + i.ToString() + "_5");
                //    //TextBox TB5 = (TextBox)Tbl_Input.Rows[i].FindControl("TB_" + i.ToString() + "_5");
                //    TextBox TB4 = (TextBox)Tbl_Input.Rows[i].FindControl("TB_" + i.ToString() + "_4");
                //    TextBox TB41 = (TextBox)Tbl_Input.Rows[i].FindControl("TB_" + i.ToString() + "_41");
                //    WBSID[i] = DDL11.SelectedValue;
                //    WBSName[i] = DDL11.SelectedItem.Text;
                //    WIName[i] = list[i].Description;
                //    Duration[i] = list[i].Duration;
                //    PreworkIDs[i] = TB4.Text;
                //    FTime[i] = TB41.Text;
                //    ES[i] = list[i].Est;
                //    EE[i] = list[i].Eet;
                //    LS[i] = list[i].Lst;
                //    LE[i] = list[i].Let;
                //    if ((EE[i] - LE[i] == 0) && (ES[i] - LS[i] == 0))
                //    {
                //        CP[i] = true;
                //    }
                //    else
                //    {
                //        CP[i] = false;
                //    }
                //    PP[i] = int.Parse(DDL5.SelectedValue);
                //    //PP[i] = decimal.Parse(TB5.Text);
                //    int temp = checkID.IndexOf(int.Parse(WBSID[i]));
                //    if (temp == -1)
                //    {
                //        checkID.Add(int.Parse(WBSID[i]));
                //        checkName.Add(WBSName[i]);
                //        checkNum.Add(PP[i]);
                //    }
                //    else
                //    {
                //        checkNum[temp] += PP[i];
                //    }
                //}
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
                //if (!int.TryParse(DDL_version.SelectedValue, out temp_version))
                //    temp_version = 1;
                bool result = DAL.ProgressMode.Write_Progress_FirstPart(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), WBSID, WBSName, WIID, WIName, Duration, PreworkIDs, ES, EE, LS, LE, CP, PP, temp_version, FTime, SD, ED);

                if (result)
                {
                    Response.Write("<script>alert('已成功儲存至資料庫');</script>");
                }
                else
                {
                    Response.Write("<script>alert('儲存失敗');</script>");
                }
                Repeater1.DataBind();
            }
            else
            {

                Response.Write("<script language='javascript'>alert('請先填入工期、前置時間！')</script>");
            }
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

            for (int i = 0; i < Repeater1.Items.Count; i++)
            {
                Label LbWBSID = Repeater1.Items[i].FindControl("LbWBSID") as Label;
                Label LbWIID = Repeater1.Items[i].FindControl("LbWIID") as Label;
                Label LbWIName = Repeater1.Items[i].FindControl("LbWIName") as Label;
                Label LbWBSName = Repeater1.Items[i].FindControl("LbWBSName") as Label;
                Label LbRate = Repeater1.Items[i].FindControl("LbRate") as Label;
                Label LbFTime = Repeater1.Items[i].FindControl("LbFTime") as Label;
                TextBox TB_F1 = Repeater1.Items[i].FindControl("TB_F1") as TextBox;
                TextBox TB_D1 = Repeater1.Items[i].FindControl("TB_D1") as TextBox;

                Activity activity = new Activity();
                //TextBox tt1 = (TextBox)Tbl_Input.Rows[i].FindControl("TB_" + i.ToString() + "_1");
                activity.Id = LbWIID.Text;

                //TextBox tt2 = (TextBox)Tbl_Input.Rows[i].FindControl("TB_" + i.ToString() + "_2");
                activity.Description = LbWIName.Text;

                //TextBox tt3 = (TextBox)Tbl_Input.Rows[i].FindControl("TB_" + i.ToString() + "_3");
                activity.Duration = int.Parse(TB_D1.Text);

                //TextBox tt4 = (TextBox)Tbl_Input.Rows[i].FindControl("TB_" + i.ToString() + "_4");
                string[] preworkID = TB_F1.Text.Split(',');
                int np;
                if ((preworkID[0] == "") || (preworkID[0] == "0"))
                {
                    np = 0;
                }
                else
                {
                    np = preworkID.Length;
                }
                //TextBox tt5 = (TextBox)Tbl_Input.Rows[i].FindControl("TB_" + i.ToString() + "_41");
                string[] prework_FLT = LbFTime.Text.Split(';');
                if (prework_FLT == null)
                {
                    activity.Flt[0] = 0;
                }
                else
                {
                    int[] FLT = new int[prework_FLT.Length];
                    for (int l = 0; l < prework_FLT.Length; l++)
                    {
                        if (prework_FLT[l] != null && prework_FLT[l] !="")
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
                            // Response.Write("<script>alert('前置作業資料有誤');</script>");
                            ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('前置作業資料有誤');", true);
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
                    list[i].Eet = list[i].Est + list[i].Duration;
                }
                else
                {
                    foreach (Activity activity in list[i].Predecessors)
                    {
                        if (list[i].Est < activity.Eet)
                            list[i].Est = activity.Eet;
                    }

                    list[i].Eet = list[i].Est + list[i].Duration;
                }
            }

            return list;
        }

        private Activity[] WalkListAback(Activity[] list)
        {
            int na = int.Parse(Session["Activities"].ToString());

            list[na - 1].Let = list[na - 1].Eet;
            list[na - 1].Lst = list[na - 1].Let - list[na - 1].Duration;

            for (int i = na - 2; i >= 0; i--)
            {
                foreach (Activity activity in list[i].Successors)
                {
                    if (list[i].Let == 0)
                        list[i].Let = activity.Lst;
                    else
                        if (list[i].Let > activity.Lst)
                            list[i].Let = activity.Lst;
                }

                list[i].Lst = list[i].Let - list[i].Duration;
            }

            return list;
        }
        protected void SetDate_Click(object sender, EventArgs e)
        {
            //Tbl_Output.Rows.Clear();
            //make_tableheader();
            if (AllEmptyCheck())
            {              
            
            string[] data = new string[10];
            int temp_ver = 1;
            //if (!int.TryParse(DDL_version.SelectedValue, out temp_ver))
                temp_ver = 1;
            bool getdata = DAL.ProgressMode.Get_Progress_AllData(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), out data, temp_ver);
            if (getdata)
            {
                string[] ActivityNo = data[0].Split(',');
                string[] Item = data[1].Split(',');
                string[] temp = data[2].Split(',');
                int[] Duration = new int[temp.Length];
                for (int i = 0; i < temp.Length; i++)
                {
                    Duration[i] = int.Parse(temp[i]);
                }
                string[] temp3 = data[3].Split(',');
                string[] temp4 = data[4].Split(',');
                string[] temp5 = data[5].Split(',');
                string[] temp6 = data[6].Split(',');
                string[] temp7 = data[7].Split(',');
                int[] ES = new int[temp3.Length];
                int[] EE = new int[temp4.Length];
                int[] LS = new int[temp5.Length];
                int[] LE = new int[temp6.Length];
                bool[] CP = new bool[temp7.Length];
                for (int i = 0; i < temp3.Length; i++)
                {
                    ES[i] = int.Parse(temp3[i]);
                    EE[i] = int.Parse(temp4[i]);
                    LS[i] = int.Parse(temp5[i]);
                    LE[i] = int.Parse(temp6[i]);
                    CP[i] = bool.Parse(temp7[i]);
                }
                string[] SD = data[8].Split(',');
                string[] ED = data[9].Split(',');
                int AllNo = ActivityNo.Length;
                for (int i = 0; i < AllNo; i++)
                {
                    //Make_result_row_with_data(ActivityNo[i], Item[i], Duration[i], ES[i], EE[i], LS[i], LE[i], CP[i], "", "");
                    Label LbWBSID = Repeater1.Items[i].FindControl("LbWBSID") as Label;
                    Label LbWIID = Repeater1.Items[i].FindControl("LbWIID") as Label;
                    Label LbWIName = Repeater1.Items[i].FindControl("LbWIName") as Label;
                    Label LbWBSName = Repeater1.Items[i].FindControl("LbWBSName") as Label;
                    Label LbRate = Repeater1.Items[i].FindControl("LbRate") as Label;
                    Label LbFTime = Repeater1.Items[i].FindControl("LbFTime") as Label;
                    Label LbCP = Repeater1.Items[i].FindControl("LbCP") as Label;
                    Label LbES = Repeater1.Items[i].FindControl("LbES") as Label;
                    Label LbLS = Repeater1.Items[i].FindControl("LbLS") as Label;
                    Label LbEF = Repeater1.Items[i].FindControl("LbEF") as Label;
                    Label LbLF = Repeater1.Items[i].FindControl("LbLF") as Label;
                    TextBox TB_S1 = Repeater1.Items[i].FindControl("TB_S1") as TextBox;
                    TextBox TB_E1 = Repeater1.Items[i].FindControl("TB_E1") as TextBox;
                    DateTime DT;
                    var isDate = DateTime.TryParse(TB_RSdate.Text, out DT);
                    string StartD = "";
                    string EndD = "";
                    if (isDate)
                    {
                        LbES.Text = DT.AddDays(ES[i]).ToString("yy/MM/dd");
                        LbEF.Text = DT.AddDays(EE[i]).ToString("yy/MM/dd");
                        LbLS.Text = DT.AddDays(LS[i]).ToString("yy/MM/dd");
                        LbLF.Text = DT.AddDays(LE[i]).ToString("yy/MM/dd");
                        if (StartD != "")
                        {
                            TB_S1.Text = StartD;
                        }
                        else
                        {
                            TB_S1.Text = LbES.Text;
                        }

                        if (LbCP.Text == "是")
                        {
                            TB_S1.ReadOnly = true;
                        }
                        else
                        {
                            //TB_11.ReadOnly = true;
                            TB_S1.Attributes.Add("onclick", "WdatePicker(({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy/MM/dd',alwaysUseStartDate:true}));");
                            TB_S1.Attributes.Add("onchange", "alerttime(this.value,'" + LbLS.Text + "','" + LbEF.Text + "');");
                        }

                        if (EndD != "")
                        {
                            TB_E1.Text = EndD;
                        }
                        else
                        {
                            TB_E1.Text = LbLF.Text;
                        }

                        if (LbCP.Text == "是")
                        {
                            TB_E1.ReadOnly = true;
                        }
                        else
                        {
                            //TB_12.ReadOnly = true;
                            TB_E1.Attributes.Add("onclick", "WdatePicker(({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy/MM/dd',alwaysUseStartDate:true}));");
                            TB_E1.Attributes.Add("onchange", "alerttime(this.value,'" + LbLS.Text + "','" + LbLF.Text + "');");
                        }
                    }
                }
            }
            }
            else
            {
                Response.Write("<script language='javascript'>alert('請先填入工期、前置時間,並先以要徑法計算並儲存計算結果！')</script>");

            }
        }

        protected void IBtn_Save_Click(object sender, ImageClickEventArgs e)
        {
            string database = Session["DatabaseName"].ToString();
            DateTime DT;
            var isDate = DateTime.TryParse(TB_RSdate.Text, out DT);
            if (isDate)
            {
                string SQLUpdate = "Update ProjectM0 set SProgressSDate='" + DT.ToShortDateString() + "' where Pid=" + Session["ProjectCode"].ToString();
                bool Result = WebModel.SQLAction(database, SQLUpdate);
            }
            int num = Repeater1.Items.Count;

            int[] WIID = new int[num];
            string[] SD = new string[num];
            string[] ED = new string[num];

            for (int i = 0; i < num; i++)
            {
                TextBox TB_S1 = Repeater1.Items[i].FindControl("TB_S1") as TextBox;
                TextBox TB_E1 = Repeater1.Items[i].FindControl("TB_E1") as TextBox;
                //TextBox TBS = new TextBox();
                //TextBox TBE = new TextBox();
                //TBS = (TextBox)Tbl_Output.Rows[i].FindControl("TB_SD_" + (i + 1).ToString());
                //TBE = (TextBox)Tbl_Output.Rows[i].FindControl("TB_ED_" + (i + 1).ToString());
                WIID[i] = i + 1;
                if (TB_S1.Text != "" && TB_E1.Text != "")
                {
                    SD[i] = TB_S1.Text;
                    ED[i] = TB_E1.Text;
                }
            }
            int temp_ver = 1;
            //if (!int.TryParse(DDL_version.SelectedValue, out temp_ver))
            temp_ver = 1;

            bool result = DAL.ProgressMode.Update_Progress_Date(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), WIID, SD, ED, temp_ver);
            if (result)
            {
                Response.Write("<script>alert('儲存成功');</script>");
            }
            else
            {
                Response.Write("<script>alert('儲存失敗');</script>");
            }
        }

        protected void IBtn_Draw_Click(object sender, ImageClickEventArgs e)
        {
            Response.Write("<script>window.open('Progress_New_Gantt.aspx','甘特圖',config='height=500,width=800,scrollbars=yes');</script>");
        }
        //public void Make_result_row_with_data(string ActivityNum, string Item, int Duration, int ES, int EE, int LS, int LE, bool CP, string StartD, string EndD)
        //{
            //TableRow TR = new TableRow();

            //TableCell cell1 = new TableCell();
            //Label lbl_1 = new Label();
            //lbl_1.ID = "Lbl_" + ActivityNum;
            //lbl_1.Text = ActivityNum;
            //cell1.Controls.Add(lbl_1);
            //TR.Cells.Add(cell1);

            //TableCell cell2 = new TableCell();
            //Label lbl_2 = new Label();
            //lbl_2.Text = Item;
            //cell2.Controls.Add(lbl_2);
            //TR.Cells.Add(cell2);

            //TableCell cell3 = new TableCell();
            //Label lbl_3 = new Label();
            //lbl_3.Text = Duration.ToString();
            //cell3.Controls.Add(lbl_3);
            //TR.Cells.Add(cell3);

            //TableCell cell4 = new TableCell();
            //Label lbl_9 = new Label();
        //    DateTime DT;
        //    var isDate = DateTime.TryParse(TB_RSdate.Text, out DT);
        //    if (isDate)
        //    {
        //        lbl_9.Text = DT.AddDays(ES).ToString("yy/MM/dd");
        //    }

        //    //cell4.Controls.Add(lbl_9);
        //    //TR.Cells.Add(cell4);

        //    //TableCell cell5 = new TableCell();
        //    //Label lbl_91 = new Label();
        //    if (isDate)
        //    {
        //        lbl_91.Text = DT.AddDays(EE).ToString("yy/MM/dd");
        //    }
        //    //cell5.Controls.Add(lbl_91);
        //    //TR.Cells.Add(cell5);

        //    //TableCell cell6 = new TableCell();
        //    //Label lbl_92 = new Label();
        //    if (isDate)
        //    {
        //        lbl_92.Text = DT.AddDays(LS).ToString("yy/MM/dd");
        //    }
        //    //cell6.Controls.Add(lbl_92);
        //    //TR.Cells.Add(cell6);

        //    //TableCell cell7 = new TableCell();
        //    //Label lbl_10 = new Label();
        //    if (isDate)
        //    {
        //        lbl_10.Text = DT.AddDays(LE).ToString("yy/MM/dd");
        //    }

        //    //cell7.Controls.Add(lbl_10);
        //    //TR.Cells.Add(cell7);

        //    //TableCell cell75 = new TableCell();
        //    //Label lbl_75 = new Label();
        //    //lbl_75.Text = (LE - EE).ToString();
        //    //cell75.Controls.Add(lbl_75);
        //    //TR.Cells.Add(cell75);

        //    //TableCell cell8 = new TableCell();
        //    //Label lbl_8 = new Label();
        //    if (CP)
        //    {
        //        lbl_8.Text = "*";
        //    }
        //    else
        //    {
        //        lbl_8.Text = "";
        //    }
        //    //cell8.Controls.Add(lbl_8);
        //    //TR.Cells.Add(cell8);

        //    //TableCell cell11 = new TableCell();
        //    //TextBox TB_11 = new TextBox();
        //    //TB_11.ID = "TB_SD_" + ActivityNum;
        //    if (StartD != "")
        //    {
        //        TB_11.Text = StartD;
        //    }
        //    else
        //    {
        //        TB_11.Text = lbl_9.Text;
        //    }

        //    if (lbl_8.Text == "*")
        //    {
        //        TB_11.ReadOnly = true;
        //    }
        //    else
        //    {
        //        //TB_11.ReadOnly = true;
        //        TB_11.Attributes.Add("onclick", "WdatePicker(({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy/MM/dd',alwaysUseStartDate:true}));");
        //        TB_11.Attributes.Add("onchange", "alerttime(this.value,'" + lbl_9.Text + "','" + lbl_91.Text + "');");
        //    }

        //    //cell11.Controls.Add(TB_11);
        //    //TR.Cells.Add(cell11);

        //    //TableCell cell12 = new TableCell();
        //    //TextBox TB_12 = new TextBox();
        //    //TB_12.ID = "TB_ED_" + ActivityNum;
        //    if (EndD != "")
        //    {
        //        TB_12.Text = EndD;
        //    }
        //    else
        //    {
        //        TB_12.Text = lbl_10.Text;
        //    }

        //    if (lbl_8.Text == "*")
        //    {
        //        TB_12.ReadOnly = true;
        //    }
        //    else
        //    {
        //        //TB_12.ReadOnly = true;
        //        TB_12.Attributes.Add("onclick", "WdatePicker(({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy/MM/dd',alwaysUseStartDate:true}));");
        //        TB_12.Attributes.Add("onchange", "alerttime(this.value,'" + lbl_92.Text + "','" + lbl_10.Text + "');");
        //    }

        //    //cell12.Controls.Add(TB_12);
        //    //TR.Cells.Add(cell12);

        //    //TR.Cells[0].HorizontalAlign = HorizontalAlign.Center;
        //    //TR.Cells[1].HorizontalAlign = HorizontalAlign.Center;
        //    //TR.Cells[2].HorizontalAlign = HorizontalAlign.Center;
        //    //TR.Cells[3].HorizontalAlign = HorizontalAlign.Center;
        //    //TR.Cells[4].HorizontalAlign = HorizontalAlign.Center;
        //    //TR.Cells[5].HorizontalAlign = HorizontalAlign.Center;
        //    //TR.Cells[6].HorizontalAlign = HorizontalAlign.Center;
        //    //TR.Cells[7].HorizontalAlign = HorizontalAlign.Center;
        //    //TR.Cells[8].HorizontalAlign = HorizontalAlign.Center;
        //    //TR.Cells[9].HorizontalAlign = HorizontalAlign.Center;

        //    //產生表格
        //    //Tbl_Output.Rows.Add(TR);
        //}
        //protected void IBtn_Save_Click(object sender, ImageClickEventArgs e)
        //{

        //}

       

       
    }
}