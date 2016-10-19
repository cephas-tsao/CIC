using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;


namespace DAL
{
    /// <summary>
    /// WebModel 的摘要描述
    /// </summary>
    public class WebModel
    {
        //建立資料 ξγ  
        /// <summary>
        /// 建立資料
        /// </summary>
        /// <param name="DataName">資料名稱</param>
        /// <param name="DBTableContent">建立內容Table</param>
        /// <returns></returns>
        public static string SaveAction(string database,string DataName, DataTable DBTableContent)
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
                //Insert_UID = DBTableContent.Rows[0]["UID"].ToString();

                //編輯寫入語法
                SQLString = "insert into " + DataName + " " +
                                   "(" + SQLString_1.Substring(0, SQLString_1.Length - 1) + ") values " +
                                   "(" + SQLString_2.Substring(0, SQLString_2.Length - 1) + ")";
                //ConnSet con = new ConnSet();
                string data = Utility.DBconnection.connect_string(database);
                using (SqlConnection L_Conn = new SqlConnection(data))
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

                return "1";
            
            }
            catch (Exception ex)
            {
                throw ex;                
            }
            finally
            {
            }
        }
        //建立資料 ξγ  
        /// <summary>
        /// 建立資料-投標管理模組
        /// </summary>
        /// <param name="DataName">資料名稱</param>
        /// <param name="DBTableContent">建立內容Table</param>
        /// <returns></returns>
        public static string SaveAction_BID(string database, string DataName, DataTable DBTableContent)
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
                Insert_UID = DBTableContent.Rows[0]["BID"].ToString();

                //編輯寫入語法
                SQLString = "insert into " + DataName + " " +
                                   "(" + SQLString_1.Substring(0, SQLString_1.Length - 1) + ") values " +
                                   "(" + SQLString_2.Substring(0, SQLString_2.Length - 1) + ")";
                //ConnSet con = new ConnSet();
                string data = Utility.DBconnection.connect_string(database);
                using (SqlConnection L_Conn = new SqlConnection(data))
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
        //取得資料_多筆
        /// <summary>
        /// 取得資料_多筆
        /// </summary>
        /// <param name="DataName">資料名稱</param>
        /// <param name="GUID">GUID</param>
        /// <param name="InString">SQL欄位</param>
        /// <returns></returns>
        public static DataTable LoadContentData(string database,string DataName, string uid, string InString)
        {
            DataTable DataTableBox = null;
            try
            {
                DataTableBox = new DataTable();
                string SQLString = "select " + InString + " from " + DataName + " where uid=@uid";
                string data = Utility.DBconnection.connect_string(database);
                using (SqlConnection L_Conn = new SqlConnection(data))
                {
                    using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    {
                        SelectList.Parameters.AddWithValue("@uid", uid);
                        SelectList.CommandType = CommandType.Text;
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                    }
                }
                return DataTableBox;
            }
            catch
            {
                return DataTableBox;
            }
            finally
            {
                DataTableBox.Dispose();
            }
        }
        //取得資料_多筆
        /// <summary>
        /// 取得資料_多筆
        /// </summary>
        /// <param name="DataName">資料名稱</param>
        /// <param name="GUID">GUID</param>
        /// <param name="InString">SQL欄位</param>
        /// <returns></returns>
        public static DataTable LoadContentData_bid(string database, string DataName, string bid, string InString)
        {
            DataTable DataTableBox = null;
            try
            {
                DataTableBox = new DataTable();
                string SQLString = "select " + InString + " from " + DataName + " where bid=@bid";
                string data = Utility.DBconnection.connect_string(database);
                using (SqlConnection L_Conn = new SqlConnection(data))
                {
                    using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    {
                        SelectList.Parameters.AddWithValue("@bid", bid);
                        SelectList.CommandType = CommandType.Text;
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                    }
                }
                return DataTableBox;
            }
            catch
            {
                return DataTableBox;
            }
            finally
            {
                DataTableBox.Dispose();
            }
        }
        //修改資料
        /// <summary>
        /// 修改資料
        /// </summary>
        /// <param name="DataName">資料名稱</param>
        /// <param name="GUID">GUID</param>
        /// <param name="DBTableContent">修改內容</param>
        /// <returns></returns>
        public static bool EditAction(string database,string DataName, string uid, DataTable DBTableContent)
        {
            try
            {
                //    if (Session["Username"] == "")
            //    {
            //        return false;
            //    }
            //    else
            //    {
                    //編輯語法
                    string SQLString = "";
                    for (int i = 1; i < DBTableContent.Columns.Count; i++)
                    {
                        SQLString += DBTableContent.Columns[i].ColumnName + "=@" + DBTableContent.Columns[i].ColumnName + ",";
                    }

                    SQLString = "update " + DataName + " set " + SQLString.Substring(0, SQLString.Length - 1) + " ";
                    SQLString += (uid != "") ? "where uid=@uid" : "";

                    //string data = Utility.DBconnection.connect_string(database);
                    using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                    {
                        using (SqlCommand ActionSQLString = new SqlCommand(SQLString, L_Conn))
                        {
                            for (int i = 0; i < DBTableContent.Columns.Count; i++)
                            {
                                ActionSQLString.Parameters.AddWithValue(DBTableContent.Columns[i].ColumnName, DBTableContent.Rows[0][DBTableContent.Columns[i].ColumnName].ToString());
                            }
                            L_Conn.Open();
                            ActionSQLString.ExecuteNonQuery();
                        }
                    }

                    return true;
                }
           
            catch
            {
                return false;
            }
            finally
            {
            }
      }
        //修改資料
        /// <summary>
        /// 修改資料-投標管理模組
        /// </summary>
        /// <param name="DataName">資料名稱</param>
        /// <param name="GUID">GUID</param>
        /// <param name="DBTableContent">修改內容</param>
        /// <returns></returns>
        public static bool EditAction_bid(string database, string DataName, string Bid, DataTable DBTableContent)
        {
            try
            {
                //    if (Session["Username"] == "")
                //    {
                //        return false;
                //    }
                //    else
                //    {
                //編輯語法
                string SQLString = "";
                for (int i = 1; i < DBTableContent.Columns.Count; i++)
                {
                    SQLString += DBTableContent.Columns[i].ColumnName + "=@" + DBTableContent.Columns[i].ColumnName + ",";
                }

                SQLString = "update " + DataName + " set " + SQLString.Substring(0, SQLString.Length - 1) + " ";
                SQLString += (Bid != "") ? "where bid=@bid" : "";

                //string data = Utility.DBconnection.connect_string(database);
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    using (SqlCommand ActionSQLString = new SqlCommand(SQLString, L_Conn))
                    {
                        for (int i = 0; i < DBTableContent.Columns.Count; i++)
                        {
                            ActionSQLString.Parameters.AddWithValue(DBTableContent.Columns[i].ColumnName, DBTableContent.Rows[0][DBTableContent.Columns[i].ColumnName].ToString());
                        }
                        L_Conn.Open();
                        ActionSQLString.ExecuteNonQuery();
                    }
                }

                return true;
            }

            catch
            {
                return false;
            }
            finally
            {
            }
        }

        //修改資料
        /// <summary>
        /// 修改資料-投標管理模組
        /// </summary>
        /// <param name="DataName">資料名稱</param>
        /// <param name="GUID">GUID</param>
        /// <param name="DBTableContent">修改內容</param>
        /// <returns></returns>
        public static bool EditAction_Wid(string database, string DataName, string WarrantyID, DataTable DBTableContent)
        {
            try
            {
                //    if (Session["Username"] == "")
                //    {
                //        return false;
                //    }
                //    else
                //    {
                //編輯語法
                string SQLString = "";
                for (int i = 1; i < DBTableContent.Columns.Count; i++)
                {
                    SQLString += DBTableContent.Columns[i].ColumnName + "=@" + DBTableContent.Columns[i].ColumnName + ",";
                }

                SQLString = "update " + DataName + " set " + SQLString.Substring(0, SQLString.Length - 1) + " ";
                SQLString += (WarrantyID != "") ? "where WarrantyID=@WarrantyID" : "";

                //string data = Utility.DBconnection.connect_string(database);
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    using (SqlCommand ActionSQLString = new SqlCommand(SQLString, L_Conn))
                    {
                        for (int i = 0; i < DBTableContent.Columns.Count; i++)
                        {
                            ActionSQLString.Parameters.AddWithValue(DBTableContent.Columns[i].ColumnName, DBTableContent.Rows[0][DBTableContent.Columns[i].ColumnName].ToString());
                        }
                        L_Conn.Open();
                        ActionSQLString.ExecuteNonQuery();
                    }
                }

                return true;
            }

            catch
            {
                return false;
            }
            finally
            {
            }
        }
       /// <summary>
       /// 
       /// </summary>
       /// <param name="database"></param>
       /// <param name="DataName"></param>
       /// <param name="AID">ID的值</param>
       /// <param name="UID">id變數</param>
       /// <param name="DBTableContent"></param>
       /// <returns></returns>
        public static bool EditAction_Anyid(string database, string DataName, string AID,string UID, DataTable DBTableContent)
        {
            try
            {
                //    if (Session["Username"] == "")
                //    {
                //        return false;
                //    }
                //    else
                //    {
                //編輯語法
                string SQLString = "";
                for (int i = 1; i < DBTableContent.Columns.Count; i++)
                {
                    SQLString += DBTableContent.Columns[i].ColumnName + "=@" + DBTableContent.Columns[i].ColumnName + ",";
                }

                SQLString = "update " + DataName + " set " + SQLString.Substring(0, SQLString.Length - 1) + " ";
                SQLString += (AID != "") ? "where " + UID + "=" + AID+"" : "";
              

                //string data = Utility.DBconnection.connect_string(database);
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    using (SqlCommand ActionSQLString = new SqlCommand(SQLString, L_Conn))
                    {
                        for (int i = 0; i < DBTableContent.Columns.Count; i++)
                        {
                            ActionSQLString.Parameters.AddWithValue(DBTableContent.Columns[i].ColumnName, DBTableContent.Rows[0][DBTableContent.Columns[i].ColumnName].ToString());
                        }
                        L_Conn.Open();
                        ActionSQLString.ExecuteNonQuery();
                    }
                }

                return true;
            }

            catch
            {
                return false;
            }
            finally
            {
            }
        }
        //取得資料_自訂義
        /// <summary>
        /// 取得資料_自訂義
        /// </summary>
        /// <param name="SelectSQL">SQL字串</param>
        /// <returns></returns>
        public static DataTable LoadSetContentData(string database,string SelectSQL)
        {
            DataTable DataTableBox = null;
            try
            {
                DataTableBox = new DataTable();
                string SQLString = SelectSQL;
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    {
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                    }
                }
                return DataTableBox;
            }
            catch
            {
                return DataTableBox;
            }
            finally
            {
                DataTableBox.Dispose();
            }
        }

        // 執行Action
        /// <summary>
        /// 執行Action
        /// </summary>
        /// <param name="SQLString">執行內容</param>
        public static bool SQLAction(string database,string SQLString)
        {
            try
            {
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    using (SqlCommand ActionSQLString = new SqlCommand(SQLString, L_Conn))
                    {
                        L_Conn.Open();
                        ActionSQLString.ExecuteNonQuery();
                    }
                }
            }
            finally
            {
            }
            return true;            
        }
     
        //建立資料 ξγ  
        /// <summary>
        /// 建立資料-專管理模組
        /// </summary>
        /// <param name="DataName">資料名稱</param>
        /// <param name="DBTableContent">建立內容Table</param>
        /// <returns></returns>
        public static string SaveAction_pro(string database, string DataName, DataTable DBTableContent, string pid)
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
                  
                    SQLString_2 += "@" + DBTableContent.Columns[i].ColumnName + ",";
                }
                //Insert_UID = DBTableContent.Rows[0]["ProjectCode"].ToString();
                Insert_UID = pid;
                //編輯寫入語法
                SQLString = "insert into " + DataName + " " +
                                   "(" + SQLString_1.Substring(0, SQLString_1.Length - 1) + ") values " +
                                   "(" + SQLString_2.Substring(0, SQLString_2.Length - 1) + ")";
              
                string data = Utility.DBconnection.connect_string(database);
                using (SqlConnection L_Conn = new SqlConnection(data))
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

        //修改資料
        /// <summary>
        /// 修改資料-專案管理模組
        /// </summary>
        /// <param name="DataName">資料名稱</param>
        /// <param name="GUID">GUID</param>
        /// <param name="DBTableContent">修改內容</param>
        /// <returns></returns>
        public static bool EditAction_pro(string database, string DataName, string pid, DataTable DBTableContent)
        {
            try
            {
                //    if (Session["Username"] == "")
                //    {
                //        return false;
                //    }
                //    else
                //    {
                //編輯語法
                string SQLString = "";
                for (int i = 1; i < DBTableContent.Columns.Count; i++)
                {
                    SQLString += DBTableContent.Columns[i].ColumnName + "=@" + DBTableContent.Columns[i].ColumnName + ",";
                }

                SQLString = "update " + DataName + " set " + SQLString.Substring(0, SQLString.Length - 1) + " ";
                SQLString += (pid != "") ? "where pid="+pid : "";

                //string data = Utility.DBconnection.connect_string(database);
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    using (SqlCommand ActionSQLString = new SqlCommand(SQLString, L_Conn))
                    {
                        for (int i = 0; i < DBTableContent.Columns.Count; i++)
                        {
                            ActionSQLString.Parameters.AddWithValue(DBTableContent.Columns[i].ColumnName, DBTableContent.Rows[0][DBTableContent.Columns[i].ColumnName].ToString());
                        }
                        L_Conn.Open();
                        ActionSQLString.ExecuteNonQuery();
                    }
                }

                return true;
            }

            catch
            {
                return false;
            }
            finally
            {
            }
        }

        //取得資料_多筆
        /// <summary>
        /// 專案取得資料_多筆
        /// </summary>
        /// <param name="DataName">資料名稱</param>
        /// <param name="GUID">GUID</param>
        /// <param name="InString">SQL欄位</param>
        /// <returns></returns>
        public static DataTable LoadContentData_pro(string database, string DataName, string Pid, string InString)
        {
            DataTable DataTableBox = null;
            try
            {
                DataTableBox = new DataTable();
                string SQLString = "select " + InString + " from " + DataName + " where Pid=@Pid";
                string data = Utility.DBconnection.connect_string(database);
                using (SqlConnection L_Conn = new SqlConnection(data))
                {
                    using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    {
                        SelectList.Parameters.AddWithValue("@Pid", Pid);
                        SelectList.CommandType = CommandType.Text;
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                    }
                }
                return DataTableBox;
            }
            catch
            {
                return DataTableBox;
            }
            finally
            {
                DataTableBox.Dispose();
            }
        }
      /// <summary>
      ///取得標案工程名稱 
      /// </summary>
      /// <param name="database"></param>
      /// <param name="SelectSQL"></param>
      /// <returns></returns>
        public static string BidName(string database, string SelectSQL)
        {
        
            DataTable DataTableBox = null;
            string BidName = "";
            try
            {
                DataTableBox = new DataTable();
                string SQLString = SelectSQL;
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    {
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                        BidName = DataTableBox.Rows[0].ItemArray[2].ToString();
                    }
                }
                return BidName;
            }
            catch
            {
                return BidName;
            }
            finally
            {

            }
        }
        /// <summary>
        /// 傳回PriceID
        /// </summary>
        /// <param name="database"></param>
        /// <param name="SelectSQL"></param>
        /// <returns></returns>
        public static string PriceID(string database, string SelectSQL)
        {
            DataTable DataTableBox = null;
            string ID = "";
            //string column = "";
            try
            {
                DataTableBox = new DataTable();
                string SQLString = SelectSQL;
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    {
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                        for (int i = 0; i < DataTableBox.Columns.Count; i++)
                        {
                            string temp2 = DataTableBox.Columns[i].ColumnName.ToString();
                            if (temp2 == "PriceID")
                            {
                                
                                ID = DataTableBox.Rows[0].ItemArray[i].ToString();
                            }
                        }
                        
                       
                    }
                }
                return ID;
            }
            catch
            {
                return ID;
            }
            finally
            {

            }
        }

        /// <summary>
        /// 傳回RFQ_Material 資料表UID
        /// </summary>
        /// <param name="database"></param>
        /// <param name="SelectSQL"></param>
        /// <returns></returns>
        public static string MID(string database, string SelectSQL)
        {
            DataTable DataTableBox = null;
            string ID = "";
            //string column = "";
            try
            {
                DataTableBox = new DataTable();
                string SQLString = SelectSQL;
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    {
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                        for (int i = 0; i < DataTableBox.Columns.Count; i++)
                        {
                            string temp2 = DataTableBox.Columns[i].ColumnName.ToString();
                            if (temp2 == "MID")
                            {

                                ID = DataTableBox.Rows[0].ItemArray[i].ToString();
                            }
                        }


                    }
                }
                return ID;
            }
            catch
            {
                return ID;
            }
            finally
            {

            }
        }
/// <summary>
/// 尋找任何欄位值
/// </summary>
/// <param name="database"></param>
/// <param name="SelectSQL"></param>
/// <returns></returns>
        public static string SItemName(string database, string SelectSQL,string ItemName)
        {
            DataTable DataTableBox = null;
            string ID = "";
            //string column = "";
            try
            {
                DataTableBox = new DataTable();
                string SQLString = SelectSQL;
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    {
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                        for (int i = 0; i < DataTableBox.Columns.Count; i++)
                        {
                            string temp2 = DataTableBox.Columns[i].ColumnName.ToString();
                            if (temp2 == ItemName)
                            {

                                ID = DataTableBox.Rows[0].ItemArray[i].ToString();
                            }
                        }


                    }
                }
                return ID;
            }
            catch
            {
                return ID;
            }
            finally
            {

            }
        }
/// <summary>
/// 傳回bid值
/// </summary>
/// <param name="database"></param>
/// <param name="SelectSQL"></param>
/// <returns></returns>
        public static string BID(string database, string SelectSQL)
        {
            DataTable DataTableBox = null;
            string ID = "";
          
            try
            {
                DataTableBox = new DataTable();
                string SQLString = SelectSQL;
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    {
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                        for (int i = 0; i < DataTableBox.Columns.Count; i++)
                        {
                            string temp2 = DataTableBox.Columns[i].ColumnName.ToString();
                            if (temp2 == "BID")
                            {

                                ID = DataTableBox.Rows[0].ItemArray[i].ToString();
                            }
                        }


                    }
                }
                return ID;
            }
            catch
            {
                return ID;
            }
            finally
            {

            }
        }
        /// <summary>
        /// MaxValue of column(maxV)欲求最大值的欄位名
        /// </summary>
        /// <param name="database"></param>
        /// <param name="SelectSQL"></param>
        /// <returns></returns>
        public static int MaxValue(string database, string Datatable, string MaxV)
        {
            DataTable DataTableBox = null;
            int ID =0;

            try
            {
                DataTableBox = new DataTable();
                //string SQLString = SelectSQL;
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    //using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    using (SqlCommand SelectList = new SqlCommand("select * from " + Datatable, L_Conn))
                    {
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                        for (int i = 0; i < DataTableBox.Columns.Count; i++)
                        {
                            string temp2 = DataTableBox.Columns[i].ColumnName.ToString();
                            if (temp2 == MaxV)
                            {
                                ID = (int)DataTableBox.Compute("Max("+temp2+")", string.Empty);
                             
                            }
                        }


                    }
                }
                return ID;
            }
            catch
            {
                return ID;
            }
            finally
            {

            }
        }
        /// <summary>
        /// 組合編號(Budget_WBS)(ItemOrder)
        /// </summary>
        /// <param name="uid"></param>
        /// <param name="UID"></param>
        /// <param name="UpperUID"></param>
        /// <param name="ItemOrder"></param>
        /// <returns></returns>
        /// 
        public static string[] gen_WBOrderCode1(int[] UID, int[] UpperUID, string[] ItemOrder, int[] UID1)
        {

            //string result = "";
            string[] result = new string[UID.Length];
            //string[] ItemOrder = new string[UID.Length];
            int[] nowUID = new int[UID.Length];
            //int[] UID2 = new int[UID1.Length];
            //for (int L = 0; L < UID.Length; L++)
            //{
                for (int k = 0; k < UID1.Length; k++)
                {
                    //if (UID[L] == UID1[k])
                    //{
                        result[k] = ItemOrder[k];
                        nowUID[k] = UpperUID[k];
                    //}
                    //break;

                }
            //}
           
            while (sum_UID(nowUID) > 0)
            {
                for (int i = 0; i < nowUID.Length; i++)
                {

                    if (nowUID[i] == 0)
                        continue;
                    for (int j = 0; j < UpperUID.Length; j++)
                    {
                        if (nowUID[i] == UpperUID[j])
                        {
                            result[i] = getWBItemOrder_by_UID(nowUID[i], UID, ItemOrder) + "." + result[i];
                            nowUID[i] = getUpperUID_by_UID(UpperUID[j], UID, UpperUID);
                            //result = getItemOrder_by_UID(nowUID[i], UID, ItemOrder).ToString() + "." + result;
                            //nowUID[i] = getUpperUID_by_UID(UpperUID[j], UID, UpperUID);

                            break;
                        }
                    }
                }
            }

            return result;
        }
        public static string[] gen_WBOrderCode(int[] UID, int[] UpperUID, string[] ItemOrder)
        {

            //string result = "";
            string[] result = new string[UID.Length];
            //string[] ItemOrder = new string[UID.Length];
            int[] nowUID = new int[UID.Length];
            
            for (int k = 0; k < UID.Length; k++)
            {

                    result[k] = ItemOrder[k];
                    nowUID[k] = UpperUID[k];

                    //break;
               
            }
            while (sum_UID(nowUID) > 0)
            {
                for (int i = 0; i < nowUID.Length; i++)
                {

                    if (nowUID[i] == 0)
                        continue;
                    for (int j = 0; j < UpperUID.Length; j++)
                    {
                        if (nowUID[i] == UpperUID[j])
                        {
                            result[i] = getWBItemOrder_by_UID(nowUID[i], UID, ItemOrder) + "." + result[i];
                            nowUID[i] = getUpperUID_by_UID(UpperUID[j], UID, UpperUID);
                            //result = getItemOrder_by_UID(nowUID[i], UID, ItemOrder).ToString() + "." + result;
                            //nowUID[i] = getUpperUID_by_UID(UpperUID[j], UID, UpperUID);

                            break;
                        }
                    }
                }
            }

            return result;
        }

        public static string getWBItemOrder_by_UID(int nowUID, int[] UID, string[] ItemOrder)
        {
            string result ="";
            for (int i = 0; i < UID.Length; i++)
            {
                if (nowUID == UID[i])
                {
                    result = ItemOrder[i];
                    break;
                }

            }

            return result;
        }
        /// <summary>
        /// 計算wbs項次(ItemOrder)[Bid_WBS]
        /// </summary>
        /// <param name="nowUID"></param>
        /// <param name="UID"></param>
        /// <param name="sortnumber"></param>
        /// <returns></returns>
        /// 

        public static string  gen_OrderCode(int uid, int[] UID, int[] UpperUID, string[] ItemOrder)
        {
           
            string result="";
            int[] nowUID = new int[UID.Length];
         
            for (int k = 0; k < UID.Length; k++)
            {
                if (uid == UID[k])
                {
                    result = ItemOrder[k];
                    nowUID[k] = UpperUID[k];
                   
                    break;
                }
            }
            while (sum_UID(nowUID) > 0)
            {
                for (int i = 0; i < nowUID.Length; i++)
                {
                  
                    if (nowUID[i] == 0)
                        continue;
                    for (int j = 0; j < UpperUID.Length; j++)
                    {
                        if (nowUID[i] == UpperUID[j])
                        {
                            result = getItemOrder_by_UID(nowUID[i], UID, ItemOrder).ToString() + "." + result;
                            nowUID[i] = getUpperUID_by_UID(UpperUID[j], UID, UpperUID);

                         
                            break;
                        }
                    }
                }
            }

            return result;
        }
        public static string  getItemOrder_by_UID(int nowUID, int[] UID, string[] ItemOrder)
        {
            string result="";
        
            for (int i = 0; i < UID.Length; i++)
            {
                if (nowUID == UID[i])
                {
                    result = ItemOrder[i];
                    break;
                }
            }

            return result;
        }
        public static int getUpperUID_by_UID(int nowUID, int[] UID, int[] UpperUID)
        {
            int result = 0;
            for (int i = 0; i < UID.Length; i++)
            {
                if (nowUID == UID[i])
                {
                    result = UpperUID[i];
                    break;
                }
            }
            return result;
        }

        public static int sum_UID(int[] UID)
        {
            int result = 0;
            for (int i = 0; i < UID.Length; i++)
            {
                if (UID[i] == null)
                {
                    UID[i] = 0;
                }
                result += UID[i];
            }
            return result;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="dbname"></param>
        /// <param name="tablename"></param>
        /// <returns></returns>
        public static string[] Get_WBS_LayerKind(string dbname,string bid)
        {
            string[] result = new string[3];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select UID,LayerNum,LayerKind,BID from Bid_WBSLayer where bid="+bid+"", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(1))
                                {
                                    result[0] += reader.GetInt32(0).ToString() + ",";
                                    result[1] += reader.GetInt32(1).ToString() + ",";
                                    result[2] += reader.GetString(2) + ",";
                                   
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

        public static string[] Get_PWBS_LayerKind(string dbname, string Pid)
        {
            string[] result = new string[3];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select UID,LayerNum,LayerKind,PID from Bid_WBSLayer where Pid=" + Pid + "", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(1))
                                {
                                    result[0] += reader.GetInt32(0).ToString() + ",";
                                    result[1] += reader.GetInt32(1).ToString() + ",";
                                    result[2] += reader.GetString(2) + ",";

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
        /// <summary>
        /// 產生LayerCode方法
        /// </summary>
        /// <param name="UID"></param>
        /// <param name="UpperUID"></param>
        /// <param name="sortnumber"></param>
        /// <returns></returns>
        public static string[] gen_LayerCode(int[] UID, int[] UpperUID, int[] sortnumber)
        {
            string[] result = new string[UID.Length];
            int[] nowUID = new int[UID.Length];
            for (int i = 0; i < UID.Length; i++)
            {
                result[i] = sortnumber[i].ToString();
                nowUID[i] = UpperUID[i];
            }
            while (sum_UID(nowUID) > 0)
            {
                for (int i = 0; i < nowUID.Length; i++)
                {
                    //if (nowUID[i] == null)
                    //    continue;
                    if (nowUID[i] == 0)
                        continue;
                    for (int j = 0; j < UpperUID.Length; j++)
                    {
                        if (nowUID[i] == UpperUID[j])
                        {
                            result[i] = getsortnumber_by_UID(nowUID[i], UID, sortnumber).ToString() + ";" + result[i];
                            nowUID[i] = getUpperUID_by_UID(UpperUID[j], UID, UpperUID);
                            break;
                        }
                    }
                }
            }

            return result;
        }

        public static int getsortnumber_by_UID(int nowUID, int[] UID, int[] sortnumber)
        {
            int result = 0;
            for (int i = 0; i < UID.Length; i++)
            {
                if (nowUID == UID[i])
                {
                    result = sortnumber[i];
                    break;
                }
            }

            return result;
        }
        /// <summary>
        ///取得專案工程名稱 
        /// </summary>
        /// <param name="database"></param>
        /// <param name="SelectSQL"></param>
        /// <returns></returns>
        public static string PidName(string dbname, string Datatable,string pid)
        {

            DataTable DataTableBox = null;
            string PidName = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                //using (SqlConnection conn = new SqlConnection(connectionString))
                DataTableBox = new DataTable();
                //string SQLString = SelectSQL;
                using (SqlConnection L_Conn = new SqlConnection(connectionString))
                {
                    //using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    using (SqlCommand SelectList = new SqlCommand("select * from " + Datatable+" where pid="+pid, L_Conn))
                    {
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                 
                  
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                        PidName = DataTableBox.Rows[0].ItemArray[2].ToString();
                    }
                }
                return PidName;
            }
            catch
            {
                return PidName;
            }
            finally
            {

            }
        }
/// <summary>
/// Search the same db(pro_resource) item name
/// </summary>
/// <param name="dbname"></param>
/// <param name="Datatable"></param>
/// <param name="pid"></param>
/// <returns></returns>

        public static bool ItemName(string dbname,string dbtable, string ItemName)
        {

            DataTable DataTableBox = null;

            string SelectString = "select * from " + dbtable + " where ItemName like @SelectKey";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                //using (SqlConnection conn = new SqlConnection(connectionString))
                DataTableBox = new DataTable();
                //string SQLString = SelectSQL;
                using (SqlConnection L_Conn = new SqlConnection(connectionString))
                {
                    using (SqlCommand SelectList = new SqlCommand(SelectString, L_Conn))
                    {
                        SelectList.Parameters.AddWithValue("@SelectKey", "%" + ItemName + "%");
                      
                        SelectList.CommandType = CommandType.Text;
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                        if (DataTableBox.Rows.Count > 0)
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
            catch
            {
                return false;
            }
            finally
            {

            }
        }
        /// <summary>
        /// 是否有相同的pricename
        /// </summary>
        /// <param name="dbname"></param>
        /// <param name="dbtable"></param>
        /// <param name="ItemName"></param>
        /// <returns></returns>
        public static bool PriceName(string dbname, string dbtable, string PriceName)
        {

            DataTable DataTableBox = null;

            string SelectString = "select * from " + dbtable + " where PriceName like @SelectKey";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                //using (SqlConnection conn = new SqlConnection(connectionString))
                DataTableBox = new DataTable();
                //string SQLString = SelectSQL;
                using (SqlConnection L_Conn = new SqlConnection(connectionString))
                {
                    using (SqlCommand SelectList = new SqlCommand(SelectString, L_Conn))
                    {
                        SelectList.Parameters.AddWithValue("@SelectKey", "%" + PriceName + "%");

                        SelectList.CommandType = CommandType.Text;
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                        if (DataTableBox.Rows.Count > 0)
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
            catch
            {
                return false;
            }
            finally
            {

            }
        }
/// <summary>
/// 尋找該layer的最大SortNum
/// </summary>
/// <param name="database"></param>
/// <param name="Datatable"></param>
/// <param name="MaxV"></param>
/// <returns></returns>
        public static int MaxSortNum(string database, string Datatable, int layerNum)
        {
            DataTable DataTableBox = null;
            int ID = 0;

            try
            {
                DataTableBox = new DataTable();
                //string SQLString = SelectSQL;
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    //using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    using (SqlCommand SelectList = new SqlCommand("select max(sortNum) as id from " + Datatable + " where layerNum=" + layerNum+"", L_Conn))
                    {
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);

                        if (DataTableBox.Rows.Count > 0)
                        {
                            ID = DataTableBox.Rows[0].ItemArray[0].ToString() !=""?int.Parse(DataTableBox.Rows[0].ItemArray[0].ToString()):0;
                        }
                       
                    }
                }
                return ID;
            }
            catch
            {
                return ID;
            }
            finally
            {

            }
        }
/// <summary>
/// 
/// </summary>
/// <param name="database"></param>
/// <param name="Datatable"></param>
/// <param name="layerNum"></param>
/// <returns></returns>
        public static int UP_MaxSortNum(string database, string Datatable, int UpperWID)
        {
            DataTable DataTableBox = null;
            int ID = 0;

            try
            {
                DataTableBox = new DataTable();
                //string SQLString = SelectSQL;
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    //using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    using (SqlCommand SelectList = new SqlCommand("select max(sortNum) as id from " + Datatable + " where UpperWID=" + UpperWID + "", L_Conn))
                    {
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);

                        if (DataTableBox.Rows.Count > 0)
                        {
                            ID = DataTableBox.Rows[0].ItemArray[0].ToString() != "" ? int.Parse(DataTableBox.Rows[0].ItemArray[0].ToString()) : 0;
                        }

                    }
                }
                return ID;
            }
            catch
            {
                return ID;
            }
            finally
            {

            }
        }
      /// <summary>
      /// 
      /// </summary>
      /// <param name="database"></param>
      /// <param name="Datatable"></param>
      /// <param name="PID"></param>
      /// <param name="BudgetLock">選擇為ebudgetlock或cbudgetlock</param>
      /// <returns></returns>
        public static int BudgetLock(string database, string Datatable, string PID, string BudgetLock)
        {
            DataTable DataTableBox = null;
            int ID = 0;

            try
            {
                DataTableBox = new DataTable();
                //string SQLString = SelectSQL;
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    //using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    using (SqlCommand SelectList = new SqlCommand("select * from " + Datatable + " where PID=" + PID + "", L_Conn))
                    {
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                        for (int i = 0; i < DataTableBox.Columns.Count; i++)
                        {
                            string temp2 = DataTableBox.Columns[i].ColumnName.ToString();
                            if (temp2 == BudgetLock)
                            {
                                ID = int.Parse(DataTableBox.Rows[0].ItemArray[i].ToString());

                            }
                        }


                    }
                }
                return ID;
            }
            catch
            {
                return ID;
            }
            finally
            {

            }
        }
        /// <summary>
        /// 求特定ewid傳回之LayerNum值
        /// </summary>
        /// <param name="database"></param>
        /// <param name="Datatable"></param>
        /// <param name="MaxV"></param>
        /// <returns></returns>
        public static int NowLayerNum(string database, string Datatable, string EWID)
        {
            DataTable DataTableBox = null;
            int ID = 0;

            try
            {
                DataTableBox = new DataTable();
                //string SQLString = SelectSQL;
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    //using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    using (SqlCommand SelectList = new SqlCommand("select * from " + Datatable + " where EWID=" + EWID + "", L_Conn))
                    {
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                        for (int i = 0; i < DataTableBox.Columns.Count; i++)
                        {
                            string temp2 = DataTableBox.Columns[i].ColumnName.ToString();
                            if (temp2 == "LayerNum")
                            {
                                ID = int.Parse(DataTableBox.Rows[0].ItemArray[i].ToString());

                            }
                        }


                    }
                }
                return ID;
            }
            catch
            {
                return ID;
            }
            finally
            {

            }
        }
/// <summary>
/// 尋找ExecuteKind
/// </summary>
/// <param name="database"></param>
/// <param name="Datatable"></param>
/// <param name="EWID"></param>
/// <returns></returns>
        public static string ExecuteKind(string database, string Datatable, string EWID)
        {
            DataTable DataTableBox = null;
            string Kind = "";

            try
            {
                DataTableBox = new DataTable();
                //string SQLString = SelectSQL;
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    //using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    using (SqlCommand SelectList = new SqlCommand("select ExecuteKind from " + Datatable + " where EWID=" + EWID + "", L_Conn))
                    {
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                        for (int i = 0; i < DataTableBox.Columns.Count; i++)
                        {
                            string temp2 = DataTableBox.Columns[0].ColumnName.ToString();
                            if (temp2 == "ExecuteKind")
                            {
                                Kind = DataTableBox.Rows[0].ItemArray[0].ToString();

                            }
                        }


                    }
                }
                return Kind;
            }
            catch
            {
                return Kind;
            }
            finally
            {

            }
        }
        /// <summary>
        /// 搜尋ebudget之priceid
        /// </summary>
        /// <param name="database"></param>
        /// <param name="Datatable"></param>
        /// <param name="EWID"></param>
        /// <returns></returns>
        public static string EPriceId(string database, string Datatable, string EWID)
        {
            DataTable DataTableBox = null;
            string EPriceId = "";

            try
            {
                DataTableBox = new DataTable();
                //string SQLString = SelectSQL;
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    //using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    using (SqlCommand SelectList = new SqlCommand("select * from " + Datatable + " where EWID=" + EWID + "", L_Conn))
                    {
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                        for (int i = 0; i < DataTableBox.Columns.Count; i++)
                        {
                            string temp2 = DataTableBox.Columns[i].ColumnName.ToString();
                            if (temp2 == "PriceID")
                            {
                                EPriceId = DataTableBox.Rows[0].ItemArray[i].ToString();

                            }
                        }


                    }
                }
                return EPriceId;
            }
            catch
            {
                return EPriceId;
            }
            finally
            {

            }
        }
        /// <summary>
        /// 尋找該ParentID的最大SortNum
        /// </summary>
        /// <param name="database"></param>
        /// <param name="Datatable"></param>
        /// <param name="EWID"></param>
        /// <returns></returns>
        public static int MaxSNumPID(string database, string Datatable, string ParentID)
        {
            DataTable DataTableBox = null;
            int ID = 0;

            try
            {
                DataTableBox = new DataTable();
                //string SQLString = SelectSQL;
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    //using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    using (SqlCommand SelectList = new SqlCommand("select max(sortNum) as id from " + Datatable + " where ParentID=" + ParentID + "", L_Conn))
                    {
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                        for (int i = 0; i < DataTableBox.Columns.Count; i++)
                        {
                            string temp2 = DataTableBox.Columns[0].ColumnName.ToString();
                            if (temp2 == "id")
                            {
                                ID = int.Parse(DataTableBox.Rows[0].ItemArray[0].ToString());

                            }
                        }


                    }
                }
                return ID;
            }
            catch
            {
                return ID;
            }
            finally
            {

            }
        }
/// <summary>
/// 
/// </summary>
/// <param name="database"></param>
/// <param name="Datatable"></param>
/// <param name="ParentID"></param>
/// <returns></returns>
        public static string UpperWID(string database, string Datatable, string EWID)
        {
            DataTable DataTableBox = null;
            string UpperWID = "";

            try
            {
                DataTableBox = new DataTable();
                //string SQLString = SelectSQL;
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    //using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    using (SqlCommand SelectList = new SqlCommand("select * from " + Datatable + " where EWID=" + EWID + "", L_Conn))
                    {
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                        for (int i = 0; i < DataTableBox.Columns.Count; i++)
                        {
                            string temp2 = DataTableBox.Columns[i].ColumnName.ToString();
                            if (temp2 == "UpperWID")
                            {
                                UpperWID = DataTableBox.Rows[0].ItemArray[i].ToString();

                            }
                        }


                    }
                }
                return UpperWID;
            }
            catch
            {
                return UpperWID;
            }
            finally
            {

            }
        }
        /// <summary>
        /// Bid_WBSLayer的SortNum最大值
        /// </summary>
        /// <param name="database"></param>
        /// <param name="Datatable"></param>
        /// <param name="ParentID"></param>
        /// <returns></returns>
        public static int MaxLayerSNum(string database, string Datatable, string PID)
        {
            DataTable DataTableBox = null;
            int ID = 0;

            try
            {
                DataTableBox = new DataTable();
                //string SQLString = SelectSQL;
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    //using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    using (SqlCommand SelectList = new SqlCommand("select max(LayerNum) as id from " + Datatable + " where PID=" + PID + "", L_Conn))
                    {
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                        for (int i = 0; i < DataTableBox.Columns.Count; i++)
                        {
                            string temp2 = DataTableBox.Columns[0].ColumnName.ToString();
                            if (temp2 == "id")
                            {
                                ID = int.Parse(DataTableBox.Rows[0].ItemArray[0].ToString());

                            }
                        }


                    }
                }
                return ID;
            }
            catch
            {
                return ID;
            }
            finally
            {

            }
        }
        /// <summary>
        /// 尋找該案之最大的anyID
        /// </summary>
        /// <param name="database"></param>
        /// <param name="Datatable"></param>
        /// <param name="PID"></param>
        /// <returns></returns>
        public static int MaxAnyID(string database, string Datatable, string ProjectCode,string AnyID)
        {
            DataTable DataTableBox = null;
            int ID = 0;

            try
            {
                DataTableBox = new DataTable();
                //string SQLString = SelectSQL;
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    //using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    using (SqlCommand SelectList = new SqlCommand("select max(" + AnyID + ") as id from " + Datatable + " where PID=" + ProjectCode + "", L_Conn))
                    {
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                        for (int i = 0; i < DataTableBox.Columns.Count; i++)
                        {
                            string temp2 = DataTableBox.Columns[0].ColumnName.ToString();
                            if (temp2 == "id")
                            {
                                ID = int.Parse(DataTableBox.Rows[0].ItemArray[0].ToString());

                            }
                        }


                    }
                }
                return ID;
            }
            catch
            {
                return ID;
            }
            finally
            {

            }
        }
/// <summary>
/// 傳出該table之最大uid值
/// </summary>
/// <param name="dbname"></param>
/// <param name="Filename"></param>
/// <param name="Elementname"></param>
/// <param name="Username"></param>
/// <param name="Remark"></param>
/// <param name="Type"></param>
/// <returns></returns>
        public static int MaxID(string dbname,string tablename)
        {
            int UpdateID = 0;
            //bool result = false;

            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("select IDENT_CURRENT('" + tablename + "'),IDENT_INCR('" + tablename + "')", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                               
                                UpdateID = int.Parse(reader.GetSqlDecimal(0).ToString()) + int.Parse(reader.GetSqlDecimal(1).ToString());
                                 
                            }
                        }
                    }
                   
                }
                return UpdateID;  
        }
            catch
            {
                return UpdateID;
            }
            finally
            {

            }
        }

        //取得資料_自訂義
        /// <summary>
        /// 取得資料_自訂義
        /// </summary>
        /// <param name="SelectSQL">SQL字串</param>
        /// <returns></returns>
        public static decimal calPrice(string database, string ProPriceID)
        {
            DataTable DataTableBox = null;
            decimal Price = 0;
            string SelectSQL = "Select * from RFQ_Material where Pro_PriceID=" + ProPriceID;
            try
            {
                DataTableBox = new DataTable();
                string SQLString = SelectSQL;
                using (SqlConnection L_Conn = new SqlConnection(Utility.DBconnection.connect_string(database)))
                {
                    using (SqlCommand SelectList = new SqlCommand(SQLString, L_Conn))
                    {
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);
                        if ( DataTableBox.Rows.Count>0)
                        {
                            for (int i = 0; i < DataTableBox.Columns.Count; i++)
                            {
                                string temp2 = DataTableBox.Columns[i].ColumnName.ToString();
                                if (temp2 == "Pro_PriceID")
                                {
                                    //Price = int.Parse(DataTableBox.Rows[i].ItemArray[i].ToString());
                                    Price = (decimal)DataTableBox.Compute("AVG([UnitPrice])", "");
                                }
                            }
                        }
                    }
                }
                return Price;
            }
            catch
            {
                return Price;
            }
            finally
            {
                DataTableBox.Dispose();
            }
        }
/// <summary>
/// 列出CBugdet_WBS的workitem
/// </summary>
/// <param name="dbname"></param>
/// <returns></returns>
        public static string Get_Item_List(string dbname)
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
                        new SqlCommand("select ItemName from CBudget_WBS ", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (!reader.IsDBNull(0))
                                {
                                    result += "\"" + reader.GetString(0) + "\",";
                                }
                            }
                        }
                    }

                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                //Log exception
                //Display Error message
                throw ex;
            }
            if (result.Length > 0)
            {
                result = result.Substring(0, result.Length - 1);
            }
            return result;
        }

        public static string Get_Item_List1(string dbname)
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
                        new SqlCommand("select ItemName from CBudget_WBS ", conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (reader.IsDBNull(0))
                                {
                                }
                                else
                                {
                                    result += "<option>" + reader.GetString(0) + "</option>";
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
                //Display Error message
            }
            //if (result.Length > 0)
            //{
            //    result.Substring(0, result.Length - 1);
            //}
            return result;
        }
   }
}
