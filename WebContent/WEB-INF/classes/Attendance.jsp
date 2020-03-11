<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 

	String day1 = (String)request.getAttribute("day1");
	String day2 = (String)request.getAttribute("day2");
	String day3 = (String)request.getAttribute("day3");
	String day4 = (String)request.getAttribute("day4");
	String day5 = (String)request.getAttribute("day5");
	String day6 = (String)request.getAttribute("day6");
	String day7 = (String)request.getAttribute("day7");
%>  
  
<!DOCTYPE html>
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
<!-- Page Title
    	======================================== -->
<title>Prince - Điểm danh</title>
<!-- links for favicon
    	======================================== -->
<link rel="icon" type="image/png" sizes="192x192"
	href="assets/favicon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="assets/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/favicon/favicon-16x16.png">
<link rel="manifest" href="assets/favicon/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="assets/favicon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">

	<!-- Icon fonts
	======================================== -->
	<link href="../../../../fonts.googleapis.com/cssa69f.css?family=Roboto:300,400,500,500i,700,700i,900" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/iconfont.css">
	<!-- css links
	======================================== -->
	<!-- Bootstrap link -->
	<link rel="stylesheet" type="text/css" href="assets/css/vendor/bootstrap.min.css">
	<!-- Link Swiper's CSS -->
	<link rel="stylesheet" href="assets/css/vendor/owl.carousel.min.css">
	<!-- Magnific popup -->
	<link rel="stylesheet" type="text/css" href="assets/css/vendor/magnific-popup.css">
	<!-- Animate css -->
	<link rel="stylesheet" type="text/css" href="assets/css/vendor/animate.css">
	<!-- Custom css -->
	<link rel="stylesheet" type="text/css" href="assets/css/style.css">
</head>

<body>
	<div class="main-content">
		<c:import url="/WEB-INF/classes/header.jsp" />
		<div class="breadcrumb-wrapper">
			<div class="container">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.jsp">Trang chủ</a></li>
						<li class="breadcrumb-item active" aria-current="page">Điểm Danh Hàng Ngày</li>
					</ol>
					<!-- End of .breadcrumb -->
				</nav>
			</div>
			<!-- End of .container -->
		</div>
		<!-- End of .breadcrumb-container -->

		<!-- Banner starts -->
		<section class="banner banner__default bg-grey-light-three">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-12">
						<div class="post-title-wrapper">
							<h2 class="m-b-xs-0 axil-post-title hover-line">Điểm Danh Nhận Điểm</h2>
						</div>
						<!-- End of .post-title-wrapper -->
					</div>
					<!-- End of .col-lg-8 -->
				</div>
			</div>
			<!-- End of .container -->
		</section>
		<!-- End of .banner -->

		<div class="axil-our-team section-gap">
			<div class="container">

				<p class="m-b-xs-30 big">Mỗi ngày bạn có 1 lượt điểm danh, hãy điểm danh liên tiếp để nhận những những phần thưởng hấp dẫn</p>

				<div class="axil-team-grid-wrapper p-t-xs-10">
					<div class="row">
					
						<div class="col-lg-4">
							<div class="axil-team-block m-b-xs-30">
								
								<% if(day1 =="donotclick"){%>
								<a class="d-block img-container">
									<img src="assets/images/chuaduocdiemdanh.png" alt="team member 1">
								</a>
								<%}else if(day1 =="clicked"){%>
								<a class="d-block img-container">
									<img src="assets/images/dadiemdanh.png" alt="team member 1">
								</a>
								<%}else{ %>
								<a href="${pageContext.request.contextPath}/AttendanceClick?day=1" class="d-block img-container">
									<img src="assets/images/diemdanh.png" alt="team member 1">
								</a>
								<%}%>

								<div class="axil-team-inner-content text-center">
									<h3 class="axil-member-title"><a>Ngày 1</a></h3>
									<h3 class="axil-member-title"><a>28 Điểm</a></h3>
									
								</div>
								<!-- End of .axil-team-inner-content -->

								
								<!-- End of .axil-team-share-wrapper -->
							</div>
							<!-- End of .team-block -->
						</div>
						<!-- End of .col-lg-4 -->
						
						<div class="col-lg-4">
							<div class="axil-team-block m-b-xs-30">
							
								<% if(day2 =="donotclick"){%>
								<a class="d-block img-container">
									<img src="assets/images/chuaduocdiemdanh.png" alt="team member 1">
								</a>
								<%}else if(day2 =="clicked"){%>
								<a class="d-block img-container">
									<img src="assets/images/dadiemdanh.png" alt="team member 1">
								</a>
								<%}else{ %>
								<a href="${pageContext.request.contextPath}/AttendanceClick?day=2" class="d-block img-container">
									<img src="assets/images/diemdanh.png" alt="team member 1">
								</a>
								<%}%>


								<div class="axil-team-inner-content text-center">
									<h3 class="axil-member-title"><a>Ngày 2</a></h3>
									<h3 class="axil-member-title"><a>38 Điểm</a></h3>
									
									
								</div>
								<!-- End of .axil-team-inner-content -->

								
								<!-- End of .axil-team-share-wrapper -->
							</div>
							<!-- End of .team-block -->
						</div>
						
						<div class="col-lg-4">
							<div class="axil-team-block m-b-xs-30">
							
								<% if(day3 =="donotclick"){%>
								<a class="d-block img-container">
									<img src="assets/images/chuaduocdiemdanh.png" alt="team member 1">
								</a>
								<%}else if(day3 =="clicked"){%>
								<a class="d-block img-container">
									<img src="assets/images/dadiemdanh.png" alt="team member 1">
								</a>
								<%}else{ %>
								<a href="${pageContext.request.contextPath}/AttendanceClick?day=3" class="d-block img-container">
									<img src="assets/images/diemdanh.png" alt="team member 1">
								</a>
								<%}%>

								<div class="axil-team-inner-content text-center">
									<h3 class="axil-member-title"><a href="#">Ngày 3</a></h3>
									<h3 class="axil-member-title"><a>48 Điểm</a></h3>
									
								</div>
								<!-- End of .axil-team-inner-content -->

								
								<!-- End of .axil-team-share-wrapper -->
							</div>
							<!-- End of .team-block -->
						</div>
						
						<div class="col-lg-4">
							<div class="axil-team-block m-b-xs-30">
							
								<% if(day4 =="donotclick"){%>
								<a class="d-block img-container">
									<img src="assets/images/chuaduocdiemdanh.png" alt="team member 1">
								</a>
								<%}else if(day4 =="clicked"){%>
								<a class="d-block img-container">
									<img src="assets/images/dadiemdanh.png" alt="team member 1">
								</a>
								<%}else{ %>
								<a href="${pageContext.request.contextPath}/AttendanceClick?day=4" class="d-block img-container">
									<img src="assets/images/diemdanh.png" alt="team member 1">
								</a>
								<%}%>

								<div class="axil-team-inner-content text-center">
									<h3 class="axil-member-title"><a href="#">Ngày 4</a></h3>
									<h3 class="axil-member-title"><a>188 Điểm</a></h3>
									
									
								</div>
								<!-- End of .axil-team-inner-content -->

								
								<!-- End of .axil-team-share-wrapper -->
							</div>
							<!-- End of .team-block -->
						</div>
						
						<div class="col-lg-4">
							<div class="axil-team-block m-b-xs-30">
							
								<% if(day5 =="donotclick"){%>
								<a class="d-block img-container">
									<img src="assets/images/chuaduocdiemdanh.png" alt="team member 1">
								</a>
								<%}else if(day5 =="clicked"){%>
								<a class="d-block img-container">
									<img src="assets/images/dadiemdanh.png" alt="team member 1">
								</a>
								<%}else{%>
								<a href="${pageContext.request.contextPath}/AttendanceClick?day=5" class="d-block img-container">
									<img src="assets/images/diemdanh.png" alt="team member 1">
								</a>
								<%}%>

								<div class="axil-team-inner-content text-center">
									<h3 class="axil-member-title"><a href="#">Ngày 5</a></h3>
									<h3 class="axil-member-title"><a>28 Điểm</a></h3>
									
								</div>
								<!-- End of .axil-team-inner-content -->

								
								<!-- End of .axil-team-share-wrapper -->
							</div>
							<!-- End of .team-block -->
						</div>
						
						<div class="col-lg-4">
							<div class="axil-team-block m-b-xs-30">
							
								<% if(day6 =="donotclick"){%>
								<a class="d-block img-container">
									<img src="assets/images/chuaduocdiemdanh.png" alt="team member 1">
								</a>
								<%}else if(day6 =="clicked"){%>
								<a class="d-block img-container">
									<img src="assets/images/dadiemdanh.png" alt="team member 1">
								</a>
								<%}else{ %>
								<a href="${pageContext.request.contextPath}/AttendanceClick?day=6" class="d-block img-container">
									<img src="assets/images/diemdanh.png" alt="team member 1">
								</a>
								<%}%>

								<div class="axil-team-inner-content text-center">
									<h3 class="axil-member-title"><a href="#">Ngày 6</a></h3>
									<h3 class="axil-member-title"><a>38 Điểm</a></h3>
									
								</div>
								<!-- End of .axil-team-inner-content -->

								
								<!-- End of .axil-team-share-wrapper -->
							</div>
							<!-- End of .team-block -->
						</div>
						
						<div class="col-lg-4">
							<div class="axil-team-block m-b-xs-30">
							
								<% if(day7 =="donotclick"){%>
								<a class="d-block img-container">
									<img src="assets/images/chuaduocdiemdanh.png" alt="team member 1">
								</a>
								<%}else if(day7 =="clicked"){%>
								<a class="d-block img-container">
									<img src="assets/images/dadiemdanh.png" alt="team member 1">
								</a>
								<%}else{ %>
								<a href="${pageContext.request.contextPath}/AttendanceClick?day=7" class="d-block img-container">
									<img src="assets/images/diemdanh.png" alt="team member 1">
								</a>
								<%}%>

								<div class="axil-team-inner-content text-center">
									<h3 class="axil-member-title"><a href="#">Ngày 7</a></h3>
									<h3 class="axil-member-title"><a>318 Điểm</a></h3>
									
								</div>
								<!-- End of .axil-team-inner-content -->

								
								<!-- End of .axil-team-share-wrapper -->
							</div>
							<!-- End of .team-block -->
						</div>
						
						
						
						<!-- End of .col-lg-4 -->
					</div>
					<!-- End of .row -->
				</div>
				<!-- End of .team-grid-wrapper -->
			</div>
			<!-- End of .container -->
		</div>
		<!-- End of .section-gap -->

	<c:import url="/WEB-INF/classes/footer.jsp" />
	</div>
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
	<script src="../../../../cdn.jsdelivr.net/npm/css-vars-ponyfill%402"></script>
	<!-- Plugins -->
	<script src="assets/js/plugins.js"></script>
	<!-- Custom Script -->
	<script src="assets/js/main.js"></script>

</body>


<!-- Mirrored from axilthemes.com/demo/template/papr/team by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 25 Oct 2019 15:28:04 GMT -->
</html>