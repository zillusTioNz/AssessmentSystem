using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentSystem.CalCarry.Administrative
{
    public partial class admpart2_2 : System.Web.UI.UserControl
    {
        AssessmentSystemDataContext db = new AssessmentSystemDataContext();

        public string LBtext
        {
            get { return lbText.Text; }
            set { lbText.Text = value; }
        }

        public decimal SEnumber
        {
            get { return seNumber.Number; }
            set { seNumber.Number = value; }
        }

        public string LBcredit
        {
            get { return lbCredit.Text; }
            set { lbCredit.Text = value; }
        }

        public string TBtotal
        {
            get { return tbTotal.Text; }
            set { tbTotal.Text = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            int credit = Convert.ToInt32(lbCredit.Text);
            int n = Convert.ToInt32(seNumber.Text);

            if (seNumber.Number > 0)
            {
                tbTotal.Text = ((n * credit) / 2).ToString();
            }
            else
            {
                tbTotal.Text = "0";
            }
        }

        protected void ASPxUploadControl1_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            if (e.IsValid)
            {
                Document x = new Document();
                x.Path = "~/CalCarry/Administrative/AdminFilesR2/" + e.UploadedFile.FileName;
                x.Iden = Convert.ToInt32(Session["id"]);
                x.TableNameID = 25;
                x.FileName = e.UploadedFile.FileName;

                db.Documents.InsertOnSubmit(x);
                db.SubmitChanges();

                e.UploadedFile.SaveAs(Server.MapPath("~/CalCarry/Administrative/AdminFilesR2/" + e.UploadedFile.FileName), true);
            }
        }

        protected void gvFileDetail_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            try
            {
                string path = gvFileDetail.GetRowValuesByKeyValue(e.Keys[0], "Path").ToString();
                File.Delete(Server.MapPath(path));
            }
            catch (Exception)
            {
            }
        }


    }
}