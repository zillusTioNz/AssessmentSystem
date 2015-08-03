using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentSystem.CalCarry.Teaching
{
    public partial class AdvisorBachelor : System.Web.UI.Page
    {
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
    }
}