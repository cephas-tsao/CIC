using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class CResourceList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            SqlDataSource1.SelectCommand = "Select  *  from CBudget_WBS a left join Pro_Resource b on a.PriceID=b.PriceID where a.PID=" + Session["ProjectCode"] + "  and  a.PriceID is not null  order by LayerCode";
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {


                DataRow vsDr = (DataRow)((DataRowView)e.Item.DataItem).Row;

                Label Priceid = (Label)e.Item.FindControl("Priceid");
                Label LbCode = (Label)e.Item.FindControl("LbCode");               
                Label LbItemName = (Label)e.Item.FindControl("LbItemName");
                Label LbUnit = (Label)e.Item.FindControl("LbUnit");
                Label LbAmount = (Label)e.Item.FindControl("LbAmount");
                TextBox TxPrice = (TextBox)e.Item.FindControl("TxPrice");

                TxPrice.Style.Add("text-align", "right");
                Priceid.Text = vsDr["Priceid"].ToString();
                LbCode.Text = vsDr["Code"].ToString();              
                LbItemName.Text = vsDr["ItemName"].ToString();                
                LbUnit.Text = vsDr["Unit"].ToString();
                LbAmount.Text = vsDr["CAmount"].ToString();
                TxPrice.Text = vsDr["CPrice"].ToString();
               
            }
        }

        protected void SaveAction_Click(object sender, EventArgs e)
        {
            foreach (RepeaterItem item in Repeater1.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {

                    Label Priceid = item.FindControl("Priceid") as Label;
                    TextBox TxPrice = (TextBox)item.FindControl("TxPrice") as TextBox;
                    int Number = 0;
                    if (TxPrice.Text !="")
                    {
                    bool output = int.TryParse(TxPrice.Text, out Number);
                    if (output)
                    {
                        
                        string ID = Priceid.Text;
                        string number = TxPrice.Text;
                        SqlDataAdapter adp = new SqlDataAdapter("UPDATE Pro_Resource SET CPrice= @CPrice  WHERE [PriceID] ='" + ID + "'", Utility.DBconnection.connect_string(Session["DatabaseName"].ToString()));

                        adp.SelectCommand.Parameters.AddWithValue("@CPrice", number);

                        DataSet ds = new DataSet();
                        adp.Fill(ds);

                    }
                    //else
                    //{
                    //    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 請輸入數字');", true);
                    //}
                    }
                    ScriptManager.RegisterStartupScript((System.Web.UI.Page)HttpContext.Current.Handler, this.GetType(), "ShowMessage", "alert(' 檔案已儲存');", true);
                   
                }
            }
            Repeater1.DataBind();
        }

        protected void Recovery_Click(object sender, EventArgs e)
        {
            Repeater1.Controls.Clear();
            Repeater1.DataBind();
        }
    }
}