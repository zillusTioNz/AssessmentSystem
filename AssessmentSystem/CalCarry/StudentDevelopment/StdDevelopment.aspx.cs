using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

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
                             //where p.UserName == Session["UserName"].ToString();
                        select p).First();

                    Session["id"] = q.id;
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
                    //x.UserName = Session["userName"].ToString();

                    db.StdDevelopments.InsertOnSubmit(x);
                    db.SubmitChanges();
                }
            }
        }

        protected void btSubmit_Click(object sender, EventArgs e)
        {
            var q = (from p in db.StdDevelopments
                     //where p.UserName == Session["UserName"].ToString()
                    select p).First();

            q.CommitteeProject = Convert.ToInt32(seCmtPro.Value);
            q.AdvisorStdProject = Convert.ToInt32(seAsp.Value);
            q.AdvisorClubProject = Convert.ToInt32(seAcp.Value);

            db.SubmitChanges();

            //StringBuilder sb = new StringBuilder();
            //sb = new StringBuilder();
            //sb.Append("<script language='javascript' type='text/javascript'>");
            //sb.Append("alert('Success!!!')");
            //sb.Append("</script>");
            //Response.Write(sb.ToString());

            Response.Redirect("StdDevelopment.aspx");
        }

        protected void gvFileDetail1_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            try
            {
                string path = gvFileDetail1.GetRowValuesByKeyValue(e.Keys[0], "Path").ToString();
                File.Delete(Server.MapPath(path));
            }
            catch (Exception)
            {
            }
        }

        protected void ASPxUploadControl2_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            if (e.IsValid)
            {
                Document x = new Document();
                x.Path = "~/CalCarry/StudentDevelopment/R2Files/" + e.UploadedFile.FileName;
                x.Iden = Convert.ToInt32(Session["id"]);
                x.TableNameID = 13;
                x.FileName = e.UploadedFile.FileName;

                db.Documents.InsertOnSubmit(x);
                db.SubmitChanges();

                e.UploadedFile.SaveAs(Server.MapPath("~/CalCarry/StudentDevelopment/R2Files/" + e.UploadedFile.FileName), true);
            }
        }

        protected void ASPxUploadControl3_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            if (e.IsValid)
            {
                Document x = new Document();
                x.Path = "~/CalCarry/StudentDevelopment/R3Files/" + e.UploadedFile.FileName;
                x.Iden = Convert.ToInt32(Session["id"]);
                x.TableNameID = 14;
                x.FileName = e.UploadedFile.FileName;

                db.Documents.InsertOnSubmit(x);
                db.SubmitChanges();

                e.UploadedFile.SaveAs(Server.MapPath("~/CalCarry/StudentDevelopment/R3Files/" + e.UploadedFile.FileName), true);
            }
        }

        protected void gvFileDetail3_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            try
            {
                string path = gvFileDetail3.GetRowValuesByKeyValue(e.Keys[0], "Path").ToString();
                File.Delete(Server.MapPath(path));
            }
            catch (Exception)
            {
            }
        }

        protected void ASPxUploadControl4_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            if (e.IsValid)
            {
                Document x = new Document();
                x.Path = "~/CalCarry/StudentDevelopment/R1Files/" + e.UploadedFile.FileName;
                x.Iden = Convert.ToInt32(Session["id"]);
                x.TableNameID = 9;
                x.FileName = e.UploadedFile.FileName;

                db.Documents.InsertOnSubmit(x);
                db.SubmitChanges();

                e.UploadedFile.SaveAs(Server.MapPath("~/CalCarry/StudentDevelopment/R1Files/" + e.UploadedFile.FileName), true);
            }
        }

        protected void gvFileDetail2_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            try
            {
                string path = gvFileDetail2.GetRowValuesByKeyValue(e.Keys[0], "Path").ToString();
                File.Delete(Server.MapPath(path));
            }
            catch (Exception)
            {
            }
        }


    }
}