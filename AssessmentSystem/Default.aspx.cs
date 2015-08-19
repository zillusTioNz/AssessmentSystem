using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentSystem
{
    public partial class Default : System.Web.UI.Page
    {
        AssessmentSystemDataContext db = new AssessmentSystemDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Membership.ValidateUser(tbUserName.Text, tbPassword.Text))
            {
                if (string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
                {
                    FormsAuthentication.SetAuthCookie(tbUserName.Text, false);
                    Session["UserName"] = tbUserName.Text;

                    DateTime dt = DateTime.Now.Date;
                    var q = (from p in db.Durations
                            where dt.Date >= p.StartDate && dt.Date <= p.EndDate 
                            select p).First();
                    Session["DurationID"] = q.DurationID;

                    Response.Redirect("~/Index.aspx");

                    //string[] roles = Roles.GetRolesForUser(Session["UserName"].ToString());
                    //for (int i = 0; i < 3; i++)
                    //{
                    //    if (roles[i] == "Admin")
                    //    {
                    //        Response.Redirect("~/Admin/Default.aspx");
                    //    }
                    //    if (roles[i] == "Quota")
                    //    {
                    //        Response.Redirect("~/Quota/Default.aspx");
                    //    }
                    //    if (roles[i] == "Employee")
                    //    {
                    //        Response.Redirect("~/Emp/Default.aspx");
                    //    }
                    //}
                }
                else
                    FormsAuthentication.RedirectFromLoginPage(tbUserName.Text, false);
            }
            else
            {
                tbUserName.ErrorText = "Invalid user";
                tbUserName.IsValid = false;
            }
        }
    }
}