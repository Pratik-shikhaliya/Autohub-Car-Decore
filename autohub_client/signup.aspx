<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.master" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <head>
	<style type="text/css">
		body{
			background: url(img/sample6.jpg);	
			background-size: 100% 120vh;
		}
	    .signup {
            padding-bottom: 50px;
	    }
		.container{
			padding-top: 120px;
		}
		.card{
			padding: 40px;
			height: inherit;
			width: 400px;
			background: rgba(155, 155, 155, 0.2);
			box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
			backdrop-filter: blur(8.5px);
			border-radius: 10px;
			border: 1px solid rgba(255, 255, 255, 0.8);
		}
		h1{
			color: #222;
            font-size: 24px;
            text-transform: uppercase;
			letter-spacing: 2px;
		}
		.card .txt
		{
			position: relative;
			border-bottom: 2px solid rgba(255, 255, 255, 0.8);
			margin: 30px 0;
		}
		.txt input
		{
			width: 100%;
			padding: 0 5px;
			height: 40px;
			font-size: 16px;
			color: #000;
			border: none;
			background: none;
			outline: none;
		}
		.txt input::placeholder{
			color: black;
		}
		.txt textarea
		{
			width: 100%;
			padding: 0 5px;
			height: 40px;
			font-size: 16px;
			color: #000;
			border: none;
			background: none;
			outline: none;
		}
		.txt textarea::placeholder{
			color: black;
		}
		.btn
		{
			display: flex;
			justify-content: space-around;
		}
		.btn input
		{
			width: 150px;
			height: 40px;
			border: 0.5px solid #fff;
			background: #222;
			border-radius: 25px;
			font-size: 15px;
			font-weight: 700;
			color: #fff;
			cursor: pointer;
			transition: .5s ease;
		}
		.btn input:hover
		{
			background: white;
            color: #222;
		}
		.link 
		{
			margin-top: 30px;
		}
		.link a{
			text-decoration: none;
			color: black;
			font-size: 20px;
		}
        .link a:hover{
            color: blue;
            text-decoration: underline;
        }
	</style>
</head>
<body>
    <section class="signup">
	<div class="container">
		<center>
		<div class="card">
			<h1>Sign UP</h1>
			<div class="txt">
				<asp:TextBox ID="txtname" runat="server" placeholder="Enter Your Name" height="30px" AutoCompleteType="Disabled"></asp:TextBox>
			</div>
			<div class="txt">
				<asp:TextBox ID="txtemail"  runat="server" placeholder="Enter Your Email" height="30px" TextMode="Email"></asp:TextBox>
			</div>
			<div class="txt">
				<asp:TextBox ID="txtpass"  runat="server" placeholder="Enter Your Password" height="30px" TextMode="Password"></asp:TextBox>
			</div>
			<div class="txt">
				<asp:TextBox ID="txtmobile"  runat="server" placeholder="Enter Your Mobile" height="30px" TextMode="Phone" AutoCompleteType="Disabled"></asp:TextBox>
			</div>
			<div class="txt">
				<asp:TextBox ID="txtaddress"  runat="server" placeholder="Enter Your Address" height="30px" TextMode="MultiLine" AutoCompleteType="Disabled"></asp:TextBox>
			</div>
			<div class="btn">
				<asp:Button ID="Button1" runat="server" Text="SignUP" OnClick="btnsignup_Click"/>
                <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="btncancel_Click"/>
			</div>
		</div>
		</center>
	</div>
    </section>
</body>
</asp:Content>

