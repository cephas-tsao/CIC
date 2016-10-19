using System;
using System.Web.UI.WebControls;
using System.Data;

namespace IMS
{
    public partial class FFundIncreaseAssign : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void Page_InitComplete(object sender, System.EventArgs e)
        {
            GridView1.Attributes.Add("style", "font-family:Microsoft JhengHei;");
            GridView1_GVgetData();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            bool Result = false;
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                GridViewRow gvr = GridView1.Rows[i];
                CheckBox ckb = (CheckBox)gvr.FindControl("checkbox1");
                if (ckb.Checked == true && ckb.Enabled == true)
                {
                    Result = DAL.FirmFundMode.Update_FFundDebitAssign(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["FFID"]), Convert.ToInt32(GridView1.DataKeys[i].Value));
                }
                else if (ckb.Checked == false && ckb.Enabled == true)
                {
                    Result = DAL.FirmFundMode.Update_FFundDebitAssign(Session["DatabaseName"].ToString(), 0, Convert.ToInt32(GridView1.DataKeys[i].Value));
                }
            }
            decimal SUM_SumPrice = DAL.FirmFundMode.SumPrice_Search_11(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["FFID"]), "I");
            Result = DAL.FirmFundMode.Update_FFundDebitAssign_3(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["FFID"]), SUM_SumPrice, "Item8");
            if (Result)
            {
                Response.Write("<script language=javascript>alert('選取成功！')</script>");
                Response.Write("<script>window.opener.document.getElementById('ContentPlaceHolder1_Self').click();self.close()</script>");
                Response.Write("<script language='javascript'>window.close();</" + "script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('選取失敗！')</script>");
            }
        }
        private void GridView1_GVgetData()
        {
            bool Result = DAL.FirmFundMode.FFund_Search3(Session["DatabaseName"].ToString(), Convert.ToInt32(Session["SCID"]), "I");
            if (Result)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("FF_MID");
                dt.Columns.Add("Subject");
                dt.Columns.Add("Type");
                dt.Columns.Add("Date");
                dt.Columns.Add("Price");
                dt.Columns.Add("Tax");
                dt.Columns.Add("SumPrice");
                dt.Columns.Add("Recorder");
                dt.Columns.Add("ckbSelect");
                dt.Columns.Add("ckb_Show");
                for (int i = 1; i < DAL.Temp2.i; i++)
                {
                    DataRow row = dt.NewRow();
                    if (DAL.Temp2.count[7, i] != "0" && DAL.Temp2.count[7, i] != Session["FFID"].ToString())
                    {
                        row["ckbSelect"] = "0";
                        row["ckb_Show"] = "0";
                    }
                    else if (DAL.Temp2.count[7, i] == "0")
                    {
                        row["ckbSelect"] = "0";
                        row["ckb_Show"] = "1";
                    }
                    else if (DAL.Temp2.count[7, i] == Session["FFID"].ToString())
                    {
                        row["ckbSelect"] = "1";
                        row["ckb_Show"] = "1";
                    }
                    row["FF_MID"] = DAL.Temp2.count[8, i];
                    row["Subject"] = DAL.Temp2.count[0, i];
                    row["Type"] = DAL.Temp2.count[1, i];
                    row["Date"] = DAL.Temp2.count[2, i];
                    row["Price"] = DAL.Temp2.count[3, i];
                    row["Tax"] = DAL.Temp2.count[4, i];
                    row["SumPrice"] = DAL.Temp2.count[5, i];
                    row["Recorder"] = DAL.Temp2.count[6, i];
                    dt.Rows.Add(row);
                }
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
}