using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class add_category : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection("Data Source=PRATIK-PC\\SQLEXPRESS; initial Catalog=db_autohub;Integrated Security=True");
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand();
        cmd.CommandText = "insert into tbl_category values("+ "'"+ txtname.Text+ "'"+")";
        cmd.Connection = con;
        con.Open();
        cmd.ExecuteNonQuery();
        Response.Write("<script>alert('Category Add Successfull')</script>");
        Response.Redirect("manage_category.aspx");
    }
}