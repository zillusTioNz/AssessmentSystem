using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentSystem.CalCarry.Administrative
{
    public partial class admpart2 : System.Web.UI.UserControl
    {
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
                tbTotal.Text = ((n*credit)/2).ToString();
            }
            else
            {
                tbTotal.Text = "";
            }
        }
    }
}