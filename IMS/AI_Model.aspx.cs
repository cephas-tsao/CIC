using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;


namespace IMS
{
    public partial class AI_Model : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            WebReference.Service AIp = new WebReference.Service();



            string[] xml = AIp.Predict("model1", 20, TextBox1.Text, DropDownList1.SelectedValue, TextBox2.Text, DropDownList2.SelectedValue, TextBox5.Text, TextBox6.Text, TextBox7.Text, TextBox8.Text, DropDownList3.SelectedValue, DropDownList4.SelectedValue, TextBox11.Text, TextBox12.Text, TextBox13.Text, TextBox14.Text, TextBox15.Text, TextBox16.Text, TextBox17.Text, TextBox18.Text, TextBox19.Text, TextBox20.Text);


            //XmlDocument xmltest = new XmlDocument();
            //xmltest = (XmlDocument)xml.GetXML();

            //讀資料庫
            double max = 98285;
            double min = 40179;

            double xnor = (Convert.ToDouble(xml[0]) * (max - min) + min);

            TextBox21.Text = Math.Round(xnor, 0).ToString();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}//