using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class TuneDecimal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
      
        protected void ReCal_Click(object sender, EventArgs e)
        {

            string RBLRuleValue1 = "";
            string TxDecmal1 = "";
            string RBLRuleValue2 = "";
            string TxDecmal2 = "";
            string RBLRuleValue3 = RBLRule3.SelectedItem.Value;
            string TxDecmal3 = TxDec3.Text;
            //string RBLRuleValue4 = RBLRule4.SelectedItem.Value;
            //string TxDecmal4 = TxDec4.Text;
            //if (RBLNum.SelectedIndex == 1)
            //{
            RBLRuleValue1 = RBLRule1.SelectedItem.Value;
            TxDecmal1 = TxDec1.Text;

            //}
            //if (RBLPrice.SelectedValue == "1")
            //{
            RBLRuleValue2 = RBLRule2.SelectedItem.Value;
            TxDecmal2 = TxDec2.Text;
            //}
            //if (Session["Bid"] != null)
            //{
                Response.Write("<script>window.open('CBudgetEdit.aspx?RBLRuleValue1=" + RBLRuleValue1 + "&TxDecmal1=" + TxDecmal1 + "&RBLRuleValue2=" + RBLRuleValue2 + "&TxDecmal2=" + TxDecmal2 + "&RBLRuleValue3=" + RBLRuleValue3 + "&TxDecmal3=" + TxDecmal3 + "&Pid=" + Session["ProjectCode"].ToString() + "','_blank')</script>");
            //}
        }
    }
}