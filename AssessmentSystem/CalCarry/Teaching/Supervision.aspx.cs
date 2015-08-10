using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using AssessmentSystem.CalCarry.App_Code;
using DevExpress.Web;

namespace AssessmentSystem.CalCarry.Teaching
{
    public partial class Supervision : System.Web.UI.Page
    {
        const string UploadDirectory = "~/Documents/";
        const int ThumbnailSize = 100;
        static int i = 1;
        static StringWriter sw;
        static StringWriter sx;
        static XElement element;
        const string fileName = "test";
        AssessmentSystemDataContext db = new AssessmentSystemDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                i = 1;
                sw = new StringWriter();
                XDocument xDoc = new XDocument(
                        new XDeclaration("1.0", "UTF-16", null),
                        new XElement("FileUrls",
                                new XComment("For add file url")
                                ));
                xDoc.Save(sw);
                element = XElement.Parse(sw.ToString());
                Session["check"] = false;
            }

        }

        protected void gvSupervision_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridViewColumnDataEventArgs e)
        {
            double StdNumber = Convert.ToDouble(e.GetListSourceFieldValue("StdNumber"));
            double CarryCredit = 3.5;

            if (e.Column.FieldName == "CarryCredit")
            {
                e.Value = CarryCredit;
            }

            if (e.Column.FieldName == "CpW")
            {
                e.Value = StdNumber * CarryCredit;
            }

            //if (e.IsGetData)
            //{
            //    if (FileList[e.ListSourceRowIndex].FileName != String.Empty && FileList[e.ListSourceRowIndex].Url != String.Empty)
            //    {
            //        ASPxHyperLink hl = gvSupervision.FindRowCellTemplateControl(e.ListSourceRowIndex, (GridViewDataColumn)e.Column, "ASPxHyperLink") as ASPxHyperLink;
            //        hl.Text = FileList[e.ListSourceRowIndex].FileName;
            //        hl.NavigateUrl = FileList[e.ListSourceRowIndex].Url;
            //    }
            //}
        }

        //public List<MySavedObjects> FileList
        //{
        //    get
        //    {
        //        List<MySavedObjects> list = Session["list"] as List<MySavedObjects>;
        //        if (list == null)
        //        {
        //            list = new List<MySavedObjects>();
        //            for (int i = 0; i < gvSupervision.VisibleRowCount; i++)
        //            {
        //                list.Add(new MySavedObjects() { RowNumber = i });
        //            }
        //            Session["list"] = list;
        //        }
        //        return list;
        //    }
        //}

        protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            //if (e.IsValid)
            //{
            //    e.UploadedFile.SaveAs(Server.MapPath("~/Documents/" + e.UploadedFile.FileName), true);
            //    FileList[gvSupervision.EditingRowVisibleIndex].Url = Page.ResolveUrl("~/Documents/" + e.UploadedFile.FileName);
            //    FileList[gvSupervision.EditingRowVisibleIndex].FileName = e.UploadedFile.FileName;
            //    Session["list"] = FileList;
            //}

            if (Convert.ToBoolean(Session["check"]))
            {
                element = XElement.Parse(Session["xml"].ToString());
            }
            element.Add(new XElement("File",
                    new XElement("Url", UploadDirectory + "(" + fileName + "-" + i.ToString() + ")" + e.UploadedFile.FileName),
                    new XElement("Name", e.UploadedFile.FileName)
                    ));

            try
            {
                e.CallbackData = SavePostedFiles(e.UploadedFile);
                i++;
                Session["check"] = false;
            }
            catch (Exception ex)
            {
                e.IsValid = false;
                e.ErrorText = ex.Message;
            }
        }

        string SavePostedFiles(UploadedFile uploadedFile)
        {
            if (!uploadedFile.IsValid)
                return string.Empty;

            FileInfo fileInfo = new FileInfo(uploadedFile.FileName);
            string resFileName = MapPath(UploadDirectory) + "(" + fileName + "-" + i.ToString() + ")" + fileInfo.Name;
            uploadedFile.SaveAs(resFileName);

            string fileLabel = "(" + fileName + "-" + i.ToString() + ")" + fileInfo.Name;
            string fileLength = uploadedFile.ContentLength / 1024 + "K";
            return string.Format("{0} ({1})|{2}", fileLabel, fileLength, fileLabel);
        }

        protected void ASPxUploadControl1_FilesUploadComplete(object sender, FilesUploadCompleteEventArgs e)
        {
            if (!Convert.ToBoolean(Session["check"]))
            {
                sx = new StringWriter();
                element.Save(sx);
                Session["xml"] = sx.ToString();
            }
        }

        protected void gvSupervision_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            var q = (from p in db.Supervisions
                where p.id == Convert.ToInt32(gvSupervision.GetRowValues(gvSupervision.EditingRowVisibleIndex, gvSupervision.KeyFieldName))
                select p).First();

            q.Refer = Session["xml"].ToString();

            db.SubmitChanges();
        }
    }
}