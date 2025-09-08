using System;
using System.Configuration;
using System.Data.SqlClient;

namespace DaudPortfolio
{
    public partial class InsertData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["portfoliodb"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    conn.Open();

                    string selectedType = rblType.SelectedValue;
                    string query = "";

                    if (selectedType == "achievement")
                    {
                        query = "INSERT INTO achievements (achi_title, achi_context, achi_link) " +
                                "VALUES (@Title, @Context, @Link)";
                    }
                    else if (selectedType == "skill")
                    {
                        query = "INSERT INTO skills (skill_title, skill_context, skill_link) " +
                                "VALUES (@Title, @Context, @Link)";
                    }

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                        cmd.Parameters.AddWithValue("@Context", txtContext.Text.Trim());
                        cmd.Parameters.AddWithValue("@Link", txtLink.Text.Trim());

                        cmd.ExecuteNonQuery();
                    }

                    lblMessage.Text = selectedType == "achievement"
                        ? "Achievement saved successfully!"
                        : "Skill saved successfully!";
                    lblMessage.ForeColor = System.Drawing.Color.Green;

                    // Clear form fields
                    txtTitle.Text = "";
                    txtContext.Text = "";
                    txtLink.Text = "";
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}
