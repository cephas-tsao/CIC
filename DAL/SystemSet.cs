using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace DAL
{
   public class SystemSet
    {
        // MSSQL搜尋特殊字串
        /// <summary>
        /// MSSQL搜尋特殊字串
        /// </summary>
        /// <param name="ThisMSSQLString">搜尋字串</param>
        /// <returns></returns>
        public static string CheckMSSQLLike(string ThisMSSQLString)
        {
            return ThisMSSQLString.Replace("_", "[_]").Replace("%", "[%]");
        }

        public static string GetString(object obj, string def)
        {
            if (obj != null)
            {
                def = obj.ToString().Replace("'", "''");
            }
            return def;
        }
        //去除空白
        /// <summary>
        /// 去除空白
        /// </summary>
        /// <param name="value">字串</param>
        /// <returns>回傳結果</returns>
        public static string ReplaceBlank(string value)
        {
            string ValueString = value.Trim();
            ValueString = ValueString.Replace(" ", "");
            ValueString = ValueString.Replace("　", "");
            ValueString = ValueString.Replace("'", "");

            return ValueString;
        }

        //取得Request參數
        /// <summary>
        /// 取得Request參數
        /// </summary>
        /// <param name="ThisString">Request參數</param>
        /// <returns>回傳結果</returns>
        public static string GetRequestSet(string ThisString)
        {
            if (HttpContext.Current.Request[ThisString] != null)
                return HttpContext.Current.Request[ThisString].ToString();
            else
                return "";
        }
       /// <summary>
        /// 上傳標案工料項目檔案
       /// </summary>
       /// <param name="dbname"></param>
       /// <returns></returns>
        public static string savePath(string dbname)
        {
            //string output = @"D:\UploadFile\" + dbname + @"\BidResourceFile\";
            //string output = @"D:\asp.net\IMS\IMS\UploadFile\BidResourceFile\";
            //string output = @"C:\SVN_CCIM\trunk\IMS\UploadFile\" + dbname + @"\BidResourceFile\";
            string output = @"C:\CIC\UploadFile\" + dbname + @"\BidResourceFile\";
            return output;
        }

        public static string tempPath(string dbname)
        {
            //string output = @"D:\UploadFile\" + dbname + @"\BidResourceFile\";
            //string output = @"D:\asp.net\IMS\IMS\UploadFile\BidResourceFile\";
            string output = @"C:\CIC\UploadFile\" + dbname + @"\BidResourceFile\temp\";
            return output;
        }
        //檢查是否為英文與數字
        /// <summary>
        /// 檢查是否為英文與數字
        /// </summary>
        /// <param name="value">字串</param>
        /// <returns>回傳結果</returns>
        public static bool IsNatural_Number(string value)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(value, @"^[A-Za-z0-9]+$");
        }

        //檢查是否為英文
        /// <summary>
        /// 檢查是否為英文
        /// </summary>
        /// <param name="value">字串</param>
        /// <returns>回傳結果</returns>
        public static bool IsLetter(string value)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(value, @"^[A-Za-z]+$");
        }

        //檢查是否為數字
        /// <summary>
        /// 檢查是否為數字
        /// </summary>
        /// <param name="value">字串</param>
        /// <returns>回傳結果</returns>
        public static bool IsNumber(string value)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(value, @"^[0-9]+$");
        }

        //檢查是否為數字+英文
        /// <summary>
        /// 檢查是否為數字+英文
        /// </summary>
        /// <param name="value">字串</param>
        /// <returns>回傳結果</returns>
        public static bool IsNumberLetter(string value)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(value, @"^(?=.*\d)(?=.*[A-Za-z]).{8,20}$");
        }

        //檢查日期(2010/09/01)
        /// <summary>
        /// 檢查日期
        /// </summary>
        /// <param name="StrSource">字串</param>
        /// <returns>回傳結果</returns>
        public static bool IsDate(string StrSource)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(StrSource, @"^((((1[6-9]|[2-9]\d)\d{2})/(0?[13578]|1[02])/(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})/(0?[13456789]|1[012])/(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})/0?2/(0?[1-9]|1\d|2[0-9]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))/0?2/29/))$");
       

        }
        public static bool IsDate1(string StrSource)
        {
            DateTime temp;
            return DateTime.TryParse(StrSource, out temp);
        }
        //檢查是否為正整數
        /// <summary>
        /// 檢查是否為正整數
        /// </summary>
        /// <param name="value">字串</param>
        /// <returns>回傳結果</returns>
        public static bool IsNumeric(string value)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(value, @"^[0-9]*[1-9][0-9]*$");
        }

        public static bool Float(string value)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(value, @"^(-?\d+)(\.\d+)?$");
        }

        public struct RegularExp
        {
            public const string Chinese = @"^[\u4E00-\u9FA5\uF900-\uFA2D]+$";
            public const string Color = "^#[a-fA-F0-9]{6}";
            public const string Date = @"^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$";
            public const string DateTime = @"^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-)) (20|21|22|23|[0-1]?\d):[0-5]?\d:[0-5]?\d$";
            //Email驗證
            public const string Email = @"^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$";
            public const string Float = @"^(-?\d+)(\.\d+)?$";
            public const string ImageFormat = @"\.(?i:jpg|bmp|gif|ico|pcx|jpeg|tif|png|raw|tga)$";
            public const string Integer = @"^-?\d+$";
            public const string IP = @"^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$";
            public const string Letter = "^[A-Za-z]+$";
            public const string LowerLetter = "^[a-z]+$";
            public const string MinusFloat = @"^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$";
            public const string MinusInteger = "^-[0-9]*[1-9][0-9]*$";
            public const string Mobile = "^0{0,1}13[0-9]{9}$";
            public const string NumbericOrLetterOrChinese = @"^[A-Za-z0-9\u4E00-\u9FA5\uF900-\uFA2D]+$";
            //數值驗證
            public const string Numeric = "^[0-9]+$";
            //英數驗證
            public const string NumericOrLetter = "^[A-Za-z0-9]+$";
            public const string NumericOrLetterOrUnderline = @"^\w+$";
            public const string PlusFloat = @"^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$";
            public const string PlusInteger = "^[0-9]*[1-9][0-9]*$";
            public const string Telephone = @"(\d+-)?(\d{4}-?\d{7}|\d{3}-?\d{8}|^\d{7,8})(-\d+)?";
            public const string UnMinusFloat = @"^\d+(\.\d+)?$";
            public const string UnMinusInteger = @"\d+$";
            public const string UnPlusFloat = @"^((-\d+(\.\d+)?)|(0+(\.0+)?))$";
            public const string UnPlusInteger = @"^((-\d+)|(0+))$";
            public const string UpperLetter = "^[A-Z]+$";
            //網址驗證
            public const string Url = @"^http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)?$";
        }
    }
}
