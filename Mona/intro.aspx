<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="intro.aspx.cs" Inherits="Group5.Mona.intro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome to Our Website</title>
    <style>
        /* Reset & Base Styles */
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow: hidden; 
        }

        body {
            background: url('img/harvard.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            animation: fadeIn 1.5s ease-in-out; 
/*            font-family:Garamond;*/
        }

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(44, 62, 80, 0.8); /* Dark overlay effect */
            z-index: 1;
        }

        .logo {
            position: absolute;
            top: 0.2vw; /* Distance from the top */
            left: 0.2vw; /* Distance from the left */
            width: 15vw; /* Adjust the logo size */
            z-index: 2;
/*            padding-top:-2vw;*/
            margin-top:-2vw;
        }

        .container {
            text-align: center;
            color: #F4F1DE;
            font-family: Arial, sans-serif;
            position: relative;
            z-index: 2;
            max-width: 600px;
            padding: 20px;
            opacity: 0;
            transform: translateY(50px);
            animation: slideUp 1.5s ease-out forwards;
        }

        /* Dynamic Animated H1 */
        h1 {
            font-size: 2.5rem;
            background: linear-gradient(90deg, #F1C40F, #FFD700, #F1C40F);
            background-size: 200% 200%;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            display: inline-block;
            opacity: 0;
            white-space: nowrap;
            overflow: hidden;
            border-right: 4px solid #F1C40F;
            width: 0;
            animation: typing 2s steps(20, end) forwards, gradientMove 3s infinite alternate, pulse 1.5s infinite 2.5s;
        }

        p {
            font-size: 1.2rem;
            margin-bottom: 20px;
            opacity: 0;
            animation: fadeIn 1s ease-in-out forwards 0.8s;
        }

        .button-container {
            margin-top: 20px;
            opacity: 0;
            animation: fadeIn 1s ease-in-out forwards 1s;
        }

        .btn {
            background-color: #F1C40F;
            color: #2C3E50;
            border: none;
            font-weight: bold;
            padding: 12px 25px;
            font-size: 1.1rem;
            margin: 10px;
            cursor: pointer;
            border-radius: 5px;
            transition: all 0.3s ease-in-out;
            position: relative;
            overflow: hidden;
        }

        .btn:hover {
            background-color: #2C3E50;
            color: #F1C40F;
            transform: scale(1.1);
        }

        .btn:active {
            transform: scale(0.9);
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes typing {
            from { width: 0; }
            to { width: 100%; opacity: 1; text-shadow:0.2vw 0.2vw 1vw #F1C40F}
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        @keyframes gradientMove {
            0% { background-position: 0% 50%; }
            100% { background-position: 100% 50%; }
        }
        /* Footer */
        .footer {
            position: absolute;
            bottom: 10px;
            width: 100%;
            align-content:center;
            color: #F4F1DE;
            z-index: 2;
        }
        .pf{
            font-size: 0.9rem;
            margin-left:5vw;

        }
        .footer a {
            color: #F1C40F;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <img src="img/logo1.png" alt="Logo" class="logo" /> <!-- Logo Image -->
        <div class="container">
            <h1>Welcome to Horizon Library</h1>
            <p>Discover a world of knowledge and resources at your fingertips.</p>
            <div class="button-container">
                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn" OnClick="btnRegister_Click" />
                <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="btn" OnClick="btnLogin_Click" />
            </div>
        </div>
        <!-- Policy & Copyright Section -->
        <div class="footer">
            <p class="pf">&copy; 2025 Horizon Library. All rights reserved. <a href="policy.aspx">Privacy Policy</a> | <a href="terms.aspx">Terms of Service</a></p>
        </div>
    </form>
</body>
</html>
