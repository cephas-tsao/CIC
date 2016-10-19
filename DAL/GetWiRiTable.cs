using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utility;

namespace DAL
{
  public  class GetWiRiTable
    {
      public static int[] GetKidID(string dbname, string PID,int wid)
      {
          
          string[] input = Get_Information(dbname, PID);
          string[] temp_ParentID = new string[input.Length];
          string[] temp_KidID = new string[input.Length];
          string[] temp_PriceID = new string[input.Length];
          if (input[0] !=null)
          {
           temp_ParentID = input[0].Split(',');
           temp_KidID = input[1].Split(',');
           temp_PriceID = input[2].Split(',');
          }
          int[] ParentID = new int[temp_ParentID.Length];
          int[] KidID = new int[temp_KidID.Length];
          int[] PriceID = new int[temp_PriceID.Length];
          for (int i = 0; i < ParentID.Length; i++)
          {
              int.TryParse(temp_ParentID[i], out ParentID[i]);
              int.TryParse(temp_KidID[i], out KidID[i]);
              int.TryParse(temp_PriceID[i], out PriceID[i]);
          }
          int[] result = new int[ParentID.Length];
          int[] result1 = new int[ParentID.Length];
          List<int> code_result = new List<int>();
          List<int> RiLayer = new List<int>();
          //int[] result = new int[WID.Length];
          //List<int> code_result = new List<int>();
          List<bool> code_show = new List<bool>();
          //for (int i = 0; i < ParentID.Length; i++)
          //{
          //    if (ParentID[i] == wid)
          //    {
          //        code_result.Add(PriceID[i]);
          //    }
          //}
          code_result.Add(wid);
          code_show.Add(true);
          RiLayer.Add(0);
          int count = 0;
          int nowWID = 0;
          int insert_count = 0;
          int layer = 0;
          
          while (count < code_result.Count)
          {
              nowWID = code_result[count];
              layer = RiLayer[count]+1;
              insert_count = count + 1;
              for (int i = 0; i < ParentID.Length; i++)
              {
                  if (nowWID == ParentID[i])
                  {
                      code_show[count] = false;
                      code_result.Insert(insert_count, PriceID[i]);
                      code_show.Insert(insert_count, true);
                      RiLayer.Insert(insert_count, layer);
                      //RiLayer.Add(layer);
                      insert_count++;
                  }
                
              }
              count++;
             
              //layer =RiLayer.Max()+1;
          }
          //Get_layer(RiLayer);
          //RiLayer = Get_layer();

          //(RiLayer, out PriceID[i]);
          List<int> FinalResult = new List<int>();
          for (int i = 0; i < code_show.Count; i++)
          {
              //if (code_show[i])
              //{
                  FinalResult.Add(code_result[i]);
              //}
          }

          //result = code_result.ToArray();
          //result = FinalResult.Distinct().ToArray();
          result = FinalResult.ToArray();
          List<int> RiLayer1 = new List<int>();
          RiLayer1.AddRange(RiLayer);
          RiLayer1.AddRange(FinalResult);
          result1 = RiLayer1.ToArray();
          if (result.Length > 1)
          {

          }
          return result;
      
      }
   
      public static int[] Get_layer(string dbname, string PID, int wid)
      {
          string[] input = Get_Information(dbname, PID);
          string[] temp_ParentID = input[0].Split(',');
          string[] temp_KidID = input[1].Split(',');
          string[] temp_PriceID = input[2].Split(',');
          int[] ParentID = new int[temp_ParentID.Length];
          int[] KidID = new int[temp_KidID.Length];
          int[] PriceID = new int[temp_PriceID.Length];
          for (int i = 0; i < ParentID.Length; i++)
          {
              int.TryParse(temp_ParentID[i], out ParentID[i]);
              int.TryParse(temp_KidID[i], out KidID[i]);
              int.TryParse(temp_PriceID[i], out PriceID[i]);
          }
          int[] result = new int[ParentID.Length];
          int[] result1 = new int[ParentID.Length];
          List<int> code_result = new List<int>();
          List<int> RiLayer = new List<int>();
        
          List<bool> code_show = new List<bool>();
         
          code_result.Add(wid);
          code_show.Add(true);
          RiLayer.Add(0);
          int count = 0;
          int nowWID = 0;
          int insert_count = 0;
          int layer = 0;

          while (count < code_result.Count)
          {
              nowWID = code_result[count];
              layer = RiLayer[count] + 1;
              insert_count = count + 1;
              for (int i = 0; i < ParentID.Length; i++)
              {
                  if (nowWID == ParentID[i])
                  {
                      code_show[count] = false;
                      code_result.Insert(insert_count, PriceID[i]);
                      code_show.Insert(insert_count, true);
                      RiLayer.Insert(insert_count, layer);
                      //RiLayer.Add(layer);
                      insert_count++;
                  }

              }
              count++;

              //layer =RiLayer.Max()+1;
          }
          //Get_layer(RiLayer);      

          //(RiLayer, out PriceID[i]);
          List<int> FinalResult = new List<int>();
          for (int i = 0; i < code_show.Count; i++)
          {
              //if (code_show[i])
              //{
              FinalResult.Add(RiLayer[i]);
              //}
          }

          //result = code_result.ToArray();
          //result = FinalResult.Distinct().ToArray();
          result = FinalResult.ToArray();
       
          if (result.Length > 1)
          {

          }
          return result;
      }
      public static string[] Get_Information(string dbname, string PID)
      {
          string[] result = new string[3];
          //string select_string = "Select a.ParentID,a.KidID,b.PriceID From Pro_Analysis a left join Pro_Resource b on a.KidID=b.PriceID where ParentID=" + wid;
          string select_string = "Select a.ParentID,a.KidID,b.PriceID From Pro_Analysis a left join Pro_Resource b on a.KidID=b.PriceID where PID="+PID;
          try
          {
              using (SqlConnection conn =
                  new SqlConnection(DBconnection.connect_string(dbname)))
              {
                  conn.Open();

                  using (SqlCommand cmd =
                      new SqlCommand(select_string, conn))
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
                             result[2] += reader.GetInt32(2).ToString() + ",";
                          }
                      }
                  }

                  conn.Close();
              }
          }
          catch (SqlException ex)
          {
              Console.Write(ex.ToString());
              //Log exception
              //Display Error message
          }
          if (result[0] !=null)
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


      public static int[] GetParentID(string dbname, string PID, int wid)
      {
          string[] input = Get_EBudgetInformation(dbname, PID);
          string[] temp_BKID = input[0].Split(',');
          string[] temp_RiUpperBKID = input[1].Split(',');
          //string[] temp_PriceID = input[2].Split(',');
          int[] RiUpperBKID = new int[temp_RiUpperBKID.Length];
          int[] BKID = new int[temp_BKID.Length];
          //int[] PriceID = new int[temp_PriceID.Length];
          for (int i = 0; i < RiUpperBKID.Length; i++)
          {
              int.TryParse(temp_RiUpperBKID[i], out RiUpperBKID[i]);
              int.TryParse(temp_BKID[i], out BKID[i]);
              //int.TryParse(temp_PriceID[i], out PriceID[i]);
          }
          int[] result = new int[RiUpperBKID.Length];
         
          List<int> code_result = new List<int>();
          //List<int> RiLayer = new List<int>();
          //int[] result = new int[WID.Length];
          //List<int> code_result = new List<int>();
          List<bool> code_show = new List<bool>();
          //for (int i = 0; i < RiUpperBKID.Length; i++)
          //{
          //    if (RiUpperBKID[i] == wid)
          //    {
          //        code_result.Add(RiUpperBKID[i]);
          //    }
          //}
          code_result.Add(wid);
          code_show.Add(true);
          //RiLayer.Add(0);
          int count = 0;
          int nowWID = 0;
          int insert_count = 0;
          //int layer = 0;

          while (count < code_result.Count)
          {
              nowWID = code_result[count];
             
              insert_count = count + 1;
              for (int i = 0; i < RiUpperBKID.Length; i++)
              {
                  if (nowWID == BKID[i])
                  {
                      code_show[count] = false;
                      code_result.Insert(insert_count, RiUpperBKID[i]);
                      code_show.Insert(insert_count, true);
                    
                      //RiLayer.Add(layer);
                      insert_count++;
                  }

              }
              count++;

              //layer =RiLayer.Max()+1;
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
          //result = FinalResult.Distinct().ToArray();
          result = FinalResult.ToArray();
               
          if (result.Length > 1)
          {

          }
          return result;

      }
      public static string[] Get_EBudgetInformation(string dbname, string PID)
      {
          string[] result = new string[2];
          //string select_string = "Select a.ParentID,a.KidID,b.PriceID From Pro_Analysis a left join Pro_Resource b on a.KidID=b.PriceID where ParentID=" + wid;
          string select_string = "Select BKID,RiUpperBKID From EBudget_ResourceBK where PID=" + PID;
          try
          {
              using (SqlConnection conn =
                  new SqlConnection(DBconnection.connect_string(dbname)))
              {
                  conn.Open();

                  using (SqlCommand cmd =
                      new SqlCommand(select_string, conn))
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
                              //result[2] += reader.GetInt32(2).ToString() + ",";
                          }
                      }
                  }

                  conn.Close();
              }
          }
          catch (SqlException ex)
          {
              Console.Write(ex.ToString());
              //Log exception
              //Display Error message
          }
          if (result[0].Length > 0)
          {
              for (int i = 0; i < result.Length; i++)
              {
                  result[i] = result[i].Substring(0, result[i].Length - 1);
              }
          }

          return result;
      }
    }
}
