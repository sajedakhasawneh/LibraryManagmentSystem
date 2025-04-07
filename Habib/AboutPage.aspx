<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutPage.aspx.cs" Inherits="Group5.Habib.AboutPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<title>About Page</title>
	<meta name="keywords" content="">
	<meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!--

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<!-- Bootstrap CSS
   ================================================== -->
	<link rel="stylesheet" href="~/Habib/css/bootstrap.min.css">

	<!-- Animate CSS
   ================================================== -->
	<link rel="stylesheet" href="~/Habib/css/animate.min.css">

	<!-- Font Icons
   ================================================== -->
	<link rel="stylesheet" href="~/Habib/css/font-awesome.min.css">
	<link rel="stylesheet" href="~/Habib/css/et-line-font.css">

	<!-- Nivo Lightbox CSS
   ================================================== -->
	<link rel="stylesheet" href="~/Habib/css/nivo-lightbox.css">
	<link rel="stylesheet" href="~/Habib/css/nivo_themes/default/default.css">

	<!-- Owl Carousel CSS
   ================================================== -->
   	<link rel="stylesheet" href="~/Habib/css/owl.theme.css">
	<link rel="stylesheet" href="~/Habib/css/owl.carousel.css">

	<!-- BxSlider CSS
   ================================================== -->
    <link rel="stylesheet" href="~/Habib/css/bxslider.css"/>

   	<!-- Main CSS
   	================================================== -->
	<link rel="stylesheet" href="~/Habib/css/style.css">

	<!-- Google web font
   ================================================== -->
	<link href='https://fonts.googleapis.com/css?family=Raleway:700' rel='stylesheet' type='text/css'>
	    <script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js">

    </script>
	<style>
		body {
			background-color: #2C3E50;
			    font-family: "Heebo", sans-serif;

		}

		#work .col-md-4 {
			display: block;
			width: 100%;
			border: 4px solid transparent;
			padding: 42px;
			transition: all 0.4s linear;
		}
		.form-control{
			color:white;
		}
		#btnSubmit{
			padding: 10px 28%;
			background-color: transparent;
			outline: none;
			border: 3px solid;
			transition: all 0.4s ease-in-out;
		}
		#btnSubmit:hover{
			border:3px solid #F1C40F;
			color:#F1C40F;
		}
		#work:hover .col-md-4:hover {
			border: 4px solid #F1C40F;
		}

		#sos {
			margin-top: 37px;
		}

		.rows {
			display: flex;
			justify-content: space-around;
		}

		.bx-thumbnail-wrapper {
			/* background-color: #161616; */
			text-align: center;
			margin-top: -1px;
			position: relative;
		}

		.site-slider {
			max-width: 100%; /* Set the maximum width of the slider */
			/*margin: 0 auto;*/ /* Center the slider */
		}

		/* Adjust the size of the slider images */
		.bxslider img {
			width: 80%; /* Ensure images fill the container */
			height: auto; /* Maintain aspect ratio */
		}

		/* Adjust the size of the thumbnail container */
		/*.bx-thumbnail-wrapper {
            max-width: 2000px;*/ /* Match the slider width */
		/*margin: 10px auto;*/ /* Center the thumbnails */
		/*}*/
		.bx-wrapper {
			height: 600px;
		}

		.bxslider img {
			width: 100%;
			height: 600px !important;
		}


		/* Adjust the size of the thumbnails */
		/*#bx-pager img {
            width: 60px;*/ /* Set thumbnail width */
		/*height: 40px;*/ /* Set thumbnail height */
		/*margin: 0 5px;*/ /* Add spacing between thumbnails */
		}
		/*** Footer ***/
		.footer {
			background-color: #2C3E50 !important;
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
			background-color: black;
			margin-top: 74px;
		}

		#contact .contact-detail {
			background: #ffffff;
			border: 4px solid #F1C40F;
			position: relative;
			top: 140px;
		}

			#contact .contact-detail .col-md-6:first-child {
				border-right: 4px solid #F1C40F;
			}

#contact input[type="submit"] {
    background: #000000 !important;
    border: 4px solid transparent !important;
    color: #ffffff !important;
    letter-spacing: 1px;
    margin-top: 18px;
    height: 58px;
}

			#contact input[type="submit"]:hover {
				border: 4px solid #F1C40F;
				color: black;
			}

		.section-title {
			border: 4px solid #fff;
			padding: 50px;
			position: relative;
			text-align: center;
			margin-bottom: 92px;
			color: #ffffff;
		}

		.heading {
			color: #F1C40F;
			font-size: 62px;
		}

		p {
			color: #fff;
			letter-spacing: 0.9px;
			line-height: 28px;
		}

		h3 {
			color: #F1C40F;
			letter-spacing: 1px;
		}
		.navbar {
			background-color:rgba(44, 62, 80, 0.9) !important;
		}
		#contact .contact-detail {
			background: transparent;
			border: 4px solid #F1C40F;
			position: relative;
			top: 140px;
		}

		.custom-navbar .navbar-brand {
			/* border: 4px solid #ffffff; */
			color: #ffffff;
			font-weight: 600;
			font-size: 24px;
			padding-top: 11px;
		}
		.custom-navbar {
    background:#425262;
    border: none;
    margin-bottom: 0;
    text-align: center;
}
		.bx-controls-direction a{
			background-color:#F1C40F;
		}
		.medium-icon{
			color:#F1C40F;
		}
		#contact .medium-icon{
			color:#F1C40F;
		}
		.foot{
			background-color:#2C3E50;
		}
	</style>
</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
    <form id="form1" runat="server">
        <div>
			
<!-- Preloader section
================================================== -->
<section  class="preloader">

	<div class="sk-rotating-plane"></div>

</section>


<!-- Navigation section
================================================== -->
<section class="navbar navbar-fixed-top custom-navbar" role="navigation">
	<div class="container">

		<div class="navbar-header">
			<button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="icon icon-bar"></span>
				<span class="icon icon-bar"></span>
				<span class="icon icon-bar"></span>
			</button>
			<asp:Image ID="Image11" runat="server" ImageUrl="~/Mona/img/logo11.png" height="50px" AlternateText="My Image" />
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/Habib/Home.aspx" class="smoothScroll">Home</a></li>
				<li><a href="/Mona/StudentsBooks.aspx" class="smoothScroll">Books</a></li>
				<li><a href="/Hani/Rooms.aspx" class="smoothScroll">Rooms</a></li>
				<li><a href="AboutPage.aspx" class="smoothScroll">About</a></li>
				<li><a href="/Habib/Contact.aspx" class="smoothScroll">Contact</a></li>
				<li><a href="/Suhaib/Loginpage.aspx" class="smoothScroll">Logout</a></li>
            <a href="/Sajeda/Profile.aspx" class="btn py-4  d-none d-lg-block"><i class="fa fa-user" style="font-size:30px;color:white"></i></a>
			</ul>
		</div>
	</div>
</section>


<!-- Homepage section
================================================== -->
<div id="home">
	<div class="site-slider">
        <ul class="bxslider">
			<li>
                <img src="Images\book-1052014_640.jpg" alt="slider image 1">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="slider-caption">
                                <h2>Streamline Your Library Operations</h2>
                                <p class="color-white">Horizon automates key tasks, freeing up your time to focus on what matters most: your community.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <img src="Images\teacup-7526022_1280.jpg" alt="slider image 2">
                <div class="container caption-wrapper">
                    <div class="slider-caption">
                        <h2>Empowering Libraries, Connecting Communities</h2>
                        <p class="color-white">Streamlining operations, enhancing patron experiences.</p>
                    </div>
                </div>
            </li>
            <li>
                <img src="https://i.pinimg.com/736x/81/90/18/819018c69f3ac3284b58b0d976f2fe10.jpg" alt="slider image 3">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="slider-caption">
                                <h2>The Future of Library Management</h2>
                                <p class="color-white">Modern solutions for the modern library.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <img src="Images\_Some books are so familiar that reading them is like returning home again__ Jo March, Little Women.jpg" alt="slider image 4">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="slider-caption">
                                <h2> Library Management, Simplified</h2>
                                <p class="color-white">Your all-in-one solution for efficient library management.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <img src="https://i.pinimg.com/736x/c3/38/12/c33812e6d9cb3bb117543a2c438b0fe3.jpg" alt="slider image 5">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="slider-caption">
                                <h2>Enhancing the Library Experience</h2>
                               <p class="color-white">Providing seamless access to resources and fostering lifelong learning.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
        </ul> <!-- /.bxslider -->
        <div class="bx-thumbnail-wrapper" style="background-color:transparent">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div id="bx-pager">
                            <a data-slide-index="0" href=""><img src="https://i.pinimg.com/736x/4f/39/c0/4f39c03cdcb6ad5874713184664aaec7.jpg" alt="thumbnail 1" / height="15"></a>
                            <a data-slide-index="1" href=""><img src="https://i.pinimg.com/736x/4f/39/c0/4f39c03cdcb6ad5874713184664aaec7.jpg" alt="thumbnail 2" / height="15"></a>
                            <a data-slide-index="2" href=""><img src="https://i.pinimg.com/736x/4f/39/c0/4f39c03cdcb6ad5874713184664aaec7.jpg" alt="thumbnail 3" / height="15"></a>
                            <a data-slide-index="3" href=""><img src="https://i.pinimg.com/736x/4f/39/c0/4f39c03cdcb6ad5874713184664aaec7.jpg" alt="thumbnail 4" / height="15"></a>
                            <a data-slide-index="4" href=""><img src="https://i.pinimg.com/736x/4f/39/c0/4f39c03cdcb6ad5874713184664aaec7.jpg" alt="thumbnail 5" / height="15"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- /.site-slider -->
</div>


<!-- Work section
================================================== -->
<section id="work" class="parallax-section">
	<div class="container">
		<div class="row">

			<!-- Section title
			================================================== -->
			<div class="col-md-offset-2 col-md-8 col-sm-offset-2 col-sm-8">
				<div class="section-title">
					<h5 class="wow bounceIn">Horizon Library</h5>
					<h1 class="heading">WHAT WE DO</h1>
					<hr>
					<p>Horizon automates library workflows, freeing up staff time and providing patrons with a seamless search and borrowing experience.</p>
				</div>
			</div>


			<!-- Work Owl Carousel section
			================================================== -->
			<div id="owl-work" class="owl-carousel">

				<div class="item col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
					<i class="fa-solid fa-magnifying-glass medium-icon"></i>
						<h3>Search for Books</h3>
						<hr>
						<p>Find books quickly and easily using book ID or book name. This streamlines the book discovery process.</p>
				</div>

				<div class="item col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="0.6s">
					<i class="fa-solid fa-book medium-icon"></i>
						<h3>Borrow Books</h3>
						<hr>
						<p>Borrow available books directly through the system. This automates the borrowing process and provides a record of borrowed items.</p>
				</div>

				<div class="item col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="0.9s">
					<i class="fa-solid fa-star medium-icon"></i>
						<h3>Reserve Meeting Rooms</h3>
						<hr>
						<p>View available meeting rooms and reserve them for a fixed 2-hour duration. This allows students to plan and book study spaces in advance.</p>
				</div>

				<div class="item col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="0.9s">
					<i class="fa-solid fa-comment medium-icon"></i>
						<h3>Provide Feedback</h3>
						<hr>
						<p>Submit feedback about library services. This gives students a voice and helps the library improve its offerings.</p>
				</div>

				<div class="item col-md-4 col-sm-6 wow fadeInUp" data-wow-delay="0.9s">
					<i class="fa-solid fa-star medium-icon"></i>
						<h3>Manage Profile</h3>
						<hr>
						<p>View and edit personal details (name, email, phone number, profile picture, etc.). This allows students to keep their information up-to-date.</p>
				</div>

			</div>

		</div>
	</div>
</section>


<!-- About section
================================================== -->
<section id="about" class="parallax-section">
	<div class="container">
		<div class="row">

			<!-- Section title
			================================================== -->
			<div class="col-md-offset-2 col-md-8 col-sm-offset-2 col-sm-8">
				<div class="section-title">
					<h1 class="heading color-black">WHO WE ARE</h1>
					<hr>
					<p class="color-black">We're driven by innovation. Horizon is built on cutting-edge technology to provide a seamless and efficient library management experience."</p>
				</div>
			</div>

			<div class="col-md-6 col-sm-12">
				<h3 class="color-black">OUR STORY</h3>
				<h2>ADVENTURE STUDIO</h2>
				<p class="color-black">We're driven by innovation. Horizon is built on cutting-edge technology to provide a seamless and efficient library management experience."</p>
			</div>

			<div class="col-md-6 col-sm-12">
				<h2 class="mobile-top">WHY CHOOSE US?</h2>
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

  					<div class="panel panel-default">
   						<div class="panel-heading" role="tab" id="headingOne">
      						<h4 class="panel-title">
        						<a role="button" data-toggle="collapse"style="background-color:#F4F1DE; color:#2C3E50;" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          							Horizon began with a simple idea
        						</a>
      						</h4>
    					</div>
   						<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      						<div class="panel-body" style="background-color:#F4F1DE; color:#2C3E50;" >
        						<p style="background-color:#F4F1DE; color:#2C3E50;">We saw a need for a modern, intuitive library management system, and that's how Horizon</p>
      						</div>
   						 </div>
 					 </div>

    				<div class="panel panel-default">
   						<div class="panel-heading" role="tab" id="headingTwo" style="background-color:#F4F1DE; color:#2C3E50;">
      						<h4 class="panel-title">
        						<a role="button" data-toggle="collapse" style="background-color:#F4F1DE; color:#2C3E50;" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          							High Quality Team
        						</a>
      						</h4>
    					</div>
   						<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      						<div class="panel-body">
        						<p>Our team comprises experienced software developers, library science professionals, and user experience experts.</p>
      						</div>
   						 </div>
 					 </div>

 					 <div class="panel panel-default" style="background-color:#F4F1DE; color:#2C3E50;">
   						<div class="panel-heading" role="tab" id="headingThree">
      						<h4 class="panel-title">
        						<a role="button" data-toggle="collapse" style="background-color:#F4F1DE; color:#2C3E50;" data-parent="#accordion" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
          							Software Development Expertise
        						</a>
      						</h4>
    					</div>
   						<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      						<div class="panel-body">
        						<p>Our team's software development expertise spans the full spectrum of the development lifecycle, encompassing everything from crafting elegant and user-friendly front-end interfaces to building robust and scalable back-end systems.  We're proficient in a wide range of technologies, including [list key technologies/languages, e.g., JavaScript, React, Python, Java, SQL], allowing us to tailor our approach to the specific needs of each project.</p>
      						</div>
   						 </div>
 					 </div>
 				 </div>
			</div>
		</div>
	</div>
</section>


<!-- team section
================================================== -->
<!-- Plan section
================================================== -->

<!-- Contact section
================================================== -->
<section id="contact" class="parallax-section">
	<div class="container">
		<div class="row">

			<!-- Section title
			================================================== -->
			<div class="col-md-offset-2 col-md-8 col-sm-offset-2 col-sm-8">
				<div class="section-title">
					<h5 class="wow bounceIn">PLAN YOUR TRIP</h5>
					<h1 class="heading">CONTACT US</h1>
					<hr>
					<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla. Excepteu sunt in culpa qui officia deserunt mollit.</p>
				</div>
			</div>

			<!-- Contact form section
			================================================== -->
			<div class="col-md-offset-1 col-md-10 col-sm-12" style="color:white;">
				<form action="#" method="post" class="wow fadeInUp" data-wow-delay="0.6s">
					<div class="col-md-4 col-sm-6">
						<input type="text" class="form-control" placeholder="Name" name="name" id="name">
					</div>
					<div class="col-md-4 col-sm-6">
						<input type="email" class="form-control" placeholder="Email" name="email" id="email">
					</div>
					<div class="col-md-4 col-sm-12">
						<input type="text" class="form-control" placeholder="Subject" name="subject" id="subject">
					</div>
					<div class="col-md-12 col-sm-12">
						<textarea class="form-control" placeholder="Message" rows="7" name"message" id="message"></textarea>
					</div>
					<div class="col-md-offset-2 col-md-8 col-sm-offset-2 col-sm-8">
					       <button type="button" id="btnSubmit" onclick="sendEmail()">Send</button>
					</div>
				</form>
			</div>

			<!-- Contact detail section
			================================================== -->
			<div class="contact-detail col-md-12 col-sm-12">
				<div class="col-md-6 col-sm-6">
					<h3><i class="icon-envelope medium-icon wow bounceIn" data-wow-delay="0.6s"></i> EMAIL</h3>
					<p>Habeeb.alafeef6@gmail.com</p>
				</div>
				<div class="col-md-6 col-sm-6">
					<h3><i class="icon-phone medium-icon wow bounceIn" data-wow-delay="0.6s"></i> PHONES</h3>
					<p>077885555558</p>
				</div>
			</div>

		</div>
	</div>
</section>


<!-- Footer section
================================================== -->
<div class="foot container-fluid footer pt-5 mt-5">
    <div class="containers py-1">
        <div class="rows">
            <div class="col-lg-3 col-md-10">
                <h4>
                    <asp:Image ID="Image1" runat="server" ImageUrl="Images/Screenshot_2025-01-31_020111-removebg-preview.png" AlternateText="My Image" />
                </h4>
                <p>The Library Management System streamlines book borrowing, room reservations, and feedback management for students and administrators in a university library.</p>
            </div>
            <div class="col-lg-3 col-md-6" id="sos">
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
            <div class="col-lg-3 col-md-6" id="sos">
                <h4>Quick Links</h4>
                <a class="btn btn-link" href="/Habib/Home.aspx">Home</a>
                <a class="btn btn-link" href="/Habib/Contact.aspx">Contact Us</a>
                <a class="btn btn-link" href="/Mona/StudentsBooks.aspx">Books</a>
                <a class="btn btn-link" href="/Hani/Rooms.aspx">Rooms</a>
                <a class="btn btn-link" href="AboutPage.aspx">About Us</a>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="copyright">
            <p>&copy; 2025 Horizon Library. All rights reserved. <a class="pfa" href="policy.aspx">Privacy Policy</a> | <a class="pfa" href="terms.aspx">Terms of Service</a></p>
        </div>
    </div>
</div>
        </div>
    </form>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/smoothscroll.js"></script>
<script src="js/nivo-lightbox.min.js"></script>
<script src="js/jquery.easing-1.3.js"></script>
<script src="js/plugins.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.parallax.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/custom.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
<script>
    (function () {
        emailjs.init("ak8XwcvPwPsxFSSIU");
    })();

    const menuToggle = document.querySelector('.menu-toggle');
    const navUl = document.querySelector('nav ul');

    menuToggle.addEventListener('click', () => {
        navUl.classList.toggle('active');
    });
    (function () {
        emailjs.init("ak8XwcvPwPsxFSSIU");
    })();
    function sendEmail() {
        const parms = {
            name: document.getElementById("name").value,
            email: document.getElementById("email").value,
            subject: document.getElementById("subject").value,
            message: document.getElementById("message").value,
        };
        console.log("Form Data:", parms);
        const serviceid = "service_kwvtdxr";
        const templateid = "template_c3k59vb";
        emailjs.send(serviceid, templateid, parms)
            .then(function (response) {
                console.log("EmailJS Response:", response);
                if (response.status === 200) {
                    alert("Email sent successfully!");
                } else {
                    alert("Failed to send the email. Please try again.");
                }
            }, function (error) {
                console.error("EmailJS error:", error);
                alert("Failed to send the email. Please try again.");
            });
    }
</script>
</body>
</html>
