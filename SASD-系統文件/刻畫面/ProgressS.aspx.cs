using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProgressS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        IBtn_Lock.TabIndex = 1;
        if ((IBtn_Lock.TabIndex == 1))
        {
            IBtn_Lock.ImageUrl = "~/img/UnLock.jpg";
            IBtn_Lock.ToolTip = "預定進度尚未鎖定，可自由修改";
            UnLockPageSetting();
        }
        else if ((IBtn_Lock.TabIndex == 2))
        {
            IBtn_Lock.ImageUrl = "~/img/Lock.jpg";
            IBtn_Lock.ToolTip = "預定進度已鎖定，可點擊解鎖";
            LockPageSetting();
        }
    }

    protected void IBtn_Lock_Click(object sender, ImageClickEventArgs e)
    {
        if ((IBtn_Lock.ImageUrl == "~/img/UnLock.jpg"))
        {
            //IBtn_Lock.TabIndex = 2;
            IBtn_Lock.ImageUrl = "~/img/Lock.jpg";
            IBtn_Lock.ToolTip = "預定進度已鎖定，可點擊解鎖";
            LockPageSetting();
        }
        else //if ((IBtn_Lock.ImageUrl == "~/img/Lock.jpg"))
        {
            //IBtn_Lock.TabIndex = 1;
            IBtn_Lock.ImageUrl = "~/img/UnLock.jpg";
            IBtn_Lock.ToolTip = "預定進度尚未鎖定，可自由修改";
            UnLockPageSetting();
        }
    }
    void LockPageSetting()
    {
        IBtn_Save.Visible = false;
        IBtn_CPM.Visible = false;
        //ImageButton IBtnU, IBtnD;
        TextBox TBD, TBF, TBT, TBS, TBE;
        //Table AA = (Table)FindControl("ActivityTable");
        //for (int i = 1; i <= AA.Rows.Count-1; i++);
        for (int i = 1; i <= 10; i++)
        {
            /*if ((i != 1))
            {
                IBtnU = (ImageButton)FindControl("IBtn_U" + i);
                IBtnU.Visible = false;
            }
            if ((i != 10))
            { 
                IBtnD = (ImageButton)FindControl("IBtn_D" + i);
                IBtnD.Visible = false;
            }*/
            
            TBD = (TextBox)FindControl("TB_D" + i);
            TBF = (TextBox)FindControl("TB_F" + i);
            TBT = (TextBox)FindControl("TB_T" + i);
            TBS = (TextBox)FindControl("TB_S" + i);
            TBE = (TextBox)FindControl("TB_E" + i);
            TBD.Enabled = false;
            TBF.Enabled = false;
            TBT.Enabled = false;
            TBS.Enabled = false;
            TBE.Enabled = false;
        }
    }
    void UnLockPageSetting()
    {
        IBtn_Save.Visible = true;
        IBtn_CPM.Visible = true;
        //ImageButton IBtnU, IBtnD;
        TextBox TBD, TBF, TBT, TBS, TBE;
        //Table AA = (Table)FindControl("ActivityTable");
        //for (int i = 1; i <= AA.Rows.Count-1; i++);
        for (int i = 1; i <= 10; i++)
        {
            /*if ((i != 1))
            {
                IBtnU = (ImageButton)FindControl("IBtn_U" + i);
                IBtnU.Visible = true;
            }
            if ((i != 10))
            {
                IBtnD = (ImageButton)FindControl("IBtn_D" + i);
                IBtnD.Visible = true;
            }*/
            TBD = (TextBox)FindControl("TB_D" + i);
            TBF = (TextBox)FindControl("TB_F" + i);
            TBT = (TextBox)FindControl("TB_T" + i);
            TBS = (TextBox)FindControl("TB_S" + i);
            TBE = (TextBox)FindControl("TB_E" + i);
            TBD.Enabled = true;
            TBF.Enabled = true;
            TBT.Enabled = true;
            TBS.Enabled = true;
            TBE.Enabled = true;
        }
    }
    protected void IBtn_Draw_Click(object sender, ImageClickEventArgs e)
    {
        Response.Write("<script>window.open('Progress_New_Gantt.aspx','甘特圖',config='height=800,width=800,scrollbars=yes');</script>");
    }
}