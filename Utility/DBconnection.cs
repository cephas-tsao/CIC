using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace Utility
{
    public class DBconnection
    {

        //static string datasource = "140.118.5.148";
        static string datasource = "140.118.5.112";
        //static string datasource = "140.118.105.228";

        //static string filepath = @"D:\Temp2\Information";
        //static string[] temp = StreamReadTextFile_Fn(filepath).Split(';');
        //static string datasource = temp[0]; //"WANG-PC\\SQLEXPRESS";
        //static string database_userid = temp[1]; //"CICIMS";
        //static string database_password = temp[2]; //"ntustCIC419";

        //static string datasource = "WANG-PC\\SQLEXPRESS";

        static string database_userid = "CICIMS";
        static string database_password = "ntustCIC419";

        public static string connect_string(string dbname)
        {
            string outp = "";
            outp = "Data Source=" + datasource + ";Initial Catalog=" + dbname + ";Persist Security Info=True;User ID=" + database_userid + ";Password=" + database_password;
            return outp;
        }



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
