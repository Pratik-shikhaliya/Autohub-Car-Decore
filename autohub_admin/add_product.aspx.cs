using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class add_product : System.Web.UI.Page
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
        if(FileUpload1.HasFile)
        {         
            FileUpload1.SaveAs("e:autohub/autohub_client/uploadproduct/"+FileUpload1.FileName);
        }
        cmd.CommandText = "insert into tbl_product values("+DropDownList1.SelectedValue+","+"'"+txtpname.Text+"'"+","+txtprice.Text+","+"'"+FileUpload1.FileName+"'"+","+"'"+txtdis.Text+"'"+","+txtstock.Text+")";
        cmd.Connection = con;
        con.Open();
        cmd.ExecuteNonQuery();
        Response.Write("<script>alert('Product Add Successfull')</script>");
        Response.Redirect("manage_product.aspx");
    }
}
