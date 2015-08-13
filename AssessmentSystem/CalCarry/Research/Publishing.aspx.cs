using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace AssessmentSystem.CalCarry.Thesis
{
    public partial class Publishing : System.Web.UI.Page
    {
        AssessmentSystemDataContext db = new AssessmentSystemDataContext();

        SqlConnection objConn = new SqlConnection();
        String strConnString, strSQL;
        SqlDataAdapter dtAdapter;
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        private int i = 0;
        static int id;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void gvResearchPublish_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridViewColumnDataEventArgs e)
        {
            if (e.Column.FieldName == "CpW")
            {
                strConnString = WebConfigurationManager.ConnectionStrings["AssessmentSystem"].ConnectionString;
                objConn = new SqlConnection(strConnString);
                objConn.Open();

                int resStatus = Convert.ToInt32(e.GetListSourceFieldValue("ResStatusID"));
                int resType = Convert.ToInt32(e.GetListSourceFieldValue("ResTypeID"));
                
                try
                {
                    id = Convert.ToInt32(e.GetListSourceFieldValue("ResNumber"));
                }
                catch (Exception)
                {

                }

                strSQL = "SELECT * FROM Research WHERE id = '" + id + "'";
                dtAdapter = new SqlDataAdapter(strSQL, objConn);
                dtAdapter.Fill(dt);

                if (resStatus == 1 && id != null)
                {
                    if (dt.Rows.Count > 0)
                    {
                        int proStatus = Convert.ToInt32(dt.Rows[i]["ProfessorStatusID"]);
                        int round = Convert.ToInt32(dt.Rows[i]["RoundID"]);
                        int percent = Convert.ToInt32(dt.Rows[i]["Percentage"]);

                        double head = 10.5;
                        double sub = 1.75;
                        double tmp = 0;
                        
                        if (round == 1 || round == 2)
                        {
                            if (proStatus == 1)
                            {
                                if (percent >= 75)
                                {
                                    tmp = head + 7;
                                }
                                else if (percent <= 74 && percent >= 51)
                                {
                                    tmp = head + 5.25;
                                }
                                else if (percent <= 50 && percent >= 25)
                                {
                                    tmp = head + 3.5;
                                }
                                else
                                {
                                    tmp = head + sub;
                                }
                            }
                            else
                            {
                                if (percent >= 75)
                                {
                                    tmp = 7;
                                }
                                else if (percent <= 74 && percent >= 51)
                                {
                                    tmp = 5.25;
                                }
                                else if (percent <= 50 && percent >= 25)
                                {
                                    tmp = 3.5;
                                }
                                else
                                {
                                    tmp = sub;
                                }
                            }

                            if (resType == 1)
                            {
                                e.Value = tmp * 0.5;
                            }
                            else
                            {
                                e.Value = tmp;
                            }
                        }
                    }
                    i++;
                }
                else
                {
                    if (resType == 1)
                    {
                        e.Value = 3.5;
                    }
                    else
                    {
                        e.Value = 7;
                    }
                }

                
            }
        }

        protected void gvResearchPublish_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            var q = (from p in db.Documents
                     where p.Iden == Convert.ToInt32(e.Keys[0]) && p.TableNameID == 8
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
                x.Path = "~/CalCarry/Research/PublishingFiles/" + e.UploadedFile.FileName;
                x.Iden = Convert.ToInt32(Session["id"]);
                x.TableNameID = 8;
                x.FileName = e.UploadedFile.FileName;

                db.Documents.InsertOnSubmit(x);
                db.SubmitChanges();

                e.UploadedFile.SaveAs(Server.MapPath("~/CalCarry/Research/PublishingFiles/" + e.UploadedFile.FileName), true);
            }
        }
    }
}
