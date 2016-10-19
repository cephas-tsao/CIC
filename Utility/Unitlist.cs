using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Sql;
using System.Data.SqlClient;

namespace Utility
{
    public class Unitlist
    {
        public static string[] UnitList()
        {
            List<string> Unit = new List<string>();
            string[] output = new string[41];
            Unit.Add("M");
            Unit.Add("M2");
            Unit.Add("M3");
            Unit.Add("KG");
            Unit.Add("才");
            Unit.Add("CM");
            Unit.Add("T");
            Unit.Add("個");
            Unit.Add("樘");
            Unit.Add("式");
            Unit.Add("處");
            Unit.Add("支");
            Unit.Add("組");
            Unit.Add("戶");
            Unit.Add("L.M3");
            Unit.Add("B.M3");
            Unit.Add("C.M3");
            Unit.Add("孔");
            Unit.Add("片");
            Unit.Add("座");
            Unit.Add("L");
            Unit.Add("面");
            Unit.Add("台");
            Unit.Add("株");
            Unit.Add("塊");
            Unit.Add("只");
            Unit.Add("根");
            Unit.Add("套");
            Unit.Add("批");
            Unit.Add("具");
            Unit.Add("時");
            Unit.Add("天");
            Unit.Add("月");
            Unit.Add("趟");
            Unit.Add("工");
            Unit.Add("片/月");
            Unit.Add("包");
            Unit.Add("CM3");
            Unit.Add("付");
            Unit.Add("對");
            Unit.Add("盞");
            Unit.Add("箱");
            output = Unit.ToArray();
            return output;
        }

        public static string[] ModuleList()
        {
          
            List<string> Module = new List<string>();
            Module.Add("工料管理");
            Module.Add("共用詞庫");
            Module.Add("包商管理");
            Module.Add("投標管理");
            Module.Add("投標預算");
            Module.Add("專案管理");
            Module.Add("合約預算");
            Module.Add("執行預算");
            Module.Add("施工元件");
            Module.Add("採購發包");
            Module.Add("包商計價");
            Module.Add("業主請款");
            Module.Add("變更管理");
            Module.Add("財務管理");
            Module.Add("竣工驗收");
            Module.Add("圖說管理");
            Module.Add("進度管理");
            Module.Add("日報管理");
            Module.Add("品質管理");
            Module.Add("工程技術");
            Module.Add("行政作業");
            Module.Add("權限管理");
            Module.Add("功能測試");
            string[] output = Module.ToArray();
            return output;
        }
        public static string[] ItemKind()
        {
            List<string> ItemKind = new List<string>();
            ItemKind.Add("連工帶料項");
            ItemKind.Add("材料");
            ItemKind.Add("人力");
            ItemKind.Add("機具");
            ItemKind.Add("雜項");
           
            string[] output = ItemKind.ToArray();
            return output;
        }
        //public static [] WBSItem()
        //{
        //    List<string> Item = new List<string>();
        //    Item.Add("-請選擇-", "0");
        //    Item.Add("工項", "X");
        //    Item.Add("包商管理");
        //    Item.Add("投標管理");
        //    Item.Add("投標預算");
        //    Item.Add("專案管理");
        //    Item.Add("合約預算");

        //    string[] output = Item.ToArray();
        //    return output;
        //}
        /// <summary>
        /// 標案狀態
        /// </summary>
        /// <returns></returns>
        public static string GetBid()
        {
            return "-請選擇-,已成案未領標,已領標,其他";
        }

        public static string GetBid1()
        {
            return "-請選擇-,已成案未領標,已領標,不領標,已領標評估中,不進行備標,備標中,標前會議決議不投標,備標完成,得標,未得標,流標,廢標,重新招標,已轉專案";
        }
        /// <summary>
        /// 工程所在國家
        /// </summary>
        /// <returns></returns>
        public static string Country()
        {
            return "請選擇國家...,中華民國(臺灣),中國";
        }
        /// <summary>
        /// 工程所在縣市
        /// </summary>
        /// <returns></returns>
        public static string City()
        {
            return "-請選擇-,台北市,新北市,基隆市,桃園縣,新竹市,新竹縣,苗栗縣,台中市,彰化縣,雲林縣,嘉義縣,南投縣,台南市,高雄市,屏東縣,台東縣,宜蘭縣,花蓮縣,澎湖縣,金門縣,連江縣,北京,上海";
        }
        /// <summary>
        /// 決標方式
        /// </summary>
        /// <returns></returns>
        public static string Awarding()
        {
            return "-請選擇-,同質最低標,異質最低標,異質最有利標,合理標價,複數決標,其他";
        }
        /// <summary>
        /// 選擇是否
        /// </summary>
        /// <returns></returns>
        public static string YesNo()
        {
            return "-請選擇-,是,否";
        }
        /// <summary>
        /// 撈出menu值
        /// </summary>
        /// <returns></returns>
        public static string[] ModuleListNew()
        {
            string ModuleName = get_Menu().Substring(0,get_Menu().Length-1);
            List<string> Module = new List<string>();
          
              foreach (string DataName in ModuleName.Split(','))
            {
                Module.Add(DataName);
            }
            
            string[] output = Module.ToArray();
            return output;
        }
        public static string get_Menu()
        {
            string dbname = "PublicDB";
         
            string result = "";
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select [Menu] from Menu Where used=1 ORDER BY ordernum Asc", conn))
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
                    return result;
                }
            }
            catch (SqlException ex)
            {
                //console.Write(ex.ToString());
                return result;
               
            }

        }
        public static string[] PageList(string dbname)
        {
            string[] result = new string[2];
            try
            {
                string connectionString = Utility.DBconnection.connect_string(dbname);
                using (SqlConnection conn =
                    new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand cmd =
                        new SqlCommand("select PageID, PageURL from PageList", conn))
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
                                    result[0] += reader.GetInt32(0).ToString() + ",";
                                    result[1] += reader.GetString(1) + ",";
                                }
                            }
                        }
                    }

                    conn.Close();
                    for (int j=0;j<2;j++)
                    {
                        if (result[j].Length > 0)
                        {
                            result[j] = result[j].Substring(0, result[j].Length - 1);
                        }
                    }
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



        /// <summary>
        /// 承攬方式
        /// radiobuttonlist
        /// </summary>
        /// <returns></returns>
        public static string ContractWay()
        {
            return "實做實算,總價承攬,實做+總價,統包,其他";
        }

        /// <summary>
        /// 工期計算方式
        /// </summary>
        /// <returns></returns>
        public static string DurationType()
        {
            return "-請選擇-,限期完工,工作天,日曆天,其他";
        }

        /// <summary>
        /// 開工期限形式
        /// radiobuttonlist
        /// </summary>
        /// <returns></returns>
        public static string StartDeadlinetype()
        {
            return "業主通知後,建照取得後,西元(YYYY/MM/DD),合約簽訂後";
        }
        /// <summary>
        /// 工期形式
        /// radiobuttonlist
        /// </summary>
        /// <returns></returns>
        public static string DurationType_Punish()
        {
            return "西元,工作天,日曆天,其他";
        }
        /// <summary>
        /// 罰款
        /// radiobuttonlist
        /// </summary>
        /// <returns></returns>
        public static string Punish()
        {
            return "千分之,一天";
        }
        /// <summary>
        /// 工程分類
        /// </summary>
        /// <returns></returns>
        public static string ClassList()
        {
            return "-請選擇-,建築工程,隧道工程,自來水工程,機場工程,高速公路工程,橋梁工程,捷運系統工程,發電工程,公路工程,污水處理廠工程,市區道路工程,高速鐵路工程,鐵路工程,明挖覆蓋隧道工程,港灣工程,水庫工程,河川整治工程,灌溉排水工程,海洋放流工程,焚化廠工程,掩埋場工程,土地重劃工程,水力發電工程,下水道工程,土方資源場工程,山坡地開發,工業區開發工程,其他工程";
        }
        /// <summary>
        /// 履約保證金
        /// </summary>
        /// <returns></returns>
        public static string Percent()
        {
            return "金額,百分比";
        }
        /// <summary>
        /// 工程區分
        /// </summary>
        /// <returns></returns>
        public static string Engineer()
        {
            return "公共工程,民間工程";
        }

        public static string[] Weather()
        {
            List<string> All_Weather = new List<string>();
            All_Weather.Add("晴");
            All_Weather.Add("陰");
            All_Weather.Add("雨");
            All_Weather.Add("豪雨");
            All_Weather.Add("颱風");
            string[] output = All_Weather.ToArray();
            return output;
        }
    }
}
