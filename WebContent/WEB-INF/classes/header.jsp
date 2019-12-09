<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="util.GlobalConstants"%>
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
	<link rel="icon" type="image/png" sizes="192x192" href="assets/favicon/android-icon-192x192.png">
	<link rel="icon" type="image/png" sizes="32x32" href="assets/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/favicon/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="assets/favicon/favicon-16x16.png">
	<link rel="manifest" href="assets/favicon/manifest.json">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="assets/favicon/ms-icon-144x144.png">
	<meta name="theme-color" content="#ffffff">
<!-- Icon fonts
    	======================================== -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,500i,700,700i,900"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" type="text/css"
	href="assets/css/vendor/tippy.css">
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

  @import url("//unpkg.com/element-ui@2.12.0/lib/theme-chalk/index.css");

.navbar-inner {
	height: fit-content;
}

.dropdown>.dropdown-menu {
	top: 170%;
	font-size: 1.5rem;
	transition: 0.3s all ease-in-out;
	right: -180%;
	left: auto;
	border-radius: .5rem;
	padding: 1rem 1rem;
}

.dropdown-item {
	padding: .5rem 1.5rem;
}

.dropdown:hover>.dropdown-menu {
	display: block;
	top: 90%;
}

.dropdown {
	cursor: pointer;
}

.dropdown>.dropdown-toggle:active {
	/*Without this, clicking will make it sticky*/
	pointer-events: none;
}
	html {
    overflow: scroll;
    overflow-x: hidden;
}
::-webkit-scrollbar {
    width: 0px;  /* Remove scrollbar space */
    background: transparent;  /* Optional: just make scrollbar invisible */
}
/* Optional: show position indicator in red */
::-webkit-scrollbar-thumb {
    background: #FF0000;
}
</style>
</head>

<body>
<div id="app">
<template>
  
</template>
</div>
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

	<header class="page-header">
		<div class="header-top bg-grey-dark-one">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md">
						<ul
							class="header-top-nav list-inline justify-content-center justify-content-md-start">
							<li class="current-date">25 July, 2019</li>
							<li><a href="#">Tiện ích</a></li>
							<li><a href="${pageContext.request.contextPath}/About">Giới thiệu</a></li>
							<li><a href="contact.html">Trợ giúp</a></li>
						</ul>
						<!-- End of .header-top-nav -->
					</div>
					<div class="col-md-auto">
						<ul class="ml-auto social-share header-top__social-share">
							<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
							<li><a href="#"><i class="fab fa-twitter"></i></a></li>
							<li><a href="#"><i class="fab fa-instagram"></i></a></li>
							<li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
						</ul>
					</div>
				</div>
				<!-- End of .row -->
			</div>
			<!-- End of .container -->
		</div>
		<nav class="navbar bg-white">
			<div class="container">
			
				<div class="navbar-inner d-flex justify-content-end ">
					<div class="brand-logo-container mr-auto">
						<a href="${pageContext.request.contextPath}/Home"> <img
							src="assets/images/prince.png" alt="" class="brand-logo">
						</a>
					</div>
					
					<div class="main-nav-wrapper ">
						<ul class="main-navigation list-inline" id="main-menu">

							<li><a href="${pageContext.request.contextPath}/Test">Thông báo</a></li>
							<li><a href="${pageContext.request.contextPath}/Contact">Liên hệ</a></li>
							<li><a
								href="${pageContext.request.contextPath}/Create?step=1">Đăng
									tin</a>
							<li class="has-dropdown"><div class="dropdown"
									id="dropdownUser">
									<i id="user" class="far fa-user"></i>
									${userName}
									<div class="dropdown-menu" aria-labelledby="dropdownUser">
										<a class="dropdown-item" href="#">Tài khoản của tôi</a>
										<c:if test="${user.ROLE_ID == 2}"> <a class="dropdown-item"
											href="${pageContext.request.contextPath}/MyListPost">Quảng
											cáo của tôi</a></c:if> <a class="dropdown-item"
											href="${pageContext.request.contextPath}/Logout">Đăng
											xuất</a>
									</div>
								</div></li>
						</ul>
						<!-- End of .main-navigation -->
					</div>
				
					<!-- End of .main-nav-toggler -->
				</div>
				<!-- End of .navbar-inner -->
			</div>
			<!-- End of .container -->
		</nav>
		<!-- End of .navbar -->
	</header>

	<!-- Javascripts
    	======================================= -->
	<!-- jQuery -->
	<script src="//unpkg.com/vue/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.12.0/lib/index.js"></script>
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
	<script src="assets/js/vendor/popper.min.js"></script>
	<script src="assets/js/vendor/tippy-bundle.iife.js"></script>
	<!-- Custom Script -->
	<script src="assets/js/main.js"></script>
</body>
<c:if test="${!empty(notify)}">
<script type="text/javascript">
var Main = {
		methods: {
			  open1() {
	        this.$notify({
	          title: '${notify.title}',
	          message: '${notify.message}',
	          type: '${notify.type}',
	          showClose: false,
	          dangerouslyUseHTMLString: '${notify.html}',
	          duration: 2000,
	          offset: 113
	        });
			  }
	    },
	    mounted: function () {
	        this.open1()
	        }
}
	var Ctor = Vue.extend(Main)
	new Ctor().$mount('#app')
</script>
	<c:remove var="notify" />
</c:if>
</html>