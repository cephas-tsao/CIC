using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CriticalPathMethod;

namespace IMS
{
    public partial class ProgressMode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Activities"] != null)
            {
                //Tbl_Input.Rows.Clear();
                int num = int.Parse(Session["Activities"].ToString());
                string[] data = DAL.ProgressMode.Get_All_Layer_Item(Session["DatabaseName"].ToString(), "XBid1DB");
                string[] Item = DAL.ProgressMode.LayerItem_Resort(data[0], data[1], data[2]).Split(',');
                //string[] Item = data[2].Split(',');
                for (int i = 1; i < Tbl_Input.Rows.Count; i++)
                {
                    Tbl_Input.Rows[i].Cells.Clear();
                }
                for (int i = 0; i < num; i++)
                {
                    if (Session["AutoLoad"] == null)
                    {
                        Make_row(i, Item, data[3].Split(','));
                    }
                    else if(Session["AutoLoad"].ToString() == "True")
                    {
                        string[] LayerCode = Session["LayerC"].ToString().Split(',');
                        string[] ItemOrder = Session["ItemO"].ToString().Split(',');
                        //string[] Item = Session["Item"].ToString().Split(',');
                        //Make_row_with_data(i, LayerCode[i], ItemOrder[i], Item[i]);
                        Make_row_with_data(i, LayerCode[i], ItemOrder[i], Item, data[3].Split(','));
                    }
                }
            }
        }

        protected void Btn1_Click(object sender, EventArgs e)
        {
            int num = 0;
            bool canConvert = int.TryParse(TB_Activities1.Text, out num);
            if (canConvert)
            {
                Session["Activities"] = num;
                Response.Redirect("ProgressMode.aspx");
            }
            else
            {
                Response.Write("<script>alert('工作天數請輸入整數!');</script>");
            }
        }

        protected void Btn_auto_Click(object sender, EventArgs e)
        {
            int num;
            //Response.Write("<script>alert('資料表被砍了!!');</script>");
            string[] data = DAL.ProgressMode.Get_All_Layer_Item(Session["DatabaseName"].ToString(), "XBid1DB");
            string[] LayerCode = data[0].Split(',');
            string[] ItemOrder = data[1].Split(',');
            string[] Item = DAL.ProgressMode.LayerItem_Resort(data[0], data[1], data[2]).Split(',');
            //string[] Item = data[2].Split(',');
            string[] newdata = BLL.ProgressMode.Get_TheLowestLayerCode(LayerCode, ItemOrder, Item);

            Session["LayerC"] = newdata[0];
            Session["ItemO"] = newdata[1];
            Session["Item"] = newdata[2];
            Session["AutoLoad"] = true;
            //Session["Activities"] = newdata[0].Split(',').Length;
            bool canConvert = int.TryParse(TB_Activities1.Text, out num);
            if (canConvert)
            {
                Session["Activities"] = num;
                Response.Redirect("ProgressMode.aspx");
            }
            else
            {
                Response.Write("<script>alert('工作天數請輸入整數!');</script>");
            }

        }

        protected void Btn2_Click(object sender, EventArgs e)
        {
            //string[] AID = new string[int.Parse(Session["Activities"].ToString())];
            //string[] AName = new string[int.Parse(Session["Activities"].ToString())];
            //string[] ADuring = new string[int.Parse(Session["Activities"].ToString())];
            //string[] ApreID = new string[int.Parse(Session["Activities"].ToString())];
            Activity[] list = null;
            list = GetActivities(list);
            list = WalkListAhead(list);
            list = WalkListAback(list);
            CriticalPath(list);
            Make_result_table(list);
            Session["all_stage"] = list;
            int num = int.Parse(Session["Activities"].ToString());
            string[] LayerCode = new string[num];
            string[] ItemOrder = new string[num];
            for (int i = 0; i < num; i++)
            {
                TextBox TB = (TextBox)Tbl_Input.FindControl("TB_" + i.ToString() + "_1");
                LayerCode[i] = TB.Text;
                DropDownList DDL = (DropDownList)Tbl_Input.FindControl("DDL_" + i.ToString() + "_11");
                ItemOrder[i] = DDL.SelectedValue;
            }
            Session["LayerC"] = Utility.array_process.array2str(LayerCode);
            Session["ItemO"] = Utility.array_process.array2str(ItemOrder);

            Session["AutoLoad"] = true;
        }

        //public void Make_row(int RowID)
        //{
        //    TableRow TR = new TableRow();

        //    TableCell cell1 = new TableCell();
        //    TextBox TB_tmp1 = new TextBox();
        //    TB_tmp1.ID = "TB_" + RowID.ToString() + "_1";
        //    TB_tmp1.Text = (RowID+1).ToString();
        //    TB_tmp1.Enabled = false;
        //    TB_tmp1.ReadOnly = true;
        //    cell1.Controls.Add(TB_tmp1);

        //    TR.Cells.Add(cell1);

        //    TableCell cell11 = new TableCell();
        //    TextBox TB_tmp11 = new TextBox();
        //    TB_tmp11.ID = "TB_" + RowID.ToString() + "_11";
        //    cell11.Controls.Add(TB_tmp11);

        //    TR.Cells.Add(cell11);

        //    TableCell cell2 = new TableCell();
        //    TextBox TB_tmp2 = new TextBox();
        //    TB_tmp2.ID = "TB_" + RowID.ToString() + "_2";
        //    cell2.Controls.Add(TB_tmp2);
        //    TR.Cells.Add(cell2);

        //    TableCell cell3 = new TableCell();
        //    TextBox TB_tmp3 = new TextBox();
        //    TB_tmp3.ID = "TB_" + RowID.ToString() + "_3";
        //    cell3.Controls.Add(TB_tmp3);
        //    TR.Cells.Add(cell3);

        //    TableCell cell4 = new TableCell();
        //    TextBox TB_tmp4 = new TextBox();
        //    TB_tmp4.ID = "TB_" + RowID.ToString() + "_4";
        //    cell4.Controls.Add(TB_tmp4);
        //    TR.Cells.Add(cell4);

        //    //產生表格
        //    Tbl_Input.Rows.Add(TR);
        //}

        //public void Make_row_with_data(int RowID,string Number, string Stage, string ItemName)
        //{
        //    TableRow TR = new TableRow();

        //    TableCell cell1 = new TableCell();
        //    TextBox TB_tmp1 = new TextBox();
        //    TB_tmp1.ID = "TB_" + RowID.ToString() + "_1";
        //    //TB_tmp1.Text = Number;
        //    TB_tmp1.Text = (RowID+1).ToString();
        //    TB_tmp1.Enabled = false;
        //    TB_tmp1.ReadOnly = true;
        //    cell1.Controls.Add(TB_tmp1);

        //    TR.Cells.Add(cell1);

        //    TableCell cell11 = new TableCell();
        //    TextBox TB_tmp11 = new TextBox();
        //    TB_tmp11.ID = "TB_" + RowID.ToString() + "_11";
        //    TB_tmp11.Text = Stage;
        //    cell11.Controls.Add(TB_tmp11);

        //    TR.Cells.Add(cell11);

        //    TableCell cell2 = new TableCell();
        //    TextBox TB_tmp2 = new TextBox();
        //    TB_tmp2.ID = "TB_" + RowID.ToString() + "_2";
        //    TB_tmp2.Text = ItemName;
        //    cell2.Controls.Add(TB_tmp2);
        //    TR.Cells.Add(cell2);

        //    TableCell cell3 = new TableCell();
        //    TextBox TB_tmp3 = new TextBox();
        //    TB_tmp3.ID = "TB_" + RowID.ToString() + "_3";
        //    cell3.Controls.Add(TB_tmp3);
        //    TR.Cells.Add(cell3);

        //    TableCell cell4 = new TableCell();
        //    TextBox TB_tmp4 = new TextBox();
        //    TB_tmp4.ID = "TB_" + RowID.ToString() + "_4";
        //    cell4.Controls.Add(TB_tmp4);
        //    TR.Cells.Add(cell4);

        //    //產生表格
        //    Tbl_Input.Rows.Add(TR);
        //}

        public void Make_row(int RowID, string[] Item, string[] IID)
        {
            TableRow TR = new TableRow();

            TableCell cell1 = new TableCell();
            TextBox TB_tmp1 = new TextBox();
            TB_tmp1.ID = "TB_" + RowID.ToString() + "_1";
            TB_tmp1.Text = (RowID + 1).ToString();
            TB_tmp1.Enabled = false;
            TB_tmp1.ReadOnly = true;
            cell1.Controls.Add(TB_tmp1);

            TR.Cells.Add(cell1);

            TableCell cell11 = new TableCell();
            DropDownList DDL11 = new DropDownList();
            DDL11.ID = "DDL_" + RowID.ToString() + "_11";
            for (int i = 0; i < Item.Length; i++)
            {
                ListItem LI = new ListItem();
                LI.Text = Item[i];
                LI.Value = IID[i];
                DDL11.Items.Add(LI);
            }
            DDL11.SelectedIndex = 0;
            DDL11.DataBind();
            cell11.Controls.Add(DDL11);

            TR.Cells.Add(cell11);

            TableCell cell2 = new TableCell();
            TextBox TB_tmp2 = new TextBox();
            TB_tmp2.ID = "TB_" + RowID.ToString() + "_2";
            cell2.Controls.Add(TB_tmp2);
            TR.Cells.Add(cell2);

            TableCell cell3 = new TableCell();
            TextBox TB_tmp3 = new TextBox();
            TB_tmp3.ID = "TB_" + RowID.ToString() + "_3";
            cell3.Controls.Add(TB_tmp3);
            TR.Cells.Add(cell3);

            TableCell cell4 = new TableCell();
            TextBox TB_tmp4 = new TextBox();
            TB_tmp4.ID = "TB_" + RowID.ToString() + "_4";
            cell4.Controls.Add(TB_tmp4);
            TR.Cells.Add(cell4);

            //產生表格
            Tbl_Input.Rows.Add(TR);
        }

        public void Make_row_with_data(int RowID, string Number, string Stage, string[] ItemName, string[] IID)
        {
            TableRow TR = new TableRow();

            TableCell cell1 = new TableCell();
            TextBox TB_tmp1 = new TextBox();
            TB_tmp1.ID = "TB_" + RowID.ToString() + "_1";
            //TB_tmp1.Text = Number;
            TB_tmp1.Text = (RowID + 1).ToString();
            TB_tmp1.Enabled = false;
            TB_tmp1.ReadOnly = true;
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
            //DDL_tmp11.DataSource = ItemName;
            DDL_tmp11.SelectedIndex = 0;
            DDL_tmp11.DataBind();
            cell11.Controls.Add(DDL_tmp11);
            //TextBox TB_tmp11 = new TextBox();
            //TB_tmp11.ID = "TB_" + RowID.ToString() + "_11";
            //TB_tmp11.Text = Stage;
            //cell11.Controls.Add(TB_tmp11);

            TR.Cells.Add(cell11);

            TableCell cell2 = new TableCell();
            TextBox TB_tmp2 = new TextBox();
            TB_tmp2.ID = "TB_" + RowID.ToString() + "_2";
            //TB_tmp2.Text = ItemName;
            cell2.Controls.Add(TB_tmp2);
            TR.Cells.Add(cell2);

            TableCell cell3 = new TableCell();
            TextBox TB_tmp3 = new TextBox();
            TB_tmp3.ID = "TB_" + RowID.ToString() + "_3";
            cell3.Controls.Add(TB_tmp3);
            TR.Cells.Add(cell3);

            TableCell cell4 = new TableCell();
            TextBox TB_tmp4 = new TextBox();
            TB_tmp4.ID = "TB_" + RowID.ToString() + "_4";
            cell4.Controls.Add(TB_tmp4);
            TR.Cells.Add(cell4);

            //產生表格
            Tbl_Input.Rows.Add(TR);
        }

        public void Make_result_table(Activity[] list)
        {
            int num = list.Length;
            Tbl_Output.Visible = true;
            for (int i = 0; i < num; i++)
            {
                Make_result_row(list[i], i);
            }
        }

        public void Make_result_row(Activity list, int nowindex)
        {
            TableRow TR = new TableRow();

            TableCell cell1 = new TableCell();
            Label lbl_1 = new Label();
            lbl_1.Text = list.Id;
            cell1.Controls.Add(lbl_1);
            TR.Cells.Add(cell1);

            TableCell cell2 = new TableCell();
            Label lbl_2 = new Label();
            lbl_2.Text = list.Description;
            cell2.Controls.Add(lbl_2);
            TR.Cells.Add(cell2);

            TableCell cell3 = new TableCell();
            Label lbl_3 = new Label();
            lbl_3.Text = list.Duration.ToString();
            cell3.Controls.Add(lbl_3);
            TR.Cells.Add(cell3);

            TableCell cell4 = new TableCell();
            Label lbl_4 = new Label();
            lbl_4.Text = list.Est.ToString();
            cell4.Controls.Add(lbl_4);
            TR.Cells.Add(cell4);

            TableCell cell5 = new TableCell();
            Label lbl_5 = new Label();
            lbl_5.Text = list.Eet.ToString();
            cell5.Controls.Add(lbl_5);
            TR.Cells.Add(cell5);

            TableCell cell6 = new TableCell();
            Label lbl_6 = new Label();
            lbl_6.Text = list.Lst.ToString();
            cell6.Controls.Add(lbl_6);
            TR.Cells.Add(cell6);

            TableCell cell7 = new TableCell();
            Label lbl_7 = new Label();
            lbl_7.Text = list.Let.ToString();
            cell7.Controls.Add(lbl_7);
            TR.Cells.Add(cell7);

            TableCell cell8 = new TableCell();
            Label lbl_8 = new Label();
            if ((list.Eet - list.Let == 0) && (list.Est - list.Lst == 0))
            {
                lbl_8.Text = "*";
            }
            else
            {
                lbl_8.Text = "";
            }
            cell8.Controls.Add(lbl_8);
            TR.Cells.Add(cell8);

            TableCell cell9 = new TableCell();
            Label lbl_9 = new Label();
            DateTime DT;
            var isDate = DateTime.TryParse(TB_StartDay.Text, out DT);
            if (isDate)
            {
                lbl_9.Text = DT.AddDays(list.Est).ToString("yyyy/MM/dd");
            }

            cell9.Controls.Add(lbl_9);
            TR.Cells.Add(cell9);

            TableCell cell91 = new TableCell();
            Label lbl_91 = new Label();
            if (isDate)
            {
                lbl_91.Text = DT.AddDays(list.Eet).ToString("yyyy/MM/dd");
            }
            cell91.Controls.Add(lbl_91);
            TR.Cells.Add(cell91);

            TableCell cell92 = new TableCell();
            Label lbl_92 = new Label();
            if (isDate)
            {
                lbl_92.Text = DT.AddDays(list.Lst).ToString("yyyy/MM/dd");
            }
            cell92.Controls.Add(lbl_92);
            TR.Cells.Add(cell92);

            TableCell cell10 = new TableCell();
            Label lbl_10 = new Label();
            if (isDate)
            {
                lbl_10.Text = DT.AddDays(list.Let).ToString("yyyy/MM/dd");
            }


            cell10.Controls.Add(lbl_10);
            TR.Cells.Add(cell10);

            TableCell cell11 = new TableCell();
            TextBox TB_11 = new TextBox();
            TB_11.ID = "TB_" + nowindex.ToString() + "_startdate";
            TB_11.Text = lbl_9.Text;
            TB_11.TextMode = TextBoxMode.Date;
            if (lbl_8.Text == "*")
            {
                TB_11.ReadOnly = true;
            }
            else
            {
                TB_11.Attributes.Add("onclick", "WdatePicker(({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy/MM/dd',alwaysUseStartDate:true}));");
                TB_11.Attributes.Add("onchange", "alerttime(this.value,'" + lbl_9.Text + "','" + lbl_91.Text + "');");
            }

            cell11.Controls.Add(TB_11);
            TR.Cells.Add(cell11);

            TableCell cell12 = new TableCell();
            TextBox TB_12 = new TextBox();
            TB_12.ID = "TB_" + nowindex.ToString() + "_enddate";
            TB_12.Text = lbl_10.Text;
            TB_12.TextMode = TextBoxMode.Date;
            if (lbl_8.Text == "*")
            {
                TB_12.ReadOnly = true;
            }
            else
            {
                TB_12.Attributes.Add("onclick", "WdatePicker(({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy/MM/dd',alwaysUseStartDate:true}));");
                TB_12.Attributes.Add("onchange", "alerttime(this.value,'" + lbl_92.Text + "','" + lbl_10.Text + "');");
            }

            cell12.Controls.Add(TB_12);
            TR.Cells.Add(cell12);

            TR.Cells[0].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[1].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[2].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[3].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[4].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[5].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[6].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[7].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[8].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[9].HorizontalAlign = HorizontalAlign.Center;
            //產生表格
            Tbl_Output.Rows.Add(TR);
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

        private void CriticalPath(Activity[] list)
        {
            Label2.Text = "要徑項目:";

            foreach (Activity activity in list)
            {
                if ((activity.Eet - activity.Let == 0) && (activity.Est - activity.Lst == 0))
                {
                    Label2.Text += activity.Description + ",";
                    //Console.Write("{0} ", activity.Id);
                }

            }

            Label2.Text = Label2.Text.Substring(0, Label2.Text.Length - 1);
            Label2.Text += "，總工期為： " + list[list.Length - 1].Eet;
            //Console.Write("\n\n         Total duration: {0}\n\n", list[list.Length - 1].Eet);
        }
        /// <summary>
        /// 將運算結果存到資料庫
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Btn_Save_Click(object sender, EventArgs e)
        {
            if (Session["ProjectCode"] == null)
            {
                Response.Write("<script>alert('請先選擇專案!');</script>");
            }
            Activity[] list = (Activity[])Session["all_stage"];
            int num = int.Parse(Session["Activities"].ToString());
            string[] LayerCode = new string[num];
            string[] ItemOrder = new string[num];
            string[] Item = new string[num];
            string[] IID = new string[num];
            int[] Duration = new int[num];
            string[] Prework_LayerCode = new string[num];
            int[] ES = new int[num];
            int[] EE = new int[num];
            int[] LS = new int[num];
            int[] LE = new int[num];
            bool[] CP = new bool[num];

            DateTime[] SD = new DateTime[num];
            DateTime[] ED = new DateTime[num];

            for (int i=0;i<num;i++)
            {
                LayerCode[i] = list[i].Id;
                DropDownList DDL11 = (DropDownList)Tbl_Input.Rows[i].FindControl("DDL_" + i.ToString() + "_11");
                TextBox TB4 = (TextBox)Tbl_Input.Rows[i].FindControl("TB_" + i.ToString() + "_4");
                //ItemOrder[i] = DDL11.SelectedValue;
                IID[i] = DDL11.SelectedValue;
                ItemOrder[i] = DDL11.SelectedItem.Text;
                //ItemOrder[i] = TB11.Text;
                Item[i] = list[i].Description;
                Duration[i] = list[i].Duration;
                Prework_LayerCode[i] = TB4.Text;
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

                //TextBox TB_SD = (TextBox)Tbl_Output.Rows[i].FindControl("TB_" + i.ToString() + "_startdate");
                //TextBox TB_ED = (TextBox)Tbl_Output.Rows[i].FindControl("TB_" + i.ToString() + "_enddate");
                //SD[i] = DateTime.Parse(TB_SD.Text);
                //ED[i] = DateTime.Parse(TB_ED.Text);
            }
            //儲存結果至資料庫
            //bool result = DAL.ProgressMode.Write_Progress_Result(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), LayerCode, ItemOrder, Item, Duration, Prework_LayerCode, ES, EE, LS, LE, CP);
            bool result = DAL.ProgressMode.Write_Progress_Result(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), LayerCode, ItemOrder, Item, Duration, Prework_LayerCode, ES, EE, LS, LE, CP, IID);
            if (result)
            {
                Response.Write("<script>alert('已成功儲存至資料庫');</script>");
            }
            else
            {
                Response.Write("<script>alert('儲存失敗');</script>");
            }
            Btn2_Click(null, null);
        }
        /// <summary>
        /// 根據資料庫資料列出input及output表格
        /// </summary>
        /// <param name="output"></param>
        public void Make_result_table_with_data(string[] output)
        {
            string[] LayerCode = output[0].Split(',');
            string[] ItemOrder = output[1].Split(',');
            string[] Item = output[2].Split(',');
            string[] temp = output[3].Split(',');
            int[] Duration = new int[temp.Length];
            for (int i = 0; i < temp.Length; i++)
            {
                Duration[i] = int.Parse(temp[i]);
            }
            string[] Prework_LayerCode = output[4].Split(';');
            string[] temp5 = output[5].Split(',');
            string[] temp6 = output[6].Split(',');
            string[] temp7 = output[7].Split(',');
            string[] temp8 = output[8].Split(',');
            string[] temp9 = output[9].Split(',');
            int[] ES = new int[temp5.Length];
            int[] EE = new int[temp6.Length];
            int[] LS = new int[temp7.Length];
            int[] LE = new int[temp8.Length];
            bool[] CP = new bool[temp9.Length];
            for (int i = 0; i < temp5.Length; i++)
            {
                ES[i] = int.Parse(temp5[i]);
                EE[i] = int.Parse(temp6[i]);
                LS[i] = int.Parse(temp7[i]);
                LE[i] = int.Parse(temp8[i]);
                CP[i] = bool.Parse(temp9[i]);
            }
            int num = temp.Length;
            Tbl_Output.Visible = true;
            string[] data = DAL.ProgressMode.Get_All_Layer_Item(Session["DatabaseName"].ToString(), "XBid1DB");
            string[] allItem = DAL.ProgressMode.LayerItem_Resort(data[0], data[1], data[2]).Split(',');
            //string[] allItem = data[2].Split(',');
            for (int i = 0; i < num; i++)
            {
                Make_result_row_with_data(LayerCode[i],Item[i],Duration[i],ES[i],EE[i],LS[i],LE[i],CP[i]);
                Make_row_with_fulldata(i, LayerCode[i], ItemOrder[i], Item[i], Duration[i], Prework_LayerCode[i], allItem, data[3].Split(','));
            }
            Session["Activities"] = num;
        }
        
        /// <summary>
        /// 根據資料輸出Output表格
        /// </summary>
        /// <param name="LayerCode"></param>
        /// <param name="Item"></param>
        /// <param name="Duration"></param>
        /// <param name="ES"></param>
        /// <param name="EE"></param>
        /// <param name="LS"></param>
        /// <param name="LE"></param>
        /// <param name="CP"></param>
        public void Make_result_row_with_data(string LayerCode, string Item, int Duration, int ES, int EE, int LS, int LE, bool CP)
        {
            TableRow TR = new TableRow();

            TableCell cell1 = new TableCell();
            Label lbl_1 = new Label();
            lbl_1.Text = LayerCode;
            cell1.Controls.Add(lbl_1);
            TR.Cells.Add(cell1);

            TableCell cell2 = new TableCell();
            Label lbl_2 = new Label();
            lbl_2.Text = Item;
            cell2.Controls.Add(lbl_2);
            TR.Cells.Add(cell2);

            TableCell cell3 = new TableCell();
            Label lbl_3 = new Label();
            lbl_3.Text = Duration.ToString();
            cell3.Controls.Add(lbl_3);
            TR.Cells.Add(cell3);

            TableCell cell4 = new TableCell();
            Label lbl_4 = new Label();
            lbl_4.Text = ES.ToString();
            cell4.Controls.Add(lbl_4);
            TR.Cells.Add(cell4);

            TableCell cell5 = new TableCell();
            Label lbl_5 = new Label();
            lbl_5.Text = EE.ToString();
            cell5.Controls.Add(lbl_5);
            TR.Cells.Add(cell5);

            TableCell cell6 = new TableCell();
            Label lbl_6 = new Label();
            lbl_6.Text = LS.ToString();
            cell6.Controls.Add(lbl_6);
            TR.Cells.Add(cell6);

            TableCell cell7 = new TableCell();
            Label lbl_7 = new Label();
            lbl_7.Text = LE.ToString();
            cell7.Controls.Add(lbl_7);
            TR.Cells.Add(cell7);

            TableCell cell8 = new TableCell();
            Label lbl_8 = new Label();
            if (CP)
            {
                lbl_8.Text = "*";
            }
            else
            {
                lbl_8.Text = "";
            }
            cell8.Controls.Add(lbl_8);
            TR.Cells.Add(cell8);
            
            TableCell cell9 = new TableCell();
            Label lbl_9 = new Label();
            DateTime DT;
            var isDate = DateTime.TryParse(TB_StartDay.Text, out DT);
            if (isDate)
            {
                lbl_9.Text = DT.AddDays(ES).ToString("yyyy/MM/dd");
            }

            cell9.Controls.Add(lbl_9);
            TR.Cells.Add(cell9);

            TableCell cell91 = new TableCell();
            Label lbl_91 = new Label();
            if (isDate)
            {
                lbl_91.Text = DT.AddDays(EE).ToString("yyyy/MM/dd");
            }
            cell91.Controls.Add(lbl_91);
            TR.Cells.Add(cell91);

            TableCell cell92 = new TableCell();
            Label lbl_92 = new Label();
            if (isDate)
            {
                lbl_92.Text = DT.AddDays(LS).ToString("yyyy/MM/dd");
            }
            cell92.Controls.Add(lbl_92);
            TR.Cells.Add(cell92);

            TableCell cell10 = new TableCell();
            Label lbl_10 = new Label();
            if (isDate)
            {
                lbl_10.Text = DT.AddDays(LE).ToString("yyyy/MM/dd");
            }


            cell10.Controls.Add(lbl_10);
            TR.Cells.Add(cell10);

            TableCell cell11 = new TableCell();
            TextBox TB_11 = new TextBox();
            TB_11.Text = lbl_9.Text;
            if (lbl_8.Text == "*")
            {
                TB_11.ReadOnly = true;
            }
            else
            {
                TB_11.Attributes.Add("onclick", "WdatePicker(({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy/MM/dd',alwaysUseStartDate:true}));");
                TB_11.Attributes.Add("onchange", "alerttime(this.value,'" + lbl_9.Text + "','" + lbl_91.Text + "');");
            }

            cell11.Controls.Add(TB_11);
            TR.Cells.Add(cell11);

            TableCell cell12 = new TableCell();
            TextBox TB_12 = new TextBox();
            TB_12.Text = lbl_10.Text;
            
            if (lbl_8.Text == "*")
            {
                TB_12.ReadOnly = true;
            }
            else
            {
                TB_12.Attributes.Add("onclick", "WdatePicker(({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy/MM/dd',alwaysUseStartDate:true}));");
                TB_12.Attributes.Add("onchange", "alerttime(this.value,'" + lbl_92.Text + "','" + lbl_10.Text + "');");
            }

            cell12.Controls.Add(TB_12);
            TR.Cells.Add(cell12);

            TR.Cells[0].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[1].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[2].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[3].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[4].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[5].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[6].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[7].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[8].HorizontalAlign = HorizontalAlign.Center;
            TR.Cells[9].HorizontalAlign = HorizontalAlign.Center;

            //產生表格
            Tbl_Output.Rows.Add(TR);
        }

       /// <summary>
       /// 根據資料庫資料輸出INPUT表格
       /// </summary>
       /// <param name="RowID"></param>
       /// <param name="Number"></param>
       /// <param name="Stage"></param>
       /// <param name="ItemName"></param>
       /// <param name="Duration"></param>
       /// <param name="PreWork"></param>
       /// <param name="Item"></param>
       /// <param name="IID"></param>
        public void Make_row_with_fulldata(int RowID, string Number, string Stage, string ItemName, int Duration, string PreWork, string[] Item, string[] IID)
        {
            TableRow TR = new TableRow();

            TableCell cell1 = new TableCell();
            TextBox TB_tmp1 = new TextBox();
            TB_tmp1.ID = "TB_" + RowID.ToString() + "_1";
            TB_tmp1.Width = 20;
            TB_tmp1.ReadOnly = true;
            TB_tmp1.Enabled = false;
            TB_tmp1.Text = Number;
            cell1.Controls.Add(TB_tmp1);

            TR.Cells.Add(cell1);

            TableCell cell11 = new TableCell();
            DropDownList DDL11 = new DropDownList();
            for (int i = 0; i < Item.Length; i++)
            {
                ListItem LI = new ListItem();
                LI.Text = Item[i];
                LI.Value = IID[i];
                DDL11.Items.Add(LI);
            }

            DDL11.ID = "DDL_" + RowID.ToString() + "_11";
            DDL11.Width = 100;
            DDL11.SelectedItem.Text = Stage;
            DDL11.DataBind();
            cell11.Controls.Add(DDL11);
            TR.Cells.Add(cell11);

            TableCell cell2 = new TableCell();
            TextBox TB_tmp2 = new TextBox();
            TB_tmp2.ID = "TB_" + RowID.ToString() + "_2";
            TB_tmp2.Text = ItemName;
            TB_tmp2.Width = 100;
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
            TB_tmp4.Text = PreWork;
            TB_tmp4.Width = 100;
            cell4.Controls.Add(TB_tmp4);
            TR.Cells.Add(cell4);

            //產生表格
            Tbl_Input.Rows.Add(TR);
        }

        protected void Btn_load_Click(object sender, EventArgs e)
        {
            string[] output = new string[10];
            
            //讀取資料庫已儲存結果
            bool result = DAL.ProgressMode.Get_Progress_Result(Session["DatabaseName"].ToString(), Session["ProjectCode"].ToString(), out output);
            if (result)
            {
                Tbl_Input.Rows.Clear();
                TableHeaderRow THR = new TableHeaderRow();
                TableHeaderCell THC1 = new TableHeaderCell();
                TableHeaderCell THC2 = new TableHeaderCell();
                TableHeaderCell THC3 = new TableHeaderCell();
                TableHeaderCell THC4 = new TableHeaderCell();
                TableHeaderCell THC5 = new TableHeaderCell();
                THR.Width = 340;
                THC1.Text = "作業編號";
                THC2.Text = "隸屬項目";
                THC3.Text = "作業名稱";
                THC4.Text = "工期";
                THC5.Text = "前置作業編號";
                THC1.Width = 20;
                THC3.Width = 200;
                THC4.Width = 20;
                THC5.Width = 100;
                THR.Cells.Add(THC1);
                THR.Cells.Add(THC2);
                THR.Cells.Add(THC3);
                THR.Cells.Add(THC4);
                THR.Cells.Add(THC5);
                Tbl_Input.Rows.Add(THR);

                Make_result_table_with_data(output);
            }
            
        }
    }
}