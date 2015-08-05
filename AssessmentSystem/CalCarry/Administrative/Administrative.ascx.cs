using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace AssessmentSystem.CalCarry.Administrative
{
    public partial class Administrative1 : System.Web.UI.UserControl
    {
        AssessmentSystemDataContext db = new AssessmentSystemDataContext();
        static ArrayList Carry = new ArrayList();
        static ArrayList Temp = new ArrayList();
        static bool a=true, b=true, c=true, d=true, e=true, f=true, g=true, h=true, j=true, k=true, l=true, m=true, n=true, o=true, p=true, q=true;

        public class ReverseSort : IComparer
        {
            public int Compare(object x, object y)
            {
                return Comparer.Default.Compare(y, x);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Carry = new ArrayList();
                Temp = new ArrayList();
                try
                {
                    var q = (from p in db.Administratives
                             //where p.UserName == Session["UserName"].ToString()
                            select p).First();

                    //cbChancellor.Value = q.Chancellor;
                    //CreateArray(tbChancellorCredit.Text, cbChancellor);

                    //cbViceChancellor.Value = q.ViceChancellor;
                    //CreateArray(tbViceChanCredit.Text, cbViceChancellor);

                    //cbDean.Value = q.Dean;
                    //CreateArray(tbDeanCredit.Text, cbDean);

                    //cbChancellorAssistant.Value = q.ChancellorAssistant;
                    //CreateArray(tbChanAssistCredit.Text, cbChancellorAssistant);

                    //cbViceDean.Value = q.ViceDean;
                    //CreateArray(tbViceDeanCredit.Text, cbViceDean);

                    //cbDepartmentHead.Value = q.DepartmentHead;
                    //CreateArray(tbDeptHeadCredit.Text, cbDepartmentHead);

                    //cbDeanOfficeHead.Value = q.DeanOfficeHead;
                    //CreateArray(tbDeanOfficeHCredit.Text, cbDeanOfficeHead);

                    //cbDeanAssistant.Value = q.DeanAssistant;
                    //CreateArray(tbDeanAssistCredit.Text, cbDeanAssistant);

                    //cbBranchHeadDirect.Value = q.BranchHeadDirect;
                    //CreateArray(tbBranchHeadDCredit.Text, cbBranchHeadDirect);

                    //cbViceDepartment.Value = q.ViceDepartment;
                    //CreateArray(tbViceDeptCredit.Text, cbViceDepartment);

                    //cbBranchHeadIn.Value = q.BranchHeadIn;
                    //CreateArray(tbBranchHeadInCredit.Text, cbBranchHeadIn);

                    //cbFacultyCouncilChief.Value = q.FacultyCouncilChief;
                    //CreateArray(tbFactCounChiefCredit.Text, cbFacultyCouncilChief);

                    //cbViceFactCouncilChief.Value = q.ViceFactCouncilChief;
                    //CreateArray(tbViceFactCounChiefCredit.Text, cbViceFactCouncilChief);

                    //cbCouncillors.Value = q.Councillors;
                    //CreateArray(tbCouncillorsCredit.Text, cbCouncillors);

                    //cbSecretary.Value = q.Secretary;
                    //CreateArray(tbSecretaryCredit.Text, cbSecretary);

                    //cbFacultyBoard.Value = q.FacultyBoard;
                    //CreateArray(tbFactBoardCredit.Text, cbFacultyBoard);

                    //seBranchBoardCmd.Value = q.BranchBoardCmd;
                    //seAssignmentCmd.Value = q.AssignmentCmd;

                    //ShowCarry();

                    cbChancellor.Value = q.Chancellor;
                    cbViceChancellor.Value = q.ViceChancellor;
                    cbDean.Value = q.Dean;
                    cbChancellorAssistant.Value = q.ChancellorAssistant;
                    cbViceDean.Value = q.ViceDean;
                    cbDepartmentHead.Value = q.DepartmentHead;
                    cbDeanOfficeHead.Value = q.DeanOfficeHead;
                    cbDeanAssistant.Value = q.DeanAssistant;
                    cbBranchHeadDirect.Value = q.BranchHeadDirect;
                    cbViceDepartment.Value = q.ViceDepartment;
                    cbBranchHeadIn.Value = q.BranchHeadIn;
                    cbFacultyCouncilChief.Value = q.FacultyCouncilChief;
                    cbViceFactCouncilChief.Value = q.ViceFactCouncilChief;
                    cbCouncillors.Value = q.Councillors;
                    cbSecretary.Value = q.Secretary;
                    cbFacultyBoard.Value = q.FacultyBoard;

                    NewShowCarry();

                }
                catch (Exception)
                {
                    AssessmentSystem.Administrative x = new AssessmentSystem.Administrative();

                    x.Chancellor = Convert.ToBoolean(cbChancellor.Value);
                    x.ViceChancellor = Convert.ToBoolean(cbViceChancellor.Value);
                    x.Dean = Convert.ToBoolean(cbDean.Value);
                    x.ChancellorAssistant = Convert.ToBoolean(cbChancellorAssistant.Value);
                    x.ViceDean = Convert.ToBoolean(cbViceDean.Value);
                    x.DepartmentHead = Convert.ToBoolean(cbDepartmentHead.Value);
                    x.DeanOfficeHead = Convert.ToBoolean(cbDeanOfficeHead.Value);
                    x.DeanAssistant = Convert.ToBoolean(cbDeanAssistant.Value);
                    x.BranchHeadDirect = Convert.ToBoolean(cbBranchHeadDirect.Value);
                    x.ViceDepartment = Convert.ToBoolean(cbViceDepartment.Value);
                    x.BranchHeadIn = Convert.ToBoolean(cbBranchHeadIn.Value);
                    x.FacultyCouncilChief = Convert.ToBoolean(cbFacultyCouncilChief.Value);
                    x.ViceFactCouncilChief = Convert.ToBoolean(cbViceFactCouncilChief.Value);
                    x.Councillors = Convert.ToBoolean(cbCouncillors.Value);
                    x.Secretary = Convert.ToBoolean(cbSecretary.Value);
                    x.FacultyBoard = Convert.ToBoolean(cbFacultyBoard.Value);
                    x.BranchBoardCmd = Convert.ToInt32(seBranchBoardCmd.Value);
                    x.AssignmentCmd = Convert.ToInt32(seAssignmentCmd.Value);
                    //x.UserName = Session["UserName"].ToString();

                    db.Administratives.InsertOnSubmit(x);
                    db.SubmitChanges();
                }
            }
        }

        protected void btSubmit_Click(object sender, EventArgs e)
        {
            var q = (from p in db.Administratives
                    select p).First();

            q.Chancellor = Convert.ToBoolean(cbChancellor.Value);
            q.ViceChancellor = Convert.ToBoolean(cbViceChancellor.Value);
            q.Dean = Convert.ToBoolean(cbDean.Value);
            q.ChancellorAssistant = Convert.ToBoolean(cbChancellorAssistant.Value);
            q.ViceDean = Convert.ToBoolean(cbViceDean.Value);
            q.DepartmentHead = Convert.ToBoolean(cbDepartmentHead.Value);
            q.DeanOfficeHead = Convert.ToBoolean(cbDeanOfficeHead.Value);
            q.DeanAssistant = Convert.ToBoolean(cbDeanAssistant.Value);
            q.BranchHeadDirect = Convert.ToBoolean(cbBranchHeadDirect.Value);
            q.ViceDepartment = Convert.ToBoolean(cbViceDepartment.Value);
            q.BranchHeadIn = Convert.ToBoolean(cbBranchHeadIn.Value);
            q.FacultyCouncilChief = Convert.ToBoolean(cbFacultyCouncilChief.Value);
            q.ViceFactCouncilChief = Convert.ToBoolean(cbViceFactCouncilChief.Value);
            q.Councillors = Convert.ToBoolean(cbCouncillors.Value);
            q.Secretary = Convert.ToBoolean(cbSecretary.Value);
            q.FacultyBoard = Convert.ToBoolean(cbFacultyBoard.Value);
            q.BranchBoardCmd = Convert.ToInt32(seBranchBoardCmd.Value);
            q.AssignmentCmd = Convert.ToInt32(seAssignmentCmd.Value);
            //x.UserName = Session["UserName"].ToString();

            db.SubmitChanges();

            Response.Redirect("Administrative.aspx");
        }

        //public void CreateArray(string str , ASPxCheckBox cb)
        //{
        //    if (cb.Checked)
        //    {
        //        Carry.Add(Convert.ToInt32(str));
        //    }
        //    else
        //    {
        //        try
        //        {
        //            Carry.RemoveAt(Carry.IndexOf(Convert.ToInt32(str)));
        //        }
        //        catch (Exception)
        //        {
        //        }
        //    }
        //    Carry.Sort(new ReverseSort());
        //    ShowArray();
        //    Temp = new ArrayList();
        //    for (int i = 0; i < Carry.Count; i++)
        //    {
        //        if (i==0)
        //        {
        //            Temp.Add(Carry[i]);
        //        }
        //        else
        //        {
        //            Temp.Add(Convert.ToInt32(Carry[i])/2);
        //        }
        //    }
        //    ShowCarry();
        //}

        //private void ShowArray()
        //{
        //    ASPxLabel17.Text = "";
        //    string data = "";
        //    foreach (var x in Carry)
        //    {
        //        data += "["+ x +"]";
        //    }
        //    ASPxLabel17.Text = Carry.Count.ToString() + ":";
        //    ASPxLabel17.Text += data;
        //}

        //public void ShowCarry()
        //{
        //    for (int i = 0; i < Temp.Count; i++)
        //    {
        //        if (cbChancellor.Checked&&a)
        //        {
        //            tbChancellorTotal.Text = Temp[i].ToString();
        //            a = false;
        //        }else if (cbViceChancellor.Checked&&b)
        //        {
        //            tbViceChanTotal.Text = Temp[i].ToString();
        //            b = false;
        //        }else if (cbDean.Checked&&c)
        //        {
        //            tbDeanTotal.Text = Temp[i].ToString();
        //            c = false;
        //        }else if (cbChancellorAssistant.Checked&&d)
        //        {
        //            tbChanAssistTotal.Text = Temp[i].ToString();
        //            d = false;
        //        }else if (cbViceDean.Checked&&e)
        //        {
        //            tbViceDeanTotal.Text = Temp[i].ToString();
        //            e = false;
        //        }else if (cbDepartmentHead.Checked&&f)
        //        {
        //            tbDeptHeadTotal.Text = Temp[i].ToString();
        //            f = false;
        //        }else if (cbDeanOfficeHead.Checked&&g)
        //        {
        //            tbDeanOfficeHTotal.Text = Temp[i].ToString();
        //            g = false;
        //        }else if (cbDeanAssistant.Checked&&h)
        //        {
        //            tbDeanAssistTotal.Text = Temp[i].ToString();
        //            h = false;
        //        }else if (cbBranchHeadDirect.Checked&&j)
        //        {
        //            tbBranchHeadDTotal.Text = Temp[i].ToString();
        //            j = false;
        //        }else if (cbViceDepartment.Checked&&k)
        //        {
        //            tbViceDeptTotal.Text = Temp[i].ToString();
        //            k = false;
        //        }else if (cbBranchHeadIn.Checked&&l)
        //        {
        //            tbBranchHeadInTotal.Text = Temp[i].ToString();
        //            l = false;
        //        }else if (cbFacultyCouncilChief.Checked&&m)
        //        {
        //            tbFactCounChiefTotal.Text = Temp[i].ToString();
        //            m = false;
        //        }else if (cbViceFactCouncilChief.Checked&&n)
        //        {
        //            tbViceFactCounChiefTotal.Text = Temp[i].ToString();
        //            n = false;
        //        }else if (cbCouncillors.Checked&&o)
        //        {
        //            tbCouncillorsTotal.Text = Temp[i].ToString();
        //            o = false;
        //        }else if (cbSecretary.Checked&&p)
        //        {
        //            tbSecretaryTotal.Text = Temp[i].ToString();
        //            p = false;
        //        }else if (cbFacultyBoard.Checked&&q)
        //        {
        //            tbFactBoardTotal.Text = Temp[i].ToString();
        //            q = false;
        //        }
        //    }

        //    a = true;
        //    b = true;
        //    c = true;
        //    d = true;
        //    e = true;
        //    f = true;
        //    g = true;
        //    h = true;
        //    j = true;
        //    k = true;
        //    l = true;
        //    m = true;
        //    n = true;
        //    o = true;
        //    p = true;
        //    q = true;
        //}

        void NewShowCarry()
        {
            if (cbChancellor.Checked)
            {
                tbChancellorTotal.Text = tbChancellorCredit.Text;
            }
            if (cbViceChancellor.Checked)
            {
                if (cbChancellor.Checked)
                {
                    tbViceChanTotal.Text = (Convert.ToInt32(tbViceChanCredit.Text)/2).ToString();
                }
                else
                {
                    tbViceChanTotal.Text = tbViceChanCredit.Text;
                }
            }
            if (cbDean.Checked)
            {
                if (cbChancellor.Checked || cbViceChancellor.Checked)
                {
                    tbDeanTotal.Text = (Convert.ToInt32(tbDeanCredit.Text) / 2).ToString();
                }
                else
                {
                    tbDeanTotal.Text = tbDeanCredit.Text;
                }
            }
            if (cbChancellorAssistant.Checked)
            {
                if (cbChancellor.Checked || cbViceChancellor.Checked || cbDean.Checked)
                {
                    tbChanAssistTotal.Text = (Convert.ToInt32(tbChanAssistCredit.Text) / 2).ToString();
                }
                else
                {
                    tbChanAssistTotal.Text = tbChanAssistCredit.Text;
                }
            }
            if (cbViceDean.Checked)
            {
                if (cbChancellor.Checked || cbViceChancellor.Checked || cbDean.Checked || cbChancellorAssistant.Checked)
                {
                    tbViceDeanTotal.Text = (Convert.ToInt32(tbViceDeanCredit.Text) / 2).ToString();
                }
                else
                {
                    tbViceDeanTotal.Text = tbViceDeanCredit.Text;
                }
            }
            if (cbDepartmentHead.Checked)
            {
                if (cbChancellor.Checked || cbViceChancellor.Checked || cbDean.Checked || cbChancellorAssistant.Checked
                    || cbViceDean.Checked)
                {
                    tbDeptHeadTotal.Text = (Convert.ToInt32(tbDeptHeadCredit.Text) / 2).ToString();
                }
                else
                {
                    tbDeptHeadTotal.Text = tbDeptHeadCredit.Text;
                }
            }
            if (cbFacultyCouncilChief.Checked)
            {
                if (cbChancellor.Checked || cbViceChancellor.Checked || cbDean.Checked || cbChancellorAssistant.Checked
                    || cbViceDean.Checked || cbDepartmentHead.Checked)
                {
                    tbFactCounChiefTotal.Text = (Convert.ToInt32(tbFactCounChiefCredit.Text) / 2).ToString();
                }
                else
                {
                    tbFactCounChiefTotal.Text = tbFactCounChiefCredit.Text;
                }
            } 
            if (cbViceFactCouncilChief.Checked)
            {
                if (cbChancellor.Checked || cbViceChancellor.Checked || cbDean.Checked || cbChancellorAssistant.Checked
                    || cbViceDean.Checked || cbDepartmentHead.Checked || cbFacultyCouncilChief.Checked)
                {
                    tbViceFactCounChiefTotal.Text = (Convert.ToInt32(tbViceFactCounChiefCredit.Text) / 2).ToString();
                }
                else
                {
                    tbViceFactCounChiefTotal.Text = tbViceFactCounChiefCredit.Text;
                }
            }
            if (cbCouncillors.Checked)
            {
                if (cbChancellor.Checked || cbViceChancellor.Checked || cbDean.Checked || cbChancellorAssistant.Checked
                    || cbViceDean.Checked || cbDepartmentHead.Checked || cbFacultyCouncilChief.Checked || cbViceFactCouncilChief.Checked)
                {
                    tbCouncillorsTotal.Text = (Convert.ToInt32(tbCouncillorsCredit.Text) / 2).ToString();
                }
                else
                {
                    tbCouncillorsTotal.Text = tbCouncillorsCredit.Text;
                }
            }
            if (cbSecretary.Checked)
            {
                if (cbChancellor.Checked || cbViceChancellor.Checked || cbDean.Checked || cbChancellorAssistant.Checked
                    || cbViceDean.Checked || cbDepartmentHead.Checked || cbFacultyCouncilChief.Checked || cbViceFactCouncilChief.Checked
                    || cbCouncillors.Checked)
                {
                    tbSecretaryTotal.Text = (Convert.ToInt32(tbSecretaryCredit.Text) / 2).ToString();
                }
                else
                {
                    tbSecretaryTotal.Text = tbSecretaryCredit.Text;
                }
            }
            if (cbDeanOfficeHead.Checked)
            {
                if (cbChancellor.Checked || cbViceChancellor.Checked || cbDean.Checked || cbChancellorAssistant.Checked
                    || cbViceDean.Checked || cbDepartmentHead.Checked || cbFacultyCouncilChief.Checked || cbViceFactCouncilChief.Checked
                    || cbCouncillors.Checked || cbSecretary.Checked)
                {
                    tbDeanOfficeHTotal.Text = (Convert.ToInt32(tbDeanOfficeHTotal.Text) / 2).ToString();
                }
                else
                {
                    tbDeanOfficeHTotal.Text = tbDeanOfficeHTotal.Text;
                }
            }
            if (cbDeanAssistant.Checked)
            {
                if (cbChancellor.Checked || cbViceChancellor.Checked || cbDean.Checked || cbChancellorAssistant.Checked
                    || cbViceDean.Checked || cbDepartmentHead.Checked || cbFacultyCouncilChief.Checked || cbViceFactCouncilChief.Checked
                    || cbCouncillors.Checked || cbSecretary.Checked || cbDeanOfficeHead.Checked)
                {
                    tbDeanAssistTotal.Text = (Convert.ToInt32(tbDeanAssistCredit.Text) / 2).ToString();
                }
                else
                {
                    tbDeanAssistTotal.Text = tbDeanAssistCredit.Text;
                }
            }
            if (cbBranchHeadDirect.Checked)
            {
                if (cbChancellor.Checked || cbViceChancellor.Checked || cbDean.Checked || cbChancellorAssistant.Checked
                    || cbViceDean.Checked || cbDepartmentHead.Checked || cbFacultyCouncilChief.Checked || cbViceFactCouncilChief.Checked
                    || cbCouncillors.Checked || cbSecretary.Checked || cbDeanOfficeHead.Checked || cbDeanAssistant.Checked)
                {
                    tbBranchHeadDTotal.Text = (Convert.ToInt32(tbBranchHeadDCredit.Text) / 2).ToString();
                }
                else
                {
                    tbBranchHeadDTotal.Text = tbBranchHeadDCredit.Text;
                }
            }
            if (cbViceDepartment.Checked)
            {
                if (cbChancellor.Checked || cbViceChancellor.Checked || cbDean.Checked || cbChancellorAssistant.Checked
                    || cbViceDean.Checked || cbDepartmentHead.Checked || cbFacultyCouncilChief.Checked || cbViceFactCouncilChief.Checked
                    || cbCouncillors.Checked || cbSecretary.Checked || cbDeanOfficeHead.Checked || cbDeanAssistant.Checked
                    || cbBranchHeadDirect.Checked)
                {
                    tbViceDeptTotal.Text = (Convert.ToInt32(tbViceDeptCredit.Text) / 2).ToString();
                }
                else
                {
                    tbViceDeptTotal.Text = tbViceDeptCredit.Text;
                }
            }
            if (cbBranchHeadIn.Checked)
            {
                if (cbChancellor.Checked || cbViceChancellor.Checked || cbDean.Checked || cbChancellorAssistant.Checked
                    || cbViceDean.Checked || cbDepartmentHead.Checked || cbFacultyCouncilChief.Checked || cbViceFactCouncilChief.Checked
                    || cbCouncillors.Checked || cbSecretary.Checked || cbDeanOfficeHead.Checked || cbDeanAssistant.Checked
                    || cbBranchHeadDirect.Checked || cbViceDepartment.Checked)
                {
                    tbBranchHeadInTotal.Text = (Convert.ToInt32(tbBranchHeadInCredit.Text) / 2).ToString();
                }
                else
                {
                    tbBranchHeadInTotal.Text = tbBranchHeadInCredit.Text;
                }
            }
            if (cbFacultyBoard.Checked)
            {
                if (cbChancellor.Checked || cbViceChancellor.Checked || cbDean.Checked || cbChancellorAssistant.Checked
                    || cbViceDean.Checked || cbDepartmentHead.Checked || cbFacultyCouncilChief.Checked || cbViceFactCouncilChief.Checked
                    || cbCouncillors.Checked || cbSecretary.Checked || cbDeanOfficeHead.Checked || cbDeanAssistant.Checked
                    || cbBranchHeadDirect.Checked || cbViceDepartment.Checked || cbBranchHeadIn.Checked)
                {
                    tbFactBoardTotal.Text = (Convert.ToInt32(tbFactBoardCredit.Text) / 2).ToString();
                }
                else
                {
                    tbFactBoardTotal.Text = tbFactBoardCredit.Text;
                }
            }
            if (Convert.ToInt32(seBranchBoardCmd.Value) != 0)
            {
                if (cbChancellor.Checked || cbViceChancellor.Checked || cbDean.Checked || cbChancellorAssistant.Checked
                    || cbViceDean.Checked || cbDepartmentHead.Checked || cbFacultyCouncilChief.Checked || cbViceFactCouncilChief.Checked
                    || cbCouncillors.Checked || cbSecretary.Checked || cbDeanOfficeHead.Checked || cbDeanAssistant.Checked
                    || cbBranchHeadDirect.Checked || cbViceDepartment.Checked || cbBranchHeadIn.Checked || cbFacultyBoard.Checked)
                {
                    tbBranchBoardCmdTotal.Text += (Convert.ToInt32(tbFactBoardCredit.Text) / 2).ToString();
                }
                else
                {
                    tbFactBoardTotal.Text = tbFactBoardCredit.Text;
                }
            }
        }

        protected void cbChancellor_CheckedChanged(object sender, EventArgs e)
        {
            //CreateArray(tbChancellorCredit.Text, cbChancellor);
            NewShowCarry();
            if (!cbChancellor.Checked)
            {
                tbChancellorTotal.Text = "";
            }
        }

        protected void cbViceChancellor_CheckedChanged(object sender, EventArgs e)
        {
            //CreateArray(tbViceChanCredit.Text, cbViceChancellor);
            NewShowCarry();
            if (!cbViceChancellor.Checked)
            {
                tbViceChanTotal.Text = "";
            }
        }

        protected void cbDean_CheckedChanged(object sender, EventArgs e)
        {
            //CreateArray(tbDeanCredit.Text, cbDean);
            NewShowCarry();
            if (!cbDean.Checked)
            {
                tbDeanTotal.Text = "";
            }
        }

        protected void cbChancellorAssistant_CheckedChanged(object sender, EventArgs e)
        {
            //CreateArray(tbChanAssistCredit.Text, cbChancellorAssistant);
            NewShowCarry();
            if (!cbChancellorAssistant.Checked)
            {
                tbChanAssistTotal.Text = "";
            }
        }

        protected void cbViceDean_CheckedChanged(object sender, EventArgs e)
        {
            //CreateArray(tbViceDeanCredit.Text, cbViceDean);
            NewShowCarry();
            if (!cbViceDean.Checked)
            {
                tbViceDeanTotal.Text = "";
            }
        }

        protected void cbDepartmentHead_CheckedChanged(object sender, EventArgs e)
        {
            //CreateArray(tbDeptHeadCredit.Text, cbDepartmentHead);
            NewShowCarry();
            if (!cbDepartmentHead.Checked)
            {
                tbDeptHeadTotal.Text = "";
            }
        }

        protected void cbDeanOfficeHead_CheckedChanged(object sender, EventArgs e)
        {
            //CreateArray(tbDeanOfficeHCredit.Text, cbDeanOfficeHead);
            NewShowCarry();
            if (!cbDeanOfficeHead.Checked)
            {
                tbDeanOfficeHTotal.Text = "";
            }
        }

        protected void cbDeanAssistant_CheckedChanged(object sender, EventArgs e)
        {
            //CreateArray(tbDeanAssistCredit.Text, cbDeanAssistant);
            NewShowCarry();
            if (!cbDeanAssistant.Checked)
            {
                tbDeanAssistTotal.Text = "";
            }
        }

        protected void cbBranchHeadDirect_CheckedChanged(object sender, EventArgs e)
        {
            //CreateArray(tbBranchHeadDCredit.Text, cbBranchHeadDirect);
            NewShowCarry();
            if (!cbBranchHeadDirect.Checked)
            {
                tbBranchHeadDTotal.Text = "";
            }
        }

        protected void cbViceDepartment_CheckedChanged(object sender, EventArgs e)
        {
            //CreateArray(tbViceDeptCredit.Text, cbViceDepartment);
            NewShowCarry();
            if (!cbViceDepartment.Checked)
            {
                tbViceDeptTotal.Text = "";
            }
        }

        protected void cbBranchHeadIn_CheckedChanged(object sender, EventArgs e)
        {
            //CreateArray(tbBranchHeadInCredit.Text, cbBranchHeadIn);
            NewShowCarry();
            if (!cbBranchHeadIn.Checked)
            {
                tbBranchHeadInTotal.Text = "";
            }
        }

        protected void cbFacultyCouncilChief_CheckedChanged(object sender, EventArgs e)
        {
            //CreateArray(tbFactCounChiefCredit.Text, cbViceFactCouncilChief);
            NewShowCarry();
            if (!cbViceFactCouncilChief.Checked)
            {
                tbFactCounChiefTotal.Text = "";
            }
        }

        protected void cbViceFactCouncilChief_CheckedChanged(object sender, EventArgs e)
        {
            //CreateArray(tbViceFactCounChiefCredit.Text, cbViceFactCouncilChief);
            NewShowCarry();
            if (!cbViceFactCouncilChief.Checked)
            {
                tbViceFactCounChiefTotal.Text = "";
            }
        }

        protected void cbCouncillors_CheckedChanged(object sender, EventArgs e)
        {
            //CreateArray(tbCouncillorsCredit.Text, cbCouncillors);
            NewShowCarry();
            if (!cbCouncillors.Checked)
            {
                tbCouncillorsTotal.Text = "";
            }
        }

        protected void cbSecretary_CheckedChanged(object sender, EventArgs e)
        {
            //CreateArray(tbSecretaryCredit.Text, cbSecretary);
            NewShowCarry();
            if (!cbSecretary.Checked)
            {
                tbSecretaryTotal.Text = "";
            }
        }

        protected void cbFacultyBoard_CheckedChanged(object sender, EventArgs e)
        {
            //CreateArray(tbFactBoardCredit.Text, cbFacultyBoard);
            NewShowCarry();
            if (!cbFacultyBoard.Checked)
            {
                tbFactBoardTotal.Text = "";
            }
        }
    }
}