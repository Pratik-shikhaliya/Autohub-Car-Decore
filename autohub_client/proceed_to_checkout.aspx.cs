using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class proceed_to_checkout : System.Web.UI.Page
{
    SqlConnection con1 = new SqlConnection("Data Source=PRATIK-PC\\SQLEXPRESS; initial catalog=db_autohub;Integrated Security=True");
    SqlConnection con = new SqlConnection("Data Source=PRATIK-PC\\SQLEXPRESS; initial catalog=db_autohub;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {        
        SqlCommand cmd = new SqlCommand("select * from tbl_user where user_id='" + Session["userdata"] + "'", con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();
        txtname.Text=dr["user_name"].ToString();
        txtemail.Text = dr["user_email"].ToString();
        txtphone.Text = dr["user_phone"].ToString();
        txtaddress.Text = dr["user_address"].ToString();
        dr.Close();        
        con.Close();        
    }
    protected void btnorder_Click(object sender, EventArgs e)
    {
        SqlCommand cmd1 = new SqlCommand("select sum(pro_price*c_qty) as amount, count(c_id) as ttl from tbl_cart join tbl_product on tbl_cart.c_pro_id=tbl_product.pro_id where c_user_id='" + Session["userdata"] + "'", con);
        con.Open();
        SqlDataReader dr1 = cmd1.ExecuteReader();
        dr1.Read();

        SqlCommand cmd3 = new SqlCommand();
        cmd3.CommandText = "insert into tbl_order values(" + "'" + Session["userdata"] + "'" + "," + "'" + txtname.Text + "'" + "," + "'" + txtemail.Text + "'" + "," + "'" + txtphone.Text + "'" + "," + "'" + txtaddress.Text + "'" + "," + "'" + dr1["amount"].ToString() + "'" + "," + "'" + DateTime.Today + "'" + ")";
        string r = dr1["ttl"].ToString();
        int count = int.Parse(r);
        dr1.Close();
        cmd3.Connection = con;
        cmd3.ExecuteNonQuery();

        SqlCommand cmd2 = new SqlCommand("select MAX(o_id) as order_id from tbl_order", con);
        SqlDataReader dr2 = cmd2.ExecuteReader();
        dr2.Read();
        string s = dr2["order_id"].ToString();
        dr2.Close();


        SqlCommand cmd4 = new SqlCommand("select * from tbl_cart join tbl_product on tbl_cart.c_pro_id=tbl_product.pro_id where c_user_id='" + Session["userdata"] + "'", con);
        SqlDataReader dr4 = cmd4.ExecuteReader();
        while (dr4.Read())
        {
            string pid = dr4["pro_id"].ToString();
            string name = dr4["pro_name"].ToString();
            string price = dr4["pro_price"].ToString();
            int prc = int.Parse(price);
            string cqty = dr4["c_qty"].ToString();
            int qty = int.Parse(cqty);
            int stock = int.Parse(dr4["pro_stock"].ToString());
            int nstock = stock - qty;
            int sub = prc * qty;
            SqlCommand upd = new SqlCommand();
            upd.CommandText = "update tbl_product set pro_stock=" + nstock + "where pro_id=" + pid;
            con1.Open();
            upd.Connection = con1;
            upd.ExecuteNonQuery();
            con1.Close();
            SqlCommand cmd5 = new SqlCommand();
            cmd5.CommandText = "insert into tbl_order_item values(" + "'" + s + "'" + "," + "'" + pid + "'" + "," + "'" + name + "'" + "," + "'" + price + "'" + "," + "'" + cqty + "'" + "," + "'" + sub + "'" + ")";
            con1.Open();
            cmd5.Connection = con1;
            cmd5.ExecuteNonQuery();
            con1.Close();
        }
        dr4.Close();
        SqlCommand cmd6 = new SqlCommand("delete from tbl_cart  where c_user_id='" + Session["userdata"] + "'", con);
        SqlDataReader dr5 = cmd6.ExecuteReader();
        dr5.Read();
        dr5.Close();
        con.Close();
        Response.Write("<script>alert('Place Order successful')</script>");
        Response.Redirect("home.aspx");
    }
}