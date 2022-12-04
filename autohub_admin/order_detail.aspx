<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="order_detail.aspx.cs" Inherits="order_detail" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<style>
        th, td, tr {
            height:50px;
            text-align:center
        }
    </style>
      <%
          SqlConnection con = new SqlConnection("Data Source=PRATIK-PC\\SQLEXPRESS; initial Catalog=db_autohub;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("select * from tbl_order_item where oi_order_id='" + Request.QueryString["order_id"] + "'", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            SqlConnection con1 = new SqlConnection("Data Source=PRATIK-PC\\SQLEXPRESS; initial Catalog=db_autohub;Integrated Security=True");
            SqlCommand cmd1 = new SqlCommand("select * from tbl_order where o_id='" + Request.QueryString["order_id"] + "'", con1);
            con1.Open();
            SqlDataReader dr1 = cmd1.ExecuteReader();
            dr1.Read();  
        %>
    <center><h3>---------Order Detail---------</h3>
        <section class="all_section">
<table style="color:black; width:900px;" border="1">
            <tr>
            <th>Name</th>
                <td><%Response.Write(dr1["o_name"]); %></td>
            <th>Phone no.</th>
                <td><%Response.Write(dr1["o_phone"]); %></td>
            </tr>

            <tr>
            <th>Email Id</th>
                <td><%Response.Write(dr1["o_email"]); %></td>
            <th>Address</th>
                <td><%Response.Write(dr1["o_address"]); %></td>
            </tr>

            <tr>
            <th colspan="2">Order Date</th>
                <td colspan="2"><%Response.Write(((DateTime)dr1["o_date"]).ToString("dd-MM-yyyy")); %></td>
            </tr>
</table>
<br />
<%dr1.Close();
  con1.Close(); %>
<table style="color:black; width:900px;" border="1">
                            <tr>
                                <th>Sr no.</th>                               
                                <th>Product name</th>                                
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                            </tr>
                            <%int total=0; while (dr.Read())
                              { %>                                 
                            <tr>                               
                                <td><%Response.Write(dr["oi_id"]); %></td>                                                                                       
                                <td><%Response.Write(dr["oi_pname"]); %></td>
                                <td>&#8377; <%Response.Write(dr["oi_price"]); %></td>
                                <td><%Response.Write(dr["oi_qty"]); %></td>							
                                <td>&#8377; <%Response.Write(dr["oi_amount"]); %></td>							
							</tr>
   
                                   <% string price = dr["oi_price"].ToString();         
                                   int prc = int.Parse(price);
                                   string oqty = dr["oi_qty"].ToString();
                                   int qty = int.Parse(oqty);
                                   int sub = prc * qty;
                                   total = total + sub;
                                   }%>									
							<tr>
								<td colspan="4">Grand Total</td>
								<td>&#8377; <%Response.Write(total); dr.Close(); con.Close();%></td>
							</tr> 		
                    </table>	</center>
    </section>
</asp:Content>

