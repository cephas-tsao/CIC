using System;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Linq;
using System.Data.SqlClient;
using System.Web.Configuration;
using Utility;


namespace IMS
{
    public partial class KCheckListLUpload : System.Web.UI.Page
    {
       
        // 設定縮圖後的檔案存放路徑
        //private const string savePath = DAL.SystemSet.savePath(Session["DatabaseName"].ToString());

        // 設定暫存路徑
        private const string tempPath = @"~\UplaodFile\";

        String KCheckListLostId;

        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Session["KCheckListLostId"].ToString();
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Boolean fileOk = false;
            String savePath = DAL.SystemSet.savePath(Session["DatabaseName"].ToString());
            if (FU1.HasFile == false) return;

            // FU1.FileName 只有 "檔案名稱.附檔名"，並沒有 Client 端的完整理路徑
            string filename = FU1.FileName;

            string extension = Path.GetExtension(filename).ToLowerInvariant();
            // 判斷是否為允許上傳的檔案附檔名

            String fileExtension = System.IO.Path.GetExtension(FU1.FileName).ToLower();  //取得上傳的檔案類型


            //檢查檔案大小

            string[] allowExtension = { ".jpg", ".gif", ".png", ".jpeg" };
            //对上传的文件的类型进行一个个匹对
            for (int i = 0; i < allowExtension.Length; i++)
            {
                if (fileExtension == allowExtension[i])
                {
                    fileOk = true;
                    break;
                }
            }
            //
            if (fileOk)
            {
                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('只允許上傳圖片');", true);
            }

            // 限制檔案大小，限制為 2MB
            /**
            int filesize = FU1.PostedFile.ContentLength;
            if (filesize > 2100000)
            {
                lblMessage.Text = "檔案大小上限為 2MB，該檔案無法上傳";
                return;
            }
    **/
            // 檢查 Server 上該資料夾是否存在，不存在就自動建立
            //string serverDir = @"G:\FileUploadDemo";
            if (Directory.Exists(savePath) == false) Directory.CreateDirectory(savePath);

            // 判斷 Server 上檔案名稱是否有重覆情況，有的話必須進行更名
            // 使用 Path.Combine 來集合路徑的優點
            //  以前發生過儲存 Table 內的是 \\ServerName\Dir（最後面沒有 \ 符號），
            //  直接跟 FileName 來進行結合，會變成 \\ServerName\DirFileName 的情況，
            //  資料夾路徑的最後面有沒有 \ 符號變成還需要判斷，但用 Path.Combine 來結合的話，
            //  資料夾路徑沒有 \ 符號，會自動補上，有的話，就直接結合
            string serverFilePath = Path.Combine(savePath, filename);
            string fileNameOnly = Path.GetFileNameWithoutExtension(filename);
            int fileCount = 1;
            while (File.Exists(serverFilePath))
            {
                // 重覆檔案的命名規則為 檔名_1、檔名_2 以此類推
                filename = string.Concat(fileNameOnly, "_", fileCount, extension);
                serverFilePath = Path.Combine(savePath, filename);
                fileCount++;
            }






            // 把檔案傳入指定的 Server 內路徑
            // try
            //{
            if (fileOk)
            {
                String DBName = Session["DatabaseName"].ToString();
                SqlConnection connStr = new SqlConnection(Utility.DBconnection.connect_string(DBName));

                connStr.Open(); //開啟資料庫的連結

                String select = "INSERT INTO KCheckListLostUpload(KCheckListLostId,DateTime,UploadAddress,Remark,Status) Values('" + Label1.Text + "','" + DateTime.Now.ToString("yyyy/MM/dd") + "','" + filename + "','" + TextBox1.Text + "','" + DropDownList1.Text + "')";   //宣告SQL語法的字串，這邊可依照自行需求修改
                SqlCommand cmd = new SqlCommand(select, connStr);
                cmd.ExecuteNonQuery();


                string tempName = tempPath + FU1.FileName;
                //string imageName = savePath + FU1.FileName;

                // 儲存暫存檔
                FU1.SaveAs(tempName);

                // System.Web.UI.WebControls 與 System.Drawing 同時擁有 Image 類別
                // 所以以下程式碼明確指定要使用的是 System.Drawing.Image

                System.Drawing.Image.GetThumbnailImageAbort callBack =
                 new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback);
                Bitmap image = new Bitmap(tempName);

                // 計算維持比例的縮圖大小
                int[] thumbnailScale = getThumbnailImageScale(300, 300, image.Width, image.Height);

                // 產生縮圖
                System.Drawing.Image smallImage =
                image.GetThumbnailImage(thumbnailScale[0], thumbnailScale[1], callBack, IntPtr.Zero);

                // 將縮圖存檔
                smallImage.Save(serverFilePath);

                // 釋放並刪除暫存檔
                image.Dispose();
                System.IO.File.Delete(tempName);

                //FU1.SaveAs(serverFilePath);
                lblMessage.Text = "檔案上傳成功";

                ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert('檔案上傳成功');", true);

            }
            // }
            // catch (Exception ex)
            //  {
            //     lblMessage.Text = ex.Message;
            // }
        }


        // 計算維持比例的縮圖大小
        private int[] getThumbnailImageScale(int maxWidth, int maxHeight, int oldWidth, int oldHeight)
        {
            int[] result = new int[] { 0, 0 };
            float widthDividend, heightDividend, commonDividend;

            widthDividend = (float)oldWidth / (float)maxWidth;
            heightDividend = (float)oldHeight / (float)maxHeight;

            commonDividend = (heightDividend > widthDividend) ? heightDividend : widthDividend;
            result[0] = (int)(oldWidth / commonDividend);
            result[1] = (int)(oldHeight / commonDividend);

            return result;
        }

        private bool ThumbnailCallback()
        {
            return false;
        }

        protected void BtnBack_Click1(object sender, EventArgs e)
        {
            Response.Write("<script language='javascript'>window.close();</" + "script>");
        }


    }
}