using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using DevExpress.Web;
using DevExpress.XtraSpreadsheet;

namespace AssessmentSystem.CalCarry.Teaching
{
    public partial class SupervisionFV : System.Web.UI.Page
    {
        private static int j;
        private static List<ASPxHyperLink> file = new List<ASPxHyperLink>();
        static List<ASPxCheckBox> cb = new List<ASPxCheckBox>();
        static List<string> url = new List<string>();

        AssessmentSystemDataContext db = new AssessmentSystemDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            //ASPxLabel1.Text = Request.QueryString["id"].ToString();
            if (!Page.IsPostBack)
            {
                try
                {
                    cb.Clear();
                    url.Clear();

                    XElement x = XElement.Parse(GetXML());
                    IEnumerable<XElement> files = x.Elements();
                    j = 0;

                    foreach (var item in files)
                    {
                        //file = new ASPxHyperLink();
                        //file.ID = "file" + j.ToString();
                        //file.Target = "_blank";
                        //file.Text = item.Element("Name").Value;
                        //file.NavigateUrl = item.Element("Url").Value;
                        file.Add(new ASPxHyperLink()
                        {
                            ID = "file" + j.ToString(),
                            Target = "_blank",
                            Text = item.Element("Name").Value,
                            NavigateUrl = item.Element("Url").Value
                        });

                        url.Add(item.Element("Url").Value);

                        cb.Add(new ASPxCheckBox()
                        {
                            ID = "cb" + j.ToString(),
                            Text = "ลบไฟล์ที่" + (j + 1).ToString()
                        });

                        Panel1.Controls.Add(file[j]);
                        Panel1.Controls.Add(cb[j]);
                        Panel1.Controls.Add(new LiteralControl("<br>"));

                        j++;

                    }
                }
                catch (Exception)
                {

                }
            }
            
        }

        protected void btSubmit_Click(object sender, EventArgs e)
        {
            XDocument doc = new XDocument(GetXML());
        }

        public string GetXML()
        {
            var q = (from p in db.Supervisions
                     where p.id == Convert.ToInt32(Request.QueryString["id"])
                     select p).First();

            return q.Refer;
        }
    }
}