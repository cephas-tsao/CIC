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
    public partial class AI_Model2 : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            WebReference.Service AIp = new WebReference.Service();



            string[] xml = AIp.Predict("model2", 7, TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, TextBox6.Text, TextBox7.Text, TextBox8.Text, TextBox9.Text, TextBox10.Text, TextBox11.Text, TextBox12.Text, TextBox13.Text, TextBox14.Text, TextBox15.Text, TextBox16.Text, TextBox17.Text, TextBox18.Text, TextBox19.Text, TextBox20.Text);
            //XmlDocument xmltest = new XmlDocument();
            //xmltest = (XmlDocument)xml.GetXML();

            //讀資料庫
            double max = 98.35;
            double min = -22.2;

            double xnor = (Convert.ToDouble(xml[0]) * (max - min) + min);

            TextBox21.Text = Math.Round(xnor, 0).ToString();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}//