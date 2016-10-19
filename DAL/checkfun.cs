using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utility;

namespace DAL
{
   public class checkfun
    {
       public static string[] check_num(string dbname, int UID)
        {
            string temp = "";
            //string[] result;
            string[] input = getUpperWID_by_UID(dbname, UID);
            //string[] temp_WID = input[0].Split(',');
            //int count = 0;
            int[] UpperWID = new int[3];
            int UpperID = 0;
            string Select_string = "Select CWID,PID,UpperWID from CBudget_WBS where CWID=" + UID;
           try
            {
                using (SqlConnection conn =
                    new SqlConnection(DBconnection.connect_string(dbname)))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand(Select_string, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                temp += reader.GetInt32(0).ToString() + ",";
                                if (reader.IsDBNull(2))
                                {
                                     UpperID = 0;
                                }
                                else
                                {
                                     UpperID = reader.GetInt32(2);
                                }
                                string[] newupperID = getUpperWID_by_UID(dbname, UpperID);
                             
                            }
                        }
                    }

                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                Console.Write(ex.ToString());
            
            }

           return input;
        }
       //public static int getUpperWID_by_UID(string dbname,int nowUID, int[] UID, int[] UpperUID)
       public static string[] getUpperWID_by_UID(string dbname,int nowUID)
       {
           //string[] result1;
           string temp = "";
           //int[] result = 0;
           string Select_string = "Select CWID,PID,UpperWID from CBudget_WBS where UpperWID=" + nowUID;
             try
            {
                using (SqlConnection conn =
                    new SqlConnection(DBconnection.connect_string(dbname)))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand(Select_string, conn))
                    {
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {

                                temp += reader.GetInt32(0).ToString()+",";
                                
                              //for (int i = 0; i < UID.Length; i++)
                              // {
                              //     if (nowUID == UID[i])
                              //     {
                              //         result = UpperUID[i];
                              //         break;
                              //     }
                              // }
          
                            }
                        }
                    }

                    conn.Close();
                }
            }
            catch (SqlException ex)
            {
                Console.Write(ex.ToString());
            
            }

             if (temp.Length > 0)
             {
                 temp = temp.Substring(0, temp.Length - 1);
             }
             else
             {
                 temp = "";
             }
             string[] result1 = temp.Split(',');
           string[] nextresult;
             for (int i = 0; i < result1.Length; i++)
             {
                 if (result1[i] != "")
                 {
                     nextresult = getUpperWID_by_UID(dbname, int.Parse(result1[i]));
                 }
             }
            return result1;
        }

       public static int[] Sort_CBudget(string dbname, string PID, int Wid)
       {
           string[] input = Get_CbudgetInformation(dbname, PID, Wid);
           string[] temp_WID = input[0].Split(',');
           string[] temp_UpperWID = input[1].Split(',');
           string[] temp_SortNum = input[2].Split(',');
           int[] WID = new int[temp_WID.Length];
           int[] UpperWID = new int[temp_UpperWID.Length];
           int[] SortNum = new int[temp_SortNum.Length];
           for (int i = 0; i < WID.Length; i++)
           {
               int.TryParse(temp_WID[i], out WID[i]);
               int.TryParse(temp_UpperWID[i], out UpperWID[i]);
               int.TryParse(temp_SortNum[i], out SortNum[i]);
           }
           int[] result = new int[WID.Length];
           List<int> code_result = new List<int>();
           List<bool> code_show = new List<bool>();
           //for (int i = 0; i < WID.Length; i++)
           //{
           //    if (UpperWID[i] == 0)
           //    {
           code_result.Add(Wid);
           code_show.Add(true);
           //    }
           //}
           int count = 0;
           int nowWID = 0;
           int insert_count = 0;
           while (count < code_result.Count)
           {
               nowWID = code_result[count];
               insert_count = count + 1;
               for (int i = 0; i < WID.Length; i++)
               {
                   if (nowWID == UpperWID[i])
                   {
                       code_show[count] = false;
                       code_result.Insert(insert_count, WID[i]);
                       code_show.Insert(insert_count, true);
                       insert_count++;
                   }
               }
               count++;
           }
           List<int> FinalResult = new List<int>();
           for (int i = 0; i < code_show.Count; i++)
           {
               if (code_show[i])
               {
                   FinalResult.Add(code_result[i]);
               }
           }

           //result = code_result.ToArray();
           result = FinalResult.Distinct().ToArray();
           if (result.Length > 1)
           {

           }
           return result;
       }
       public static string[] Get_CbudgetInformation(string dbname, string PID, int UID)
       {
           //string temp = "";
           string[] result = new string[3];
           //string[] temp_WID = input[0].Split(',');
           //int count = 0;
           int[] UpperWID = new int[3];
           string Select_string = "Select CWID,UpperWID,SortNum from CBudget_WBS where pid=" + PID;
           try
           {
               using (SqlConnection conn =
                   new SqlConnection(DBconnection.connect_string(dbname)))
               {
                   conn.Open();

                   using (SqlCommand cmd =
                       new SqlCommand(Select_string, conn))
                   {
                       using (var reader = cmd.ExecuteReader())
                       {
                           while (reader.Read())
                           {
                               result[0] += reader.GetInt32(0).ToString() + ",";
                               if (reader.IsDBNull(1))
                               {
                                   result[1] += "0,";
                               }
                               else
                               {
                                   result[1] += reader.GetInt32(1).ToString() + ",";
                               }
                               if (reader.IsDBNull(2))
                               {
                                   result[2] += "0,";
                               }
                               else
                               {
                                   result[2] += reader.GetInt32(2).ToString() + ",";
                               }
                           }
                       }
                   }

                   conn.Close();
               }
           }
           catch (SqlException ex)
           {
               Console.Write(ex.ToString());

           }

           return result;
       }
       public static int[] Sort_LayerCode(string dbname, string PID,int Wid)
       {
           string[] input = Get_Information(dbname, PID, Wid);
           string[] temp_WID = input[0].Split(',');
           string[] temp_UpperWID = input[1].Split(',');
           string[] temp_SortNum = input[2].Split(',');
           int[] WID = new int[temp_WID.Length];
           int[] UpperWID = new int[temp_UpperWID.Length];
           int[] SortNum = new int[temp_SortNum.Length];
           for (int i = 0; i < WID.Length; i++)
           {
               int.TryParse(temp_WID[i], out WID[i]);
               int.TryParse(temp_UpperWID[i], out UpperWID[i]);
               int.TryParse(temp_SortNum[i], out SortNum[i]);
           }
           int[] result = new int[WID.Length];
           List<int> code_result = new List<int>();
           List<bool> code_show = new List<bool>();
           //for (int i = 0; i < WID.Length; i++)
           //{
           //    if (UpperWID[i] == 0)
           //    {
                   code_result.Add(Wid);
                   code_show.Add(true);
           //    }
           //}
           int count = 0;
           int nowWID = 0;
           int insert_count = 0;
           while (count < code_result.Count)
           {
               nowWID = code_result[count];
               insert_count = count + 1;
               for (int i = 0; i < WID.Length; i++)
               {
                   if (nowWID == UpperWID[i])
                   {
                       code_show[count] = false;
                       code_result.Insert(insert_count, WID[i]);
                       code_show.Insert(insert_count, true);
                       insert_count++;
                   }
               }
               count++;
           }
           List<int> FinalResult = new List<int>();
           for (int i = 0; i < code_show.Count; i++)
           {
               if (code_show[i])
               {
                   FinalResult.Add(code_result[i]);
               }
           }

           //result = code_result.ToArray();
           result = FinalResult.Distinct().ToArray();
           if (result.Length>1)
           {

           }
           return result;
       }
    
       //分包
       public static bool  Sub_EBudget(string dbname, string PID, int Wid)
       {
           string[] input = Get_SubInformation(dbname, PID, Wid);
           string[] temp_WID = input[0].Split(',');
           string[] temp_UpperWID = input[1].Split(',');
           string[] temp_SortNum = input[2].Split(',');
           string[] temp_ENumber = input[3].Split(',');
           string[] temp_LastENumber = input[4].Split(',');
           int[] WID = new int[temp_WID.Length];
           int[] UpperWID = new int[temp_UpperWID.Length];
           int[] SortNum = new int[temp_SortNum.Length];
           decimal[] ENumber = new decimal[temp_ENumber.Length];
           decimal[] LastENumber = new decimal[temp_LastENumber.Length];
           for (int i = 0; i < WID.Length; i++)
           {
               int.TryParse(temp_WID[i], out WID[i]);
               int.TryParse(temp_UpperWID[i], out UpperWID[i]);
               int.TryParse(temp_SortNum[i], out SortNum[i]);
               decimal.TryParse(temp_ENumber[i], out ENumber[i]);
               decimal.TryParse(temp_LastENumber[i], out LastENumber[i]);
           }
           int[] result = new int[WID.Length];
           bool result1 = false;
           List<int> code_result = new List<int>();
           List<decimal> code_ENumber = new List<decimal>();
           List<decimal> code_LastENumber = new List<decimal>();
           List<bool> code_show = new List<bool>();
           //for (int i = 0; i < WID.Length; i++)
           //{
           //    if (UpperWID[i] == 0)
           //    {
           string SQLSelect = "Select * from EBudget_WBS where EWID=" + Wid;
           string ENum = WebModel.SItemName(dbname, SQLSelect, "ENumber");
           string LastENum = WebModel.SItemName(dbname, SQLSelect, "LastENumber");
           code_result.Add(Wid);
           if (LastENum != "")
           {
           code_ENumber.Add(decimal.Parse(ENum));
           code_LastENumber.Add(decimal.Parse(LastENum));
           code_show.Add(true);
           }
           //    }
           //}
           int count = 0;
           int nowWID = 0;
           int insert_count = 0;
           while (count < code_result.Count)
           {
               nowWID = code_result[count];
               insert_count = count + 1;
               for (int i = 0; i < WID.Length; i++)
               {
                   if (nowWID == UpperWID[i])
                   {
                       code_show[count] = false;
                       code_result.Insert(insert_count, WID[i]);
                       code_ENumber.Insert(insert_count, ENumber[i]);
                       code_LastENumber.Insert(insert_count, LastENumber[i]);
                       code_show.Insert(insert_count, true);
                       insert_count++;
                   }
               }
               count++;
           }
           List<int> FinalResult = new List<int>();
           for (int i = 0; i < code_show.Count; i++)
           {
               //if (code_show[i])
               //{
               FinalResult.Add(code_result[i]);
               //}
           }
           for (int i = 0; i < FinalResult.Count; i++)
           {

               if (code_ENumber[i] != code_LastENumber[i])
               {

                   result1 = true;
                   break;

               }
               else
               {
                   result1 = false;
               }
            
           }
           //result = code_result.ToArray();
           result = FinalResult.Distinct().ToArray();
           if (result.Length > 1)
           {

           }
           return result1;
       }

       public static string[] Get_SubInformation(string dbname, string PID, int UID)
       {
           //string temp = "";
           string[] result = new string[5];
           //string[] temp_WID = input[0].Split(',');
           //int count = 0;
           int[] UpperWID = new int[5];
           string Select_string = "Select EWID,UpperWID,SortNum,ENumber,LastENumber from EBudget_WBS where pid=" + PID + " Order by order_Num";
           try
           {
               using (SqlConnection conn =
                   new SqlConnection(DBconnection.connect_string(dbname)))
               {
                   conn.Open();

                   using (SqlCommand cmd =
                       new SqlCommand(Select_string, conn))
                   {
                       using (var reader = cmd.ExecuteReader())
                       {
                           while (reader.Read())
                           {
                               result[0] += reader.GetInt32(0).ToString() + ",";
                               if (reader.IsDBNull(1))
                               {
                                   result[1] += "0,";
                               }
                               else
                               {
                                   result[1] += reader.GetInt32(1).ToString() + ",";
                               }
                               if (reader.IsDBNull(2))
                               {
                                   result[2] += "0,";
                               }
                               else
                               {
                                   result[2] += reader.GetInt32(2).ToString() + ",";
                               }
                               if (reader.IsDBNull(3))
                               {
                                   result[3] += "0,";
                               }
                               else
                               {
                                   result[3] += reader.GetDecimal(3).ToString() + ",";
                               }
                               if (reader.IsDBNull(4))
                               {
                                   result[4] += "0,";
                               }
                               else
                               {
                                   result[4] += reader.GetDecimal(4).ToString() + ",";
                               }
                           }
                       }
                   }

                   conn.Close();
               }
           }
           catch (SqlException ex)
           {
               Console.Write(ex.ToString());

           }

           return result;
       }
       //
       public static int[] Sort_EBudget(string dbname, string PID, int Wid)
       {
           string[] input = Get_Information(dbname, PID, Wid);
           string[] temp_WID = input[0].Split(',');
           string[] temp_UpperWID = input[1].Split(',');
           string[] temp_SortNum = input[2].Split(',');
           int[] WID = new int[temp_WID.Length];
           int[] UpperWID = new int[temp_UpperWID.Length];
           int[] SortNum = new int[temp_SortNum.Length];
           for (int i = 0; i < WID.Length; i++)
           {
               int.TryParse(temp_WID[i], out WID[i]);
               int.TryParse(temp_UpperWID[i], out UpperWID[i]);
               int.TryParse(temp_SortNum[i], out SortNum[i]);
           }
           int[] result = new int[WID.Length];
           List<int> code_result = new List<int>();
           List<bool> code_show = new List<bool>();
           //for (int i = 0; i < WID.Length; i++)
           //{
           //    if (UpperWID[i] == 0)
           //    {
           code_result.Add(Wid);
           code_show.Add(true);
           //    }
           //}
           int count = 0;
           int nowWID = 0;
           int insert_count = 0;
           while (count < code_result.Count)
           {
               nowWID = code_result[count];
               insert_count = count + 1;
               for (int i = 0; i < WID.Length; i++)
               {
                   if (nowWID == UpperWID[i])
                   {
                       code_show[count] = false;
                       code_result.Insert(insert_count, WID[i]);
                       code_show.Insert(insert_count, true);
                       insert_count++;
                   }
               }
               count++;
           }
           List<int> FinalResult = new List<int>();
           for (int i = 0; i < code_show.Count; i++)
           {
               //if (code_show[i])
               //{
               FinalResult.Add(code_result[i]);
               //}
           }

           //result = code_result.ToArray();
           result = FinalResult.Distinct().ToArray();
           if (result.Length > 1)
           {

           }
           return result;
       }

       public static string[] Get_Information(string dbname, string PID, int UID)
       {
           //string temp = "";
           string[] result = new string[3];
           //string[] temp_WID = input[0].Split(',');
           //int count = 0;
           int[] UpperWID = new int[3];
           string Select_string = "Select EWID,UpperWID,SortNum from EBudget_WBS where pid=" + PID + " Order by order_Num";
           try
           {
               using (SqlConnection conn =
                   new SqlConnection(DBconnection.connect_string(dbname)))
               {
                   conn.Open();

                   using (SqlCommand cmd =
                       new SqlCommand(Select_string, conn))
                   {
                       using (var reader = cmd.ExecuteReader())
                       {
                           while (reader.Read())
                           {
                               result[0] += reader.GetInt32(0).ToString() + ",";
                               if (reader.IsDBNull(1))
                               {
                                   result[1] += "0,";
                               }
                               else
                               {
                                   result[1] += reader.GetInt32(1).ToString() + ",";
                               }
                               if (reader.IsDBNull(2))
                               {
                                   result[2] += "0,";
                               }
                               else
                               {
                                   result[2] += reader.GetInt32(2).ToString() + ",";
                               }
                           }
                       }
                   }

                   conn.Close();
               }
           }
           catch (SqlException ex)
           {
               Console.Write(ex.ToString());

           }

           return result;
       }
       public static int[] Sort_PublicResource(string dbname, int Wid)
       {
           string[] input = Get_PublicAnalysis_Information(dbname);
           string[] temp_WID = input[0].Split(',');
           string[] temp_UpperWID = input[1].Split(',');
           string[] temp_SortNum = input[2].Split(',');
           int[] WID = new int[temp_WID.Length];
           int[] UpperWID = new int[temp_UpperWID.Length];
           int[] SortNum = new int[temp_SortNum.Length];
           for (int i = 0; i < WID.Length; i++)
           {
               int.TryParse(temp_WID[i], out WID[i]);
               int.TryParse(temp_UpperWID[i], out UpperWID[i]);
               int.TryParse(temp_SortNum[i], out SortNum[i]);
           }
           int[] result = new int[WID.Length];
           List<int> code_result = new List<int>();
           List<bool> code_show = new List<bool>();
           //for (int i = 0; i < WID.Length; i++)
           //{
           //    if (UpperWID[i] == 0)
           //    {
           code_result.Add(Wid);
           code_show.Add(true);
           //    }
           //}
           int count = 0;
           int nowWID = 0;
           int insert_count = 0;
           while (count < code_result.Count)
           {
               nowWID = code_result[count];
               insert_count = count + 1;
               for (int i = 0; i < WID.Length; i++)
               {
                   if (nowWID == UpperWID[i])
                   {
                       code_show[count] = false;
                       code_result.Insert(insert_count, WID[i]);
                       code_show.Insert(insert_count, true);
                       insert_count++;
                   }
               }
               count++;
           }
           List<int> FinalResult = new List<int>();
           for (int i = 0; i < code_show.Count; i++)
           {
               if (code_show[i])
               {
                   FinalResult.Add(code_result[i]);
               }
           }

           //result = code_result.ToArray();
           result = FinalResult.Distinct().ToArray();
           if (result.Length > 1)
           {

           }
           return result;
       }
       public static string[] Get_PublicAnalysis_Information(string dbname)
       {
           //string temp = "";
           string[] result = new string[3];
           //string[] temp_WID = input[0].Split(',');
           //int count = 0;
           int[] UpperWID = new int[3];
           string Select_string = "Select KidID,ParentID,SortNum from PublicAnalysis ";
           try
           {
               using (SqlConnection conn =
                   new SqlConnection(DBconnection.connect_string(dbname)))
               {
                   conn.Open();

                   using (SqlCommand cmd =
                       new SqlCommand(Select_string, conn))
                   {
                       using (var reader = cmd.ExecuteReader())
                       {
                           while (reader.Read())
                           {
                               result[0] += reader.GetInt32(0).ToString() + ",";
                               if (reader.IsDBNull(1))
                               {
                                   result[1] += "0,";
                               }
                               else
                               {
                                   result[1] += reader.GetInt32(1).ToString() + ",";
                               }
                               if (reader.IsDBNull(2))
                               {
                                   result[2] += "0,";
                               }
                               else
                               {
                                   result[2] += reader.GetInt32(2).ToString() + ",";
                               }
                           }
                       }
                   }

                   conn.Close();
               }
           }
           catch (SqlException ex)
           {
               Console.Write(ex.ToString());

           }

           return result;
       }

       public static string[] BWBS_UpperUID(string dbname, int UID)
       {
           string temp = "";
           //string[] result;
           string[] input = getUpperUID_by_UID(dbname, UID);
           //string[] temp_WID = input[0].Split(',');
           //int count = 0;
           int[] UpperWID = new int[3];
           string Select_string = "Select UID,BID,UpperUID from Bid_WBS where UID=" + UID;
           try
           {
               using (SqlConnection conn =
                   new SqlConnection(DBconnection.connect_string(dbname)))
               {
                   conn.Open();

                   using (SqlCommand cmd =
                       new SqlCommand(Select_string, conn))
                   {
                       using (var reader = cmd.ExecuteReader())
                       {
                           while (reader.Read())
                           {
                               temp += reader.GetInt32(0).ToString() + ",";
                               int UpperID = reader.GetInt32(2);
                               string[] newupperID = getUpperUID_by_UID(dbname, UpperID);

                           }
                       }
                   }

                   conn.Close();
               }
           }
           catch (SqlException ex)
           {
               Console.Write(ex.ToString());

           }

           return input;
       }
       //public static int getUpperWID_by_UID(string dbname,int nowUID, int[] UID, int[] UpperUID)
       public static string[] getUpperUID_by_UID(string dbname, int nowUID)
       {
           //string[] result1;
           string temp = "";
           //int[] result = 0;
           string Select_string = "Select UID,BID,UpperUID from Bid_WBS where UpperUID=" + nowUID;
           try
           {
               using (SqlConnection conn =
                   new SqlConnection(DBconnection.connect_string(dbname)))
               {
                   conn.Open();

                   using (SqlCommand cmd =
                       new SqlCommand(Select_string, conn))
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
                                   temp += reader.GetInt32(0).ToString() + ",";
                               }
                               //for (int i = 0; i < UID.Length; i++)
                               // {
                               //     if (nowUID == UID[i])
                               //     {
                               //         result = UpperUID[i];
                               //         break;
                               //     }
                               // }

                           }
                       }
                   }

                   conn.Close();
               }
           }
           catch (SqlException ex)
           {
               Console.Write(ex.ToString());

           }

           if (temp.Length > 0)
           {
               temp = temp.Substring(0, temp.Length - 1);
           }
           else
           {
               temp = "";
           }
           
          
               string[] result1 = temp.Split(',');
               string[] nextresult;
               if (temp != "")
               {
                   for (int i = 0; i < result1.Length; i++)
                   {
                       nextresult = getUpperUID_by_UID(dbname, int.Parse(result1[i]));
                   }
               }
         
           return result1;
       }

          
       }
  
}
