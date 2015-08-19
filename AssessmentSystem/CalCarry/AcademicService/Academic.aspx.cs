using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentSystem.CalCarry.AcademicService
{
    public partial class Academic : System.Web.UI.Page
    {
        AssessmentSystemDataContext db = new AssessmentSystemDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null && Session["DurationID"] == null)
            {
                FormsAuthentication.SignOut();
                Response.Redirect("~/Account/Login.aspx");
            }
            if (!Page.IsPostBack)
            {
                try
                {
                    Calculating();
                }
                catch (Exception)
                {
                    AssessmentSystem.AcademicService x = new AssessmentSystem.AcademicService();

                    x.UserName = Session["UserName"].ToString();
                    x.DurationID = Convert.ToInt32(Session["DurationID"]);
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
                     where p.UserName == Session["UserName"].ToString() && p.DurationID == Convert.ToInt32(Session["DurationID"])
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

            Response.Redirect("Academic.aspx");
        }

        public void Calculating()
        {
            var q = (from p in db.AcademicServices
                     where p.UserName == Session["UserName"].ToString() && p.DurationID == Convert.ToInt32(Session["DurationID"])
                     select p).First(); seCmtPro.Value = q.CommitteeProject;

            Session["id"] = q.id;
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

            tbCmtTotal.Text = (Convert.ToDouble(seCmtPro.Value) * Convert.ToDouble(tbCmtCredit.Text)).ToString();
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

            Total();
        }

        public void Total()
        {
            tbAllTotal.Text = (Convert.ToDouble(tbCmtTotal.Text) + Convert.ToDouble(tbEihTotal.Text)
                + Convert.ToDouble(tbEipTotal.Text) + Convert.ToDouble(tbEohTotal.Text)
                + Convert.ToDouble(tbEopTotal.Text) + Convert.ToDouble(tbCmtApTotal.Text)
                + Convert.ToDouble(tbCmtCpTotal.Text) + Convert.ToDouble(tbCmtBpTotal.Text)
                + Convert.ToDouble(tbCmtTpTotal.Text) + Convert.ToDouble(tbSatTotal.Text)
                + Convert.ToDouble(tbSotTotal.Text)).ToString();
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

        protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            if (e.IsValid)
            {
                Document x = new Document();
                x.Path = "~/CalCarry/AcademicService/Files/R1/" + e.UploadedFile.FileName;
                x.Iden = Convert.ToInt32(Session["id"]);
                x.TableNameID = 1;
                x.FileName = e.UploadedFile.FileName;

                db.Documents.InsertOnSubmit(x);
                db.SubmitChanges();

                e.UploadedFile.SaveAs(Server.MapPath("~/CalCarry/AcademicService/Files/R1/" + e.UploadedFile.FileName), true);
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

        protected void ASPxUploadControl2_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            if (e.IsValid)
            {
                Document x = new Document();
                x.Path = "~/CalCarry/AcademicService/Files/R2/" + e.UploadedFile.FileName;
                x.Iden = Convert.ToInt32(Session["id"]);
                x.TableNameID = 15;
                x.FileName = e.UploadedFile.FileName;

                db.Documents.InsertOnSubmit(x);
                db.SubmitChanges();

                e.UploadedFile.SaveAs(Server.MapPath("~/CalCarry/AcademicService/Files/R2/" + e.UploadedFile.FileName), true);
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

        protected void ASPxUploadControl3_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            if (e.IsValid)
            {
                Document x = new Document();
                x.Path = "~/CalCarry/AcademicService/Files/R3/" + e.UploadedFile.FileName;
                x.Iden = Convert.ToInt32(Session["id"]);
                x.TableNameID = 16;
                x.FileName = e.UploadedFile.FileName;

                db.Documents.InsertOnSubmit(x);
                db.SubmitChanges();

                e.UploadedFile.SaveAs(Server.MapPath("~/CalCarry/AcademicService/Files/R3/" + e.UploadedFile.FileName), true);
            }
        }

        protected void gvFileDetail4_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            try
            {
                string path = gvFileDetail4.GetRowValuesByKeyValue(e.Keys[0], "Path").ToString();
                File.Delete(Server.MapPath(path));
            }
            catch (Exception)
            {
            }
        }

        protected void ASPxUploadControl4_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            if (e.IsValid)
            {
                Document x = new Document();
                x.Path = "~/CalCarry/AcademicService/Files/R4/" + e.UploadedFile.FileName;
                x.Iden = Convert.ToInt32(Session["id"]);
                x.TableNameID = 17;
                x.FileName = e.UploadedFile.FileName;

                db.Documents.InsertOnSubmit(x);
                db.SubmitChanges();

                e.UploadedFile.SaveAs(Server.MapPath("~/CalCarry/AcademicService/Files/R4/" + e.UploadedFile.FileName), true);
            }
        }

        protected void gvFileDetail5_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            try
            {
                string path = gvFileDetail5.GetRowValuesByKeyValue(e.Keys[0], "Path").ToString();
                File.Delete(Server.MapPath(path));
            }
            catch (Exception)
            {
            }
        }

        protected void ASPxUploadControl5_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            if (e.IsValid)
            {
                Document x = new Document();
                x.Path = "~/CalCarry/AcademicService/Files/R5/" + e.UploadedFile.FileName;
                x.Iden = Convert.ToInt32(Session["id"]);
                x.TableNameID = 18;
                x.FileName = e.UploadedFile.FileName;

                db.Documents.InsertOnSubmit(x);
                db.SubmitChanges();

                e.UploadedFile.SaveAs(Server.MapPath("~/CalCarry/AcademicService/Files/R5/" + e.UploadedFile.FileName), true);
            }
        }

        protected void gvFileDetail6_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            try
            {
                string path = gvFileDetail6.GetRowValuesByKeyValue(e.Keys[0], "Path").ToString();
                File.Delete(Server.MapPath(path));
            }
            catch (Exception)
            {
            }
        }

        protected void ASPxUploadControl6_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            if (e.IsValid)
            {
                Document x = new Document();
                x.Path = "~/CalCarry/AcademicService/Files/R6/" + e.UploadedFile.FileName;
                x.Iden = Convert.ToInt32(Session["id"]);
                x.TableNameID = 19;
                x.FileName = e.UploadedFile.FileName;

                db.Documents.InsertOnSubmit(x);
                db.SubmitChanges();

                e.UploadedFile.SaveAs(Server.MapPath("~/CalCarry/AcademicService/Files/R6/" + e.UploadedFile.FileName), true);
            }
        }

        protected void gvFileDetail7_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            try
            {
                string path = gvFileDetail7.GetRowValuesByKeyValue(e.Keys[0], "Path").ToString();
                File.Delete(Server.MapPath(path));
            }
            catch (Exception)
            {
            }
        }

        protected void ASPxUploadControl7_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            if (e.IsValid)
            {
                Document x = new Document();
                x.Path = "~/CalCarry/AcademicService/Files/R7/" + e.UploadedFile.FileName;
                x.Iden = Convert.ToInt32(Session["id"]);
                x.TableNameID = 20;
                x.FileName = e.UploadedFile.FileName;

                db.Documents.InsertOnSubmit(x);
                db.SubmitChanges();

                e.UploadedFile.SaveAs(Server.MapPath("~/CalCarry/AcademicService/Files/R7/" + e.UploadedFile.FileName), true);
            }
        }

        protected void gvFileDetail8_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            try
            {
                string path = gvFileDetail8.GetRowValuesByKeyValue(e.Keys[0], "Path").ToString();
                File.Delete(Server.MapPath(path));
            }
            catch (Exception)
            {
            }
        }

        protected void ASPxUploadControl8_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            if (e.IsValid)
            {
                Document x = new Document();
                x.Path = "~/CalCarry/AcademicService/Files/R8/" + e.UploadedFile.FileName;
                x.Iden = Convert.ToInt32(Session["id"]);
                x.TableNameID = 21;
                x.FileName = e.UploadedFile.FileName;

                db.Documents.InsertOnSubmit(x);
                db.SubmitChanges();

                e.UploadedFile.SaveAs(Server.MapPath("~/CalCarry/AcademicService/Files/R8/" + e.UploadedFile.FileName), true);
            }
        }

        protected void gvFileDetail9_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            try
            {
                string path = gvFileDetail9.GetRowValuesByKeyValue(e.Keys[0], "Path").ToString();
                File.Delete(Server.MapPath(path));
            }
            catch (Exception)
            {
            }
        }

        protected void ASPxUploadControl9_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            if (e.IsValid)
            {
                Document x = new Document();
                x.Path = "~/CalCarry/AcademicService/Files/R9/" + e.UploadedFile.FileName;
                x.Iden = Convert.ToInt32(Session["id"]);
                x.TableNameID = 22;
                x.FileName = e.UploadedFile.FileName;

                db.Documents.InsertOnSubmit(x);
                db.SubmitChanges();

                e.UploadedFile.SaveAs(Server.MapPath("~/CalCarry/AcademicService/Files/R9/" + e.UploadedFile.FileName), true);
            }
        }

        protected void gvFileDetail10_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            try
            {
                string path = gvFileDetail10.GetRowValuesByKeyValue(e.Keys[0], "Path").ToString();
                File.Delete(Server.MapPath(path));
            }
            catch (Exception)
            {
            }
        }

        protected void ASPxUploadControl10_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            if (e.IsValid)
            {
                Document x = new Document();
                x.Path = "~/CalCarry/AcademicService/Files/R10/" + e.UploadedFile.FileName;
                x.Iden = Convert.ToInt32(Session["id"]);
                x.TableNameID = 23;
                x.FileName = e.UploadedFile.FileName;

                db.Documents.InsertOnSubmit(x);
                db.SubmitChanges();

                e.UploadedFile.SaveAs(Server.MapPath("~/CalCarry/AcademicService/Files/R10/" + e.UploadedFile.FileName), true);
            }
        }

        protected void gvFileDetail11_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            try
            {
                string path = gvFileDetail11.GetRowValuesByKeyValue(e.Keys[0], "Path").ToString();
                File.Delete(Server.MapPath(path));
            }
            catch (Exception)
            {
            }
        }

        protected void ASPxUploadControl11_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            if (e.IsValid)
            {
                Document x = new Document();
                x.Path = "~/CalCarry/AcademicService/Files/R11/" + e.UploadedFile.FileName;
                x.Iden = Convert.ToInt32(Session["id"]);
                x.TableNameID = 24;
                x.FileName = e.UploadedFile.FileName;

                db.Documents.InsertOnSubmit(x);
                db.SubmitChanges();

                e.UploadedFile.SaveAs(Server.MapPath("~/CalCarry/AcademicService/Files/R11/" + e.UploadedFile.FileName), true);
            }
        }

        protected void seCmtPro_NumberChanged(object sender, EventArgs e)
        {
            tbCmtTotal.Text = (Convert.ToDouble(seCmtPro.Value) * Convert.ToDouble(tbCmtCredit.Text)).ToString();
            Total();
        }

        protected void seEih_NumberChanged(object sender, EventArgs e)
        {
            tbEihTotal.Text = (Convert.ToDouble(seEih.Value) * Convert.ToDouble(tbEihCredit.Text)).ToString();
            Total();
        }

        protected void seEip_NumberChanged(object sender, EventArgs e)
        {
            tbEipTotal.Text = (Convert.ToDouble(seEip.Value) * Convert.ToDouble(tbEipCredit.Text)).ToString();
            Total();
        }

        protected void seEoh_NumberChanged(object sender, EventArgs e)
        {
            if (Convert.ToDouble(seEoh.Value) * Convert.ToDouble(tbEohCredit.Text) >= 7)
            {
                tbEohTotal.Text = "7";
            }
            else
            {
                tbEohTotal.Text = (Convert.ToDouble(seEoh.Value) * Convert.ToDouble(tbEohCredit.Text)).ToString();
            }
            Total();
        }

        protected void seEop_NumberChanged(object sender, EventArgs e)
        {
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
            Total();
        }

        protected void seCmtAp_NumberChanged(object sender, EventArgs e)
        {
            tbCmtApTotal.Text = (Convert.ToDouble(seCmtAp.Value) * Convert.ToDouble(tbCmtApCredit.Text)).ToString();
            Total();
        }

        protected void seCmtCp_NumberChanged(object sender, EventArgs e)
        {
            tbCmtCpTotal.Text = (Convert.ToDouble(seCmtCp.Value) * Convert.ToDouble(tbCmtCpCredit.Text)).ToString();
            Total();
        }

        protected void seCmtBp_NumberChanged(object sender, EventArgs e)
        {
            tbCmtBpTotal.Text = (Convert.ToDouble(seCmtBp.Value) * Convert.ToDouble(tbCmtCpCredit.Text)).ToString();
            Total();
        }

        protected void seCmtTp_NumberChanged(object sender, EventArgs e)
        {
            tbCmtTpTotal.Text = (Convert.ToDouble(seCmtTp.Value) * Convert.ToDouble(tbCmtTpCredit.Text)).ToString();
            Total();
        }

        protected void seSat_NumberChanged(object sender, EventArgs e)
        {
            tbSatTotal.Text = (Convert.ToDouble(seSat.Value) * Convert.ToDouble(tbSatCredit.Text)).ToString();
            Total();
        }

        protected void seSot_NumberChanged(object sender, EventArgs e)
        {
            tbSotTotal.Text = (Convert.ToDouble(seSot.Value) * Convert.ToDouble(tbSotCredit.Text)).ToString();
            Total();
        }
    }
}