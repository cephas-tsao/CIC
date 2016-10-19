using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;
using System.Data;

namespace DAL
{
    public class SuperSystemManage
    {
        public static string Get_dbname_by_CompanyID(int CompanyID)
        {
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string("USER_Information");
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select [DatabaseName] from CompanyDB where CompanyID=" + CompanyID.ToString(), conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                result = reader.GetString(0);
                            }
                        }
                    }

                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                Console.Write(ex.ToString());
                //Display Error message
            }
            return result;
        }
        public static string SaveAction_OID(string database, string DataName, DataTable DBTableContent)
        {
            string Insert_UID = "0";
            string SQLString = "";

            try
            {
                //建立欄位與內容
                string SQLString_1 = "";
                string SQLString_2 = "";
                for (int i = 0; i < DBTableContent.Columns.Count; i++)
                {
                    SQLString_1 += DBTableContent.Columns[i].ColumnName + ",";
                    //if (DBTableContent.Columns[i].ColumnName == "Password")  //密碼轉型
                    //    SQLString_2 += "CONVERT(varbinary, @" + DBTableContent.Columns[i].ColumnName + "),";
                    //else
                    SQLString_2 += "@" + DBTableContent.Columns[i].ColumnName + ",";
                }
                Insert_UID = DBTableContent.Rows[0]["OID"].ToString();

                //編輯寫入語法
                SQLString = "insert into " + DataName + " " +
                                   "(" + SQLString_1.Substring(0, SQLString_1.Length - 1) + ") values " +
                                   "(" + SQLString_2.Substring(0, SQLString_2.Length - 1) + ")";
                //ConnSet con = new ConnSet();
                //string data = Utility.DBconnection.connect_string(database);
                string connectionString = Utility.DBconnection.connect_string("USER_Information");
                using (SqlConnection L_Conn = new SqlConnection(connectionString))
                {
                    using (SqlCommand SQLAction = new SqlCommand(SQLString, L_Conn))
                    {
                        for (int i = 0; i < DBTableContent.Columns.Count; i++)
                        {
                            SQLAction.Parameters.AddWithValue(DBTableContent.Columns[i].ColumnName, DBTableContent.Rows[0][DBTableContent.Columns[i].ColumnName].ToString());
                        }
                        SQLAction.CommandType = CommandType.Text;
                        L_Conn.Open();
                        SQLAction.ExecuteNonQuery();
                    }
                }

                return Insert_UID;
            }
            catch (Exception ee)
            {
                return "0";
                throw ee;
            }
            finally
            {
            }
        }
        public static bool Create_Company_Database(string dbname)
        {
            bool result = false;
            try
            {
                string connectionString = Utility.DBconnection.connect_string("USER_Information");

                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("CREATE DATABASE " + dbname + ";", conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                        if (rows > 0)
                            result = true;
                    }
                    
                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                throw ex;
                //Display Error message
            }

            return result;
        }
        /// <summary>
        /// 寫入訂單
        /// </summary>
        /// <param name="Company"></param>
        /// <param name="TaxID"></param>
        /// <param name="Payman"></param>
        /// <param name="SendAddress"></param>
        /// <param name="PClass"></param>
        /// <param name="LoginMan"></param>
        /// <returns></returns>
        public static bool Insert_Order(string Company, string TaxID, string Payman, string SendAddress, string PClass, string LoginMan)
        {
            bool result = false;
            try
            {
                //string connectionString = "Data Source=WANG-PC\\SQLEXPRESS;Initial Catalog=USER_Information;Persist Security Info=True;User ID=CICIMS;Password=ntustCIC419";
                string connectionString = Utility.DBconnection.connect_string("USER_Information");
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("Insert into [USER_Information].[dbo].[Order]([Company],[TaxID],[Payman],[SendAddress],[PClass],[LoginMan]) VALUES ('" + Company + "','" + TaxID + "','" + Payman + "','" + SendAddress + "','" + PClass + "','" + LoginMan + "')", conn))
                    {
                        int rows = cmd.ExecuteNonQuery();
                        //if (rows != 0)
                        //{
                        //    Lbl_NC.Text = "公司：" + CompanyName + "新增成功";
                        //}
                        //else
                        //{
                        //    Lbl_NC.Text = "公司" + CompanyName + "新增失敗，請再確認是否輸入正確";
                        //}
                    }

                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                throw ex;
                //Log exception
                //Display Error message
            }
            return result;

        }
        //寫入文字檔案功能函式。
        public static void StreamWriterTextFile_Fn(string strContent_Val, string strFilePath_Val)
        {
            //建立物件案例。(取得文字檔案寫入案例)
            StreamWriter objStreamWriter = new StreamWriter(strFilePath_Val);
            //將字串內容寫入緩衝區。
            objStreamWriter.Write(strContent_Val);
            //釋放使用中的資源。
            objStreamWriter.Close();
            objStreamWriter.Dispose();
        }

        //讀取文字檔案功能函式。
        public static string StreamReadTextFile_Fn(string strFilePath_Val)
        {
            //當要存取的檔案存在時。
            if (File.Exists(strFilePath_Val) == true)
            {
                //建立物件案例。(取得文字檔案讀取案例)
                StreamReader objStreamReader = new StreamReader(strFilePath_Val, Encoding.UTF8);
                //將字串內容從頭到尾讀取至緩衝區。
                string strText = objStreamReader.ReadToEnd();
                //釋放使用中的資源。
                objStreamReader.Close();
                objStreamReader.Dispose();
                //傳回結果。
                return strText;
            }
            else
            {
                //傳回結果。
                return null;
            }
        }
    }
}
