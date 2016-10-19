using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IMS
{
    public partial class KEngineeringImportItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
            String Name = Session["DatabaseName"].ToString();
            String ID = Session["PublicKEngineeringListId"].ToString();
            String PDB = "PublicDB";



            SqlAll.ConnectionString = Utility.DBconnection.connect_string(PDB);
            SqlAll.SelectCommand = "select * from KEngineeringListItem where  KEngineeringListId='" + ID + "' and KEngineeringListItemPhase='施工前'";

            SqlDataSource1.ConnectionString = Utility.DBconnection.connect_string(PDB);
            SqlDataSource1.SelectCommand = "select * from KEngineeringListItem where  KEngineeringListId='" + ID + "' and KEngineeringListItemPhase='施工中'";

            SqlDataSource2.ConnectionString = Utility.DBconnection.connect_string(PDB);
            SqlDataSource2.SelectCommand = "select * from KEngineeringListItem where  KEngineeringListId='" + ID + "' and KEngineeringListItemPhase='施工後'";
        }
    }
}