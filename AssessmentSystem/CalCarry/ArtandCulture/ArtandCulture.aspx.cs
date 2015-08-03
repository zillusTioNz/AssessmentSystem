using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentSystem.CalCarry.ArtCulture
{
    public partial class ArtandCulture : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvCulture_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridViewColumnDataEventArgs e)
        {
            int proNumber = Convert.ToInt32(e.GetListSourceFieldValue("ProjectNumber"));
            double CarryCredit = 1.5;

            if (e.Column.FieldName == "CarryCredit")
            {
                e.Value = CarryCredit;
            }
            if (e.Column.FieldName == "Total")
            {
                e.Value = proNumber*CarryCredit;
            }
        }
    }
}