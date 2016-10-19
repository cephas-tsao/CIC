using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class BidSum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RBLNum.SelectedIndex == 1)
            {
                RBLRule1.Enabled = true;
                TxDec1.Enabled = true;
                //string RBLRuleValue1 = RBLRule1.SelectedItem.Value;
                //string TxDecmal1 = TxDec1.Text;
            }
            else 
            {
                RBLRule1.Enabled = false;
                TxDec1.Enabled = false;
            }
           
          
        }
        protected void RBLPrice_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RBLPrice.SelectedIndex == 1)
            {
                RBLRule2.Enabled = true;
                TxDec2.Enabled = true;
                //string RBLRuleValue2 = RBLRule2.SelectedItem.Value;
                //string TxDecmal2 = TxDec2.Text;
            }
            else
            {
                RBLRule2.Enabled = false;
                TxDec2.Enabled = false;
            }
        }
        protected void ReCal_Click(object sender, EventArgs e)
        {
           
            string RBLRuleValue1="" ;
            string TxDecmal1 ="";
            string RBLRuleValue2="";
            string TxDecmal2="";
            string RBLRuleValue3 = RBLRule3.SelectedItem.Value;
            string TxDecmal3 = TxDec3.Text;
            string RBLRuleValue4 = RBLRule4.SelectedItem.Value;
            string TxDecmal4 = TxDec4.Text;
            if (RBLNum.SelectedIndex == 1)
            {             
                 RBLRuleValue1 = RBLRule1.SelectedItem.Value;
                 TxDecmal1 = TxDec1.Text;
              
            }
            if (RBLPrice.SelectedValue == "1")
            {              
                 RBLRuleValue2 = RBLRule2.SelectedItem.Value;
                 TxDecmal2 = TxDec2.Text;
            }
            if(Session["Bid"] !=null)
            {
                Response.Write("<script>window.open('BidBudgetEdit.aspx?RBLNum=" + RBLNum.SelectedValue + "&RBLPrice=" + RBLPrice.SelectedValue + "&RBLRuleValue1=" + RBLRuleValue1 + "&TxDecmal1=" + TxDecmal1 + "&RBLRuleValue2=" + RBLRuleValue2 + "&TxDecmal2=" + TxDecmal2 + "&RBLRuleValue3=" + RBLRuleValue3 + "&TxDecmal3=" + TxDecmal3 + "&RBLRuleValue4=" + RBLRuleValue4 + "&TxDecmal4=" + TxDecmal4 + "&Bid=" + Session["Bid"].ToString() + "','_blank')</script>");
            }
        }

      
    }
}