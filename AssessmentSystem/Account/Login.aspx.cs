using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace AssessmentSystem {
    public partial class Login : System.Web.UI.Page {
        AssessmentSystemDataContext db = new AssessmentSystemDataContext();
        protected void Page_Load(object sender, EventArgs e) {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e) {
            if (Membership.ValidateUser(tbUserName.Text, tbPassword.Text)) {
                if(string.IsNullOrEmpty(Request.QueryString["ReturnUrl"])) {
                    FormsAuthentication.SetAuthCookie(tbUserName.Text, false);
                    Session["UserName"] = tbUserName.Text;
                    DateTime dt = DateTime.Now.Date;
                    var q = (from p in db.Durations
                             where dt.Date >= p.StartDate && dt.Date <= p.EndDate
                             select p).First();
                    Session["DurationID"] = q.DurationID;
                    Response.Redirect("~/Index.aspx");
                }
                else
                    FormsAuthentication.RedirectFromLoginPage(tbUserName.Text, false);
            }
            else {
                tbUserName.ErrorText = "Invalid user";
                tbUserName.IsValid = false;
            }
        }
    }
}