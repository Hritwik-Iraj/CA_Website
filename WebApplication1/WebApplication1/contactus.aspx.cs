using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace WebApplication1
{
    public partial class contactus : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            con.Close();

            SqlCommand cmd = new SqlCommand("insert into catable values (@name,@contact,@email,@service,@dt)", con);
            cmd.Parameters.AddWithValue("@name", txtName.Text);
            cmd.Parameters.AddWithValue("@contact", txtContact.Text);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@service", ddlservice.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@dt", DateTime.Now);
            con.Open();
            cmd.ExecuteNonQuery();

            txtContact.Text = "";
            txtName.Text = "";
            txtEmail.Text = string.Empty;
            ddlservice.SelectedIndex = 0;
            Response.Write("<script>alert('You are registered successfully..!')</script>");
        }
    }
}