using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace AssessmentSystem.CalCarry.Teaching
{
    public partial class CommitteeThesis : System.Web.UI.Page
    {
        AssessmentSystemDataContext db = new AssessmentSystemDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null && Session["DurationID"] == null)
            {
                FormsAuthentication.SignOut();
                Response.Redirect("~/Account/Login.aspx");
            }
        }

        protected void gvTesterThesis_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridViewColumnDataEventArgs e)
        {

            if (e.Column.FieldName == "CpW")
            {
                e.Value = 1.5;
            }
        }

        protected void gvTesterThesis_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            var q = (from p in db.Documents
                     where p.Iden == Convert.ToInt32(e.Keys[0]) && p.TableNameID == 12
                     select p).ToArray();

            foreach (var item in q)
            {
                File.Delete(Server.MapPath(item.Path));
            }
        }

        protected void gvFileDetail_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["id"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void gvFileDetail_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            try
            {
                ASPxGridView gvFileDetail = sender as ASPxGridView;
                string path = gvFileDetail.GetRowValuesByKeyValue(e.Keys[0], "Path").ToString();

                File.Delete(Server.MapPath(path));
            }
            catch (Exception)
            {
            }
        }

        protected void ASPxUploadControl1_FileUploadComplete1(object sender, FileUploadCompleteEventArgs e)
        {
            if (e.IsValid)
            {
                Document x = new Document();
                x.Path = "~/CalCarry/Teaching/CommitteeThesisFiles/" + e.UploadedFile.FileName;
                x.Iden = Convert.ToInt32(Session["id"]);
                x.TableNameID = 12;
                x.FileName = e.UploadedFile.FileName;

                db.Documents.InsertOnSubmit(x);
                db.SubmitChanges();

                e.UploadedFile.SaveAs(Server.MapPath("~/CalCarry/Teaching/CommitteeThesisFiles/" + e.UploadedFile.FileName), true);
            }
        }
    }
}