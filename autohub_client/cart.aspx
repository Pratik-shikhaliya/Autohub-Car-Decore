<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="cart" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <style>
        .cart1 {
            padding-top: 150px;
            padding-bottom: 100px;
        }
        .cart1 table tr th{
            font-size: 25px;
        }
        th,td,tr {
            height:80px;
        }
    </style>
    <%
        SqlConnection con = new SqlConnection("Data Source=PRATIK-PC\\SQLEXPRESS; initial catalog=db_autohub;Integrated Security=True");
            SqlCommand cmd= new SqlCommand("select * from tbl_cart join tbl_product on tbl_cart.c_pro_id=tbl_product.pro_id where c_user_id='"+Session["userdata"]+"'", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();            
        %>
    
    <section class="cart1">
    <center>
        <table style="height:auto; width:600px; text-align:center; border-color:black;" border="1">                        
                            <tr>                                
                                <th>Product name</th>                                
                                <th>price</th>
                                <th>quantity</th>
                                <th>total</th>
                                <th>Remove</th>
                            </tr>
                             <% int total = 0;
                                while (dr.Read())
                                {                                    
                                   string price = dr["pro_price"].ToString();
                                   int prc = int.Parse(price);
                                   string cqty = dr["c_qty"].ToString();
                                   int qty = int.Parse(cqty);
                                   int sub = prc * qty;
                                   total = total + sub;                            
                                   %>                                                                      
                            <tr>                                
                                <td ><%Response.Write(dr["pro_name"]); %></td>                                                               
                                <td>&#8377; <%Response.Write(dr["pro_price"]); %></td>
                                <td><%Response.Write(dr["c_qty"]); %></td>                                
                                <td> &#8377; <%Response.Write(sub); %></td>
                                <td><a href="cart_remove.aspx?cartid=<%Response.Write(dr["c_id"]); %>" style="text-decoration: none; color: blue;">Remove</a></td>
                            </tr>	<%} %>											             
						<tr>
						<td colspan="4">Total</td>
						<td>&#8377; <%Response.Write(total); %></td>
						</tr>  
                        <tr>
                            <td colspan="2"><a href="product.aspx" style="text-decoration: none;color: black ">Continue Shoping</a></td>
                            <td colspan="3"><a href="proceed_to_checkout.aspx" style="text-decoration: none; color: white; padding: 20px 10px; background: #cf9201; border-radius: 25px">Proceed To Checkout</a></td>
                        </tr>                     
                    </table></center>
    </section>
</asp:Content>

