using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_login : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection("Data Source=PRATIK-PC\\SQLEXPRESS; initial Catalog=db_autohub;Integrated Security=True");
    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        
    }
    protected void btnsignin_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("select * from tbl_admin where a_email='" + txtname.Text + "' and a_password='" + txtpass.Text + "'", con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Session["admindata"] = dr;
            Response.Write("<script>alert('Login success')</script>");
            Response.Redirect("home.aspx");
        }
        else
        {
            Response.Write("<script>alert('Invalid Username or password')</script>");
        }
    }
    protected void btnclear_Click(object sender, EventArgs e)
    {
        txtname.Text = "";
        txtpass.Text = "";
    }
}