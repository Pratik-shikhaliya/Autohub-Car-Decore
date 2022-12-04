using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class feedback : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection("Data Source=PRATIK-PC\\SQLEXPRESS; initial catalog=db_autohub;Integrated Security=True");
    }
    protected void btnfeedback_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insert into tbl_feedback values (" + "'" + TextBox1.Text + "'" + "," + "'" + TextBox2.Text + "'" + "," + "'" + TextBox3.Text + "'" + "," + "'" + TextBox4.Text + "')";
        cmd.Connection = con;
        con.Open();
        cmd.ExecuteNonQuery();
        Response.Write("<script>alert('Feedback send Successful');window.location.href='home.aspx'</script>"); 
    }
    protected void btnclear_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";

    }
}