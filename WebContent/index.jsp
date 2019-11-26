<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="utf-8">
  <title>NewBiz Bootstrap Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="assets/css/vendor/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="assets/css/font-awesome.min.css" rel="stylesheet">
  <link href="assets/css/vendor/animate.min.css" rel="stylesheet">
  <link href="assets/css/ionicons.min.css" rel="stylesheet">
  <link href="assets/css/vendor/owl.carousel.min.css" rel="stylesheet">
	<style type="text/css">
	/*
  Theme Name: NewBiz
  Theme URL: https://bootstrapmade.com/newbiz-bootstrap-business-template/
  Author: BootstrapMade.com
  License: https://bootstrapmade.com/license/
*/

/*--------------------------------------------------------------
# General
--------------------------------------------------------------*/

body {
  background: #fff;
  color: #444;
  font-family: "Open Sans", sans-serif;
}

a {
  color: #007bff;
  transition: 0.5s;
}

a:hover,
a:active,
a:focus {
  color: #0b6bd3;
  outline: none;
  text-decoration: none;
}

p {
  padding: 0;
  margin: 0 0 30px 0;
}

h1,
h2,
h3,
h4,
h5,
h6 {
  font-family: "Montserrat", sans-serif;
  font-weight: 400;
  margin: 0 0 20px 0;
  padding: 0;
}

/* Back to top button */

.back-to-top {
  position: fixed;
  display: none;
  background: #007bff;
  color: #fff;
  width: 44px;
  height: 44px;
  text-align: center;
  line-height: 1;
  font-size: 16px;
  border-radius: 50%;
  right: 15px;
  bottom: 15px;
  transition: background 0.5s;
  z-index: 11;
}

.back-to-top i {
  padding-top: 12px;
  color: #fff;
}

/* Prelaoder */

#preloader {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 9999;
  overflow: hidden;
  background: #fff;
}

#preloader:before {
  content: "";
  position: fixed;
  top: calc(50% - 30px);
  left: calc(50% - 30px);
  border: 6px solid #f2f2f2;
  border-top: 6px solid #007bff;
  border-radius: 50%;
  width: 60px;
  height: 60px;
  -webkit-animation: animate-preloader 1s linear infinite;
  animation: animate-preloader 1s linear infinite;
}

@-webkit-keyframes animate-preloader {
  0% {
    -webkit-transform: rotate(0deg);
    transform: rotate(0deg);
  }

  100% {
    -webkit-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}

@keyframes animate-preloader {
  0% {
    -webkit-transform: rotate(0deg);
    transform: rotate(0deg);
  }

  100% {
    -webkit-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}

/*--------------------------------------------------------------
# Header
--------------------------------------------------------------*/

#header {
 
  transition: all 0.5s;
  z-index: 997;
  transition: all 0.5s;
  padding: 10px 0;
  background: linear-gradient(to right, #0cebeb, #20e3b2, #29ffc6); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */ center bottom no-repeat;
  box-shadow: 0px 0px 30px rgba(127, 137, 161, 0.3);
}

#header.header-scrolled,
#header.header-pages {
  height: 60px;
  padding: 10px 0;
}

#header .logo h1 {
  font-size: 36px;
  margin: 0;
  padding: 0;
  line-height: 1;
  font-weight: 400;
  letter-spacing: 3px;
  text-transform: uppercase;
}

#header .logo h1 a,
#header .logo h1 a:hover {
  color: #00366f;
  text-decoration: none;
}

#header .logo img {
  padding: 0;
  max-height: 34px;
}

.main-pages {
  margin-top: 60px;
}

/*--------------------------------------------------------------
# Intro Section
--------------------------------------------------------------*/

#intro {
  width: 100%;
  position: relative;
  background: linear-gradient(to right, #0cebeb, #20e3b2, #29ffc6); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */ center no-repeat;
  background-size: cover;
  padding: 200px 0 120px 0;
}

#intro .intro-img {
  width: 50%;
  float: right;
}

#intro .intro-info {
  width: 50%;
  float: left;
}

#intro .intro-info h2 {
  color: #fff;
  margin-bottom: 40px;
  font-size: 40px;
  font-weight: 700;
}

#intro .intro-info h2 span {
  color: #74b5fc;
  text-decoration: underline;
}

#intro .intro-info .btn-get-started,
#intro .intro-info .btn-services {
  font-family: "Montserrat", sans-serif;
  font-size: 14px;
  font-weight: 600;
  letter-spacing: 1px;
  display: inline-block;
  padding: 10px 32px;
  border-radius: 50px;
  transition: 0.5s;
  margin: 0 20px 20px 0;
  color: #fff;
}

#intro .intro-info .btn-get-started {
  background: linear-gradient(to right, #32be8f, #38d39f, #32be8f);;
  border: 2px solid #32be8f;
  color: #fff;
}

#intro .intro-info .btn-get-started:hover {
  background: none;
  border-color: #fff;
  color: #fff;
}

#intro .intro-info .btn-services {
  border: 2px solid #fff;
}

#intro .intro-info .btn-services:hover {
  background: #007bff;
  border-color: #007bff;
  color: #fff;
}

/*--------------------------------------------------------------
# Navigation Menu
--------------------------------------------------------------*/

/* Desktop Navigation */

.main-nav {
  /* Drop Down */
  /* Deep Drop Down */
}

.main-nav,
.main-nav * {
  margin: 0;
  padding: 0;
  list-style: none;
}

.main-nav > ul > li {
  position: relative;
  white-space: nowrap;
  float: left;
}

.main-nav a {
  display: block;
  position: relative;
  color: #000;
  padding: 10px 15px;
  transition: 0.3s;
  font-size: 14px;
  font-family: "Montserrat", sans-serif;
  font-weight: 500;
}

.main-nav a:hover,
.main-nav .active > a,
.main-nav li:hover > a {
  color: #007bff;
  text-decoration: none;
}

.main-nav .drop-down ul {
  display: block;
  position: absolute;
  left: 0;
  top: calc(100% + 30px);
  z-index: 99;
  opacity: 0;
  visibility: hidden;
  padding: 10px 0;
  background: #fff;
  box-shadow: 0px 0px 30px rgba(127, 137, 161, 0.25);
  transition: ease all 0.3s;
}

.main-nav .drop-down:hover > ul {
  opacity: 1;
  top: 100%;
  visibility: visible;
}

.main-nav .drop-down li {
  min-width: 180px;
  position: relative;
}

.main-nav .drop-down ul a {
  padding: 10px 20px;
  font-size: 13px;
  color: #004289;
}

.main-nav .drop-down ul a:hover,
.main-nav .drop-down ul .active > a,
.main-nav .drop-down ul li:hover > a {
  color: #007bff;
}

.main-nav .drop-down > a:after {
  content: "\f107";
  font-family: FontAwesome;
  padding-left: 10px;
}

.main-nav .drop-down .drop-down ul {
  top: 0;
  left: calc(100% - 30px);
}

.main-nav .drop-down .drop-down:hover > ul {
  opacity: 1;
  top: 0;
  left: 100%;
}

.main-nav .drop-down .drop-down > a {
  padding-right: 35px;
}

.main-nav .drop-down .drop-down > a:after {
  content: "\f105";
  position: absolute;
  right: 15px;
}

/* Mobile Navigation */

.mobile-nav {
  position: fixed;
  top: 0;
  bottom: 0;
  z-index: 9999;
  overflow-y: auto;
  left: -260px;
  width: 260px;
  padding-top: 18px;
  background: rgba(19, 39, 57, 0.8);
  transition: 0.4s;
}

.mobile-nav * {
  margin: 0;
  padding: 0;
  list-style: none;
}

.mobile-nav a {
  display: block;
  position: relative;
  color: #fff;
  padding: 10px 20px;
  font-weight: 500;
}

.mobile-nav a:hover,
.mobile-nav .active > a,
.mobile-nav li:hover > a {
  color: #74b5fc;
  text-decoration: none;
}

.mobile-nav .drop-down > a:after {
  content: "\f078";
  font-family: FontAwesome;
  padding-left: 10px;
  position: absolute;
  right: 15px;
}

.mobile-nav .active.drop-down > a:after {
  content: "\f077";
}

.mobile-nav .drop-down > a {
  padding-right: 35px;
}

.mobile-nav .drop-down ul {
  display: none;
  overflow: hidden;
}

.mobile-nav .drop-down li {
  padding-left: 20px;
}

.mobile-nav-toggle {
  position: fixed;
  right: 0;
  top: 0;
  z-index: 9998;
  border: 0;
  background: none;
  font-size: 24px;
  transition: all 0.4s;
  outline: none !important;
  line-height: 1;
  cursor: pointer;
  text-align: right;
}

.mobile-nav-toggle i {
  margin: 18px 18px 0 0;
  color: #004289;
}

.mobile-nav-overly {
  width: 100%;
  height: 100%;
  z-index: 9997;
  top: 0;
  left: 0;
  position: fixed;
  background: rgba(19, 39, 57, 0.8);
  overflow: hidden;
  display: none;
}

.mobile-nav-active {
  overflow: hidden;
}

.mobile-nav-active .mobile-nav {
  left: 0;
}

.mobile-nav-active .mobile-nav-toggle i {
  color: #fff;
}

/*--------------------------------------------------------------
# Sections
--------------------------------------------------------------*/

/* Sections Header
--------------------------------*/

.section-header h3 {
  font-size: 36px;
  color: #283d50;
  text-align: center;
  font-weight: 500;
  position: relative;
}

.section-header p {
  text-align: center;
  margin: auto;
  font-size: 15px;
  padding-bottom: 60px;
  color: #556877;
  width: 50%;
}

/* Section with background
--------------------------------*/

.section-bg {
  background: #ecf5ff;
}



/*--------------------------------------------------------------
# Responsive Media Queries
--------------------------------------------------------------*/

@media (min-width: 992px) {
  #testimonials .testimonial-item p {
    width: 80%;
  }
}

@media (max-width: 991px) {
  #header {
    height: 60px;
    padding: 10px 0;
  }

  #header .logo h1 {
    font-size: 28px;
    padding: 8px 0;
  }

  #intro {
    padding: 140px 0 60px 0;
  }

  #intro .intro-img {
    width: 80%;
    float: none;
    margin: 0 auto 25px auto;
  }

  #intro .intro-info {
    width: 80%;
    float: none;
    margin: auto;
    text-align: center;
  }

  #why-us .card {
    margin: 0;
  }
}

@media (max-width: 768px) {
  .back-to-top {
    bottom: 15px;
  }
}

@media (max-width: 767px) {
  #intro .intro-info {
    width: 100%;
  }

  #intro .intro-info h2 {
    font-size: 34px;
    margin-bottom: 30px;
  }

  .section-header p {
    width: 100%;
  }

  #testimonials .testimonial-item {
    text-align: center;
  }

  #testimonials .testimonial-item .testimonial-img {
    float: none;
    margin: auto;
  }

  #testimonials .testimonial-item h3,
  #testimonials .testimonial-item h4,
  #testimonials .testimonial-item p {
    margin-left: 0;
  }
}

@media (max-width: 574px) {
  #intro {
    padding: 100px 0 20px 0;
  }
}
	</style>
  <!-- =======================================================
    Theme Name: NewBiz
    Theme URL: https://bootstrapmade.com/newbiz-bootstrap-business-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
</head>

<body>

  <!--==========================
  Header
  ============================-->
  <header id="header" class="fixed-top">
    <div class="container">

      <div class="logo float-left">
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <h1 class="text-light"><a href="#header"><span>NewBiz</span></a></h1> -->
        <a href="${pageContext.request.contextPath}/Home" class="scrollto"><img src="assets/images/prince (1).svg" alt="" class="img-fluid"></a>
      </div>

      <nav class="main-nav float-right d-none d-lg-block">
        <ul>
          <li><a href="#about">Giới thiệu</a></li>
          <li><a href="${pageContext.request.contextPath}/Login" style="border:solid; border-radius:2rem;">Đăng nhập</a></li>
        </ul>
      </nav><!-- .main-nav -->
      
    </div>
  </header><!-- #header -->

  <!--==========================
    Intro Section
  ============================-->
  <section id="intro" class="clearfix">
    <div class="container">

      <div class="intro-img">
        <img src="assets/images/intro-img.svg" alt="" class="img-fluid">
      </div>

      <div class="intro-info">
        <h2>Xem<br><span>Quảng cáo</span> nhiều <br>Sợ gì không tiền tiêu</h2>
        <div>
          <a href="${pageContext.request.contextPath}/Register" class="btn-get-started scrollto">Đăng ký ngay</a>
        </div>
      </div>

    </div>
  </section><!-- #intro -->

  

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <!-- Uncomment below i you want to use a preloader -->
  <!-- <div id="preloader"></div> -->

  <!-- JavaScript Libraries -->
  <script src="assets/js/vendor/jquery.min.js"></script>
  <script src="assets/js/vendor/jquery-migrate.min.js"></script>
  <script src="assets/js/vendor/bootstrap.bundle.min.js"></script>
  <script src="assets/js/vendor/easing-1.3.js"></script>
  <script src="lib/mobile-nav/mobile-nav.js"></script>
  <script src="lib/wow/wow.min.js"></script>
  <script src="lib/waypoints/waypoints.min.js"></script>
  <script src="lib/counterup/counterup.min.js"></script>
  <script src="assets/js/vendor/owl.carousel.min.js"></script>
  
  


  <!-- Template Main Javascript File -->
	<script type="text/javascript">
	(function ($) {
		  "use strict";

		  // Preloader (if the #preloader div exists)
		  $(window).on('load', function () {
		    if ($('#preloader').length) {
		      $('#preloader').delay(100).fadeOut('slow', function () {
		        $(this).remove();
		      });
		    }
		  });

		  // Back to top button
		  $(window).scroll(function() {
		    if ($(this).scrollTop() > 100) {
		      $('.back-to-top').fadeIn('slow');
		    } else {
		      $('.back-to-top').fadeOut('slow');
		    }
		  });
		  $('.back-to-top').click(function(){
		    $('html, body').animate({scrollTop : 0},1500, 'easeInOutExpo');
		    return false;
		  });

		  // Initiate the wowjs animation library
		  new WOW().init();

		  // Header scroll class
		  $(window).scroll(function() {
		    if ($(this).scrollTop() > 100) {
		      $('#header').addClass('header-scrolled');
		    } else {
		      $('#header').removeClass('header-scrolled');
		    }
		  });

		  if ($(window).scrollTop() > 100) {
		    $('#header').addClass('header-scrolled');
		  }

		  // Smooth scroll for the navigation and links with .scrollto classes
		  $('.main-nav a, .mobile-nav a, .scrollto').on('click', function() {
		    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
		      var target = $(this.hash);
		      if (target.length) {
		        var top_space = 0;

		        if ($('#header').length) {
		          top_space = $('#header').outerHeight();

		          if (! $('#header').hasClass('header-scrolled')) {
		            top_space = top_space - 20;
		          }
		        }

		        $('html, body').animate({
		          scrollTop: target.offset().top - top_space
		        }, 1500, 'easeInOutExpo');

		        if ($(this).parents('.main-nav, .mobile-nav').length) {
		          $('.main-nav .active, .mobile-nav .active').removeClass('active');
		          $(this).closest('li').addClass('active');
		        }

		        if ($('body').hasClass('mobile-nav-active')) {
		          $('body').removeClass('mobile-nav-active');
		          $('.mobile-nav-toggle i').toggleClass('fa-times fa-bars');
		          $('.mobile-nav-overly').fadeOut();
		        }
		        return false;
		      }
		    }
		  });

		  // Navigation active state on scroll
		  var nav_sections = $('section');
		  var main_nav = $('.main-nav, .mobile-nav');
		  var main_nav_height = $('#header').outerHeight();

		  $(window).on('scroll', function () {
		    var cur_pos = $(this).scrollTop();
		  
		    nav_sections.each(function() {
		      var top = $(this).offset().top - main_nav_height,
		          bottom = top + $(this).outerHeight();
		  
		      if (cur_pos >= top && cur_pos <= bottom) {
		        main_nav.find('li').removeClass('active');
		        main_nav.find('a[href="#'+$(this).attr('id')+'"]').parent('li').addClass('active');
		      }
		    });
		  });

		  // jQuery counterUp (used in Whu Us section)
		  $('[data-toggle="counter-up"]').counterUp({
		    delay: 10,
		    time: 1000
		  });

		  // Porfolio isotope and filter
		  $(window).on('load', function () {
		    var portfolioIsotope = $('.portfolio-container').isotope({
		      itemSelector: '.portfolio-item'
		    });
		    $('#portfolio-flters li').on( 'click', function() {
		      $("#portfolio-flters li").removeClass('filter-active');
		      $(this).addClass('filter-active');
		  
		      portfolioIsotope.isotope({ filter: $(this).data('filter') });
		    });
		  });

		  // Testimonials carousel (uses the Owl Carousel library)
		  $(".testimonials-carousel").owlCarousel({
		    autoplay: true,
		    dots: true,
		    loop: true,
		    items: 1
		  });

		})(jQuery);


	</script>
</body>
</html>
