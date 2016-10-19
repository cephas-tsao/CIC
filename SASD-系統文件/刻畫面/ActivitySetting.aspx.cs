using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ActivitySetting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        IBtn_Lock.TabIndex = 1;
        if ((IBtn_Lock.TabIndex == 1))
        {
            IBtn_Lock.ImageUrl = "~/img/UnLock.jpg";
            IBtn_Lock.ToolTip = "預定進度尚未鎖定，可自由修改作業項目";
            IBtn_Save.Visible = true;
        }
        else if ((IBtn_Lock.TabIndex == 2))
        {
            IBtn_Lock.ImageUrl = "~/img/Lock.jpg";
            IBtn_Lock.ToolTip = "預定進度已鎖定，不可修改作業項目，如欲解鎖請至「排定預定進度」設定";
            LockPageSetting();
        }
        
    }
    void LockPageSetting()
    {
        IBtn_Save.Visible = false;
        DDL_EWBS.Visible = false;
        IBtn_AddNew.Visible = false;
        ImageButton IBtnA, IBtnD;
        TextBox TBN, TBP;
        //Table AA = (Table)FindControl("ActivityTable");
        //for (int i = 1; i <= AA.Rows.Count-1; i++);
        for (int i = 1; i <= 10; i++)
        {
            IBtnA = (ImageButton)FindControl("IBtn_A" + i);
            IBtnD = (ImageButton)FindControl("IBtn_D" + i);
            TBN = (TextBox)FindControl("TB_N" + i);
            TBP = (TextBox)FindControl("TB_P" + i);
            IBtnA.Visible = false;
            IBtnD.Visible = false;
            TBN.Enabled = false;
            TBP.Enabled = false;
        }
    }
    
}