using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentSystem.CalCarry.AcademicService
{
    public partial class Academic : System.Web.UI.Page
    {
        AssessmentSystemDataContext db = new AssessmentSystemDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                try
                {
                    var q = (from p in db.AcademicServices
                             //where p.UserName == Session["UserName"].ToString() 
                             select p).First();seCmtPro.Value = q.CommitteeProject;
                    seEih.Value = q.ExpertInHours;
                    seEip.Value = q.ExpertInPracHours;
                    seEoh.Value = q.ExpertOutHours;
                    seEop.Value = q.ExpertOutPracHours;
                    seCmtAp.Value = q.CommitteeAcPerson;
                    seCmtCp.Value = q.CommitteeCrPerson;
                    seCmtBp.Value = q.CommitteeBsPerson;
                    seCmtTp.Value = q.CommitteeThPerson;
                    seSat.Value = q.ServiceAnalysisTimes;
                    seSot.Value = q.ServiceOtherTimes;

                    tbCmtTotal.Text = (Convert.ToDouble(seCmtPro.Value)*Convert.ToDouble(tbCmtCredit.Text)).ToString();
                    tbEihTotal.Text = (Convert.ToDouble(seEih.Value) * Convert.ToDouble(tbEihCredit.Text)).ToString();
                    tbEipTotal.Text = (Convert.ToDouble(seEip.Value) * Convert.ToDouble(tbEipCredit.Text)).ToString();
                    
                    
                    if (Convert.ToDouble(seEoh.Value) * Convert.ToDouble(tbEohCredit.Text) >= 7)
                    {
                        tbEohTotal.Text = "7";
                    }
                    else
                    {
                        tbEohTotal.Text = (Convert.ToDouble(seEoh.Value) * Convert.ToDouble(tbEohCredit.Text)).ToString();
                    }
                    
                    if (tbEohTotal.Text == "7")
                    {
                        tbEopTotal.Text = "0";
                    }
                    else if ((Convert.ToDouble(seEop.Value) * Convert.ToDouble(tbEopCredit.Text)) <= (7 - Convert.ToDouble(tbEohTotal.Text)))
                    {
                        tbEopTotal.Text = (Convert.ToDouble(seEop.Value) * Convert.ToDouble(tbEopCredit.Text)).ToString();
                    }
                    else
                    {
                        tbEopTotal.Text = (7 - Convert.ToDouble(tbEohTotal.Text)).ToString();
                    }

                    tbCmtApTotal.Text = (Convert.ToDouble(seCmtAp.Value) * Convert.ToDouble(tbCmtApCredit.Text)).ToString();
                    tbCmtCpTotal.Text = (Convert.ToDouble(seCmtCp.Value) * Convert.ToDouble(tbCmtCpCredit.Text)).ToString();
                    tbCmtBpTotal.Text = (Convert.ToDouble(seCmtBp.Value) * Convert.ToDouble(tbCmtCpCredit.Text)).ToString();
                    tbCmtTpTotal.Text = (Convert.ToDouble(seCmtTp.Value) * Convert.ToDouble(tbCmtTpCredit.Text)).ToString();

                    tbSatTotal.Text = (Convert.ToDouble(seSat.Value) * Convert.ToDouble(tbSatCredit.Text)).ToString();
                    tbSotTotal.Text = (Convert.ToDouble(seSot.Value) * Convert.ToDouble(tbSotCredit.Text)).ToString();

                    tbAllTotal.Text = (Convert.ToDouble(tbCmtTotal.Text) + Convert.ToDouble(tbEihTotal.Text)
                        + Convert.ToDouble(tbEipTotal.Text) + Convert.ToDouble(tbEohTotal.Text)
                        + Convert.ToDouble(tbEopTotal.Text) + Convert.ToDouble(tbCmtApTotal.Text)
                        + Convert.ToDouble(tbCmtCpTotal.Text) + Convert.ToDouble(tbCmtBpTotal.Text)
                        + Convert.ToDouble(tbCmtTpTotal.Text) + Convert.ToDouble(tbSatTotal.Text)
                        + Convert.ToDouble(tbSotTotal.Text)).ToString();
                }
                catch (Exception)
                {
                    AssessmentSystem.AcademicService x = new AssessmentSystem.AcademicService();

                    //x.UserName = Session["UserName"].ToString();
                    x.CommitteeProject = Convert.ToInt32(seCmtPro.Value);
                    x.ExpertInHours = Convert.ToInt32(seEih.Value);
                    x.ExpertInPracHours = Convert.ToInt32(seEip.Value);
                    x.ExpertOutHours = Convert.ToInt32(seEoh.Value);
                    x.ExpertOutPracHours = Convert.ToInt32(seEop.Value);
                    x.CommitteeAcPerson = Convert.ToInt32(seCmtAp.Value);
                    x.CommitteeCrPerson = Convert.ToInt32(seCmtCp.Value);
                    x.CommitteeBsPerson = Convert.ToInt32(seCmtBp.Value);
                    x.CommitteeThPerson = Convert.ToInt32(seCmtTp.Value);
                    x.ServiceAnalysisTimes = Convert.ToInt32(seSat.Value);
                    x.ServiceOtherTimes = Convert.ToInt32(seSot.Value);

                    db.AcademicServices.InsertOnSubmit(x);
                    db.SubmitChanges();
                }
            }
        }

        protected void btSubmit_Click(object sender, EventArgs e)
        {
            var q = (from p in db.AcademicServices
                     //where p.UserName == Session["UserName"].ToString() 
                     select p).First();

            q.CommitteeProject = Convert.ToInt32(seCmtPro.Value);
            q.ExpertInHours = Convert.ToInt32(seEih.Value);
            q.ExpertInPracHours = Convert.ToInt32(seEip.Value);
            q.ExpertOutHours = Convert.ToInt32(seEoh.Value);
            q.ExpertOutPracHours = Convert.ToInt32(seEop.Value);
            q.CommitteeAcPerson = Convert.ToInt32(seCmtAp.Value);
            q.CommitteeCrPerson = Convert.ToInt32(seCmtCp.Value);
            q.CommitteeBsPerson = Convert.ToInt32(seCmtBp.Value);
            q.CommitteeThPerson = Convert.ToInt32(seCmtTp.Value);
            q.ServiceAnalysisTimes = Convert.ToInt32(seSat.Value);
            q.ServiceOtherTimes = Convert.ToInt32(seSot.Value);

            db.SubmitChanges();

            StringBuilder sb = new StringBuilder();
            sb = new StringBuilder();
            sb.Append("<script language='javascript' type='text/javascript'>");
            sb.Append("alert('Success!!!')");
            sb.Append("</script>");
            Response.Write(sb.ToString());

            Response.Redirect("Academic.aspx");
        }
    }
}