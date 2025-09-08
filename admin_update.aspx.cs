using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DaudPortfolio
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddAchievement_Click(object sender, EventArgs e)
        {
            /*string title = txtAchTitle.Text.Trim();
            string description = txtAchDescription.Text.Trim();
            string dateAchieved = txtAchDate.Text.Trim();
            int type = int.Parse(ddlAchType.SelectedValue);
            int? teamId = null;

            if (!string.IsNullOrEmpty(txtAchTeamId.Text.Trim()))
            {
                teamId = int.Parse(txtAchTeamId.Text.Trim());
            }

            string connStr = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Achievements (Title, Description, DateAchieved, Type, TeamId) " +
                               "VALUES (@Title, @Description, @DateAchieved, @Type, @TeamId)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Description", description);
                    cmd.Parameters.AddWithValue("@DateAchieved", dateAchieved);
                    cmd.Parameters.AddWithValue("@Type", type);
                    cmd.Parameters.AddWithValue("@TeamId", (object)teamId ?? DBNull.Value);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            lblAchMessage.Text = "Achievement added successfully!";
            // Clear fields
            txtAchTitle.Text = "";
            txtAchDescription.Text = "";
            txtAchDate.Text = "";
            txtAchTeamId.Text = "";
            ddlAchType.SelectedIndex = 0;

            // Reload achievements to show the new one
            LoadAchievements();*/
        }

    }
}