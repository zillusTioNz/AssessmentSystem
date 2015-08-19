using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace AssessmentSystem.CalCarry.ArtCulture
{
    public partial class ArtandCulture : System.Web.UI.Page
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

        protected void gvCulture_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridViewColumnDataEventArgs e)
        {
            int proNumber = Convert.ToInt32(e.GetListSourceFieldValue("ProjectNumber"));
            double CarryCredit = 1.5;

            if (e.Column.FieldName == "CarryCredit")
            {
                e.Value = CarryCredit;
            }
            if (e.Column.FieldName == "Total")
            {
                e.Value = proNumber*CarryCredit;
            }
        }

        protected void gvCulture_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            var q = (from p in db.Documents
                     where p.Iden == Convert.ToInt32(e.Keys[0]) && p.TableNameID == 5
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
                x.Path = "~/CalCarry/ArtandCulture/ArtandCultureFiles/" + e.UploadedFile.FileName;
                x.Iden = Convert.ToInt32(Session["id"]);
                x.TableNameID = 5;
                x.FileName = e.UploadedFile.FileName;

                db.Documents.InsertOnSubmit(x);
                db.SubmitChanges();

                e.UploadedFile.SaveAs(Server.MapPath("~/CalCarry/ArtandCulture/ArtandCultureFiles/" + e.UploadedFile.FileName), true);
            }
        }
    }
}