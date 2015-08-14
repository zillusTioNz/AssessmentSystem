using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace AssessmentSystem.CalCarry.Thesis
{
    public partial class Topics : System.Web.UI.Page
    {
        AssessmentSystemDataContext db = new AssessmentSystemDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvResearch_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridViewColumnDataEventArgs e)
        {
            int proStatus = Convert.ToInt32(e.GetListSourceFieldValue("ProfessorStatusID"));
            int round = Convert.ToInt32(e.GetListSourceFieldValue("RoundID"));
            int percent = Convert.ToInt32(e.GetListSourceFieldValue("Percentage"));
            double head = 10.5;
            double sub = 1.75;

            if (e.Column.FieldName == "ResCredit")
            {
                if (round == 1)
                {
                    if (proStatus == 1)
                    {
                        if (percent >= 75)
                        {
                            e.Value = head + 7;
                        }
                        else if (percent <= 74 && percent >= 51)
                        {
                            e.Value = head + 5.25;
                        }
                        else if (percent <= 50 && percent >= 25)
                        {
                            e.Value = head + 3.5;
                        }
                        else
                        {
                            e.Value = head + sub;
                        }
                    }
                    else
                    {
                        if (percent >= 75)
                        {
                            e.Value = 7;
                        }
                        else if (percent <= 74 && percent >= 51)
                        {
                            e.Value = 5.25;
                        }
                        else if (percent <= 50 && percent >= 25)
                        {
                            e.Value = 3.5;
                        }
                        else
                        {
                            e.Value = sub;
                        }
                    }
                }
            }
        }

        protected void gvResearch_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            var q = (from p in db.Documents
                     where p.Iden == Convert.ToInt32(e.Keys[0]) && p.TableNameID == 7
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
                x.Path = "~/CalCarry/Research/TopicFiles/" + e.UploadedFile.FileName;
                x.Iden = Convert.ToInt32(Session["id"]);
                x.TableNameID = 7;
                x.FileName = e.UploadedFile.FileName;

                db.Documents.InsertOnSubmit(x);
                db.SubmitChanges();

                e.UploadedFile.SaveAs(Server.MapPath("~/CalCarry/Research/TopicFiles/" + e.UploadedFile.FileName), true);
            }
        }
    }
}