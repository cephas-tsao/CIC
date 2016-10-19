using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Data.SqlClient;
using Pechkin;

namespace IMS
{
    public partial class BargainTable : System.Web.UI.Page
    {
        protected string ID;
     
        protected void Page_Load(object sender, EventArgs e)
        {
            ID = (SystemSet.GetRequestSet("ID") != "") ? SystemSet.GetRequestSet("ID") : "";
            string database = Session["DatabaseName"].ToString();
      
             if ((Session["UserName"] == null) || (Session["CompanyName"] == null))
            {
                Response.Redirect("Login.aspx");
            }
             else if (Session["ProjectCode"] == null || Session["ProjectCode"] == "")
             {

                 Response.Write("<script>alert('尚未選擇專案或是您的權限不足');location.href='Main.aspx';</script>");

             }
             else
             {
                 GetTitleList();
                 GetDataList();
                 LbSubNum.Text = ID;
                 string SQLSubName="Select * from SubBudgetList where SBID="+ID;
                 LbSubName.Text = WebModel.SItemName(database, SQLSubName, "SB_Name");
             }
        }
        //讀取列表內容
        protected void GetTitleList()
        {
            string _PCStr="";
            string _PCStr1 = "";
            
            string database = Session["DatabaseName"].ToString();
            string SQLMax = "Select COUNT(*) as num from SubRFQ_Firm where SBID=" + ID;//" +ID + "
            string num = WebModel.SItemName(database, SQLMax, "num");
       
                _PCStr = @"              
                <td class=""Table1"" colspan=""4"">{0}{1}
                </td>";
           

                for (int i = 0; i < int.Parse(num); i++)
                {
                _PCStr1 += @"<td class=""Table1"">報價單價</td>
                <td class=""Table1"">報價複價</td>
                <td class=""Table1"">議價後單價</td>
                <td class=""Table1"">議價後複價</td>";
                }


            //讀取電腦版列表
             //ID = "6";
            string SQLSelect="Select * from SubRFQ_Firm a left join FirmM b on a.FirmID=b.UID where a.SBID= "+ID;
            using (DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLSelect))
             {
                 DateListString.Text = "";
                 DateListString1.Text = "";              
                 string _Image = "";
                 string _FirmName = "";
                 //檢視列表
                 if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                 {
                     StringBuilder thisContent = new StringBuilder();
                     StringBuilder thisContent1 = new StringBuilder();
                     foreach (DataRow row in DataTableBox.Rows)
                     {
                       
                          _FirmName = row["Name"].ToString();
                         
                          if (row["GetNY"].ToString() == "1")
                          {
                               _Image = @"<img src="" ../img/tick.png""  style=""width:15px"" alt=""目前得標廠商""/>";
                            
                          }
                          else
                          {
                              _Image = "";
                          }

                          thisContent.Append(string.Format(_PCStr, _FirmName, _Image));
                     }
                     thisContent1.Append(string.Format(_PCStr1));
                     //DataTableBox.Dispose(); //釋放Table資源

                     DateListString.Text = thisContent.ToString();
                     DateListString1.Text = thisContent1.ToString();
                 }
             }
        }
        public int[] getFrimID(string SBID)
        {

            string SQLString = "Select * from SubRFQ_Firm where SBID=" + SBID + "";
            string database = Session["DatabaseName"].ToString();
            DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLString);
            int[] MID = new int[DataTableBox.Rows.Count];
          
            if (DataTableBox != null && DataTableBox.Rows.Count > 0)
            {
                int count = 0;
                foreach (DataRow row in DataTableBox.Rows)
                {
                    MID[count] = int.Parse(row["FirmID"].ToString());
                   
                    count++;
                }
            }
            return MID;
        }
        protected void GetDataList()
        {
            string _PCStr = "";
            bool flag = false;
            string database = Session["DatabaseName"].ToString();
            string SQLMax = "Select COUNT(*) as num from SubRFQ_Firm where SBID=6";//" +ID + "
            string num = WebModel.SItemName(database, SQLMax, "num");
            StringBuilder thisContent = new StringBuilder();
            StringBuilder thisContent1 = new StringBuilder();
            int i = 0;
            int[] FID = getFrimID(ID);
            _PCStr = @"<tr>            
               <td class=""Table2C"">{0}</td>
                        <td class=""Table2"">{1}</td>
                        <td class=""Table2C"">{2}</td>
                        <td class=""Table2R"">{3}</td>
                        <td class=""Table2R"">{4}</td>
                        <td class=""Table2R"">{5}</td>";
       
            //ID = "6";
            string SQLSelect = "Select * from SubBudget_Item  where SBID= " + ID;
         
            using (DataTable DataTableBox = WebModel.LoadSetContentData(database, SQLSelect))
            {
                DateListString2.Text = "";


                //檢視列表
                if (DataTableBox != null && DataTableBox.Rows.Count > 0)
                {

                
                    foreach (DataRow row in DataTableBox.Rows)
                    {
                        
                        int _sort = i + 1;
                        string _ItemOrder = row["BelongItem"].ToString();
                        string _ItemName = row["ItemName"].ToString();
                        string _Unit = row["Unit"].ToString();
                        string _SCNumber = row["SCNumber"].ToString();
                        string _UnitPrice = row["UnitPrice"].ToString();
                        string _Complex = (decimal.Parse(_SCNumber) * decimal.Parse(_UnitPrice)).ToString("N0");
                        string SB_MID = row["SB_MID"].ToString();

                        thisContent.Append(string.Format(_PCStr, _ItemOrder, _ItemName, _Unit, _SCNumber, _UnitPrice, _Complex));
                            i++;
                       


                        for (int id = 0; id < FID.Length; id++)
                        {

                            int fid = FID[id];
                            //string SQLSF = "";               
                            //SQLSF = "UnitPrice" + fid + ",ComplexPrice" + fid + ",DisUnitPrice" + fid + ",DisComplexPrice" + fid + " ";
                            string SQLSelectFrim = "Select * from SubRFQ_Material where SBID=" + ID + " and FirmID=" + fid + " and SB_MID=" + SB_MID;
                            //DataTable addFrim = Add_Frim(database, ID, fid);
                            DataTable addFrim = WebModel.LoadSetContentData(database, SQLSelectFrim);
                          
                                        //DataRow row1 = addFrim.Rows[j];
                                        for (int k = 0; k < addFrim.Rows.Count; k++)
                                        {
                                            DataRow vsDr = addFrim.Rows[k];
                                            //foreach (DataRow row in DataTableBox.Rows)
                                            //{


                                            string _UnitPrice1 = vsDr["UnitPrice"].ToString() !=""?vsDr["UnitPrice"].ToString():"0";
                                            //string _ComplexPrice = vsDr["ComplexPrice"].ToString() != "" ? decimal.Parse(vsDr["ComplexPrice"].ToString()).ToString("N0") : "";
                                            string _ComplexPrice = (decimal.Parse(_SCNumber) * decimal.Parse(_UnitPrice1)).ToString("N0");
                                            string _DisUnitPrice = vsDr["DisUnitPrice"].ToString();
                                            string _DisComplexPrice = vsDr["DisComplexPrice"].ToString() !=""?decimal.Parse(vsDr["DisComplexPrice"].ToString()).ToString("N0"):"";


                                                thisContent.AppendLine(string.Format(@"<td class=""Table2R"">{0}</td>", _UnitPrice1));
                                                thisContent.AppendLine(string.Format(@"<td class=""Table2R"">{0}</td>", _ComplexPrice));
                                                thisContent.AppendLine(string.Format(@"<td class=""Table2R"">{0}</td>", _DisUnitPrice));
                                                thisContent.AppendLine(string.Format(@"<td class=""Table2R"">{0}</td>", _DisComplexPrice));
                                              
                                        }
                                   
                                        DataTableBox.Dispose(); //釋放Table資源
                                
                                       
                                    }
                                }
                                                     

                            }

                            thisContent.AppendLine(string.Format(@"</tr>"));
                            //DataTableBox.Dispose(); //釋放Table資源
                           
                            thisContent.AppendLine(string.Format(@"<tr class=""ShtRowExecuteDeep""><td class=""ShtCellCC"" colspan=""6"">得標廠商</td>"));
                            DateListString2.Text = thisContent.ToString();
                            for (int id = 0; id < FID.Length; id++)
                            {

                                int fid = FID[id];
                                PlaceHolder1.Controls.Add(new LiteralControl("<td class=\"ShtCellCC\" colspan=\"4\">"));
                                Button Link = new Button();                             
                                Link.Click += Firm_click;
                                Link.ID = "Sub"+fid.ToString();
                                Link.Width = 150;
                                Link.Text = "指定為得標廠商";
                                Link.Visible = true;                            
                                PlaceHolder1.Controls.Add(Link);
                                PlaceHolder1.Controls.Add(new LiteralControl("</td>"));
                              
                            }                                                                            
                            thisContent.AppendLine(string.Format(@"</tr>"));
                            thisContent1.AppendLine(string.Format(@"<tr><td class=""Table0C"" rowspan=""13"">議<br />約<br /> 資<br /> 訊</td><td class=""Table1"" colspan=""5"">合約種類</td>"));
                            int fid1=0;
                            string SQLFirmSelect = "";
                          
                            for (int id1 = 0; id1 < FID.Length; id1++)
                            {
                                 fid1 = FID[id1];
                                 SQLFirmSelect = "Select * from SubRFQ_Firm where SBID=" + ID + " and FirmID=" + fid1;
                                DataTable Firm = WebModel.LoadSetContentData(database, SQLFirmSelect);
                                if (Firm != null && Firm.Rows.Count > 0)
                                {
                                    for (int k = 0; k < Firm.Rows.Count; k++)
                                    {
                                        DataRow vsDr1 = Firm.Rows[k];
                                      string  ContractType = vsDr1["ContractType"].ToString();

                                      thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4"" >{0}</td>", ContractType));

                                    }

                                }
                              
                            }

                            thisContent1.AppendLine(string.Format(@"</tr><tr><td class=""Table1"" colspan=""5"" >履約保證</td>"));
                            for (int id1 = 0; id1 < FID.Length; id1++)
                            {
                                fid1 = FID[id1];
                                SQLFirmSelect = "Select * from SubRFQ_Firm where SBID=" + ID + " and FirmID=" + fid1;
                                DataTable Firm = WebModel.LoadSetContentData(database, SQLFirmSelect);
                                if (Firm != null && Firm.Rows.Count > 0)
                                {
                                    for (int k = 0; k < Firm.Rows.Count; k++)
                                    {
                                        DataRow vsDr1 = Firm.Rows[k];
                                       
                                      string  GuaranteeWay = vsDr1["GuaranteeWay"].ToString();

                                        thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4"" >{0}</td>", GuaranteeWay));

                                    }

                                }
                               
                            }
                            thisContent1.AppendLine(string.Format(@"</tr><tr><td class=""Table1"" colspan=""5"">出廠證明提送</td>"));
                            for (int id1 = 0; id1 < FID.Length; id1++)
                            {
                                fid1 = FID[id1];
                                SQLFirmSelect = "Select * from SubRFQ_Firm where SBID=" + ID + " and FirmID=" + fid1;
                                DataTable Firm = WebModel.LoadSetContentData(database, SQLFirmSelect);
                                if (Firm != null && Firm.Rows.Count > 0)
                                {
                                    for (int k = 0; k < Firm.Rows.Count; k++)
                                    {
                                        DataRow vsDr1 = Firm.Rows[k];
                                     
                                        string SubmitPercent = vsDr1["SubmitPercent"].ToString();
                                        if (SubmitPercent !="")
                                        {
                                        thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4"">{0}％提送</td>", SubmitPercent));
                                        }
                                        else
                                        {
                                            thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4""></td>"));
                                        }
                                    }

                                }

                            }
                            thisContent1.AppendLine(string.Format(@"</tr><tr><td class=""Table1"" colspan=""5"" >請款次數及請付款日期</td>"));
                            for (int id1 = 0; id1 < FID.Length; id1++)
                            {
                                fid1 = FID[id1];
                                SQLFirmSelect = "Select * from SubRFQ_Firm where SBID=" + ID + " and FirmID=" + fid1;
                                DataTable Firm = WebModel.LoadSetContentData(database, SQLFirmSelect);
                                if (Firm != null && Firm.Rows.Count > 0)
                                {
                                    for (int k = 0; k < Firm.Rows.Count; k++)
                                    {
                                        DataRow vsDr1 = Firm.Rows[k];
                                      
                                        string RequestNum = vsDr1["RequestNum"].ToString();
                                        string RequestDate = vsDr1["RequestDate"].ToString();
                                        string PayDate = vsDr1["PayDate"].ToString();
                                        if (RequestNum != "" || RequestDate != "" || PayDate != "")
                                        {
                                            thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4"">{0}次/月;{1}日請款;{2}日付款</td>", RequestNum, RequestDate, PayDate));
                                        }
                                        else
                                        {
                                            thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4""></td>"));
                                        }

                                    }

                                }

                            }
                            thisContent1.AppendLine(string.Format(@"</tr><tr><td class=""Table1"" colspan=""5"" >工程逾罰規定</td>"));
                            for (int id1 = 0; id1 < FID.Length; id1++)
                            {
                                fid1 = FID[id1];
                                SQLFirmSelect = "Select * from SubRFQ_Firm where SBID=" + ID + " and FirmID=" + fid1;
                                DataTable Firm = WebModel.LoadSetContentData(database, SQLFirmSelect);
                                if (Firm != null && Firm.Rows.Count > 0)
                                {
                                    for (int k = 0; k < Firm.Rows.Count; k++)
                                    {
                                        DataRow vsDr1 = Firm.Rows[k];
                                       
                                        //string DurationRule = vsDr1["DurationRule"].ToString() !=""?vsDr1["DurationRule"].ToString():"";
                                        string PunishType = vsDr1["PunishType"].ToString() !=""?vsDr1["PunishType"].ToString():"";
                                        string Punish = vsDr1["Punish"].ToString() != "" ? "千分之" + vsDr1["Punish"].ToString() + "/天;" : "";
                                        if (PunishType != "" || Punish != "")
                                        {
                                            thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4"">{0}{1}</td>", PunishType, Punish));
                                        }
                                        else
                                        {
                                            thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4""></td>"));
                                        }
                                    }

                                }

                            }
                            thisContent1.AppendLine(string.Format(@"</tr><tr><td class=""Table1"" colspan=""5"" >保養保固年限</td>"));
                            for (int id1 = 0; id1 < FID.Length; id1++)
                            {
                                fid1 = FID[id1];
                                SQLFirmSelect = "Select * from SubRFQ_Firm where SBID=" + ID + " and FirmID=" + fid1;
                                DataTable Firm = WebModel.LoadSetContentData(database, SQLFirmSelect);
                                if (Firm != null && Firm.Rows.Count > 0)
                                {
                                    for (int k = 0; k < Firm.Rows.Count; k++)
                                    {
                                        DataRow vsDr1 = Firm.Rows[k];

                                        string WarrantyYear = vsDr1["WarrantyYear"].ToString() !=""?"保固" + vsDr1["WarrantyYear"].ToString() + "年；":"";
                                        string MaintainYear = vsDr1["PunishType"].ToString() !=""?"保養" + vsDr1["PunishType"].ToString() + "年；":"";
                                        string ReWarrantyYear =vsDr1["ReWarrantyYear"].ToString()!=""? "再保固" + vsDr1["ReWarrantyYear"].ToString() + "年":"";

                                        if (WarrantyYear != "" || MaintainYear != "" || ReWarrantyYear != "")
                                        {
                                            thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4"">{0}{1}{2}</td>", WarrantyYear, MaintainYear, ReWarrantyYear));
                                        }
                                        else
                                        {
                                            thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4""></td>"));
                                        }

                                    }

                                }

                            }
                            thisContent1.AppendLine(string.Format(@"</tr><tr><td class=""Table1"" colspan=""5"" >稅額百分比</td>"));
                            for (int id1 = 0; id1 < FID.Length; id1++)
                            {
                                fid1 = FID[id1];
                                SQLFirmSelect = "Select * from SubRFQ_Firm where SBID=" + ID + " and FirmID=" + fid1;
                                DataTable Firm = WebModel.LoadSetContentData(database, SQLFirmSelect);
                                if (Firm != null && Firm.Rows.Count > 0)
                                {
                                    for (int k = 0; k < Firm.Rows.Count; k++)
                                    {
                                        DataRow vsDr1 = Firm.Rows[k];
                                       
                                        string TaxPercent = vsDr1["TaxPercent"].ToString() !=""?vsDr1["TaxPercent"].ToString()+"%":"";
                                        if (TaxPercent !="")
                                        {

                                        thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4"">{0}</td>", TaxPercent));
                                        }
                                        else
                                        {
                                             thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4""></td>"));
                                        }

                                    }

                                }

                            }
                            thisContent1.AppendLine(string.Format(@"</tr><tr><td class=""Table1"" colspan=""5"" >承攬範圍</td>"));
                            for (int id1 = 0; id1 < FID.Length; id1++)
                            {
                                fid1 = FID[id1];
                                SQLFirmSelect = "Select * from SubRFQ_Firm where SBID=" + ID + " and FirmID=" + fid1;
                                DataTable Firm = WebModel.LoadSetContentData(database, SQLFirmSelect);
                                if (Firm != null && Firm.Rows.Count > 0)
                                {
                                    for (int k = 0; k < Firm.Rows.Count; k++)
                                    {
                                        DataRow vsDr1 = Firm.Rows[k];

                                        string Scope = vsDr1["Scope"].ToString()!=""?vsDr1["Scope"].ToString()+"":"";
                                        if (Scope !="")
                                        {
                                        thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4"">{0}</td>", Scope));
                                        }
                                        else
                                        {
                                             thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4""></td>"));

                                        }
                                    }

                                }

                            }
                            thisContent1.AppendLine(string.Format(@"</tr><tr><td class=""Table1"" colspan=""5"" >備註</td>"));
                            for (int id1 = 0; id1 < FID.Length; id1++)
                            {
                                fid1 = FID[id1];
                                SQLFirmSelect = "Select * from SubRFQ_Firm where SBID=" + ID + " and FirmID=" + fid1;
                                DataTable Firm = WebModel.LoadSetContentData(database, SQLFirmSelect);
                                if (Firm != null && Firm.Rows.Count > 0)
                                {
                                    for (int k = 0; k < Firm.Rows.Count; k++)
                                    {
                                        DataRow vsDr1 = Firm.Rows[k];

                                        string ContractNote = vsDr1["ContractNote"].ToString();
                                        if (ContractNote !="")
                                        {

                                        thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4"">{0}</td>", ContractNote));
                                        }
                                        else
                                        {
                                             thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4""></td>"));

                                        }
                                    }

                                }

                            }
                            thisContent1.AppendLine(string.Format(@"</tr><tr><td class=""Table1"" colspan=""5"" >預付款</td>"));
                            for (int id1 = 0; id1 < FID.Length; id1++)
                            {
                                fid1 = FID[id1];
                                SQLFirmSelect = "Select * from SubRFQ_Firm where SBID=" + ID + " and FirmID=" + fid1;
                                DataTable Firm = WebModel.LoadSetContentData(database, SQLFirmSelect);
                                if (Firm != null && Firm.Rows.Count > 0)
                                {
                                    for (int k = 0; k < Firm.Rows.Count; k++)
                                    {
                                        DataRow vsDr1 = Firm.Rows[k];

                                        string PrepayPercent = vsDr1["PrepayPercent"].ToString() != "" ? "佔" + vsDr1["PrepayPercent"].ToString() + "%；" : "";
                                        string PrepayCash = vsDr1["PrepayCash"].ToString() !=""?"現金"+vsDr1["PrepayCash"].ToString()+" %；":"";
                                        string PrepayCheck = vsDr1["PrepayCheck"].ToString() != "" ? "票" + vsDr1["PrepayCheck"].ToString() + "％；" : "";
                                        string PrepayCheckDay = vsDr1["PrepayCheckDay"].ToString() != "" ? "(" + vsDr1["PrepayCheckDay"].ToString() + "天)；" : "";
                                        string PrepayGuarantee = vsDr1["PrepayGuarantee"].ToString() != "" ? "還款保證：" + vsDr1["PrepayGuarantee"].ToString() + "％" : "";
                                        if (PrepayPercent != "" || PrepayCash != "" || PrepayCheck != "" || PrepayCheckDay != "" || PrepayGuarantee !="")
                                        {
                                        thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4"">{0}{1}{2}{3}{4}</td>", PrepayPercent, PrepayCash, PrepayCheck, PrepayCheckDay, PrepayGuarantee));
                                        }
                                        else
                                        {
                                             thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4""></td>"));

                                        }
                                    }

                                }

                            }
                            thisContent1.AppendLine(string.Format(@"</tr><tr><td class=""Table1"" colspan=""5"" >工程款</td>"));
                            for (int id1 = 0; id1 < FID.Length; id1++)
                            {
                                fid1 = FID[id1];
                                SQLFirmSelect = "Select * from SubRFQ_Firm where SBID=" + ID + " and FirmID=" + fid1;
                                DataTable Firm = WebModel.LoadSetContentData(database, SQLFirmSelect);
                                if (Firm != null && Firm.Rows.Count > 0)
                                {
                                    for (int k = 0; k < Firm.Rows.Count; k++)
                                    {
                                        DataRow vsDr1 = Firm.Rows[k];

                                        string FundCash = vsDr1["FundCash"].ToString() != "" ? "現金" + vsDr1["FundCash"].ToString() + "％；" : "";
                                        string FundCheck = vsDr1["FundCheck"].ToString() != "" ? "票" + vsDr1["FundCheck"].ToString() + "％" : "";
                                        string FundCheckDay = vsDr1["FundCheckDay"].ToString() != "" ? "(" + vsDr1["FundCheckDay"].ToString() + "天)" : "";
                                        if (FundCash != "" || FundCash != "" || FundCash != "" )
                                        {
                                            thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4"">{0}{1}{2}</td>", FundCash, FundCheck, FundCheckDay));
                                        }
                                        else
                                        {
                                            thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4""></td>"));

                                        }
                                    }

                                }

                            }
                            thisContent1.AppendLine(string.Format(@"</tr><tr><td class=""Table1"" colspan=""5"" >保留款</td>"));
                            for (int id1 = 0; id1 < FID.Length; id1++)
                            {
                                fid1 = FID[id1];
                                SQLFirmSelect = "Select * from SubRFQ_Firm where SBID=" + ID + " and FirmID=" + fid1;
                                DataTable Firm = WebModel.LoadSetContentData(database, SQLFirmSelect);
                                if (Firm != null && Firm.Rows.Count > 0)
                                {
                                    for (int k = 0; k < Firm.Rows.Count; k++)
                                    {
                                        DataRow vsDr1 = Firm.Rows[k];

                                        string RetentionPercent = vsDr1["RetentionPercent"].ToString() !=""?"佔"+vsDr1["RetentionPercent"].ToString()+"％；":"";
                                        string RetentionCash = vsDr1["RetentionCash"].ToString() !=""?"現金"+vsDr1["RetentionCash"].ToString()+"％；":"";
                                        string RetentionCheck = vsDr1["FundCheckDay"].ToString() != "" ? "票" + vsDr1["FundCheckDay"].ToString() + "％；" : "";
                                        string RetentionCheckDay = vsDr1["RetentionCheckDay"].ToString() != "" ? "(" + vsDr1["RetentionCheckDay"].ToString() + "天)" : "";
                                        if (RetentionPercent != "" || RetentionCash != "" || RetentionCheck != "" || RetentionCheckDay !="")
                                        {
                                            thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4"">{0}{1}{2}{3}</td>", RetentionPercent, RetentionCash, RetentionCheck, RetentionCheckDay));
                                        }
                                        else
                                        {
                                            thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4""></td>"));

                                        }
                                    }

                                }

                            }
                            thisContent1.AppendLine(string.Format(@"</tr><tr><td class=""Table1"" colspan=""5"" >保固金</td>"));
                            for (int id1 = 0; id1 < FID.Length; id1++)
                            {
                                fid1 = FID[id1];
                                SQLFirmSelect = "Select * from SubRFQ_Firm where SBID=" + ID + " and FirmID=" + fid1;
                                DataTable Firm = WebModel.LoadSetContentData(database, SQLFirmSelect);
                                if (Firm != null && Firm.Rows.Count > 0)
                                {
                                    for (int k = 0; k < Firm.Rows.Count; k++)
                                    {
                                        DataRow vsDr1 = Firm.Rows[k];

                                        string WarrantyPercent = vsDr1["WarrantyPercent"].ToString() !=""?"佔"+vsDr1["WarrantyPercent"].ToString()+"％；":"";
                                        string WarrantyCash = vsDr1["WarrantyCash"].ToString() !=""?"現金"+vsDr1["WarrantyCash"].ToString()+"％；":"";
                                        string WarrantyCheck = vsDr1["WarrantyCheck"].ToString() !=""?"票"+vsDr1["WarrantyCheck"].ToString()+"天；":"";
                                        string WarrantyCheckDay = vsDr1["WarrantyCheckDay"].ToString() != "" ? "" + vsDr1["WarrantyCheckDay"].ToString() + "％；" : "";
                                        string WarrantyWay = vsDr1["WarrantyWay"].ToString() !=""?"保留方式："+vsDr1["WarrantyWay"].ToString()+"":"";
                                        if (WarrantyPercent != "" || WarrantyCash != "" || WarrantyCheck != "" || WarrantyCheckDay != "" || WarrantyWay !="")
                                        {
                                            thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4"">{0}{1}{2}{3}{4}</td>", WarrantyPercent, WarrantyCash, WarrantyCheck, WarrantyCheckDay, WarrantyWay));
                                        }
                                        else
                                        {

                                            thisContent1.AppendLine(string.Format(@" <td class=""Table2"" colspan=""4""></td>"));

                                        }
                                    }

                                }

                            }
                            thisContent1.AppendLine(string.Format(@" </tr>"));
                            DateListString3.Text = thisContent1.ToString();

                        }
                     
          
        }

        protected void Firm_click(object sender, EventArgs e)
     {
         string database = Session["DatabaseName"].ToString();        
         Button Link = (Button)sender;
         string tempID = Link.ID.Substring(3);
         string SQLUpdateSub = "Update SubRFQ_Firm set GetNY=0 where SBID=" + ID;
         string SQLUpdate = "Update SubRFQ_Firm set GetNY=1 where SBID=" + ID + " and FirmID=" + tempID;
         string SQLUpdate1 = "Update SubBudgetList set GetFirmID=" + tempID + "where SBID=" + ID;
        bool result=  WebModel.SQLAction(database,SQLUpdateSub);
        bool result1=  WebModel.SQLAction(database, SQLUpdate);
        bool result2 = WebModel.SQLAction(database, SQLUpdate1);
          GetTitleList();
             
     }
        public DataTable Add_Frim(string database,string SBID, int FIRM)
        {
            DataTable DataTableBox = null;

            try
            {
                DataTableBox = new DataTable();
                //string SQLString1 = "select a.*,b.EWID from EBudget_Change_Detail a  left join EBudget_WBS b on a.EWID=b.CWID where a.Pid=" + Pid + " and a.CEdition=" + Edition + " ";
                string SQLString1 = "Select * from SubRFQ_Material where SBID="+SBID+" and FirmID="+FIRM+"";
                string data = Utility.DBconnection.connect_string(database);
                using (SqlConnection L_Conn = new SqlConnection(data))
                {
                    using (SqlCommand SelectList = new SqlCommand(SQLString1, L_Conn))
                    {
                        //SelectList.Parameters.AddWithValue("@Pid", Pid);
                        SelectList.CommandType = CommandType.Text;
                        L_Conn.Open();
                        SqlDataReader SelectList_read = SelectList.ExecuteReader();
                        DataTableBox = new DataTable();
                        DataTableBox.Load(SelectList_read);

                    }
                }
                return DataTableBox;
            }
            catch
            {
                return DataTableBox;
            }
            finally
            {
                DataTableBox.Dispose();
            }
        }

        protected void ImgExcel_Click(object sender, ImageClickEventArgs e)
        {
            string ProjectName = WebModel.PidName(Session["DatabaseName"].ToString(), "ProjectM0", Session["ProjectCode"].ToString());
            Response.Expires = 0;
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "utf-8";
            Response.ContentEncoding = System.Text.Encoding.UTF8;
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + ProjectName + ".xls");
            Response.Write("<meta http-equiv=Content-Type content=text/html;charset=utf-8>");

            string l_str2 = "";
            l_str2 += @"<table class=""Table100"" border=""1"">         
            <tr><td class=""Table0C"" colspan=""6"">分包預算工料</td>";
            l_str2 += DateListString.Text;
            l_str2 += @"</tr> <tr>
                <td class=""Table0C"">項次</td>
                <td class=""Table0C"">工項/工料名稱</td>
                <td class=""Table0C"">單位</td>
                <td class=""Table0C"">分包數量</td>
                <td class=""Table0C"">預算單價</td>
                <td class=""Table0C"">預算複價</td>";
            l_str2 += DateListString1.Text;
            l_str2 += DateListString2.Text;
            l_str2 += DateListString3.Text;           
            l_str2 += @"</tr></table>";
            Response.Write(l_str2);
            Response.End(); 
        }

        protected void ImgPDF_Click(object sender, ImageClickEventArgs e)
        {
            string ProjectName = WebModel.PidName(Session["DatabaseName"].ToString(), "ProjectM0", Session["ProjectCode"].ToString());
            string l_str2 = "";
            l_str2 += @"<table class=""Table100"" border=""1"">         
            <tr><td class=""Table0C"" colspan=""6"">分包預算工料</td>";
            l_str2 += DateListString.Text;
            l_str2 += @"</tr> <tr>
                <td class=""Table0C"">項次</td>
                <td class=""Table0C"">工項/工料名稱</td>
                <td class=""Table0C"">單位</td>
                <td class=""Table0C"">分包數量</td>
                <td class=""Table0C"">預算單價</td>
                <td class=""Table0C"">預算複價</td>";
            l_str2 += DateListString1.Text;
            l_str2 += DateListString2.Text;
            l_str2 += DateListString3.Text;
            l_str2 += @"</tr></table>";
            string html = l_str2.ToString();

            using (IPechkin pechkin = Factory.Create(new GlobalConfig()))
            {

                var pdf = pechkin.Convert(new ObjectConfig()
                        .SetLoadImages(true).SetZoomFactor(1.5)
                        .SetPrintBackground(true)
                        .SetScreenMediaType(true)
                        .SetAffectPageCounts(true)
                        .SetCreateExternalLinks(true), html);




                Response.Clear();

                Response.ClearContent();
                Response.ClearHeaders();

                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", string.Format("attachment;filename=" + ProjectName + ".pdf; size={0}", pdf.Length));
                Response.BinaryWrite(pdf);

                Response.Flush();
                Response.End();
            }
        }
    }
}