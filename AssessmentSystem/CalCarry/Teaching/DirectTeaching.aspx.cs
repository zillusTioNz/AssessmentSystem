using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentSystem.CalCarry.Teaching
{
    public partial class DirectTeaching : System.Web.UI.Page
    {
        static public double theoResult;
        static public double pracResult;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null && Session["DurationID"] == null)
            {
                FormsAuthentication.SignOut();
                Response.Redirect("~/Account/Login.aspx");
            }
        }

        protected void gvDirectTeaching_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridViewColumnDataEventArgs e)
        {
            int StdNumber = Convert.ToInt32(e.GetListSourceFieldValue("StdNumber"));
            double result = 0;

            if (e.Column.FieldName == "TheoryCpW"){
                
                if (StdNumber >= 101){
                    result = 6.5F;
	            }else if (StdNumber <= 100 && StdNumber >= 71){
                    result = 5.5F;
	            }else if (StdNumber <= 70 && StdNumber >= 41){
                    result = 4.5F;
                }else if (StdNumber <= 40 && StdNumber > 0){
                    result = 3.5F;
                }
                theoResult = result;
                e.Value = result;
            }

            if (e.Column.FieldName == "PracticeCpW")
            {
                if (StdNumber>0)
                {
                    result = 1.75F;
                }
                pracResult = result;
                e.Value = result;
            }

            if (e.Column.FieldName == "TotalinRow")
            {

                int theoryCredit = Convert.ToInt32(e.GetListSourceFieldValue("TheoryCredit"));
                int practiceCredit = Convert.ToInt32(e.GetListSourceFieldValue("PracticeCredit"));
                int theoryWeek = Convert.ToInt32(e.GetListSourceFieldValue("TheoryWeek"));
                int practiceWeek = Convert.ToInt32(e.GetListSourceFieldValue("PracticeWeek"));

                double tmpMultiTheo = (theoryWeek * (theoResult * theoryCredit)) / 15;
                double tmpMultiPrac = (practiceWeek * (pracResult * practiceCredit)) / 15;

                string str = String.Format("{0:F2}", tmpMultiTheo + tmpMultiPrac);
                e.Value = str;
                
            }

        }
    }
}