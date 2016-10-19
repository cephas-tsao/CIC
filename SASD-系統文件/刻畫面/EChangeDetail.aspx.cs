using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EChangeDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void TB_5_TextChanged(object sender, EventArgs e)
    {
        double A = double.Parse(Label181.Text, System.Globalization.NumberStyles.Number);
        double B = double.Parse(TB_5.Text, System.Globalization.NumberStyles.Number);
        double C = A + B;
        double D = double.Parse(Label188.Text, System.Globalization.NumberStyles.Number);
        double E = C * D;
        Label184.Text = Convert.ToString(C);
        Label187.Text = Convert.ToString(E);
    }
    protected void Label184_TextChanged(object sender, EventArgs e)
    {
        double A = double.Parse(Label181.Text, System.Globalization.NumberStyles.Number);
        double B = double.Parse(Label184.Text, System.Globalization.NumberStyles.Number);
        double C = B - A;
        double D = double.Parse(Label188.Text, System.Globalization.NumberStyles.Number);
        double E = B * D;
        TB_5.Text = Convert.ToString(C);
        Label187.Text = Convert.ToString(E);
    }
}