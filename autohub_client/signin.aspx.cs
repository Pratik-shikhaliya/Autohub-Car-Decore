using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class signin : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;   
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection("Data Source=PRATIK-PC\\SQLEXPRESS; initial catalog=db_autohub;Integrated Security=True");
    }
    protected void btnsignin_Click(object sender, EventArgs e)
    {        
        cmd = new SqlCommand("select * from tbl_user where user_email='" + txtname.Text + "' and user_password='" + txtpass.Text + "'", con);
        con.Open();

        SqlDataReader dr = cmd.ExecuteReader();
        if ((txtpass.Text == "") || (txtname.Text == ""))
        {
            Response.Write("<script>alert('Password and username should not be blank')</script>");
        }
        else { 
            if (dr.Read())
            {
                Session["userdata"] = dr[0];
                Response.Write("<script>alert('Login successfully')</script>");
                Response.Redirect("home.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid Username or password')</script>");
            }
        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("home.aspx");
    }
}