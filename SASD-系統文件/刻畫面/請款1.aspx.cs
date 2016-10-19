using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 請款1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["PID"] = "1";
        DisableTextBox(Pnl_1);
    }
    public static void DisableTextBox(Control control)
    {
        //if (control.HasChildren)
        //{
        foreach (Control subControl in control.Controls)
        {
            if (subControl is TextBox)
                (subControl as TextBox).Enabled = false;
            else if (subControl is CheckBox)
                (subControl as CheckBox).Enabled = false;
        }
        //}
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Pnl_1.Visible = true;
    }
    public void OpenNewWindowA(string url, string Tgr)
    {
        string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=yes,height=700,width=1500";
        ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
    }
    public void OpenNewWindowB(string url, string Tgr)
    {
        string winFeatures = "toolbar=no,status=no,menubar=no,location=center,scrollbars=no,resizable=yes,height=700,width=1000";
        ClientScript.RegisterStartupScript(this.GetType(), "newWindow", string.Format("<script type='text/javascript'>window.open('{0}','" + Tgr + "', '{1}');</script>", url, winFeatures));
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        OpenNewWindowA("OFundItemView.aspx", "A");
    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        OpenNewWindowB("OFundDebitView.aspx", "A");
    }
    protected void Button11_Click(object sender, EventArgs e)
    {
        OpenNewWindowB("OFundIncreaseView.aspx", "A");
    }
}