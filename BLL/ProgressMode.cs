using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ProgressMode
    {
        public static string[] Get_TheLowestLayerCode(string[] LayerCode, string[] ItemOrder, string[] Item)
        {
            string[] result = new string[3];
            bool[] check = new bool[LayerCode.Length];
            for (int k = 0; k < LayerCode.Length; k++)
            {
                check[k] = true;
            }
            for (int k = 0; k < 3; k++)
            {
                result[k] = "";
            }
            for (int i = 0; i < LayerCode.Length; i++)
            {
                for (int j = 0; j < LayerCode.Length; j++)
                {
                    if (i == j)
                    {
                        continue;
                    }
                    else
                    {
                        if (LayerCode[j].IndexOf(LayerCode[i]) == 0)
                        {
                            check[i] = false;
                        }
                    }
                }
                if (check[i])
                {
                    result[0] += LayerCode[i] + ",";
                    result[1] += ItemOrder[i] + ",";
                    result[2] += Item[i] + ",";
                }
            }
            if (result[0].Length > 0)
            {
                for (int k = 0; k < 3; k++)
                {
                    result[k] = result[k].Substring(0, result[k].Length - 1);
                }
            }
            return result;
        }
    }
}
