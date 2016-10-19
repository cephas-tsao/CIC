using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS.Ajax
{
    public partial class SidePage : System.Web.UI.Page
    {
        protected string asaction = string.Empty;
        int uid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.asaction = SystemSet.GetString(base.Request["action"], string.Empty);

            object data;
            switch (Request.QueryString["act"])
            {
                case "getUserMessageHistory":
                    string a;
                    a = GetUserMessageHistory();
                    Response.Write("{\"userMessageHistory\":\"" + a + "\"}");
                    break;

                case "getUserData":
                    string Keyword = base.Request["Keyword"];
                    string[] Kid;
                    Kid = SearchKeyword(Session["DatabaseName"].ToString(), Session["Projectcode"].ToString(), Keyword);
                    Response.Write("{\"getUserData\":\"" + Kid[0] + "\"}");
                    break;
                case "getReData":
                    string KeywordRe = base.Request["Keyword"];
                    string[] KidRe;
                    KidRe = SearchReKeyword(Session["DatabaseName"].ToString(), Session["Projectcode"].ToString(), KeywordRe);
                    Response.Write("{\"getReData\":\"" + KidRe[0] + "\"}");
                    break;
            }



            if (this.asaction == "open")
            {

                //string SQLString = "Select MAX(UID) as uid from Bid_WBS where bid=" + Session["Bid"].ToString() + "";
                string SQLString = "update SidePage set situation=1 where idno= (SELECT MAX(idno) FROM SidePage)";
                if (Session["DatabaseName"] !=null)
                {
                string database = Session["DatabaseName"].ToString();
                bool result = WebModel.SQLAction(database, SQLString);
                }
               
            }

            if (this.asaction == "close")
            {

                if (Session["DatabaseName"] != null)
                {
                    string SQLString = "update SidePage set situation=0 where idno= (SELECT MAX(idno) FROM SidePage)";
                    string database = Session["DatabaseName"].ToString();
                    bool result = WebModel.SQLAction(database, SQLString);
                }

            }

            if (this.asaction == "Select")
            {

                if (Session["DatabaseName"] != null)
                {
                    string SQLString = "Select situation from SidePage where idno= (SELECT MAX(idno) FROM SidePage)";
                    string database = Session["DatabaseName"].ToString();
                    string result = WebModel.SItemName(database, SQLString, "situation");
                }
            }

        }
       
        public string GetUserMessageHistory()
        {
            string SQLString = "Select situation from SidePage where idno= (SELECT MAX(idno) FROM SidePage)";
            string database = "";
            if (Session["DatabaseName"]!=null)
            {  
             database = Session["DatabaseName"].ToString();
              }
            string result = WebModel.SItemName(database, SQLString, "situation");

            return result;
        }
      
        public static string[] SearchKeyword(string dbname, string Pid,string Keyword)
        {
            string[] result = new string[2];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select EWID,ItemName from EBudget_WBS where ItemName Like '%" + Keyword + "%' and  PID=" + Pid + "", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                {
                                    result[0] += reader.GetInt32(0).ToString() + ",";
                                    result[1] += reader.GetString(1).ToString() + ",";
                                    //result[2] += reader.GetString(2) + ",";

                                }
                            }
                        }
                    }
                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            if (result[0] != null)
            {
                if (result[0].Length > 0)
                {
                    for (int i = 0; i < result.Length; i++)
                    {
                        result[i] = result[i].Substring(0, result[i].Length - 1);
                    }
                }
            }
            return result;
        }
        public static string[] SearchReKeyword(string dbname, string Pid, string Keyword)
        {
            string[] result = new string[2];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select EWID,ItemName from EBudget_WBS where ItemName Like '%" + Keyword + "%' and  PID=" + Pid + "", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                {
                                    result[0] += reader.GetInt32(0).ToString() + ",";
                                    result[1] += reader.GetString(1).ToString() + ",";
                                    //result[2] += reader.GetString(2) + ",";

                                }
                            }
                        }
                    }
                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            if (result[0] != null)
            {
                if (result[0].Length > 0)
                {
                    for (int i = 0; i < result.Length; i++)
                    {
                        result[i] = result[i].Substring(0, result[i].Length - 1);
                    }
                }
            }
            return result;
        }
    }
}