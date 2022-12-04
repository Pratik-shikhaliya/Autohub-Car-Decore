<%@ Page Title="" Language="C#" MasterPageFile="~/masterpage.master" AutoEventWireup="true" CodeFile="signin.aspx.cs" Inherits="signin" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<head>
	<style type="text/css">
		body{
			background: url(img/sample5.jpg);	
			background-size: 100% 120vh;
		}
	    .signin {
            height: 100vh;
	    }
		.container{
			padding-top: 170px;
		}
		.card{
			padding: 40px;
			height: inherit;
			width: 400px;
			background: rgba(155, 155, 155, 0.2);
			box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
			backdrop-filter: blur(18.5px);
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
    <section class="signin">
	<div class="container">
		<center>
		<div class="card">
			<h1>Sign IN</h1>
			<div class="txt">
				<asp:TextBox ID="txtname" runat="server" placeholder="Enter Your Email" height="30px" AutoCompleteType="Disabled" TextMode="Email"></asp:TextBox>
			</div>
			<div class="txt">
				<asp:TextBox ID="txtpass"  runat="server" placeholder="Enter Your Password" height="30px" TextMode="Password"></asp:TextBox>
			</div>
			<div class="btn">
				<asp:Button ID="Button1" runat="server" Text="SignIn" OnClick="btnsignin_Click"/>
                <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="btncancel_Click"/>
			</div>
			<div class="link">
				<a href="signup.aspx">Create new account</a>
			</div>
		</div>
		</center>
	</div>
    </section>
</body>
</asp:Content>

