using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
namespace DaudPortfolio
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAchievements();
                LoadSkills();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string message = txtMessage.Text.Trim();

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(message))
            {
                lblStatus.Text = "Please fill in all fields.";
                lblStatus.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["portfoliodb"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    string sql = "INSERT INTO messages (name, email, msg) VALUES (@name, @email, @msg)";

                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@name", name);
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@msg", message);

                        cmd.ExecuteNonQuery();
                    }

                    lblStatus.Text = "Thank you! Your message has been sent.";
                    lblStatus.ForeColor = System.Drawing.Color.Green;

                    // Clear input fields
                    txtName.Text = "";
                    txtEmail.Text = "";
                    txtMessage.Text = "";
                }
                catch (Exception ex)
                {
                    lblStatus.Text = "Error: " + ex.Message;
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        private void LoadAchievements()
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["portfoliodb"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT achi_title AS Title, achi_context AS Description FROM achievements ORDER BY achi_id DESC";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        rptAchievements.DataSource = dt;
                        rptAchievements.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    // Optional: show error message
                    // lblStatus.Text = "Error loading achievements: " + ex.Message;
                }
            }
        }

        private void LoadSkills()
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["portfoliodb"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT skill_title AS Title, skill_context AS Description FROM skills ORDER BY skill_id DESC";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        Repeatskills.DataSource = dt;
                        Repeatskills.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    // Optional: show error
                    // lblStatus.Text = "Error loading skills: " + ex.Message;
                }
            }
        }



    }
}