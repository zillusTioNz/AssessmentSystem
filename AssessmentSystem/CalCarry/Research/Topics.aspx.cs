using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentSystem.CalCarry.Thesis
{
    public partial class Topics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvResearch_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridViewColumnDataEventArgs e)
        {
            int proStatus = Convert.ToInt32(e.GetListSourceFieldValue("ProfessorStatusID"));
            int round = Convert.ToInt32(e.GetListSourceFieldValue("RoundID"));
            int percent = Convert.ToInt32(e.GetListSourceFieldValue("Percentage"));
            double head = 10.5;
            double sub = 1.75;

            if (e.Column.FieldName == "ResCredit")
            {
                if (round == 1)
                {
                    if (proStatus == 1)
                    {
                        if (percent >= 75)
                        {
                            e.Value = head + 7;
                        }
                        else if (percent <= 74 && percent >= 51)
                        {
                            e.Value = head + 5.25;
                        }
                        else if (percent <= 50 && percent >= 25)
                        {
                            e.Value = head + 3.5;
                        }
                        else
                        {
                            e.Value = head + sub;
                        }
                    }
                    else
                    {
                        if (percent >= 75)
                        {
                            e.Value = 7;
                        }
                        else if (percent <= 74 && percent >= 51)
                        {
                            e.Value = 5.25;
                        }
                        else if (percent <= 50 && percent >= 25)
                        {
                            e.Value = 3.5;
                        }
                        else
                        {
                            e.Value = sub;
                        }
                    }
                }
            }
        }
    }
}