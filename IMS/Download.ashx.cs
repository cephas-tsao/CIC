using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace IMS
{
    /// <summary>
    /// Download 的摘要描述
    /// 提供下載介面
    /// </summary>
    public class Download : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string FileID = context.Request.QueryString["file"];
            string FileType = context.Request.QueryString["function"];
            string Company = context.Request.QueryString["company"];
            string Savepath = @"/UploadFile/";
            if (FileType == "IllMode")
            {
                string[] result = DAL.IllMode.Get_IllustratedNewDocName_by_IllustratedDocID(Company, int.Parse(FileID));
                //Savepath = DAL.IllMode.savePath(Company);
                Savepath += Company + @"/IllustratedDoc/";
                string fullpath = Savepath + result[0];
                if (File.Exists(context.Server.MapPath(fullpath)))
                {
                    string fileName = result[1];

                    //context.Response.HeaderEncoding = System.Text.Encoding.GetEncoding("big5");
                    context.Response.AddHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
                    context.Response.ContentType = "application/download";
                    //FileCRUD FM = new FileCRUD();
                    //FM.xDownload(RealFilePath, FilePath);
                    context.Response.WriteFile(fullpath);
                }
            }
            else if (FileType == "ConIllLibrary")
            {
                string result = DAL.ConIllLibrary.Get_ElementFileName_by_ElementID(Company, int.Parse(FileID));
                Savepath += Company + @"/ConstructionLibrary/";
                string fullpath = Savepath + FileID + "_" + result;
                if (File.Exists(context.Server.MapPath(fullpath)))
                {
                    string fileName = result;

                    //context.Response.HeaderEncoding = System.Text.Encoding.GetEncoding("big5");
                    context.Response.AddHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
                    context.Response.ContentType = "application/download";
                    //FileCRUD FM = new FileCRUD();
                    //FM.xDownload(RealFilePath, FilePath);
                    context.Response.WriteFile(fullpath);

                }
            
            }
            
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}