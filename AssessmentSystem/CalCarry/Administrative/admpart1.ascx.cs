using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentSystem.CalCarry.Administrative
{
    public partial class admpart1 : System.Web.UI.UserControl
    {
        public string LBtext
        {
            get { return lbText.Text; } 
            set { lbText.Text = value; }
        }

        public bool CBposition
        {
            get { return cbPosition.Checked; }
            set { cbPosition.Checked = value; }
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
            if (cbPosition.Checked)
            {
                tbTotal.Text = (Convert.ToInt32(lbCredit.Text) / 2).ToString();
            }
            else
            {
                tbTotal.Text = "";
            }
        }
    }
}