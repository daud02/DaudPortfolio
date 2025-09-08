using System;
using System.Web.UI;

namespace DaudPortfolio
{
    public partial class AdminDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optionally protect with session check
            if (Session["Admin"] == null)
            {
                Response.Redirect("Admin.aspx");
            }
            else
            {
                lblAdmin.Text = Session["Admin"].ToString();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Admin.aspx");
        }

        protected void btnShowData_Click(object sender, EventArgs e)
        {
            Response.Redirect("show_data.aspx");
        }

        protected void btnInsertData_Click(object sender, EventArgs e)
        {
            Response.Redirect("insert_data.aspx");
        }

        protected void btnMessages_Click(object sender, EventArgs e)
        {
            Response.Redirect("messages.aspx");
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }
    }
}
