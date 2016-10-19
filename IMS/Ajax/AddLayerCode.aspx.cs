using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace IMS.Ajax
{
    public partial class AddLayerCode : System.Web.UI.Page
    {
        protected string asaction = string.Empty;
        int uid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.asaction =SystemSet.GetString(base.Request["action"], string.Empty);
          
            if (this.asaction == "addsave")
            {
                
                //string SQLString = "Select MAX(UID) as uid from Bid_WBS where bid=" + Session["Bid"].ToString() + "";
                string SQLString = "Select * from Bid_WBS where bid=" + Session["Bid"].ToString() + "";
                string database = Session["DatabaseName"].ToString();
                DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {

                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        uid = int.Parse(row["UID"].ToString());
                        main(uid);
                    }
                }
              
            }
        }
        public void main(int UID1)
        {

            string SQLString = "Select * from Bid_WBS where bid=" + Session["Bid"].ToString() + "";
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
            int[] UID = new int[DataTableBox.Rows.Count];
            int[] UpperUID = new int[DataTableBox.Rows.Count];
            int[] sortnumber = new int[DataTableBox.Rows.Count];

            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                int count = 0;
                foreach (DataRow row in DataTableBox.Rows)
                {
                    UID[count] = int.Parse(row["UID"].ToString());
                    sortnumber[count] = int.Parse(row["SortNum"].ToString());
                    if (row["UpperUID"].ToString() == "")
                    {
                        UpperUID[count] = 0;
                    }
                    else
                    {
                        UpperUID[count] = int.Parse(row["UpperUID"].ToString());
                    }
                    //UpperUID[count]=(row["UpperUID"]==null)?0:int.Parse(row["UpperUID"].ToString());
                    count++;
                }
            }

            //int[] UID = { int.Parse(row["UID"].ToString())};
            //int[] UpperUID = { 0, 2, 3, 3, 3, 2, 7, 7, 7, 7, 7 };
            //int[] sortnumber = { 1, 1, 1, 2, 3, 2, 1, 2, 3, 4, 5 };
            string[] result = gen_LayerCode(UID, UpperUID, sortnumber);
            string result1 = "";
            for (int k = 0; k < UID.Length; k++)
            {
                if (UID1 == UID[k])
                {
                    result1 = result[k];
                    break;
                }
            }
            string SQLLayerCode = "update Bid_WBS set LayerCode='" + result1 + "' where UID = " + UID1 + "";
        
          bool result2 = WebModel.SQLAction(database, SQLLayerCode);

        }

        /// <summary> 
        /// 產生LayerCode方法
        /// </summary>
        /// <param name="UID"></param>
        /// <param name="UpperUID"></param>
        /// <param name="sortnumber"></param>
        /// <returns></returns>
        public string[] gen_LayerCode(int[] UID, int[] UpperUID, int[] sortnumber)
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

        public int getsortnumber_by_UID(int nowUID, int[] UID, int[] sortnumber)
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

        public int getUpperUID_by_UID(int nowUID, int[] UID, int[] UpperUID)
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
        public int sum_UID(int[] UID)
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
    }
}