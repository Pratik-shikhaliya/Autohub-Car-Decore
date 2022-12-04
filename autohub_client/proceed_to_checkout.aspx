<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.master" AutoEventWireup="true" CodeFile="proceed_to_checkout.aspx.cs" Inherits="proceed_to_checkout" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <style>
        .checkout {
            padding-top: 150px;
            padding-bottom: 100px;
            padding-left: 100px;
        }
        .checkout .cktbl{
            padding: 20px;
            background: #d9d9d9;
        }
        .cktbl .innertbl1 {
             margin: 50px;
        }
        .cktbl .innertbl1 tr th{
              font-size: 20px;
              height: 30px;
              padding: 10px;
              background: none;
              color: black;
        }
        .cktbl .innertbl1 tr .btn input{
              padding: 5px;
              background: #cf9201;
              color: white;
              border: none;
              font-size: 15px;
              margin: 10px;
        }
        
        .cktbl .innertbl1 tr td {
            padding: 10px;
        }
        
        .cktbl .innertbl1 tr td input{
            padding: 10px;
            width:88%;
        }
        
        .cktbl .innertbl1 tr td textarea{
            padding: 10px;
        }
        .cktbl .innertbl2 {
            margin-left: 230px;
            margin-right: 50px;
        }
        .cktbl .innertbl2 tr th{
              font-size: 20px;
              height: 30px;
              padding: 10px;
              background : #cf9201;
              color:white;
        }
        .cktbl .innertbl2 .total td {
            padding: 10px;
        }
        .cktbl .innertbl2 tr td{
            padding: 50px 10px;
        }
    </style>
    <section class="checkout">
    <table class="cktbl">
        <tr>
            <td>
                <h3 align="center">Billing & Shipping Address</h3>
					<table border="1" class="innertbl1">
	      	            
					   <tr>
							<th>Name</th>
							<td><asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
					   </tr>
						<tr>
							<th>Email</th>
							<td><asp:TextBox ID="txtemail" runat="server"></asp:TextBox></td>
					   </tr>  
						<tr>
							<th>Phone</th>
							<td><asp:TextBox ID="txtphone" runat="server"></asp:TextBox></td>
						</tr>
						<tr>
							<th>Address</th>
							<td><asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine"></asp:TextBox></td>
					   </tr>					   
					   <tr>
							<td colspan=2 class="btn"><p align="center">
                            <asp:Button ID="btnorder" runat="server" Text="Place Order" OnClick="btnorder_Click" /></p></td>
					   </tr>
					   </table>
            </td>
            <td>
                <%
                    SqlConnection con = new SqlConnection("Data Source=PRATIK-PC\\SQLEXPRESS; initial catalog=db_autohub;Integrated Security=True");
            SqlCommand cmd= new SqlCommand("select * from tbl_cart join tbl_product on tbl_cart.c_pro_id=tbl_product.pro_id where c_user_id='"+Session["userdata"]+"'", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();            
        %>
    <center><table border="1" class="innertbl2">                        
                            <tr>                                
                                <th>Product name</th>                                
                                <th>price</th>
                                <th>quantity</th>
                                <th>total</th>                                
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
                            </tr>	<%} %>											             
						<tr class="total">
						<td colspan="3">Total</td>
						<td>&#8377; <%Response.Write(total); %></td>
						</tr>    
        <%dr.Close(); %>                                
                    </table></center>
            </td>
        </tr>
    </table>
    </section>
</asp:Content>

