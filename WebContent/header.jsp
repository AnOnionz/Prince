<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="zxx">
<!--<![endif]-->

<head>
<!-- Basic metas
    	======================================== -->
<meta charset="utf-8">
<meta name="author" content="">
<meta name="description" content="">
<meta name="keywords" content="">
<!-- Mobile specific metas
    	======================================== -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title></title>
<!-- links for favicon
    	======================================== -->

<!-- Icon fonts
    	======================================== -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,500i,700,700i,900"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="assets/css/fontawesome-all.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/iconfont.css">
<!-- css links
    	======================================== -->
<!-- Bootstrap link -->
<link rel="stylesheet" type="text/css"
	href="assets/css/vendor/bootstrap.min.css">
<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="assets/css/vendor/owl.carousel.min.css">
<!-- Magnific popup -->
<link rel="stylesheet" type="text/css"
	href="assets/css/vendor/magnific-popup.css">
<!-- Animate css -->
<link rel="stylesheet" type="text/css"
	href="assets/css/vendor/animate.css">

<!-- Custom css -->
<link rel="stylesheet" type="text/css" href="assets/css/style.css">
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Roboto|Taviraj&display=swap');
.containerdangtin {
  width: auto;
  margin: auto;
}
a {
  
  text-decoration: none;
  font-weight: 700;
}
@keyframes top {
  from {
    transform: translate(0rem, 0);
  }
  to {
    transform: translate(0rem, 3.5rem);
  }
}
@keyframes bottom {
  from {
    transform: translate(-11.5rem, 0);
  }
  to {
    transform: translate(0rem, 0);
  }
}
.dangtin {
  position: relative;
  letter-spacing: 0.15em;
  margin: 0 auto;
  font-size:1.6rem;
  padding: 1rem 2.5rem;
  background: transparent;
  outline: none;
  color: #121213;
  transition: all 0.5s cubic-bezier(0.68, -0.55, 0.265, 1.55) 0.15s;
}
.dangtin::after, .dangtin::before {
  content: "";
  position: absolute;
  height: 40%;
  width: 10%;
  transition: all 0.5s cubic-bezier(0.68, -0.55, 0.265, 1.55);
  z-index: -2;
  border-radius: 50%;
}
.dangtin::before {
  background-color: #c92918;
  top: -0.75rem;
  left: 0.5rem;
  animation: top 2s cubic-bezier(0.68, -0.55, 0.265, 1.55) 0.25s infinite alternate;
}
.dangtin::after {
  background-color: #e74c3c;
  top: 3rem;
  left: 13rem;
  animation: bottom 2s cubic-bezier(0.68, -0.55, 0.265, 1.55) 0.5s infinite alternate;
}
.dangtin:hover {
  color: white;
}
.dangtin:hover::before, .dangtin:hover::after {
  top: 0;
  height: 100%;
  width: 100%;
  border-radius: 0;
  animation: none;
}
.dangtin:hover::after {
  left: 0rem;
}
.dangtin:hover::before {
  top: 0.5rem;
  left: 0.35rem;
}

</style>
</head>

<body>
	<!--[if lte IE 9]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
    <![endif]-->
	<!-- 	<div class="subscribe-popup"> -->
	<!-- 		<div class="subscribe-popup-inner"> -->
	<!-- 			<div class="close-popup"> -->
	<!-- 				<i class="fal fa-times"></i> -->
	<!-- 			</div> -->
	<!-- 			<div class="row no-gutters"> -->
	<!-- 				<div class="col-lg-6"> -->
	<!-- 					<div class="img-container"> -->
	<!-- 						<img src="assets/images/subscribe-popup-img.jpg" alt="subscribe img"> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<!-- 				End of .col-lg-6 -->
	<!-- 				<div class="col-lg-6"> -->
	<!-- 					<div class="newsletter-widget weekly-newsletter bg-grey-light-three"> -->
	<!-- 						<div class="newsletter-content"> -->
	<!-- 							<div class="newsletter-icon"> -->
	<!-- 								<i class="feather icon-send"></i> -->
	<!-- 							</div> -->
	<!-- 							<div class="section-title"> -->
	<!-- 								<h3 class="axil-title">Subscribe To Our Weekly Newsletter</h3> -->
	<!-- 								<p class="mid m-t-xs-10 m-b-xs-20">No spam, notifications only about new -->
	<!-- 									products, -->
	<!-- 									updates.</p> -->
	<!-- 							</div> -->
	<!-- 							End of .section-title -->
	<!-- 							<div class="subscription-form-wrapper"> -->
	<!-- 								<form action="#" class="subscription-form"> -->
	<!-- 									<div class="form-group form-group-small m-b-xs-20"> -->
	<!-- 										<label for="subscription-email">Enter Email Address</label> -->
	<!-- 										<input type="text" name="subscription-email" id="subscription-email"> -->
	<!-- 									</div> -->
	<!-- 									<div class="m-b-xs-0"> -->
	<!-- 										<button class="btn btn-primary btn-small">SUBSCRIBE</button> -->
	<!-- 									</div> -->
	<!-- 								</form> -->
	<!-- 								End of .subscription-form -->
	<!-- 							</div> -->
	<!-- 							End of .subscription-form-wrapper -->
	<!-- 						</div> -->
	<!-- 						End of .newsletter-content -->
	<!-- 					</div> -->
	<!-- 					End of .newsletter-widget -->
	<!-- 				</div> -->
	<!-- 				End of .col-lg-6 -->
	<!-- 			</div> -->
	<!-- 			<!-- End of .row -->
	<!-- 		</div> -->
	<!-- 		<!-- End of .subscribe-popup-inner -->
	<!-- 	</div> -->
	<!-- End of .subscribe-popup -->
	<!-- Main contents
	================================================ -->

	<!-- End of .side-nav -->
	<!-- Header starts -->
	<header class="page-header">
		<!-- End of .header-top -->
		<nav class="navbar bg-white">
			<div class="container">
				<div class="navbar-inner">
					<div class="brand-logo-container">
						<a href="index.jsp"> <img src="assets/images/prince.png"
							alt="" class="brand-logo">
						</a>
					</div>
					<!-- End of .brand-logo-container -->
					<div class="main-nav-wrapper">
						<ul class="main-navigation list-inline" id="main-menu">
							<li><a href="business.jsp">kinh Tế</a></li>
							<li><a href="lifestyle.jsp">đời sống</a></li>
							<li><a href="technology.jsp">công nghệ</a></li>
							<li><a href="sports.jsp">thể thao</a></li>
							<li class="has-dropdown"><a href="#">khác</a>
								<ul class="submenu">
									<li><a href="error-404.jsp">404 Error</a></li>
									<li><a href="under-construction.jsp">Coming Soon</a></li>
									<li><a href="about-us.jsp">About Us</a></li>
									<li><a href="team.jsp">Team</a></li>
									<li><a href="contact.jsp">Contact fUs</a></li>
								</ul> <!-- End of .submenu --></li>
								<li><div class="containerdangtin"><a class="dangtin" href="editcontent.jsp">đăng tin</a></div>
						<!-- End of .main-navigation -->
					</div>
					<!-- End of .main-nav-wrapper -->
					<div class="navbar-extra-features ml-auto">
					<i class="far fa-user"></i>
						
					</div>
					<!-- End of .navbar-extra-features -->
					<div class="main-nav-toggler d-block d-lg-none"
						id="main-nav-toggler">
						<div class="toggler-inner">
							<span></span> <span></span> <span></span>
						</div>
					</div>
					<!-- End of .main-nav-toggler -->
				</div>
				<!-- End of .navbar-inner -->
			</div>
			<!-- End of .container -->
		</nav>
		<!-- End of .navbar -->
	</header>
	<!-- End of .page-header -->
	<!-- End of .main-content -->
	<!-- Javascripts
    	======================================= -->
	<!-- jQuery -->
	<script src="assets/js/vendor/jquery.min.js"></script>
	<script src="assets/js/vendor/jquery-migrate.min.js"></script>
	<!-- jQuery Easing Plugin -->
	<script src="assets/js/vendor/easing-1.3.js"></script>
	<!-- Waypoints js -->
	<script src="assets/js/vendor/jquery.waypoints.min.js"></script>
	<!-- Owl Carousel JS -->
	<script src="assets/js/vendor/owl.carousel.min.js"></script>
	<!-- Slick Carousel JS -->
	<script src="assets/js/vendor/slick.min.js"></script>
	<!-- Bootstrap js -->
	<script src="assets/js/vendor/bootstrap.bundle.min.js"></script>
	<script src="assets/js/vendor/isotope.pkgd.min.js"></script>
	<!-- Counter up js -->
	<script src="assets/js/vendor/jquery.counterup.js"></script>
	<!-- Magnific Popup js -->
	<script src="assets/js/vendor/jquery.magnific-popup.min.js"></script>
	<!-- Nicescroll js -->
	<script src="assets/js/vendor/jquery.nicescroll.min.js"></script>
	<!-- IF ie -->
	<script src="https://cdn.jsdelivr.net/npm/css-vars-ponyfill@2"></script>
	<!-- Plugins -->
	<script src="assets/js/plugins.js"></script>
	<!-- Custom Script -->
	<script src="assets/js/main.js"></script>
</body>
</html>