using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace DaudPortfolio
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (CheckAdminLogin(email, password))
            {
                Response.Write("<script>alert('valid  password');</script>");
                Session["Admin"] = email;
                Response.Redirect("AdminDashboard.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid email or password');</script>");
            }
        }

        private bool CheckAdminLogin(string email, string password)
        {
            string connStr = ConfigurationManager.ConnectionStrings["portfoliodb"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT COUNT(*) FROM AdminLogin WHERE admin_id = 1 AND email=@e AND password=@p";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@e", email);
                cmd.Parameters.AddWithValue("@p", password);

                con.Open();
                int count = (int)cmd.ExecuteScalar();
                return count == 1;
            }
        }
    }
}
