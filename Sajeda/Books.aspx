<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="Group5.Books" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Books Information</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
    <style>
        body {
            background-color: #2C3E50;
            color: white;
        }
      form  .container {
            background-color: #F4F1DE;
            border-radius: 15px;
            padding: 30px;
        }
        .profile-section {
            text-align: center;
        }
        .profile-section img {
            border: 3px solid #F1C40F;
        }
        h4 {
            color: #F1C40F;
            font-weight: bold;
        }
        label {
            color: #2C3E50;
            font-weight: bold;
        }
        .profile-button {
            background-color: #2C3E50;
            color: white;
            border: none;
            transition: 0.3s ease-in-out;
        }
        .profile-button:hover {
            background-color: #F1C40F;
            color: #2C3E50;
        }
        .btn-secondary {
            background-color: #F1C40F !important;
            color: #2C3E50 !important;
        }

        /*NAvbar*/ 


.navbar .dropdown-toggle::after {
    border: none;
    content: "\f107";
    font-family: "Font Awesome 5 Free";
    font-weight: 900;
    vertical-align: middle;
    margin-left: 8px;
}

.navbar-light .navbar-nav .nav-link {
    margin-right: 30px;
    padding: 25px 0;
    color: #FFFFFF;
    font-size: 15px;
    text-transform: uppercase;
    outline: none;
}

.navbar-light .navbar-nav .nav-link:hover,
.navbar-light .navbar-nav .nav-link.active {
    color:#F1C40F;
}

@media (max-width: 991.98px) {
    .navbar-light .navbar-nav .nav-link  {
        margin-right: 0;
        padding: 10px 0;
    }

    .navbar-light .navbar-nav {
        border-top: 1px solid #EEEEEE;
    }
}

.navbar-light .navbar-brand,
.navbar-light a.btn {
    height: 75px;
}

.navbar-light .navbar-nav .nav-link {
    color: var(--dark);
    font-weight: 500;
}

.navbar-light.sticky-top {
    top: -100px;
    transition: .5s;
}

@media (min-width: 992px) {
    .navbar .nav-item .dropdown-menu {
        display: block;
        margin-top: 0;
        opacity: 0;
        visibility: hidden;
        transition: .5s;
    }

    .navbar .dropdown-menu.fade-down {
        top: 100%;
        transform: rotateX(-75deg);
        transform-origin: 0% 0%;
    }

    .navbar .nav-item:hover .dropdown-menu {
        top: 100%;
        transform: rotateX(0deg);
        visibility: visible;
        transition: .5s;
        opacity: 1;
    }
}


 nav .btn {
    font-family: 'Nunito', sans-serif;
    font-weight: 600;
    transition: .5s;
    color: white;
    background-color: #2C3E50;
    border: none;
    border-left: 20px;
}
.btn:hover{
    background-color: #F1C40F;
    color: black;
}

.btn-square {
    width: 38px;
    height: 38px;
}

.btn-sm-square {
    width: 32px;
    height: 32px;
}
small{
    color: #F1C40F;
}
.btn-lg-square {
    width: 48px;
    height: 48px;
}

.btn-square,
.btn-sm-square,
.btn-lg-square {
    padding: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: normal;
    border-radius: 0px;
}





/**footer style *****/
.footer {
     background-color: #2C3E50 !important; /*Same as navbar */
     color: #F4F1DE;
     padding: 4px 0;
     font-size: 14px;
 }

     .footer h4 {
         color: #F1C40F;
     }

     .footer a {
         color: #FFFFFF;
         font-size: 14px;
         text-decoration: none;
         transition: color 0.3s ease-in-out;
     }

         .footer a:hover {
             color: #F1C40F !important;
         }

     .footer .btn-social {
         color: #F4F1DE;
         border: 1px solid #F4F1DE;
         margin-right: 8px;
         width: 40px;
         height: 40px;
         display: inline-flex;
         align-items: center;
         justify-content: center;
         border-radius: 50%;
         transition: 0.3s;
     }

         .footer .btn-social:hover {
             background-color: #F1C40F;
             color: #2C3E50;
         }

     .footer .copyright {
         border-top: 1px solid #F1C40F;
         padding-top: 2px;
         text-align: center;
     }

 .pf {
     font-size: 0.9rem;
     margin-left: 5vw;
 }

 .copyright a {
     color: #F1C40F;
     text-decoration: none;
 }

 #Image1 {
     Width: 11vw;
     Height: 5vw;
 }

 .foot {
     box-shadow: 0.4vw 0.4vw 0.9vw black;
 }
    </style>
</head>
<body>

        <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg  navbar-light shadow sticky-top p-0">
        <a href="index.html" class="navbar-brand d-flex align-items-center">
              <asp:Image ID="Image2" runat="server" ImageUrl="/Mona/img/logo1.png" AlternateText="My Image" Width="300px" />
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
       <div class="collapse navbar-collapse" id="navbarCollapse">
    <div class="navbar-nav ms-auto p-4 p-lg-0">
        <a href="/Habib/Home.aspx" class="nav-item nav-link active">Home</a>
        <a href="/Habib/AboutPage.aspx" class="nav-item nav-link">About Us</a>
        <a href="/Hani/Rooms.aspx" class="nav-item nav-link">Rooms</a>
        <a href="/Mona/StudentsBooks.aspx" class="nav-item nav-link">Books</a>
        <a href="/Habib/Contact.aspx" class="nav-item nav-link">Contact Us</a>
        <a href="/Suhaib/Loginpage.aspx" class="nav-item nav-link">LogOut</a>
    </div>
    <a href="/Sajeda/Profile.aspx" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block"><i class="fa fa-user"></i></a>
</div>
    </nav>
    <!-- Navbar End -->

    <form id="form1" runat="server">
        <div>
         <div class="container">
            <h2 class="text-center text-dark">Books history</h2>
            
            <table class="table table-striped mt-4">
                <thead>
                    <tr>
                        <th scope="col">Book ID</th>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">start Date</th>
                        <th scope="col">End Date</th>
                        <th scope="col">status</th>
                    </tr>
                </thead>
              <thbody id="bookhistory" runat="server">

              </thbody>
            </table>

          <%--  <div>
                <asp:Button ID="backbtn" runat="server" OnClick="backbtn_Click1" Text="Back" class="btn profile-button" />
            </div>--%>

             <div class="text-center mt-4">
                 <asp:Button ID="toBack" runat="server" OnClick="toBack_Click" Text="Back" class="btn profile-button" />
             </div>
        </div>

     </div>
    </form>

    
    
    <!-- Footer Start -->
<div class="foot container-fluid footer text-light pt-5 mt-5">
    <div class="container py-1">
        <div class="row g-5 justify-content-between">
            <div class="col-lg-3 col-md-6">
                <h4 class="mb-3">
                    <asp:Image ID="Image1" runat="server" ImageUrl="/Mona/Img/logo11.png" AlternateText="My Image" />
                </h4>
                <p>The Library Management System streamlines book borrowing, room reservations, and feedback management for students and administrators in a university library.</p>
            </div>
            <div class="col-lg-3 col-md-6">
                <h4>Contact</h4>
                <p><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                <p><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                <p><i class="fa fa-envelope me-3"></i>info@example.com</p>
                <div class="d-flex pt-2">
                    <a class="btn btn-social" href=""><i class="fab fa-twitter"></i></a>
                    <a class="btn btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-social" href=""><i class="fab fa-youtube"></i></a>
                    <a class="btn btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <h4>Quick Links</h4>
                         <a class="btn btn-link" href="/Habib/Home.aspx">Home</a>
      <a class="btn btn-link" href="/Habib/Contact.aspx">Contact Us</a>
      <a class="btn btn-link" href="/Mona/StudentsBooks.aspx">Books</a>
      <a class="btn btn-link" href="/Hani/Rooms.aspx">Rooms</a>
      <a class="btn btn-link" href="/Habib/AboutPage.aspx">About Us</a>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="copyright">
            <p>&copy; 2025 Horizon Library. All rights reserved. <a class="pfa" href="policy.aspx">Privacy Policy</a> | <a class="pfa" href="terms.aspx">Terms of Service</a></p>
        </div>
    </div>


</body>
</html>














