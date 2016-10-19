using System;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class AcceptanceView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["PID"] = Session["ProjectCode"];
            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(Session["DatabaseName"].ToString());
            Pnl_Detail.Enabled = false;
            GridView1.Attributes.Add("style", "font-family:Microsoft JhengHei;");
            if (!IsPostBack)
            {
                DAL.Temp.cc = -1;
            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if ((Pnl_View.Visible == true))
            {
                Pnl_View.Visible = false;
            }
            else {
                Pnl_View.Visible = true;
            }
        }
        protected void Button3_Click(object sender, EventArgs e)
        {

        }
        protected void RadioButtonList8_SelectedIndexChanged(object sender, EventArgs e)
        {
            if ((RadioButtonList8.SelectedIndex == 1))
            {
                TB_ResultNO2.Visible = true;
            }
            else
            {
                TB_ResultNO2.Visible = false;
            }
        }

        protected void GridView1_RowDataBound(Object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowIndex > -1)
            {
                e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#e4c0d6'");
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c;");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DAL.Temp.cc != -1)
            {
                if ((DAL.Temp.cc % 2) == 0)
                {
                    GridView1.Rows[DAL.Temp.cc].BackColor = System.Drawing.ColorTranslator.FromHtml("#EFF3FB");
                }
                else
                {
                    GridView1.Rows[DAL.Temp.cc].BackColor = System.Drawing.ColorTranslator.FromHtml("#FFFFFF");
                }
            }
            GridView1.Rows[GridView1.SelectedIndex].BackColor = System.Drawing.ColorTranslator.FromHtml("#c0d6e4");
            DAL.Temp.cc = GridView1.SelectedIndex;
            DAL.Temp3.cc = Convert.ToInt32(GridView1.DataKeys[GridView1.SelectedIndex].Value);
            Pnl_Detail.Visible = true;
            DropDownList2.SelectedValue = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Type");
            RadioButtonList5.SelectedValue = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "AllPart");
            TextBox15.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Batch");
            TextBox16.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Date");
            TextBox17.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Location");
            TextBox18.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Code");
            TextBox19.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "FirmName");
            TextBox20.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "TargetNumber");
            RadioButtonList6.SelectedValue = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "PurchaseLevel");
            TextBox21.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "DeadlineDate");
            TextBox22.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "CompletionDate");
            TextBox21.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "DeadlineDate");
            TextBox22.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "CompletionDate");
            RadioButtonList7.SelectedValue = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "OverNY");
            TextBox23.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "ContractPrice");
            TextBox24.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "ChangeCount");
            TextBox25.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Process");
            RadioButtonList8.SelectedValue = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Result");
            TB_ResultNO2.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "ResultNOT");
            TextBox26.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "ImproveDate");
            TextBox27.Text = DAL.CompletionMode.AcceptanceM_Search(Session["DatabaseName"].ToString(), DAL.Temp3.cc, "Notes");
            if ((RadioButtonList8.SelectedIndex == 1))
            {
                TB_ResultNO2.Visible = true;
            }
            else
            {
                TB_ResultNO2.Visible = false;
            }
        }

        protected void TextBox22_TextChanged(object sender, EventArgs e)
        {
            if (DateTime.Compare(Convert.ToDateTime(TextBox22.Text), Convert.ToDateTime(TextBox22.Text)) > 0 || DateTime.Compare(Convert.ToDateTime(TextBox22.Text), Convert.ToDateTime(TextBox22.Text)) == 0)
            {
                RadioButtonList7.SelectedValue = "未逾期";
            }
            else
            {
                RadioButtonList7.SelectedValue = "逾期";
            }
        }
    }
}