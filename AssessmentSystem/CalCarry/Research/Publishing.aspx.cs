using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentSystem.CalCarry.Thesis
{
    public partial class Publishing : System.Web.UI.Page
    {
        SqlConnection objConn = new SqlConnection();
        String strConnString, strSQL;
        SqlDataAdapter dtAdapter;
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void gvResearchPublish_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridViewColumnDataEventArgs e)
        {
            if (e.Column.FieldName == "CpW")
            {
                strConnString = WebConfigurationManager.ConnectionStrings["AssessmentSystem"].ConnectionString;
                objConn = new SqlConnection(strConnString);
                objConn.Open();

                int resStatus = Convert.ToInt32(e.GetListSourceFieldValue("ResStatusID"));
                int resType = Convert.ToInt32(e.GetListSourceFieldValue("ResTypeID"));
                int id = Convert.ToInt32(e.GetListSourceFieldValue("ResNumber"));

                strSQL = "SELECT * FROM Research WHERE id = '" + id + "'";
                dtAdapter = new SqlDataAdapter(strSQL, objConn);
                dtAdapter.Fill(dt);

                if (resStatus == 1 && id != null)
                {
                    if (dt.Rows.Count > 0)
                    {
                        int proStatus = Convert.ToInt32(dt.Rows[0]["ProfessorStatusID"]);
                        int round = Convert.ToInt32(dt.Rows[0]["RoundID"]);
                        int percent = Convert.ToInt32(dt.Rows[0]["Percentage"]);
                        double head = 10.5;
                        double sub = 1.75;
                        double tmp = 0;
                        
                        if (round == 1 || round == 2)
                        {
                            if (proStatus == 1)
                            {
                                if (percent >= 75)
                                {
                                    tmp = head + 7;
                                }
                                else if (percent <= 74 && percent >= 51)
                                {
                                    tmp = head + 5.25;
                                }
                                else if (percent <= 50 && percent >= 25)
                                {
                                    tmp = head + 3.5;
                                }
                                else
                                {
                                    tmp = head + sub;
                                }
                            }
                            else
                            {
                                if (percent >= 75)
                                {
                                    tmp = 7;
                                }
                                else if (percent <= 74 && percent >= 51)
                                {
                                    tmp = 5.25;
                                }
                                else if (percent <= 50 && percent >= 25)
                                {
                                    tmp = 3.5;
                                }
                                else
                                {
                                    tmp = sub;
                                }
                            }

                            if (resType == 1)
                            {
                                e.Value = tmp * 0.5;
                            }
                            else
                            {
                                e.Value = tmp;
                            }
                        }
                    }
                }
                else
                {
                    if (resType == 1)
                    {
                        e.Value = 3.5;
                    }
                    else
                    {
                        e.Value = 7;
                    }
                }

                
            }
        }
    }
}