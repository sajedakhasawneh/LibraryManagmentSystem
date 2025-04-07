<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentsBooks.aspx.cs" Inherits="Group5.Mona.StudentsBooks" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student - Book List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            background-color: #2C3E50;
            color: #F4F1DE;
/*            font-family: Garamond;*/
        }

        .container {
            margin-top: 50px;
        }

        

        .card {
            background-color: #F4F1DE;
            color: #2C3E50;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }

            .card img {
                height: 200px;
                object-fit: cover;
            }

        .card-title {
            color: #F1C40F;
        }

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
                color: #F1C40F;
            }

        @media (max-width: 991.98px) {
            .navbar-light .navbar-nav .nav-link {
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

        .btn:hover {
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

        small {
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
        /* Footer Styling */
        .footer {
            background-color: #2C3E50 !important; /* Same as navbar */
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

        .btn-custom {
    background-color: #F1C40F;
    color: #2C3E50;
    border: none;
    font-weight: bold;
}

    .btn-custom:hover {
/*        background-color: #DEC55F;*/
        color: black;
        transform:scale(1.05);
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg  navbar-light shadow sticky-top p-0">
            <a href="index.html" class="navbar-brand d-flex align-items-center">
                <asp:Image ID="Image2" runat="server" ImageUrl="img/logo1.png" AlternateText="My Image" Width="300px" />
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
        <div class="container">
            <%--<h2 class="text-center">Student Book List</h2>--%>

            <div class="mb-3">
                <label for="txtSearch" class="form-label">Search by Book Name</label>
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-custom mt-2" OnClick="btnSearch_Click" />
            </div>

            <div class="row" id="bookCards" runat="server">
                <%-- Books will be dynamically inserted here --%>
            </div>
        </div>

        <!-- Borrow Modal -->
        <div id="borrowModal" class="modal fade" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Borrow Book</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="hiddenBookID" name="hiddenBookID" runat="server" />

                        <label for="borrowDate">Borrow Date:</label>
                        <asp:TextBox ID="txtBorrowDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>

                        <label for="returnDate">Return Date:</label>
                        <asp:TextBox ID="txtReturnDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnConfirmBorrow" runat="server" CssClass="btn btn-primary btn-custom" Text="Confirm Borrow" OnClick="btnConfirmBorrow_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Start -->
        <div class="foot container-fluid footer text-light pt-5 mt-5">
            <div class="container py-1">
                <div class="row g-5 justify-content-between">
                    <div class="col-lg-3 col-md-6">
                        <h4 class="mb-3">
                            <asp:Image ID="Image1" runat="server" ImageUrl="Img/logo11.png" AlternateText="My Image" />
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
            </div>


            <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <script>
                function openBorrowModal(bookID) {
                    document.getElementById('<%= hiddenBookID.ClientID %>').value = bookID;
                    var myModal = new bootstrap.Modal(document.getElementById('borrowModal'));
                    myModal.show();
                }
            </script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </form>
</body>
</html>

