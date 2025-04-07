<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Group5.Habib.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <meta charset="utf-8">
    <title>Horizon Library</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="~\Habib\animates.css" rel="stylesheet">
      <link href="~\Habib\owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="~\Habib\bootstrap.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <style>

        :root {
    --primary: #06BBCC;
    --light: #F0FBFC;
    --dark: #181d38;
}
*{
    color: white;
}
body{
    margin: 0;
    font-family: "Heebo", sans-serif;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #52565b;
    background-color:#2C3E50;
    -webkit-text-size-adjust: 100%;
}
.btn
.fw-medium {
    font-weight: 600 !important;
}
        #ss {
            color: black !important;
        }





.fw-semi-bold {
    font-weight: 700 !important;
}

.back-to-top {
    position: fixed;
    display: none;
    right: 45px;
    bottom: 45px;
    z-index: 99;
}



/*** Spinner ***/
#spinner {
    opacity: 0;
    visibility: hidden;
    transition: opacity .5s ease-out, visibility 0s linear .5s;
    z-index: 99999;
}
#join{
    background-color: #F1C40F;
    color: black;
}
#join:hove{
    background-color: #2C3E50;
    color: #F1C40F;
    border: 1px solid white;
}
#spinner.show {
    transition: opacity .5s ease-out, visibility 0s linear 0s;
    visibility: visible;
    opacity: 1;
}


/*** Button ***/
.btn {
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


/*** Navbar ***/
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
    color: #F4F1DE !important;
    font-size: 15px;
    text-transform: uppercase;
    outline: none;
}

.navbar-light .navbar-nav .nav-link:hover,
.navbar-light .navbar-nav .nav-link.active {
    color:#F1C40F !important;
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


/*** Header carousel ***/
@media (max-width: 768px) {
    .header-carousel .owl-carousel-item {
        position: relative;
        min-height: 500px;
    }
    
    .header-carousel .owl-carousel-item img {
        position: absolute;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
}

.header-carousel .owl-nav {
    position: absolute;
    top: 83%;
    right: 8%;
    transform: translateY(-50%);
    display: flex;
}

.header-carousel .owl-nav .owl-prev,
.header-carousel .owl-nav .owl-next {
    margin: 7px 5px;
    width: 45px;
    height: 45px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #FFFFFF;
/*    background: transparent;*/
    background-color:black !important; 
    border: 1px solid #FFFFFF;
    font-size: 22px;
    transition: .5s;
}

.header-carousel .owl-nav .owl-prev:hover,
.header-carousel .owl-nav .owl-next:hover {
    background:#F1C40F !important;
    border-color: white !important;
}

/*owl Testmonial*/
        .owl-carousel .owl-nav button.owl-prev,
        .owl-carousel .owl-nav button.owl-next {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
/*            background-color: rgba(0, 0, 0, 0.5) !important;*/
            color: white !important;
            border: none;
            padding: 10px;
            font-size: 40px;
            line-height: 1;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .owl-carousel .owl-nav button.owl-prev:hover,
        .owl-carousel .owl-nav button.owl-next:hover {
            background-color: rgba(0, 0, 0, 0.8) !important;
        }

        .owl-carousel .owl-nav button.owl-prev {
            left: -50px;
        }

        .owl-carousel .owl-nav button.owl-next {
            right: -50px;
        }

/*owl Testmonial*/

.page-header {
    background: linear-gradient(rgba(24, 29, 56, .7), rgba(24, 29, 56, .7)), url(../img/carousel-1.jpg);
    background-position: center center;
    background-repeat: no-repeat;
    background-size: cover;
}

.page-header-inner {
    background: rgba(15, 23, 43, .7);
}

.breadcrumb-item + .breadcrumb-item::before {
    color: var(--light);
}


/*** Section Title ***/
.section-title {
    position: relative;
    display: inline-block;
    text-transform: uppercase;
    border:none;
    color:#F1C40F !important;
}

.section-title::before {
    position: absolute;
    content: "";
    width: calc(100% + 80px);
    height: 2px;
    top: 4px;
    left: -40px;
    background: #F1C40F;
    z-index: -1;
}

.section-title::after {
    position: absolute;
    content: "";
    width: calc(100% + 120px);
    height: 2px;
    bottom: 5px;
    left: -60px;
    background: #F1C40F;
    z-index: -1;
}

.section-title.text-start::before {
    width: calc(100% + 40px);
    left: 0;
}

.section-title.text-start::after {
    width: calc(100% + 60px);
    left: 0;
}

/*** Service ***/
.service-item {
    background: #F4F1DE;
    transition: .5s;
    color: black;
}

.service-item:hover {
    margin-top: -10px;
    background: var(--primary);
}

.service-item * {
    transition: .5s;
    color: black;
}

.service-item:hover  {
    background-color: #F1C40F !important;
}


/*** Categories & Courses ***/
.category img,
.course-item img {
    transition: .5s;
}

.category a:hover img,
.course-item:hover img {
    transform: scale(1.1);
}


/*** Team ***/
.team-item img {
    transition: .5s;
}

.team-item:hover img {
    transform: scale(1.1);
}


/*** Testimonial ***/
/* .testimonial-carousel::before {
    position: absolute;
    content: "";
    top: 0;
    left: 0;
    height: 100%;
    width: 0;
    background: linear-gradient(to right, rgba(255, 255, 255, 1) 0%, rgba(255, 255, 255, 0) 100%);
    z-index: 1;
} */

/* .testimonial-carousel::after {
    position: absolute;
    content: "";
    top: 0;
    right: 0;
    height: 100%;
    width: 0;
    background: linear-gradient(to left, rgba(255, 255, 255, 1) 0%, rgba(255, 255, 255, 0) 100%);
    z-index: 1;
} */

@media (min-width: 768px) {
    .testimonial-carousel::before,
    .testimonial-carousel::after {
        width: 200px;
    }
}

@media (min-width: 992px) {
    .testimonial-carousel::before,
    .testimonial-carousel::after {
        width: 300px;
    }
}

.testimonial-carousel .owl-item .testimonial-text,
.testimonial-carousel .owl-item.center .testimonial-text * {
    transition: .5s;
    background:#F4F1DE !important;
    color:black;
}

.testimonial-carousel .owl-item.center .testimonial-text {
    background:#F1C40F !important;
     color:black;
}

.testimonial-carousel .owl-item.center .testimonial-text * {
    color: black !important;
    background:#F1C40F !important;
}

.testimonial-carousel .owl-dots {
    margin-top: 24px;
    display: flex;
    align-items: flex-end;
    justify-content: center;
    
}

.testimonial-carousel .owl-dot {
    position: relative;
    display: inline-block;
    margin: 0 5px;
    width: 15px;
    height: 15px;
    border: 1px solid #CCCCCC;
    transition: .5s;
}

.testimonial-carousel .owl-dot.active {
    background:#F4F1DE !important;
    border-color: var(--primary);
}


/*** Footer ***/
.footer {
     background-color: #2C3E50 !important; / Same as navbar */
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
 p{
     color:#F4F1DE;
 }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg  navbar-light shadow sticky-top p-0">
        <a href="index.html" class="navbar-brand d-flex align-items-center">
              <asp:Image ID="Image2" runat="server" ImageUrl="Images/Screenshot_2025-01-31_020111-removebg-preview.png" AlternateText="My Image" Width="300px" />
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="Home.aspx" class="nav-item nav-link active">Home</a>
                <a href="/Habib/AboutPage.aspx" class="nav-item nav-link">About Us</a>
                <a href="/Hani/Rooms.aspx" class="nav-item nav-link">Rooms</a>
                <a href="/Mona/StudentsBooks.aspx" class="nav-item nav-link">Books</a>
                <a href="/Habib/Contact.aspx" class="nav-item nav-link">Contact Us</a>
                <a href="/Suhaib/Loginpage.aspx" class="nav-item nav-link">LogOut</a>
            </div>
            <a href="/Sajeda/Profile.aspx" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block"><i class="fa fa-user" style="font-size:25px"></i></a>
        </div>
    </nav>
    <!-- Navbar End -->


    <div class="container-fluid p-0 mb-5">
            <div class="owl-carousel owl-theme header-carousel">
                <div class="item">
                    <img class="img-fluid" src="https://i.pinimg.com/736x/e1/33/83/e1338392651c034c2789eb0871a8a140.jpg" alt="">
                    <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(24, 29, 56, .7);">
                        <div class="container">
                            <div class="row justify-content-start">
                                <div class="col-sm-10 col-lg-8">
                                    <h5 class="text-uppercase mb-3 animated slideInDown" style="color: #F1C40F;">Your Digital Library Hub</h5>
                                    <h1 class="display-3 text-white animated slideInDown">Smart University Library Management System</h1>
                                    <p class="fs-5 text-white mb-4 pb-2">Explore, Borrow, and Learn – All in One Place!</p>
                                    <a href="AboutPage.aspx" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft" style="border: solid 1px white;">Read More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img class="img-fluid" src="https://i.pinimg.com/736x/8f/2f/e3/8f2fe351847a82957dce973fe208f194.jpg" alt="">
                    <div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(24, 29, 56, .7);">
                        <div class="container">
                            <div class="row justify-content-start">
                                <div class="col-sm-10 col-lg-8">
                                    <h5 class="text-uppercase mb-3 animated slideInDown" style="color: #F1C40F;">Innovative Library Solutions for Modern Learning</h5>
                                    <h1 class="display-3 text-white animated slideInDown">Empowering Knowledge, Simplifying Access</h1>
                                    <p class="fs-5 text-white mb-4 pb-2">Your Gateway to a Smarter Library!</p>
                                    <a href="AboutPage.aspx" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft" style="border: solid 1px white;">Read More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <!-- Carousel End -->

      <!-- <a href="" class="btn btn-light py-md-3 px-md-5 animated slideInRight">Join Now</a>--> 

    <!-- Service Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="service-item text-center pt-3">
                        <div class="p-4">
                            <i class="fa fa-3x fa-graduation-cap text-primary mb-4" style="color:#2C3E50 !important;"></i>
                            <h5 class="mb-3"> Smart Catalog System</h5>
                            <p>Search for books instantly and access detailed information.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="service-item text-center pt-3">
                        <div class="p-4">
                            <i class="fa fa-3x fa-globe text-primary mb-4" style="color:#2C3E50 !important;"></i>
                            <h5 class="mb-3">Student & Faculty Access search</h5>
                            <p>A seamless experience tailored for university students.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="service-item text-center pt-3">
                        <div class="p-4">
                            <i class="fa fa-3x fa-home text-primary mb-4" style="color:#2C3E50 !important;"></i>
                            <h5 class="mb-3"> Advanced Search & Filters</h5>
                            <p>Find books by title, author, genre, or subject in seconds!</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                    <div class="service-item text-center pt-3">
                        <div class="p-4">
                            <i class="fa fa-3x fa-book-open text-primary mb-4" style="color:#2C3E50 !important;"></i>
                            <h5 class="mb-3">Book Reservation System</h5>
                            <p>"Reserve books in advance and pick them up when ready!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Service End -->


    <!-- About Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s" style="min-height: 400px;">
                    <div class="position-relative h-100">
                        <img class="img-fluid position-absolute w-100 h-100" src="https://i.pinimg.com/736x/62/ea/68/62ea685b4f8ce16214f60e0cf77d22d4.jpg" alt="" style="object-fit: cover;">
                    </div>
                </div>
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.3s">
                    <h6 class="section-title text-start text-primary pe-3"> Welcome to Horizon</h6>
                    <%--<h1 class="mb-4">Welcome to Horizon</h1>--%>
                    <p class="mb-4">At our University Library Management System, we believe in making knowledge accessible to everyone. Our platform seamlessly connects students and faculty with books, research materials, and digital resources, ensuring a smooth and efficient learning experience</p>
                    <p class="mb-4">We are committed to transforming university libraries into smart, efficient, and technology-driven hubs of knowledge. With advanced search features, automated borrowing, and digital access, we make learning more convenient than ever.</p>
                    <div class="row gy-2 gx-4 mb-4">
                        <div class="col-sm-6">
                            <p class="mb-0"><i class="fa fa-arrow-right text-warning me-2"></i>User-Friendly Interface</p>
                        </div>
                        <div class="col-sm-6">
                            <p class="mb-0"><i class="fa fa-arrow-right text-warning me-2"></i>Smart Search & Filtering</p>
                        </div>
                        <div class="col-sm-6">
                            <p class="mb-0"><i class="fa fa-arrow-right text-warning me-2"></i>Automated Borrow & Return System</p>
                        </div>
                        <div class="col-sm-6">
                            <p class="mb-0"><i class="fa fa-arrow-right text-warning me-2"></i>Online Book Search & Reservation </p>
                        </div>
                        <div class="col-sm-6">
                            <p class="mb-0"><i class="fa fa-arrow-right text-warning me-2"></i>24/7 Library Access</p>
                        </div>
                        <div class="col-sm-6">
                            <p class="mb-0"><i class="fa fa-arrow-right text-warning me-2"></i>International Certificate</p>
                        </div>
                    </div>
                    <a class="btn btn-primary py-3 px-5 mt-2" href="AboutPage.aspx" style="border: solid 1px white;">Read More</a>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->


    <!-- Categories Start -->
    <div class="container-xxl py-5 category">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title text-center text-primary px-3">Our Services</h6>
               <%-- <h1 class="mb-5">Our Services</h1>--%>
            </div>
            <div class="row g-3">
                <div class="col-lg-7 col-md-6">
                    <div class="row g-3">
                        <div class="col-lg-12 col-md-12 wow zoomIn" data-wow-delay="0.1s">
                            <a class="position-relative d-block overflow-hidden" href="">
                                <img class="img-fluid" src="https://i.pinimg.com/736x/8f/2f/e3/8f2fe351847a82957dce973fe208f194.jpg" alt="">
                                <div class=" text-center position-absolute bottom-0 end-0 py-2 px-3" style="margin: 1px;">
                                    <h5 class="m-0">Borrow Book</h5>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-6 col-md-12 wow zoomIn" data-wow-delay="0.3s">
                            <a class="position-relative d-block overflow-hidden" href="">
                                <img class="img-fluid" src="https://i.pinimg.com/736x/d8/32/99/d83299887c4bc4f3ba24e3c49261ffb1.jpg" alt="">
                                <div class=" text-center position-absolute bottom-0 end-0 py-2 px-3" style="margin: 1px;">
                                    <h5 class="m-0">Search Books</h5>
                                </div>
                            </a>
                        </div>
                        <div class="col-lg-6 col-md-12 wow zoomIn" data-wow-delay="0.5s">
                            <a class="position-relative d-block overflow-hidden" href="">
                                <img class="img-fluid" src="https://i.pinimg.com/736x/d2/41/6d/d2416db69fac9d882a8941c975bbee54.jpg" alt="">
                                <div class=" text-center position-absolute bottom-0 end-0 py-2 px-3" style="margin: 1px;">
                                    <h5 class="m-0">View Available Rooms</h5>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5 col-md-6 wow zoomIn" data-wow-delay="0.7s" style="min-height: 350px;">
                    <a class="position-relative d-block h-100 overflow-hidden" href="">
                        <img class="img-fluid position-absolute w-100 h-100" src="https://i.pinimg.com/736x/bf/a8/30/bfa830b9f4ded5e6e623faa9020ee664.jpg" alt="" style="object-fit: cover;">
                        <div class=" text-center position-absolute bottom-0 end-0 py-2 px-3" style="margin:  1px;">
                            <h5 class="m-0">Reserve a Room</h5>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- Team Start -->
    <%--<div class="container-xxl py-5">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title text-center text-primary px-3">Team</h6>
            </div>
            <div class="row g-4">
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="team-item bg-light">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="https://media.licdn.com/dms/image/v2/D4D03AQFDQci2ENoOIQ/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1719332925899?e=1744243200&v=beta&t=3B6W9yTHu--F5HvmQc60MQBcYT3k1_UBOyetHe6j98Y" alt="">
                        </div>
                        <div class="position-relative d-flex justify-content-center" style="margin-top: -23px;">
                            <div class="bg-light d-flex justify-content-center pt-2 px-1">
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                        <div class="text-center p-4">
                            <h5 class="mb-0">Hani Jarrah (Team Leader) </h5>
                            <small>Full stack web Development</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="team-item bg-light">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="https://media.licdn.com/dms/image/v2/D4D03AQG0q-yk5XQlaQ/profile-displayphoto-shrink_400_400/B4DZONLxgvHcAg-/0/1733240495884?e=1744243200&v=beta&t=1qPzsnWF6IpkoBRcaM5Y_XnGQ-F9I05NtVo4b6OImtE" alt="">
                        </div>
                        <div class="position-relative d-flex justify-content-center" style="margin-top: -23px;">
                            <div class="bg-light d-flex justify-content-center pt-2 px-1">
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                        <div class="text-center p-4">
                            <h5 class="mb-0">Suhaib Abu lail </h5>
                            <small>Full stack web Development</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="team-item bg-light">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="Images\woman (3).png" alt="">
                        </div>
                        <div class="position-relative d-flex justify-content-center" style="margin-top: -23px;">
                            <div class="bg-light d-flex justify-content-center pt-2 px-1">
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                        <div class="text-center p-4">
                            <h5 class="mb-0">mona tamimi</h5>
                            <small>Full stack web Development</small>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                    <div class="team-item bg-light">
                        <div class="overflow-hidden">
                            <img class="img-fluid" src="Images\woman (3).png" alt="">
                        </div>
                        <div class="position-relative d-flex justify-content-center" style="margin-top: -23px;">
                            <div class="bg-light d-flex justify-content-center pt-2 px-1">
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-sm-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                        <div class="text-center p-4">
                            <h5 class="mb-0">Sajeda Khasawneh(PO)</h5>
                            <small>Full stack web Development</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>--%>
    <!-- Team End -->


    <!-- Testimonial Start -->
    <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="text-center">
                <h6 class="section-title text-center text-primary px-3">Testimonial</h6>
               <%-- <h1 class="mb-5">Testimonial!</h1>--%>
            </div>
            <div class="owl-carousel testimonial-carousel position-relative">
                <div class="testimonial-item text-center">
                    <img class="rounded-circle p-2 mx-auto mb-3" src="https://i.pinimg.com/236x/b5/51/82/b55182df9efa010dea0e2558a9cf968a.jpg" style="width: 126px; height: 116px">
                    <h5 class="mb-0">Tariq</h5>
                    <p>Profession</p>
                    <div class="testimonial-text bg-light text-center p-4">
                        <p class="mb-0" id="ss">This library management system has simplified our operations and made it easier for both staff and patrons to find what they need.</p>
                    </div>
                </div>
                <div class="testimonial-item text-center">
                    <img class="rounded-circle p-2 mx-auto mb-3" src="https://i.pinimg.com/236x/b5/b3/05/b5b30504f47c108fea1943757c87b0a6.jpg" style="width: 126px; height: 116px">
                    <h5 class="mb-0">Nabil</h5>
                    <p>Profession</p>
                    <div class="testimonial-text bg-light text-center p-4">
                        <p class="mb-0" id="ss">This system has improved our patron experience immensely, making it easier for them to access resources and manage their accounts.</p>
                    </div>
                </div>
                <div class="testimonial-item text-center">
                    <img class=" rounded-circle p-2 mx-auto mb-3" src="https://i.pinimg.com/236x/d1/e3/59/d1e35928bb6a26c3433d2eb6b812ac8e.jpg" style="width: 126px; height: 116px">
                    <h5 class="mb-0">Rami</h5>
                    <p>Profession</p>
                    <div class="testimonial-text bg-light text-center p-4">
                        <p class="mb-0" id="ss">The comprehensive features of this library management system have streamlined everything from cataloging to circulation.</p>
                    </div>
                </div>
                <div class="testimonial-item text-center">
                    <img class=" rounded-circle p-2 mx-auto mb-3" src="https://i.pinimg.com/236x/0b/5c/d0/0b5cd0b51e431bbac4dffa331a3cbed5.jpg" style="width: 126px; height: 116px">
                    <h5 class="mb-0">Zayd</h5>
                    <p>Profession</p>
                    <div class="testimonial-text bg-light text-center p-4">
                            <p class="mb-0" id="ss">We're incredibly satisfied with this library management system – it's been a game-changer for our library.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Testimonial End -->
        

    <!-- Footer Start -->
<div class="foot container-fluid footer text-light pt-5 mt-5">
    <div class="container py-1">
        <div class="row g-5 justify-content-between" style="padding-bottom: 25px;">
            <div class="col-lg-3 col-md-6" style="margin-top:39px">
                <h4 class="mb-3">
			        <asp:Image ID="Image11" runat="server" ImageUrl="~/Mona/img/logo11.png" height="50px" AlternateText="My Image" />
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
                <a class="btn btn-link" href="Home.aspx">Home</a>
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
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    <script src="~\Habib\jojo.js"></script>
     <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="~\Habib\wow.js"></script>
    <script src="~\Habib\esting.js"></script>
    <script src="~\Habib\why.js"></script>
    <script src="~\Habib\owl.carousel.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
     <script>
         $(document).ready(function () {
             $(".owl-carousel").owlCarousel({
                 items: 1,
                 loop: true,
                 autoplay: true,
                 autoplayTimeout: 5000, // 5 seconds delay
                 autoplaySpeed: 1000, // 1 second transition speed
                 nav: true, // Enable navigation arrows
                 dots: false // Enable dots navigation
             });
         });
         $(document).ready(function () {
             // Header Carousel
             $(".header-carousel").owlCarousel({
                 items: 1,
                 loop: true,
                 autoplay: true,
                 autoplayTimeout: 5000,
                 autoplaySpeed: 1000,
                 nav: true,
                 dots: false
             });

             // Testimonial Carousel
             $(".testimonial-carousel").owlCarousel({
                 items: 1,
                 loop: true,
                 autoplay: true,
                 autoplayTimeout: 5000,
                 autoplaySpeed: 1000,
                 nav: true,
                 dots: false,
                 navText: [
                     '<i class="fa fa-chevron-left"></i>',
                     '<i class="fa fa-chevron-right"></i>'
                 ]
             });
         });
     </script>
</body>
</html>
