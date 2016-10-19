using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CTotalPriceAdjest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            double A = double.Parse(LB_NormalPrice.Text, System.Globalization.NumberStyles.Number);
            double B = double.Parse(TB_Percent.Text, System.Globalization.NumberStyles.Number) / 100;
            int C = (int)(A * B);
            TB_Price.Text = Convert.ToString(C);
        }
    }
    protected void TB_Percent_TextChanged(object sender, EventArgs e)
    {
        double A = double.Parse(LB_NormalPrice.Text, System.Globalization.NumberStyles.Number);
        double B = double.Parse(TB_Percent.Text, System.Globalization.NumberStyles.Number) / 100;
        int C = (int)(A * B);
        TB_Price.Text = Convert.ToString(C);
    }
    protected void TB_Price_TextChanged(object sender, EventArgs e)
    {
        double A = double.Parse(LB_NormalPrice.Text, System.Globalization.NumberStyles.Number);
        double B = double.Parse(TB_Price.Text, System.Globalization.NumberStyles.Number);
        double C = B/A*100;
        TB_Percent.Text = Convert.ToString(C);
    }
}