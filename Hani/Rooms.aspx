<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rooms.aspx.cs" Inherits="Group5.Hani.Rooms" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rooms</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">



    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


    <style>
        .btn {
            border-radius: 19px;
            transition: all 0.3s ease-in-out;
        }

        body {
            background-color:#2C3E50;
            color: white;
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

        .btn {
            border-radius: 19px;
            transition: all 0.3s ease-in-out;
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

        .card {
            border: none;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            height: 100%;
            background-color: white;
            border-radius: 15px;
            transition: transform 0.3s ease-in-out;
        }

            .card:hover {
                transform: scale(1.05);
            }

        .card-img-top {
            height: 200px;
            object-fit: cover;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }

        .card-title {
            font-weight: bold;
            font-size: 1.2rem;
        }

        .time-picker-panel {
            display: none;
            opacity: 0;
            transition: opacity 0.3s ease-in-out;
        }

            .time-picker-panel.open {
                display: block;
                opacity: 1;
            }

        .btn {
            transition: all 0.3s ease-in-out;
        }

            .btn:hover {
                transform: translateY(-3px);
            }

        .status-label {
            padding: 8px 12px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: bold;
            text-align: center;
            display: inline-block;
        }

        .status-available {
            background-color: #28a745;
            color: white;
        }

        .status-pending {
            background-color: #ffc107;
            color: black;
        }

        .status-reserved {
            background-color: #d5db7b;
            color: white;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg  navbar-light shadow sticky-top p-0">
            <a href="index.html" class="navbar-brand d-flex align-items-center">
                <asp:Image ID="Image2" runat="server" ImageUrl="\Habib\Images\Screenshot_2025-01-31_020111-removebg-preview.png" AlternateText="My Image" Width="300px" />
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
        <div class="container my-4">
            <h2 class="text-center mb-4">Available Rooms</h2>
            <div class="row">
                <asp:Repeater ID="rptRooms" runat="server" OnItemDataBound="rptRooms_ItemDataBound">
                    <ItemTemplate>
                        <div class="col-md-4 col-sm-6 mb-4">
                            <div class="card h-100">
                                <img src='<%# Eval("Image") %>' class="card-img-top" alt="Room Image" onerror="this.src='/Uploads/default-placeholder.png';" />
                                <div class="card-body d-flex flex-column">
                                    <h5 class="card-title"><%# Eval("Name") %></h5>
                                    <p class="card-text">Capacity: <%# Eval("Capacity") %></p>
                                    <p class="card-text"><%# Eval("Description") %></p>

                                    <asp:Label ID="lblStatus" runat="server" CssClass='<%# "status-label " + (Eval("Status").ToString() == "Available" ? "status-available" : Eval("Status").ToString() == "Pending" ? "status-pending" : "status-reserved") %>' Text='<%# Eval("Status") %>'></asp:Label>

                                    <%--                 <asp:Button ID="btnReserve" runat="server" Text="Reserve" CssClass="btn btn-primary mt-auto"
    CommandArgument='<%# Eval("ID") %>'
    Enabled='<%# Eval("Status").ToString() != "Reserved" %>'
    OnClientClick="toggleTimePicker(this); return false;" />--%>
                                    <asp:Button ID="btnReserve" runat="server" Text="Reserve" CssClass="btn btn-primary mt-auto"
                                        CommandArgument='<%# Eval("ID") %>'
                                        Enabled='<%# Eval("Status").ToString() == "Available" %>'
                                        OnClientClick="toggleTimePicker(this); return false;" />



                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel Reservation" CssClass="btn btn-danger mt-2"
                                        Visible='<%# Eval("Status").ToString() == "Reserved" || Eval("Status").ToString() == "Cancel Pending" %>'
                                        Enabled='<%# Eval("Status").ToString() != "Cancel Pending" %>'
                                        CommandArgument='<%# Eval("ID") %>'
                                        OnClientClick="return confirmCancel();" OnClick="btnCancelReservation_Click" />

                                    <asp:Panel ID="pnlTimePicker" runat="server" CssClass="mt-3 time-picker-panel">
                                        <label for="txtDatePicker">Select Date:</label>
                                        <asp:TextBox ID="txtDatePicker" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>

                                        <label for="ddlStartTime">Select Start Time:</label>
                                        <asp:DropDownList ID="ddlStartTime" runat="server" CssClass="form-select"></asp:DropDownList>

                                        <asp:Button ID="btnConfirmReserve" runat="server" Text="Confirm Reservation" CssClass="btn btn-success mt-2"
                                            CommandArgument='<%# Eval("ID") %>'
                                            OnClick="btnConfirmReserve_Click" />
                                    </asp:Panel>

                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>






        <!-- Footer Start -->
        <div class="foot container-fluid footer text-light pt-5 mt-5">
            <div class="container py-1">
                <div class="row g-5 justify-content-between">
                    <div class="col-lg-3 col-md-6">
                        <h4 class="mb-3">
                            <asp:Image ID="Image1" runat="server" ImageUrl="\Mona\img\logo11.png" AlternateText="My Image" />
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
    </form>

    <script>
        function toggleTimePicker(button) {
            document.querySelectorAll('.time-picker-panel').forEach(panel => {
                if (panel !== button.closest('.card').querySelector('.time-picker-panel')) {
                    panel.classList.remove('open');
                }
            });
            var panel = button.closest('.card').querySelector('.time-picker-panel');
            panel.classList.toggle('open');
        }

        function confirmCancel() {
            return confirm("Are you sure you want to cancel this reservation? This will require admin approval.");
        }
    </script>
</body>
</html>
