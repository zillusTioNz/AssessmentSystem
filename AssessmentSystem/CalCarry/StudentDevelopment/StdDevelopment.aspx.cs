using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentSystem.CalCarry.StudentDevelopment
{
    public partial class StdDevelopment : System.Web.UI.Page
    {
        AssessmentSystemDataContext db = new AssessmentSystemDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    var q = (from p in db.StdDevelopments
                        select p).First();

                    seCmtPro.Value = q.CommitteeProject;
                    seAsp.Value = q.AdvisorStdProject;
                    seAcp.Value = q.AdvisorClubProject;

                    tbCmtProTotal.Text = (Convert.ToDouble(seCmtPro.Value)*Convert.ToDouble(tbCmtProCredit.Text)).ToString();
                    tbAspTotal.Text = (Convert.ToDouble(seAsp.Value) * Convert.ToDouble(tbAspCredit.Text)).ToString();
                    tbAcpTotal.Text = (Convert.ToDouble(seAcp.Value) * Convert.ToDouble(tbAcpCredit.Text)).ToString();
                    tbAllTotal.Text = (Convert.ToDouble(tbCmtProTotal.Text)+Convert.ToDouble(tbAspTotal.Text)
                        +Convert.ToDouble(tbAcpTotal.Text)).ToString();
                }
                catch (Exception)
                {
                    AssessmentSystem.StdDevelopment x = new AssessmentSystem.StdDevelopment();

                    x.CommitteeProject = Convert.ToInt32(seCmtPro.Value);
                    x.AdvisorStdProject = Convert.ToInt32(seAsp.Value);
                    x.AdvisorClubProject = Convert.ToInt32(seAcp.Value);

                    db.StdDevelopments.InsertOnSubmit(x);
                    db.SubmitChanges();
                }
            }
        }

        protected void btSubmit_Click(object sender, EventArgs e)
        {
            var q = (from p in db.StdDevelopments
                    select p).First();

            q.CommitteeProject = Convert.ToInt32(seCmtPro.Value);
            q.AdvisorStdProject = Convert.ToInt32(seAsp.Value);
            q.AdvisorClubProject = Convert.ToInt32(seAcp.Value);

            db.SubmitChanges();

            StringBuilder sb = new StringBuilder();
            sb = new StringBuilder();
            sb.Append("<script language='javascript' type='text/javascript'>");
            sb.Append("alert('Success!!!')");
            sb.Append("</script>");
            Response.Write(sb.ToString());

            Response.Redirect("StdDevelopment.aspx");
        }
    }
}