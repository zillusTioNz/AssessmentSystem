using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentSystem.CalCarry.Teaching
{
    public partial class Supervision : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
        }
    }
}