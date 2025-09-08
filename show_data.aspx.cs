using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace DaudPortfolio
{
    public partial class ShowData : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["portfoliodb"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindGrid();
        }

        protected void rblType_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvData.EditIndex = -1;
            BindGrid();
        }

        private void BindGrid()
        {
            string table = rblType.SelectedValue;
            if (table != "achievements" && table != "skills")
                return;

            DataTable dt = new DataTable();
            string sql = table == "achievements"
                ? "SELECT achi_id AS ID, achi_title AS Title, achi_context AS Context, achi_link AS Link FROM achievements ORDER BY achi_id"
                : "SELECT skill_id AS ID, skill_title AS Title, skill_context AS Context, skill_link AS Link FROM skills ORDER BY skill_id";

            using (SqlConnection con = new SqlConnection(conString))
            using (SqlDataAdapter da = new SqlDataAdapter(sql, con))
            {
                da.Fill(dt);
            }

            gvData.DataSource = dt;
            gvData.DataBind();
        }

        protected void gvData_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvData.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvData_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvData.EditIndex = -1;
            BindGrid();
        }

        protected void gvData_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string table = rblType.SelectedValue;
            GridViewRow row = gvData.Rows[e.RowIndex];
            string id = gvData.DataKeys[e.RowIndex].Value.ToString();

            // Find controls directly
            string title = ((TextBox)row.FindControl("txtTitle")).Text.Trim();
            string context = ((TextBox)row.FindControl("txtContext")).Text.Trim();
            string link = ((TextBox)row.FindControl("txtLink")).Text.Trim();

            using (SqlConnection con = new SqlConnection(conString))
            using (SqlCommand cmd = con.CreateCommand())
            {
                if (table == "achievements")
                {
                    cmd.CommandText = "UPDATE achievements SET achi_title=@title, achi_context=@context, achi_link=@link WHERE achi_id=@id";
                }
                else
                {
                    cmd.CommandText = "UPDATE skills SET skill_title=@title, skill_context=@context, skill_link=@link WHERE skill_id=@id";
                }

                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@title", title);
                cmd.Parameters.AddWithValue("@context", context);
                cmd.Parameters.AddWithValue("@link", link);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            gvData.EditIndex = -1;
            lblMessage.Text = $"{table} record updated!";
            BindGrid();
        }

        protected void gvData_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string table = rblType.SelectedValue;
            string id = gvData.DataKeys[e.RowIndex].Value.ToString();

            using (SqlConnection con = new SqlConnection(conString))
            using (SqlCommand cmd = con.CreateCommand())
            {
                if (table == "achievements")
                    cmd.CommandText = "DELETE FROM achievements WHERE achi_id=@id";
                else
                    cmd.CommandText = "DELETE FROM skills WHERE skill_id=@id";

                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }

            lblMessage.Text = $"{table} record deleted!";
            BindGrid();
        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("insert_data.aspx");
        }
    }
}
