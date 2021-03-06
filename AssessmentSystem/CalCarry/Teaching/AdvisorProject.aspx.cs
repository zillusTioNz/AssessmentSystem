﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace AssessmentSystem.CalCarry.Teaching
{
    public partial class AdvisorBachelor : System.Web.UI.Page
    {
        AssessmentSystemDataContext db = new AssessmentSystemDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvAdvisorProject_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridViewColumnDataEventArgs e)
        {
            int status = Convert.ToInt32(e.GetListSourceFieldValue("StatusID"));

            if (e.Column.FieldName == "CpW")
            {
                if (status == 0)
                {
                    e.Value = 3;
                }
                else
                {
                    e.Value = 1.5;
                }
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

        protected void gvAdvisorProject_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            var q = (from p in db.Documents
                     where p.Iden == Convert.ToInt32(e.Keys[0]) && p.TableNameID == 3
                     select p).ToArray();

            foreach (var item in q)
            {
                File.Delete(Server.MapPath(item.Path));
            }
        }

        protected void ASPxUploadControl1_FileUploadComplete1(object sender, FileUploadCompleteEventArgs e)
        {
            if (e.IsValid)
            {
                Document x = new Document();
                x.Path = "~/CalCarry/Teaching/AdvisorProjectFiles/" + e.UploadedFile.FileName;
                x.Iden = Convert.ToInt32(Session["id"]);
                x.TableNameID = 3;
                x.FileName = e.UploadedFile.FileName;

                db.Documents.InsertOnSubmit(x);
                db.SubmitChanges();

                e.UploadedFile.SaveAs(Server.MapPath("~/CalCarry/Teaching/AdvisorProjectFiles/" + e.UploadedFile.FileName), true);
            }
        }
    }
}