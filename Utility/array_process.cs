using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utility
{
    public class array_process
    {
        public static string array2str(string[] inp)
        {
            string outp = "";
            foreach (string i in inp)
            {
                outp += i + ",";
            }
            outp = outp.Substring(0, outp.Length - 1);
            return outp;
        }

        public static string[] array_del_byindex(string[] arr, int index)
        {
            string[] outp = new string[arr.Length - 1];
            int count = 0;
            for (int i = 0; i < arr.Length; i++)
            {
                if (i != index)
                {
                    outp[count] = arr[i];
                    count++;
                }
            }
            return outp;
        }
    }
}
