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
        static bool a=true, b=true, c=true, d=true, e=true, f=true;

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

                    cbChancellor.Value = q.Chancellor;
                    CreateArray("35", cbChancellor);

                    cbViceChancellor.Value = q.ViceChancellor;
                    CreateArray("30", cbViceChancellor);

                    cbDean.Value = q.Dean;
                    CreateArray("30", cbDean);

                    cbChancellorAssistant.Value = q.ChancellorAssistant;
                    CreateArray("26", cbChancellorAssistant);

                    cbViceDean.Value = q.ViceDean;
                    CreateArray("24", cbViceDean);

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
                    seBranchBoardCmd.Value = q.BranchBoardCmd;
                    seAssignmentCmd.Value = q.AssignmentCmd;

                    ShowCarry();

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

        public void CreateArray(string str , ASPxCheckBox cb)
        {
            if (cb.Checked)
            {
                Carry.Add(Convert.ToInt32(str));
            }
            else
            {
                try
                {
                    Carry.RemoveAt(Carry.IndexOf(Convert.ToInt32(str)));
                }
                catch (Exception)
                {
                }
            }
            Carry.Sort(new ReverseSort());
            ShowArray();
            Temp = new ArrayList();
            for (int i = 0; i < Carry.Count; i++)
            {
                if (i==0)
                {
                    Temp.Add(Carry[i]);
                }
                else
                {
                    Temp.Add(Convert.ToInt32(Carry[i])/2);
                }
            }
            ShowCarry();
        }

        private void ShowArray()
        {
            ASPxLabel17.Text = "";
            string data = "";
            foreach (var x in Carry)
            {
                data += "["+ x +"]";
            }
            ASPxLabel17.Text = Carry.Count.ToString() + ":";
            ASPxLabel17.Text += data;
        }

        public void ShowCarry()
        {
            for (int i = 0; i < Temp.Count; i++)
            {
                if (cbChancellor.Checked&&a)
                {
                    tbChancellorTotal.Text = Temp[i].ToString();
                    a = false;
                }else if (cbViceChancellor.Checked&&b)
                {
                    tbViceChanTotal.Text = Temp[i].ToString();
                    b = false;
                }else if (cbDean.Checked&&c)
                {
                    tbDeanTotal.Text = Temp[i].ToString();
                    c = false;
                }else if (cbChancellorAssistant.Checked&&d)
                {
                    tbChanAssistTotal.Text = Temp[i].ToString();
                    d = false;
                }else if (cbViceDean.Checked&&e)
                {
                    tbViceDeanTotal.Text = Temp[i].ToString();
                    e = false;
                }else if (cbDepartmentHead.Checked)
                {
                    tbDeptHeadTotal.Text = Temp[i].ToString();
                }else if (cbDeanOfficeHead.Checked)
                {
                    tbDeanOfficeHTotal.Text = Temp[i].ToString();
                }else if (cbDeanAssistant.Checked)
                {
                    tbDeanAssistTotal.Text = Temp[i].ToString();
                }else if (cbBranchHeadDirect.Checked)
                {
                    tbBranchHeadDTotal.Text = Temp[i].ToString();
                }else if (cbViceDepartment.Checked)
                {
                    tbViceDeptTotal.Text = Temp[i].ToString();
                }else if (cbBranchHeadIn.Checked)
                {
                    tbBranchHeadInTotal.Text = Temp[i].ToString();
                }else if (cbFacultyCouncilChief.Checked)
                {
                    tbFactCounChiefTotal.Text = Temp[i].ToString();
                }else if (cbViceFactCouncilChief.Checked)
                {
                    tbViceFactCounChiefTotal.Text = Temp[i].ToString();
                }else if (cbCouncillors.Checked)
                {
                    tbCouncillorsTotal.Text = Temp[i].ToString();
                }
            }

            a = true;
            b = true;
            c = true;
            d = true;
            e = true;
        }

        protected void cbChancellor_CheckedChanged(object sender, EventArgs e)
        {
            CreateArray(tbChancellorCredit.Text, cbChancellor);
            if (!cbChancellor.Checked)
            {
                tbChancellorTotal.Text = "";
            }
        }

        protected void cbViceChancellor_CheckedChanged(object sender, EventArgs e)
        {
            CreateArray(tbViceChanCredit.Text, cbViceChancellor);
            if (!cbViceChancellor.Checked)
            {
                tbViceChanTotal.Text = "";
            }
        }

        protected void cbDean_CheckedChanged(object sender, EventArgs e)
        {
            CreateArray(tbDeanCredit.Text, cbDean);
            if (!cbDean.Checked)
            {
                tbDeanTotal.Text = "";
            }
        }

        protected void cbChancellorAssistant_CheckedChanged(object sender, EventArgs e)
        {
            CreateArray(tbChanAssistCredit.Text, cbChancellorAssistant);
            if (!cbChancellorAssistant.Checked)
            {
                tbChanAssistTotal.Text = "";
            }
        }
    }
}