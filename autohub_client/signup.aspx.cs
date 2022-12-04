using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class signup : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection("Data Source=PRATIK-PC\\SQLEXPRESS; initial catalog=db_autohub;Integrated Security=True");
    }
    protected void btnsignup_Click(object sender, EventArgs e)
    {
        cmd=new SqlCommand();
        cmd.CommandText = "insert into tbl_user values ("+"'"+txtname.Text+"'"+","+"'"+txtemail.Text+"'"+","+"'"+txtmobile.Text+"'"+","+"'"+txtaddress.Text+"'"+","+"'"+txtpass.Text+"')";
        cmd.Connection = con;
        con.Open();
        cmd.ExecuteNonQuery();
        if ((txtname.Text == "") || (txtemail.Text == "") || (txtpass.Text == "") || (txtmobile.Text == "") || (txtaddress.Text == ""))
        {
            Response.Write("<script>alert('Fields can not be blank')</script>");
        }
        else if (txtpass.Text.Length < 7)
        {
            Response.Write("<script>alert('Password must be more than 6 characters')</script>");
        }
        else if ((txtmobile.Text.Length > 10) || (txtmobile.Text.Length < 10))
        {
            Response.Write("<script>alert('Mobile number must be 10 digits')</script>");
        }
        else
        {
            Response.Write("<script>alert('Signup Successful')</script>");
            Response.Redirect("signin.aspx");
        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("signin.aspx");
    }
}