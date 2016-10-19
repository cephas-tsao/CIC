using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class test : System.Web.UI.Page
{
    int i = 1;
    int aa = 1;
    int bb = 1;
    int cc = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
        Button3.Attributes.Add("onclick ", "return confirm( '確定要刪除嗎');");
        Label2.Visible = false;
        string projectname;
        Application.Lock();
        projectname = Application["project"].ToString();
        Application.UnLock();
        //projectname = "鐵捲門工程";
        Label1.Text = projectname;

        SqlConnection connStr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());
        SqlDataReader reader;   //宣告一個DataReader

        connStr.Open(); //開啟資料庫的連結
        String select = "select projectid from project where projectname ='" + projectname + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
        SqlCommand cmd = new SqlCommand(select, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
        reader = cmd.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
        //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法
        while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
        {
            int projectid = (int)reader["projectid"];
            Label2.Text = projectid.ToString();
        }
        
        reader.Close();


        TableHeaderCell header = new TableHeaderCell();
        header.RowSpan = 1;
        header.ColumnSpan = 3;
        header.Text = "施工前";
        header.Font.Bold = true;
        header.HorizontalAlign = HorizontalAlign.Center;
        header.VerticalAlign = VerticalAlign.Middle;
        // Add the header to a new row.
        TableRow headerRow = new TableRow();
        headerRow.Cells.Add(header);

        // Add the header row to the table.
        Table1.Rows.AddAt(0, headerRow); 


	      	  
         
        TableRow row;
        TableCell cell;
        TableCell cell2;
        TableCell cell3;
       
        String select1 = "select itemname from items where projectid ='" + Label2.Text + "' and phasee='施工前'";  //宣告SQL語法的字串，這邊可依照自行需求修改
        SqlCommand cmd1 = new SqlCommand(select1, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
        reader = cmd1.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
        //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法


        

        while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
        {
            String itemname = reader.GetString(0);
            
            CheckBox checkbox = new CheckBox();
            checkbox.ID = "checkbox" + i;

                row = new TableRow();
                
                
                cell = new TableCell();
                cell2 = new TableCell();
                cell3 = new TableCell();
                cell.Text = itemname;
               
                cell2.Text=i.ToString();
                cell3.Controls.Add(checkbox);
                //cell.Text = reader[i].ToString();
                row.Cells.Add(cell3);
                row.Cells.Add(cell2);
                row.Cells.Add(cell);
                
                
                Table1.Rows.Add(row);
                i = i + 1;
                aa = aa + 1;
      
        
        }

        reader.Close();
       //connStr.Close();
       
        TableHeaderCell header1 = new TableHeaderCell();
        header1.RowSpan = 1;
        header1.ColumnSpan = 3;
        header1.Text = "施工中";
        header1.Font.Bold = true;
        header1.HorizontalAlign = HorizontalAlign.Center;
        header1.VerticalAlign = VerticalAlign.Middle;
        // Add the header to a new row.
        TableRow headerRow1 = new TableRow();
        headerRow1.Cells.Add(header1);

        // Add the header row to the table.
        Table1.Rows.AddAt(i+1, headerRow1);

        String select2 = "select itemname from items where projectid ='" + Label2.Text + "' and phasee='施工中'";  //宣告SQL語法的字串，這邊可依照自行需求修改
        SqlCommand cmd2 = new SqlCommand(select2, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
        reader = cmd2.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
        //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

       


        while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
        {
            String itemname = reader.GetString(0);
            row = new TableRow();

            CheckBox checkbox = new CheckBox();
            checkbox.ID = "checkbox" + i;

            cell = new TableCell();
            cell2 = new TableCell();
            cell3 = new TableCell();

            cell.Text = itemname;

            cell2.Text = i.ToString();
            cell3.Controls.Add(checkbox);
            //cell.Text = reader[i].ToString();
            row.Cells.Add(cell3);
            row.Cells.Add(cell2);
            row.Cells.Add(cell);


            Table1.Rows.Add(row);
            i = i + 1;
            bb = bb + 1;
        }
        reader.Close();


        TableHeaderCell header3 = new TableHeaderCell();
        header3.RowSpan = 1;
        header3.ColumnSpan = 3;
        header3.Text = "施工後";
        header3.Font.Bold = true;
        header3.HorizontalAlign = HorizontalAlign.Center;
        header3.VerticalAlign = VerticalAlign.Middle;
        // Add the header to a new row.
        TableRow headerRow3 = new TableRow();
        headerRow3.Cells.Add(header3);

        // Add the header row to the table.
        Table1.Rows.AddAt(i+2, headerRow3);

        String select3 = "select itemname from items where projectid ='" + Label2.Text + "' and phasee='施工後'";  //宣告SQL語法的字串，這邊可依照自行需求修改
        SqlCommand cmd3 = new SqlCommand(select3, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
        reader = cmd3.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
        //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法



        while (reader.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
        {
            String itemname = reader.GetString(0);
            row = new TableRow();

            CheckBox checkbox = new CheckBox();
            checkbox.ID = "checkbox" + i;

            cell = new TableCell();
            cell2 = new TableCell();
            cell3 = new TableCell();

            cell.Text = itemname;

            cell2.Text = i.ToString();
            cell3.Controls.Add(checkbox);
            //cell.Text = reader[i].ToString();
            row.Cells.Add(cell3);
            row.Cells.Add(cell2);
            row.Cells.Add(cell);


            Table1.Rows.Add(row);
            i = i + 1;
            cc = cc + 1;
        }
        reader.Close();


        //麻煩的陣列  思考未來要用在哪 先做好XD
        /*
        const int sizex = 2;
        //const int sizey = i;
        int[,] ia = new int[i, sizex];
        for (int y = 0; y != i; ++y)
        {
            for (int x = 0; x != sizex; ++x)
            {
                ia[y, x] = y + x;

            }
        }

        int a = ia.Length / ia.Rank;

        Label4.Text = a.ToString();


        for (int y = 0; y < (ia.Length / ia.Rank); y++)  //ia.Length 為長度 總共有40個資料   
        {
            for (int x = 0; x < ia.Rank; x++)    //ia.Rank為維度 這為2維陣列
            {
                //輸出結果。
                Response.Write(ia[y, x]);
            }
            Response.Write("<br />");
        }
       
        */

        connStr.Close();
    }
    
  
    protected void Button1_Click1(object sender, EventArgs e)    //新增項目
    {
        Application["projectname"] = Label1.Text;
        Server.Transfer("additem.aspx");



    }
    protected void Button2_Click(object sender, EventArgs e)    //編輯項目
    {
        const int sizex = 2;
        int[,] ia = new int[i, sizex];
        int a = 1;

        SqlConnection connStr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());
        SqlDataReader readera;   //宣告一個DataReader
        connStr.Open();
        String selecta = "select itemid from items where projectid ='" + Label2.Text + "' and phasee='施工前'";  //宣告SQL語法的字串，這邊可依照自行需求修改
        SqlCommand cmda = new SqlCommand(selecta, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
        readera = cmda.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
        //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

        while (readera.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
        {
            int itemid = readera.GetInt32(0);
            ia[a, 1] = itemid;

            CheckBox checkbox = FindControl("checkbox" + a) as CheckBox;
            if (checkbox.Checked == true)
            {
                ia[a, 0] = 1;
            }
            else
            {
                ia[a, 0] = 0;
            }

            a = a + 1;

        }
        readera.Close();
        connStr.Close();



        connStr.Open();
        String selectb = "select itemid from items where projectid ='" + Label2.Text + "' and phasee='施工中'";  //宣告SQL語法的字串，這邊可依照自行需求修改
        SqlCommand cmdb = new SqlCommand(selectb, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
        readera = cmdb.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
        //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

        while (readera.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
        {
            int itemid = readera.GetInt32(0);

            ia[a, 1] = itemid;
            CheckBox checkbox = FindControl("checkbox" + a) as CheckBox;
            if (checkbox.Checked == true)
            {
                ia[a, 0] = 1;
            }
            else
            {
                ia[a, 0] = 0;
            }
            a = a + 1;

        }
        readera.Close();
        connStr.Close();

        connStr.Open();
        String selectc = "select itemid from items where projectid ='" + Label2.Text + "' and phasee='施工後'";  //宣告SQL語法的字串，這邊可依照自行需求修改
        SqlCommand cmdc = new SqlCommand(selectc, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
        readera = cmdc.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
        //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

        while (readera.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
        {
            int itemid = readera.GetInt32(0);

            ia[a, 1] = itemid;
            CheckBox checkbox = FindControl("checkbox" + a) as CheckBox;
            if (checkbox.Checked == true)
            {
                ia[a, 0] = 1;
            }
            else
            {
                ia[a, 0] = 0;
            }

            a = a + 1;

        }
        readera.Close();
        connStr.Close();

        Application["ia"] = ia;
        Application["project"] = Label1.Text;
        Server.Transfer("edititem.aspx");  


    }
    protected void Button3_Click(object sender, EventArgs e)    //刪除項目
    { 
        int a=1;
          
        SqlConnection connStr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());
        SqlDataReader readera;   //宣告一個DataReader
        connStr.Open();
        String selecta = "select itemid from items where projectid ='" + Label2.Text + "' and phasee='施工前'";  //宣告SQL語法的字串，這邊可依照自行需求修改
        SqlCommand cmda = new SqlCommand(selecta, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
        readera = cmda.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
        //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

        while (readera.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
        {
            int itemid = readera.GetInt32(0);
            
            CheckBox checkbox = FindControl("checkbox" + a) as CheckBox;
            if (checkbox.Checked == true)
            {
             SqlConnection connStrr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());
             connStrr.Open();
             String selectaa = "delete from items where itemid ='" + itemid  + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
             SqlCommand cmdaa = new SqlCommand(selectaa, connStrr);   //宣告SqlCommand並將SQL語法及連結語法帶入
             cmdaa.ExecuteNonQuery();
             connStrr.Close();
            }
             else { 
            
            }

            a = a + 1;
        
        }
        readera.Close();
        connStr.Close();


        
        connStr.Open();
        String selectb = "select itemid from items where projectid ='" + Label2.Text + "' and phasee='施工中'";  //宣告SQL語法的字串，這邊可依照自行需求修改
        SqlCommand cmdb = new SqlCommand(selectb, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
        readera = cmdb.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
        //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

        while (readera.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
        {
            int itemid = readera.GetInt32(0);

            CheckBox checkbox = FindControl("checkbox" + a) as CheckBox;
            if (checkbox.Checked == true)
            {
                SqlConnection connStrr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());
                connStrr.Open();
                String selectab = "delete from items where itemid ='" + itemid + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
                SqlCommand cmdab = new SqlCommand(selectab, connStrr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                cmdab.ExecuteNonQuery();
                connStrr.Close();
            }
            else
            {

            }

            a = a + 1;

        }
        readera.Close();
        connStr.Close();

        connStr.Open();
        String selectc = "select itemid from items where projectid ='" + Label2.Text + "' and phasee='施工後'";  //宣告SQL語法的字串，這邊可依照自行需求修改
        SqlCommand cmdc = new SqlCommand(selectc, connStr);   //宣告SqlCommand並將SQL語法及連結語法帶入
        readera = cmdc.ExecuteReader();   //使用SqlCommand的ExecuteReader()方法，
        //ExecuteReader()為查詢時使用，如要刪除、修改、新增，須改為ExecuteNonQuery()方法

        while (readera.Read())   //使用無限迴圈將SQL語法查詢的結果每筆查閱一次
        {
            int itemid = readera.GetInt32(0);

            CheckBox checkbox = FindControl("checkbox" + a) as CheckBox;
            if (checkbox.Checked == true)
            {
                SqlConnection connStrr = new SqlConnection(WebConfigurationManager.ConnectionStrings["checklistConnectionString"].ConnectionString.ToString());
                connStrr.Open();
                String selectac = "delete from items where itemid ='" + itemid + "'";  //宣告SQL語法的字串，這邊可依照自行需求修改
                SqlCommand cmdac = new SqlCommand(selectac, connStrr);   //宣告SqlCommand並將SQL語法及連結語法帶入
                cmdac.ExecuteNonQuery();
                connStrr.Close();
            }
            else
            {

            }

            a = a + 1;

        }
        readera.Close();
        connStr.Close();




        Application["project"] = Label1.Text;
        Server.Transfer("listitem.aspx");    


    }


        

    
    
    protected void Button4_Click1(object sender, EventArgs e)
    {
        Server.Transfer("Default.aspx");    
    }
}