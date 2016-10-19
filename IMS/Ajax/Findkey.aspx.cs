using DAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS.Ajax
{
    public partial class Findkey : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.CacheControl = "no-cache";
	        Response.AddHeader("Pragma","no-cache");
            string sInput = "";
            string fresource = "";
            string Activity = "";
           
            if (Request["sColor"] != null)
            {
                 sInput = Request["sColor"].Trim();
            }
            if (Request["fresource"] != null)
            {
                 fresource = Request["fresource"].Trim();
            }
            if (Request["Activity"] != null)
            {
                Activity = Request["Activity"].Trim();

            }
            if (sInput.Length == 0)
            {
                //return;
            }
            else
            {
                string sResult = "";
                List<string> Module = new List<string>();
                string dbname = Session["DatabaseName"].ToString();
                string ProjectCode = Session["ProjectCode"].ToString();

                string a = PageList(dbname, ProjectCode);
                foreach (string DataName in a.Split(','))
                {
                    Module.Add(DataName);
                }
                string[] output = Module.ToArray();
                string[] aColors = output;
                //string[] aColors = new string[]{"aliceblue","antiquewith","aquamarine","azure","beige","bisque","black","blanchedalmond","blue","blueviolet","brass","bronze","brown","burlywood","cadetblue","chartreuse","chocolate","copper","coral","cornfloewrblue","cornsilk","cyan","darkblue","darkcyan","darkgoldenrod","darkgray","darkgreen","darkhaki","darkmagenta","darkolivegreen","darkorchid","darkorenge","darkred","darksalmon","darkseagreen","darkslateblue","darkslategray","darkturquoise","darkviolet","deeppink","deepskyblue","dimgray","dodgerblue","feldspar","firebrick","floralwhite","forestgreen","fuchsia","gainsboro","gold","goldenrod","golenrod","gostwhite","gray","green","greenyellow","honeydew","hotpink","indianred","inen","ivory","khaki","lavender","lavenderblush","lawngreen","lemonchiffon","lightblue","lightcoral","lightcyan","lightgodenrod","lightgodenrodyellow","lightgray","lightgreen","lightpink","lightsalmon","lightseagreen","lightskyblue","lightslateblue","lightslategray","lightsteelblue","lightyellow","lime","limegreen","magenta","magenta","maroom","maroon","mediumaquamarine","mediumblue","mediumorchid","mediumpurpul","mediumseagreen","mediumslateblue","mediumspringgreen","mediumturquoise","mediumvioletred","midnightblue","mintcream","mistyrose","moccasin","navajowhite","navy","navyblue","oldlace","olivedrab","orange","orchid","orengered","palegodenrod","palegreen","paleturquoise","palevioletred","papayawhip","peachpuff","peru","pink","plum","powderblue","purple","quartz","red","rosybrown","royalblue","saddlebrown","salmon","sandybrown","scarlet","seagreen","seashell","sienna","silver","skyblue","slategray","snow","springgreen","steelblue","tan","thistle","tomato","turquoise","violet","violetred","wheat","whitesmoke","yellow","yellowgreen"};

                for (int i = 0; i < aColors.Length; i++)
                {
                    if (aColors[i].IndexOf(sInput) == 0)
                        sResult += aColors[i] + ",";
                }
           
	        if(sResult.Length>0)									//如果有匹配項
		        sResult = sResult.Substring(0,sResult.Length-1);	//去掉最後的“,”號
	        Response.Write(sResult);
            }
            if (fresource.Length == 0)
            {
                //return;
            }
            else
            {
                string FResult = "";
                List<string> Module = new List<string>();
                string dbname = Session["DatabaseName"].ToString();
                string ProjectCode = Session["ProjectCode"].ToString();

                string a = PageListRes(dbname, ProjectCode);
                foreach (string DataName in a.Split(','))
                {
                    Module.Add(DataName);
                }
                string[] output = Module.ToArray();
                string[] aColors = output;
                //string[] aColors = new string[]{"aliceblue","antiquewith","aquamarine","azure","beige","bisque","black","blanchedalmond","blue","blueviolet","brass","bronze","brown","burlywood","cadetblue","chartreuse","chocolate","copper","coral","cornfloewrblue","cornsilk","cyan","darkblue","darkcyan","darkgoldenrod","darkgray","darkgreen","darkhaki","darkmagenta","darkolivegreen","darkorchid","darkorenge","darkred","darksalmon","darkseagreen","darkslateblue","darkslategray","darkturquoise","darkviolet","deeppink","deepskyblue","dimgray","dodgerblue","feldspar","firebrick","floralwhite","forestgreen","fuchsia","gainsboro","gold","goldenrod","golenrod","gostwhite","gray","green","greenyellow","honeydew","hotpink","indianred","inen","ivory","khaki","lavender","lavenderblush","lawngreen","lemonchiffon","lightblue","lightcoral","lightcyan","lightgodenrod","lightgodenrodyellow","lightgray","lightgreen","lightpink","lightsalmon","lightseagreen","lightskyblue","lightslateblue","lightslategray","lightsteelblue","lightyellow","lime","limegreen","magenta","magenta","maroom","maroon","mediumaquamarine","mediumblue","mediumorchid","mediumpurpul","mediumseagreen","mediumslateblue","mediumspringgreen","mediumturquoise","mediumvioletred","midnightblue","mintcream","mistyrose","moccasin","navajowhite","navy","navyblue","oldlace","olivedrab","orange","orchid","orengered","palegodenrod","palegreen","paleturquoise","palevioletred","papayawhip","peachpuff","peru","pink","plum","powderblue","purple","quartz","red","rosybrown","royalblue","saddlebrown","salmon","sandybrown","scarlet","seagreen","seashell","sienna","silver","skyblue","slategray","snow","springgreen","steelblue","tan","thistle","tomato","turquoise","violet","violetred","wheat","whitesmoke","yellow","yellowgreen"};

                for (int i = 0; i < aColors.Length; i++)
                {
                    if (aColors[i].IndexOf(fresource) == 0)
                        FResult += aColors[i] + ",";
                }

                if (FResult.Length > 0)									//如果有匹配項
                    FResult = FResult.Substring(0, FResult.Length - 1);	//去掉最後的“,”號
                Response.Write(FResult);
            }
            if (Activity.Length == 0)
            {
                return;
            }
            else
            {
                string FResult = "";
                List<string> Module = new List<string>();
                string dbname = Session["DatabaseName"].ToString();
                string ProjectCode = Session["ProjectCode"].ToString();

                string a = PageListAct(dbname, ProjectCode);
                foreach (string DataName in a.Split(','))
                {
                    Module.Add(DataName);
                }
                string[] output = Module.ToArray();
                string[] aColors = output;
                //string[] aColors = new string[]{"aliceblue","antiquewith","aquamarine","azure","beige","bisque","black","blanchedalmond","blue","blueviolet","brass","bronze","brown","burlywood","cadetblue","chartreuse","chocolate","copper","coral","cornfloewrblue","cornsilk","cyan","darkblue","darkcyan","darkgoldenrod","darkgray","darkgreen","darkhaki","darkmagenta","darkolivegreen","darkorchid","darkorenge","darkred","darksalmon","darkseagreen","darkslateblue","darkslategray","darkturquoise","darkviolet","deeppink","deepskyblue","dimgray","dodgerblue","feldspar","firebrick","floralwhite","forestgreen","fuchsia","gainsboro","gold","goldenrod","golenrod","gostwhite","gray","green","greenyellow","honeydew","hotpink","indianred","inen","ivory","khaki","lavender","lavenderblush","lawngreen","lemonchiffon","lightblue","lightcoral","lightcyan","lightgodenrod","lightgodenrodyellow","lightgray","lightgreen","lightpink","lightsalmon","lightseagreen","lightskyblue","lightslateblue","lightslategray","lightsteelblue","lightyellow","lime","limegreen","magenta","magenta","maroom","maroon","mediumaquamarine","mediumblue","mediumorchid","mediumpurpul","mediumseagreen","mediumslateblue","mediumspringgreen","mediumturquoise","mediumvioletred","midnightblue","mintcream","mistyrose","moccasin","navajowhite","navy","navyblue","oldlace","olivedrab","orange","orchid","orengered","palegodenrod","palegreen","paleturquoise","palevioletred","papayawhip","peachpuff","peru","pink","plum","powderblue","purple","quartz","red","rosybrown","royalblue","saddlebrown","salmon","sandybrown","scarlet","seagreen","seashell","sienna","silver","skyblue","slategray","snow","springgreen","steelblue","tan","thistle","tomato","turquoise","violet","violetred","wheat","whitesmoke","yellow","yellowgreen"};

                for (int i = 0; i < aColors.Length; i++)
                {
                    if (aColors[i].IndexOf(Activity) == 0)
                        FResult += aColors[i] + ",";
                }

                if (FResult.Length > 0)									//如果有匹配項
                    FResult = FResult.Substring(0, FResult.Length - 1);	//去掉最後的“,”號
                Response.Write(FResult);
            }
        }
        public static string PageList(string dbname, string ProjectCode)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("SELECT ItemName FROM EBudget_WBS  WHERE PID =" + ProjectCode + " Order By order_Num", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                    return result;
                                }
                                else
                                {
                                    //result[0] += reader.GetInt32(0).ToString() + ",";
                                    result += reader.GetString(0) + ",";
                                }
                            }
                        }
                    }

                    conn.Close();
                    //for (int j = 0; j < 1; j++)
                    //{
                    //    if (result[j].Length > 0)
                    //    {
                    //        result[j] = result[j].Substring(0, result[j].Length - 1);
                    //    }
                    //}
                }
            }
            catch (SqlException ex)
            {
                Console.Write(ex.ToString());
                //Log exception
                //Display Error message
            }
            return result;
        }
        public static string PageListRes(string dbname, string ProjectCode)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("SELECT ItemName FROM EBudget_WBS  WHERE ResourceNY=1 and PID =" + ProjectCode + " Order By order_Num", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                    return result;
                                }
                                else
                                {
                                    //result[0] += reader.GetInt32(0).ToString() + ",";
                                    result += reader.GetString(0) + ",";
                                }
                            }
                        }
                    }

                    conn.Close();
                    //for (int j = 0; j < 1; j++)
                    //{
                    //    if (result[j].Length > 0)
                    //    {
                    //        result[j] = result[j].Substring(0, result[j].Length - 1);
                    //    }
                    //}
                }
            }
            catch (SqlException ex)
            {
                Console.Write(ex.ToString());
                //Log exception
                //Display Error message
            }
            return result;
        }
        public static string PageListAct(string dbname, string ProjectCode)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("SELECT ItemName FROM EBudget_WBS  WHERE ActivityUseNY=1 and PID =" + ProjectCode + " Order By order_Num", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                    return result;
                                }
                                else
                                {
                                    //result[0] += reader.GetInt32(0).ToString() + ",";
                                    result += reader.GetString(0) + ",";
                                }
                            }
                        }
                    }

                    conn.Close();
                    //for (int j = 0; j < 1; j++)
                    //{
                    //    if (result[j].Length > 0)
                    //    {
                    //        result[j] = result[j].Substring(0, result[j].Length - 1);
                    //    }
                    //}
                }
            }
            catch (SqlException ex)
            {
                Console.Write(ex.ToString());
                //Log exception
                //Display Error message
            }
            return result;
        }
    }
}