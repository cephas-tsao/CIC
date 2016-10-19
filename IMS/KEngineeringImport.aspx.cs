using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace IMS
{
    public partial class KEngineeringImport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            String Name = Session["DatabaseName"].ToString();
            String PDB = "PublicDB";

            //String DBName = "Private_Com1";
            SqlAll.ConnectionString = Utility.DBconnection.connect_string(PDB);
            SqlAll.SelectCommand = "select * from KEngineeringList ";
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int ID_class = Convert.ToInt32(e.CommandArgument);


            ID_class = ID_class % GridView1.PageSize;
            if (e.CommandName == "item") {
                string ID = ((Label)GridView1.Rows[ID_class].FindControl("ID")).Text.Trim();
                Session["PublicKEngineeringListId"] = ID;
                OpenNewWindow("KEngineeringImportItem.aspx", "700", "900");


            }
        }
        public void OpenNewWindow(string url, string height, string width)
        {

            string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=no,height=" + height + ",width=" + width + "";
            ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}', 'yourWin', '{1}');</script>", url, winFeatures));

        }

        protected void SaveAction(object sender, EventArgs e)
        {
            string data = "";
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[1].FindControl("chkCtrl") as CheckBox);
                    if (chkRow.Checked)
                    {
                        //string storid = row.Cells[0].Text;
                         string PublicKEngineeringListId = (row.Cells[0].FindControl("ID") as Label).Text;
                        //data = data + storid + "<br>";
                        String PDB = "PublicDB";
                        String dataName = Session["DatabaseName"].ToString();


                        SqlConnection PDBconnStr = new SqlConnection(Utility.DBconnection.connect_string(PDB));
                        SqlDataReader PDBreader;
                        //SqlDataReader PDBreader2;
                        PDBconnStr.Open();
                        String PDB_Com1select = "select * from KEngineeringList where  KEngineeringListId = '" + PublicKEngineeringListId + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
                        SqlCommand PDB_Com1cmd = new SqlCommand(PDB_Com1select, PDBconnStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                        PDBreader = PDB_Com1cmd.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，

                        while (PDBreader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
                        {
                            String PDBKEngineeringName= PDBreader.GetString(1);
                            Label1.Text = PDBreader.GetString(1);
                            if (datacheck(PDBKEngineeringName) == false)
                            {
                                SqlConnection PrivateconnStr = new SqlConnection(Utility.DBconnection.connect_string(dataName));
                                SqlDataReader Privatereader;
                                PrivateconnStr.Open();
                                String PrivateKEngineering = "INSERT INTO KEngineeringList(KEngineeringListName) Values('" + PDBKEngineeringName + "')";   //宣告SQL語法的字串，這邊可依照自行需求修改
                                SqlCommand Privatecmd = new SqlCommand(PrivateKEngineering, PrivateconnStr);
                                Privatecmd.ExecuteNonQuery();

                                String Private_Com1select = "select * from KEngineeringList where  KEngineeringListName = '" + PDBKEngineeringName + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
                                SqlCommand Private_Com1cmd = new SqlCommand(Private_Com1select, PrivateconnStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                                Privatereader = Private_Com1cmd.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                int? projectid = null;
                               

                                while (Privatereader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
                                {
                                    projectid = (int)Privatereader["KEngineeringListId"];//獲得ID
                                }

                                SqlConnection PDBconnStrr = new SqlConnection(Utility.DBconnection.connect_string(PDB));
                                SqlDataReader PDBreader2;
                                PDBconnStrr.Open();


                                String PDB2_Com1select = "select * from KEngineeringListItem where  KEngineeringListId = '" + PublicKEngineeringListId + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
                                SqlCommand PDB2_Com1cmd = new SqlCommand(PDB2_Com1select, PDBconnStrr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                                PDBreader2 = PDB2_Com1cmd.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，

                                while (PDBreader2.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
                                {
                                    Label3.Text = PDBreader2.GetString(1);
                                    Label4.Text = PDBreader2.GetString(2);
                                    //= PDBreader2.GetString(4);
                                    if (!PDBreader2.IsDBNull(4))
                                    {
                                        Label5.Text = PDBreader2.GetString(4);
                                       
                                    }
                                    else {
                                        Label5.Text = " ";
                                    }

                                        SqlConnection PrivateconnStrr = new SqlConnection(Utility.DBconnection.connect_string(dataName));
                                    //SqlDataReader Privatereader;
                                    PrivateconnStrr.Open();


                                    String PrivateItemKEngineering = "INSERT INTO KEngineeringListItem(KEngineeringListItemName,KEngineeringListItemPhase,KEngineeringListId,KEngineeringListItemStandard) Values('" + Label3.Text + "','" + Label4.Text + "','" + projectid + "','" + Label5.Text + "')";   //宣告SQL語法的字串，這邊可依照自行需求修改
                                    SqlCommand PrivateItemcmd = new SqlCommand(PrivateItemKEngineering, PrivateconnStrr);
                                    PrivateItemcmd.ExecuteNonQuery();


                                    PrivateconnStrr.Close();
                                 }
                               
                                PDBreader2.Close();
                                PDBconnStrr.Close();
                                Privatereader.Close();
                                PrivateconnStr.Close();
                                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('匯入成功');", true);
                                Response.Write("<script>window.opener.location.href=window.opener.location.href;</script>");
                            } else
                            {


                                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('已有相同檢查表');", true);

                            }

                        }




                        PDBreader.Close();
                        PDBconnStr.Close();







                    }
                }
            }
            //Label1.Text = data;

        }
        protected void BtnBack_Click1(object sender, EventArgs e)
        {
            //Response.Write("<script language='javascript'></" + "script>");
            Response.Write("<script>window.opener.location.href=window.opener.location.href;window.close();</script>");
        }


        public bool datacheck(string data)
        {
            int i = 0;
            String name;
            string database = Session["DatabaseName"].ToString();
            SqlConnection connStr = new SqlConnection(Utility.DBconnection.connect_string(database));
            SqlDataReader reader;   //宣告一個DataReader

            connStr.Open();

            String select1 = "select * from KEngineeringList where KEngineeringListName = '" + data + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
            SqlCommand cmd1 = new SqlCommand(select1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
            reader = cmd1.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
                                             //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

            while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
            {
                name = reader.GetString(1);
                i = i + 1;
            }
            connStr.Close();
           
            if (i != 0)
            {

                return true;
            }
            else
            {

                return false;
            }

        }
    }
    }