using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class product_detail : System.Web.UI.Page
{
    SqlConnection con; 
    SqlConnection con1;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection("Data Source=PRATIK-PC\\SQLEXPRESS; initial catalog=db_autohub;Integrated Security=True");
        con1 = new SqlConnection("Data Source=PRATIK-PC\\SQLEXPRESS; initial catalog=db_autohub;Integrated Security=True");
    }
   protected void btnaddtocart_Click(object sender, EventArgs e)
    {
        SqlCommand cmd1 = new SqlCommand("select * from tbl_cart where c_user_id="+Session["userdata"]+"and c_pro_id="+Request.QueryString["id"],con);
        con.Open();
        SqlDataReader dr = cmd1.ExecuteReader();
        if (dr.Read())
        {
            string sqty = dr["c_qty"].ToString();
            int qty = int.Parse(sqty);
            string tqty = TextBox1.Text;
            int iqty = int.Parse(tqty);
            int fqty = qty + iqty;
            cmd = new SqlCommand();
            cmd.CommandText = "update tbl_cart set c_qty=" + fqty + "where c_id=" + dr["c_id"];
            con1.Open();
            cmd.Connection = con1;          
            cmd.ExecuteNonQuery();
            Response.Redirect("cart.aspx");
            Response.Write("<script>alert('Update Cart Successful')</script>");
            
        }
        else
        {
            string s = Request.QueryString["stock"];
            int istock = int.Parse(s);
            string qty = TextBox1.Text;
            int iqty = int.Parse(qty);
            if (istock > iqty)
            {
                cmd = new SqlCommand();
                cmd.CommandText = "insert into tbl_cart values (" + Session["userdata"] + "," + Request.QueryString["id"] + "," + TextBox1.Text + ")";
                con1.Open();
                cmd.Connection = con1;
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Added to Cart Successful');window.location.href='product.aspx'</script>");
               
            }
            else 
            {
                Response.Write("<script>alert('Enter Valid Qty')</script>");
            }
        }
        dr.Close();
        con.Close();
        con1.Close();
    }
}