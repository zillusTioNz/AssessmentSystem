using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentSystem.CalCarry.Administrative
{
    public partial class Administrative : System.Web.UI.Page
    {
        AssessmentSystemDataContext db = new AssessmentSystemDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    var q = (from p in db.Administratives
                        //where p.UserName == Session["UserName"]
                        select p).First();

                    ucChancellor.CBposition = Convert.ToBoolean(q.Chancellor);
                    ucViceChancellor.CBposition = Convert.ToBoolean(q.ViceChancellor);
                    ucDean.CBposition = Convert.ToBoolean(q.Dean);
                    ucChanAssist.CBposition = Convert.ToBoolean(q.ChancellorAssistant);
                    ucViceDean.CBposition = Convert.ToBoolean(q.ViceDean);
                    ucDeptHead.CBposition = Convert.ToBoolean(q.DepartmentHead);
                    ucDeanOffHead.CBposition = Convert.ToBoolean(q.DeanOfficeHead);
                    ucDeanAssist.CBposition = Convert.ToBoolean(q.DeanAssistant);
                    ucBranchHD.CBposition = Convert.ToBoolean(q.BranchHeadDirect);
                    ucViceDept.CBposition = Convert.ToBoolean(q.ViceDepartment);
                    ucBranchHI.CBposition = Convert.ToBoolean(q.BranchHeadIn);
                    ucFactCounChief.CBposition = Convert.ToBoolean(q.FacultyCouncilChief);
                    ucViceFactCounChief.CBposition = Convert.ToBoolean(q.ViceFactCouncilChief);
                    ucCouncillores.CBposition = Convert.ToBoolean(q.Councillors);
                    ucSecretary.CBposition = Convert.ToBoolean(q.Secretary);
                    ucFactBoard.CBposition = Convert.ToBoolean(q.FacultyBoard);
                    ucBranchBCmd.SEnumber = Convert.ToInt32(q.BranchBoardCmd);
                    ucAssignCmd.SEnumber = Convert.ToInt32(q.AssignmentCmd);

                }
                catch (Exception)
                {
                    AssessmentSystem.Administrative x = new AssessmentSystem.Administrative();

                    x.Chancellor = Convert.ToBoolean(ucChancellor.CBposition);
                    x.ViceChancellor = Convert.ToBoolean(ucViceChancellor.CBposition);
                    x.Dean = Convert.ToBoolean(ucDean.CBposition);
                    x.ChancellorAssistant = Convert.ToBoolean(ucChanAssist.CBposition);
                    x.ViceDean = Convert.ToBoolean(ucViceDean.CBposition);
                    x.DepartmentHead = Convert.ToBoolean(ucDeptHead.CBposition);
                    x.DeanOfficeHead = Convert.ToBoolean(ucDeanOffHead.CBposition);
                    x.DeanAssistant = Convert.ToBoolean(ucDeanAssist.CBposition);
                    x.BranchHeadDirect = Convert.ToBoolean(ucBranchHD.CBposition);
                    x.ViceDepartment = Convert.ToBoolean(ucViceDept.CBposition);
                    x.BranchHeadIn = Convert.ToBoolean(ucBranchHI.CBposition);
                    x.FacultyCouncilChief = Convert.ToBoolean(ucFactCounChief.CBposition);
                    x.ViceFactCouncilChief = Convert.ToBoolean(ucViceFactCounChief.CBposition);
                    x.Councillors = Convert.ToBoolean(ucCouncillores.CBposition);
                    x.Secretary = Convert.ToBoolean(ucSecretary.CBposition);
                    x.FacultyBoard = Convert.ToBoolean(ucFactBoard.CBposition);
                    x.BranchBoardCmd = Convert.ToInt32(ucBranchBCmd.SEnumber);
                    x.AssignmentCmd = Convert.ToInt32(ucAssignCmd.SEnumber);
                    //x.UserName = Session["UserName"].ToString();

                    db.Administratives.InsertOnSubmit(x);
                    db.SubmitChanges();
                }
            }

            Page.LoadComplete += new EventHandler(Page_LoadComplete);
        }

        void Page_LoadComplete(object sender, EventArgs e)
        {
            if (ucChancellor.CBposition)
            {
                ucChancellor.TBtotal = ucChancellor.LBcredit;
            }
            else if (ucViceChancellor.CBposition)
            {
                ucViceChancellor.TBtotal = ucViceChancellor.LBcredit;
            }
            else if (ucDean.CBposition)
            {
                ucDean.TBtotal = ucDean.LBcredit;
            }
            else if (ucChanAssist.CBposition)
            {
                ucChanAssist.TBtotal = ucChanAssist.LBcredit;
            }
            else if (ucViceDean.CBposition)
            {
                ucViceDean.TBtotal = ucViceDean.LBcredit;
            }
            else if (ucDeptHead.CBposition)
            {
                ucDeptHead.TBtotal = ucDeptHead.LBcredit;
            }
            else if (ucFactCounChief.CBposition)
            {
                ucFactCounChief.TBtotal = ucFactCounChief.LBcredit;
            }
            else if (ucViceFactCounChief.CBposition)
            {
                ucViceFactCounChief.TBtotal = ucViceFactCounChief.LBcredit;
            }
            else if (ucCouncillores.CBposition)
            {
                ucCouncillores.TBtotal = ucCouncillores.LBcredit;
            }
            else if (ucSecretary.CBposition)
            {
                ucSecretary.TBtotal = ucSecretary.LBcredit;
            }
            else if (ucDeanOffHead.CBposition)
            {
                ucDeanOffHead.TBtotal = ucDeanOffHead.LBcredit;
            }
            else if (ucDeanAssist.CBposition)
            {
                ucDeanAssist.TBtotal = ucDeanAssist.LBcredit;
            }
            else if (ucBranchHD.CBposition)
            {
                ucBranchHD.TBtotal = ucBranchHD.LBcredit;
            }
            else if (ucViceDept.CBposition)
            {
                ucViceDept.TBtotal = ucViceDept.LBcredit;
            }
            else if (ucBranchHI.CBposition)
            {
                ucBranchHI.TBtotal = ucBranchHI.LBcredit;
            }
            else if (ucFactBoard.CBposition)
            {
                ucFactBoard.TBtotal = ucFactBoard.LBcredit;
            }
            else if (ucBranchBCmd.SEnumber == 1)
            {
                ucBranchBCmd.TBtotal = ucBranchBCmd.LBcredit;
                if (ucAssignCmd.SEnumber == 1)
                {
                    int credit = Convert.ToInt32(ucAssignCmd.LBcredit);
                    int n = Convert.ToInt32(ucAssignCmd.SEnumber);

                    ucAssignCmd.TBtotal = ((n * credit) / 2).ToString();
                }
            }
            else if (ucBranchBCmd.SEnumber > 1)
            {
                int credit = Convert.ToInt32(ucBranchBCmd.LBcredit);
                int n = Convert.ToInt32(ucBranchBCmd.SEnumber);

                ucBranchBCmd.TBtotal =  ( credit + ((n - 1) * credit) / 2).ToString();
            }
            else if (ucAssignCmd.SEnumber == 1)
            {
                ucAssignCmd.TBtotal = ucAssignCmd.LBcredit;
            }
            else if (ucAssignCmd.SEnumber > 1)
            {
                int credit = Convert.ToInt32(ucAssignCmd.LBcredit);
                int n = Convert.ToInt32(ucAssignCmd.SEnumber);

                ucAssignCmd.TBtotal = (credit + ((n - 1) * credit) / 2).ToString();
            }
        }

        protected void btSubmit_Click(object sender, EventArgs e)
        {
            var q = (from p in db.Administratives
                     select p).First();

            q.Chancellor = Convert.ToBoolean(ucChancellor.CBposition);
            q.ViceChancellor = Convert.ToBoolean(ucViceChancellor.CBposition);
            q.Dean = Convert.ToBoolean(ucDean.CBposition);
            q.ChancellorAssistant = Convert.ToBoolean(ucChanAssist.CBposition);
            q.ViceDean = Convert.ToBoolean(ucViceDean.CBposition);
            q.DepartmentHead = Convert.ToBoolean(ucDeptHead.CBposition);
            q.DeanOfficeHead = Convert.ToBoolean(ucDeanOffHead.CBposition);
            q.DeanAssistant = Convert.ToBoolean(ucDeanAssist.CBposition);
            q.BranchHeadDirect = Convert.ToBoolean(ucBranchHD.CBposition);
            q.ViceDepartment = Convert.ToBoolean(ucViceDept.CBposition);
            q.BranchHeadIn = Convert.ToBoolean(ucBranchHI.CBposition);
            q.FacultyCouncilChief = Convert.ToBoolean(ucFactCounChief.CBposition);
            q.ViceFactCouncilChief = Convert.ToBoolean(ucViceFactCounChief.CBposition);
            q.Councillors = Convert.ToBoolean(ucCouncillores.CBposition);
            q.Secretary = Convert.ToBoolean(ucSecretary.CBposition);
            q.FacultyBoard = Convert.ToBoolean(ucFactBoard.CBposition);
            q.BranchBoardCmd = Convert.ToInt32(ucBranchBCmd.SEnumber);
            q.AssignmentCmd = Convert.ToInt32(ucAssignCmd.SEnumber);
            //x.UserName = Session["UserName"].ToString();

            db.SubmitChanges();

            Response.Redirect("Administrative.aspx");
        }
    }
}