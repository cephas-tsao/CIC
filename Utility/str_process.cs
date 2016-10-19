using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utility
{
    public class str_process
    {
        public static string[] str2array(string arr)
        {
            string[] outp;
            if (arr == null)
            {
                outp = new string[1];
                outp[0] = "";
            }
            else
            {
                outp = arr.Split(',');
            }
            return outp;
        }

    }
}
