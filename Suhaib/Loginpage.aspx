<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Loginpage.aspx.cs" Inherits="Group5.Suhaib.Loginpage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Background color */
        body {
            background-color: #2C3E50;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            animation: fadeIn 1s ease-in-out;
        }

        /* Login Container */
        .login-container {
            width: 85%;
            max-width: 1200px;
            height: 550px;
            border-radius: 15px;
            overflow: hidden;
            background: white;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.2);
            transform: translateY(-20px);
            animation: slideIn 1s ease-out forwards;
            display: flex;
            flex-direction: row;
        }

        /* Image Section */
        .image-container {
            flex: 1;
            overflow: hidden;
            border-top-left-radius: 15px;
            border-bottom-left-radius: 15px;
        }

        .login-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Form Section */
        .login-form {
            flex: 1;
            padding: 80px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
            opacity: 0;
            animation: fadeInUp 1.5s ease-out forwards;
        }

        /* Stylish Textbox */
        .form-control {
            border-radius: 25px;
            padding: 12px;
            border: 1px solid #ccc;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
        }

        .form-control:focus {
            border-color: #F4F1DE;
            box-shadow: 0px 0px 10px rgba(244, 241, 222, 0.7);
            outline: none;
        }

        /* Login Header */
        .login-title {
            font-size: 2.2rem;
            font-weight: bold;
            margin-bottom: 25px;
            color: #34495E;
            opacity: 0;
            animation: fadeInUp 1s ease-out forwards;
        }

        /* Button Styling */
        .btn-login {
            background-color: #F4F1DE;
            color: #2C3E50;
            font-weight: bold;
            padding: 12px;
            width: 100%;
            border-radius: 25px;
            transition: all 0.3s ease-in-out;
        }

        .btn-login:hover {
            background-color: #E0DAC6;
            transform: scale(1.05);
        }

        /* Register Link */
        .register-link {
            margin-top: 15px;
            font-size: 0.9rem;
        }

        .register-link a {
            color: #524d27;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease-in-out;
        }

        .register-link a:hover {
            color: #E0DAC6;
            text-decoration: underline;
        }

        /* Footer */
        .footer {
            margin-top: 20px;
            color: white;
            text-align: center;
            font-size: 1rem;
            opacity: 0;
            animation: fadeIn 2s ease-in-out forwards;
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes slideIn {
            from {
                transform: translateY(-20px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .login-container {
                width: 90%;
                height: auto;
                flex-direction: column;
            }
            .image-container {
                height: 250px;
            }
            .login-image {
                height: 100%;
            }
            .login-form {
                padding: 50px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container d-flex justify-content-center align-items-center">
            <div class="login-container">
                
                <!-- Image Section -->
                <div class="image-container">
                    <img src="loginPhoto.jpg" alt="Login Image" class="login-image">
                </div>
                
                <!-- Form Section -->
                <div class="login-form">
                    <h3 class="login-title">Welcome Back</h3>

                    <div class="form-group">
                        <label class="form-label">University ID</label>
                        <asp:TextBox ID="uniID" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Password</label>
                        <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:Button ID="login" runat="server" Text="Login" CssClass="btn btn-login" OnClick="login_Click" />
                    </div>

                    <!-- Register Link -->
                    <div class="register-link">
                        Don't have an account? <a href="registration.aspx">Sign up here</a>
                    </div>

                </div>
            </div>
        </div>

        <!-- Footer Section -->
        <footer class="footer">
            &copy; 2025 Horizon Library. All Rights Reserved.
        </footer>
    </form>
</body>
</html>
