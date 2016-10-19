using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace IMS
{
    /// <summary>
    /// showImage 的摘要描述
    /// </summary>
    public class showImage : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            if (context.Session["myFile"] != null)
            {
                HttpPostedFile myFile = (HttpPostedFile)context.Session["myFile"];
                int nFileLen = myFile.ContentLength;
                // Allocate a buffer for reading of the file

                byte[] myData = new byte[nFileLen];
                myFile.InputStream.Read(myData, 0, nFileLen);
                context.Response.Clear();
                context.Response.ContentType = "image/jpeg";
                context.Response.ContentType = "image/gif";
                context.Response.ContentType = "image/png";
                context.Response.ContentType = "image/jpg";
                context.Response.BinaryWrite(myData);
            }
            //context.Response.Write("Hello World");
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