<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prince-thêm nội dung</title>
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
<link
	href="../../../../fonts.googleapis.com/cssa69f.css?family=Roboto:300,400,500,500i,700,700i,900"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="assets/css/fontawesome-all.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="assets/css/iconfont.css">

<!-- css links
	======================================== -->
<!-- Bootstrap link -->
<link rel="stylesheet" type="text/css"
	href="assets/css/vendor/bootstrap.min.css">

<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="assets/css/vendor/owl.carousel.min.css">



<!-- Custom css -->
<link rel="stylesheet" type="text/css" href="assets/css/style.css">
</head>
<style>

.break {
	word-break: break-all;
}
.character-counter-indicator{
margin-top: 5rem;
font-size: 1.1rem;
}
.textarea p {
	margin-top: 0 !important;
}

h3 {
	margin: 1rem 0 3rem !important;
	word-break:break-all;
}

.p-t-xs-60 {
	padding-top: 2rem ! important;
}

.axil-post-title {
	font-size: 1.8rem;
}

.post-details h3 {
	font-size: 1.6rem;
}

col-lg-12 {
	padding: 0;
}

* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Poppins', sans-serif;
	overflow: hidden;
	padding-right: 0 ! important;
}

.wave {
	position: fixed;
	bottom: 0;
	left: 0;
	height: 100%;
	z-index: -1;
}

.container {
	position: relative;
}

.img {
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

.logo {
	
}

#uploadPost {
	padding-right: 0 !important;
}

.login-content {
	margin-top: 5rem;
	justify-content: flex-start;
	align-items: center;
	text-align: center;
}

.img img {
	width: 500px;
}

form {
	width: 360px;
	margin: auto;
}

.login-content img {
	height: 100px;
}

.login-content h2 {
	margin: 15px 0;
	color: #333;
	text-transform: uppercase;
	font-size: 2.9rem;
}

.login-content .input-div {
	position: relative;
	display: grid;
	grid-template-columns: 7% 93%;
	padding: 5px 0;
	border-bottom: 2px solid #d9d9d9;
}

.login-content .input-div.one {
	margin-top: 0;
}

.i {
	color: #d9d9d9;
	display: flex;
	justify-content: center;
	align-items: center;
}

.i i {
	transition: .3s;
}

.input-div>div {
	position: relative;
	height: 45px;
}

.input-div>div>h5 {
	position: absolute;
	left: 10px;
	top: 50%;
	transform: translateY(-50%);
	color: #999;
	font-size: 1.5rem;
	transition: .3s;
}

.input-div:before, .input-div:after {
	content: '';
	position: absolute;
	bottom: -2px;
	width: 0%;
	height: 2px;
	background-color: #42a8ff;
	transition: .4s;
}

.input-div:before {
	right: 50%;
}

.input-div:after {
	left: 50%;
}

.input-div.focus:before, .input-div.focus:after {
	width: 50%;
}

.input-div.focus>div>h5 {
	top: -.5rem;
	font-size: 1.5rem;
}

.input-div.focus>.i>i {
	color: #42a8ff;
}

.input-div>div>input {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 90%;
	border: none;
	outline: none;
	background: none;
	padding: 0.3rem 0.7rem;
	font-size: 1.4rem;
	color: #555;
	font-family: 'poppins', sans-serif;
}

.input-div.pass {
	margin-bottom: 4px;
}

a {
	display: block;
	text-align: right;
	color: #999;
	font-size: 1.6rem;
	transition: .3s;
}

a:hover {
	color: #42a8ff;
}

@media screen and (max-width: 1050px) {
	.container {
		grid-gap: 5rem;
	}
}

@media screen and (max-width: 1000px) {
	form {
		width: 290px;
	}
	.login-content h2 {
		font-size: 2.2rem;
		margin: 8px 0;
	}
	.img img {
		width: 400px;
	}
}

@media screen and (max-width: 900px) {
	.container {
		grid-template-columns: 1fr;
	}
	.img {
		display: none;
	}
	.wave {
		display: none;
	}
	.login-content {
		justify-content: center;
	}
}

#popup {
	position: relative;
	margin: auto;
	overflow: hidden;
	width: 700px;
	height: 250px;
}

h1 {
	font-size: 0.9em;
	font-weight: 100;
	letter-spacing: 3px;
	padding-top: 5px;
	color: $white;
	padding-bottom: 5px;
	text-transform: uppercase;
}

.green {
	color: darken($ secondary, 20%);
}

.red {
	color: darken($ error, 10%);
}

.alert {
	font-weight: 700;
	letter-spacing: 5px;
}

p {
	margin: 5rem 0 0 0;
	font-size: 1.1rem;
	font-weight: 100;
	color: darken($ dark, 10%);
	letter-spacing: 1px;
	font-size: 1.1rem;
}

#error-box {
	position: absolute;
	width: 35%;
	height: 100%;
	right: 12%;
	background: linear-gradient(to bottom left, $ error 40%, $ orange 100%);
	border-radius: 20px;
	box-shadow: 5px 5px 20px rgba($ gray, 10%);
}

.dot {
	width: 8px;
	height: 8px;
	background: $white;
	border-radius: 50%;
	position: absolute;
	top: 4%;
	right: 6%;
	&:
	hover
	{
	background
	:
	darken(
	$
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	white
	,
	20%
	);
}

}
.two {
	right: 12%;
	opacity: .5;
}

.face {
	position: absolute;
	width: 22%;
	height: 22%;
	background: $white;
	border-radius: 50%;
	border: 1px solid$dark;
	top: 21%;
	left: 37.5%;
	z-index: 2;
	animation: bounce 1s ease-in infinite;
}

.face2 {
	position: absolute;
	width: 22%;
	height: 22%;
	background: $white;
	border-radius: 50%;
	border: 1px solid$dark;
	top: 21%;
	left: 37.5%;
	z-index: 2;
	animation: roll 3s ease-in-out infinite;
}

.eye {
	position: absolute;
	width: 5px;
	height: 5px;
	background: $dark;
	border-radius: 50%;
	top: 40%;
	left: 20%;
}

.right {
	left: 68%;
}

.mouth {
	position: absolute;
	top: 43%;
	left: 41%;
	width: 7px;
	height: 7px;
	border-radius: 50%;
}

.happy {
	border: 2px solid;
	border-color: transparent$dark$dark transparent;
	transform: rotate(45deg);
}

.sad {
	top: 49%;
	border: 2px solid;
	border-color: $dark transparent transparent$dark;
	transform: rotate(45deg);
}

.shadow {
	position: absolute;
	width: 21%;
	height: 3%;
	opacity: .5;
	background: $dark;
	left: 40%;
	top: 43%;
	border-radius: 50%;
	z-index: 1;
}

.scale {
	animation: scale 1s ease-in infinite;
}

.move {
	animation: move 3s ease-in-out infinite;
}

.message {
	position: absolute;
	width: 100%;
	text-align: center;
	height: 40%;
	top: 47%;
}

.button-box {
	position: absolute;
	background: $white;
	width: 50%;
	height: 15%;
	border-radius: 20px;
	top: 73%;
	left: 25%;
	outline: 0;
	border: none;
	box-shadow: 2px 2px 10px rgba($ dark, .5);
	transition: all .5s ease-in-out; &: hover { background : darken( $ 
	 white, 5%);
	transform: scale(1.05);
	transition: all .3s ease-in-out;
}

}
@
keyframes bounce { 50% {
	transform: translateY(-10px);
}

}
@
keyframes scale { 50% {
	transform: scale(0.9);
}

}
@
keyframes roll { 0% {
	transform: rotate(0deg);
	left: 25%;
}

50%
{
left
































:
































60%;
transform



































:



































rotate



































(168
deg



































);
}
100%
{
transform



































:



































rotate



































(0
deg



































);
left



































:




































25%;
}
}
@
keyframes move { 0% {
	left: 25%;
}

50%
{
left



































:




































60%;
}
100%
{
left



































:




































25%;
}
}
footer {
	position: absolute;
	bottom: 0;
	right: 0;
	text-align: center;
	font-size: 1em;
	text-transform: uppercase;
	padding: 10px;
	font-family: $ font; p { color : $ error;
	letter-spacing: 2px;
}

a {
	color: $success;
	text-decoration: none;
	&:
	hover
	{
	color
	:
	$
	orange;
}
}
}
</style>
<body>
<c:import url="/header.jsp"/>
	<script type="text/javascript">
		function show_result() {
			// Lấy hai thẻ HTML
			var inputTitle = document.getElementById("inputTitle");
			var inputTitle1 = document.getElementById("inputTitle1");
			var inputTitle2 = document.getElementById("inputTitle2");
			var title = document.getElementById("title");
			var title1 = document.getElementById("title1");
			var title2 = document.getElementById("title2");
			var content1 = document.getElementById("content1");
			var content2 = document.getElementById("content2");
			var inputContent1 = document.getElementById("inputContent1");
			var inputContent2 = document.getElementById("inputContent2");

			// Gán nội dung ô input vào thẻ div

			title.innerHTML = inputTitle.value;
			title1.innerHTML = inputTitle1.value;
			title2.innerHTML = inputTitle2.value;
			content1.innerHTML = inputContent1.value;
			content2.innerHTML = inputContent2.value;

			if (inputTitle.value == "") {
				title.innerHTML = "Tiêu đề"
			}
			if (inputTitle1.value == "") {
				title1.innerHTML = "Tiêu đề phụ 1"
			}
			if (inputTitle2.value == "") {
				title2.innerHTML = "Tiêu đề phụ 2"
			}
			if (inputContent1.value == "") {
				content1.innerHTML = "Nội dung 1"
			}
			if (inputContent2.value == "") {
				content2.innerHTML = "Nội dung 2"
			}

		}
	</script>
	<div class="main-content">
		<div class="row ">
			<div class="col-lg-6">
				<form data-toggle="validator" role="form" action="" method="post">
					<div class="form-group">
						<div class="login-content">
							<div class="input-div one">
								<div class="i">
									<i class="fas fa-edit"></i>
								</div>
								<div class="div">
									<h5>Tiêu đề</h5>
									<input type="text" class="input" data-charcount-enable=true
										id="inputTitle" maxlength="60" name="inputTitle"
										onkeyup="show_result()" value="" required>
								</div>
							</div>
						</div>
					</div>

					<div class="form-group" style="margin-top: -4rem;">
						<div class="login-content">
							<div class="input-div one">
								<div class="i">
									<i class="fas fa-edit"></i>
								</div>
								<div class="div">
									<h5>Tiêu đề phụ 1</h5>
									<input type="text" class="input" data-charcount-enable=true
										id="inputTitle1" maxlength="60" name="inputTitle"
										onkeyup="show_result()" value="" required>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class=textarea>
							<label for="inputContent1">Nội dung 1</label>
							<textarea class="form-control" id="inputContent1" rows="3"
								onkeyup="show_result()" style="font-size: 1.4rem;"
								maxlength="160"></textarea>
						</div>
					</div>
					<div class="form-group" style="margin-top: -4rem;">
						<div class="login-content" style="margin-top: 0;">
							<div class="input-div one">
								<div class="i">
									<i class="fas fa-edit"></i>
								</div>
								<div class="div">
									<h5>Tiêu đề phụ 2</h5>
									<input type="text" class="input" data-charcount-enable=true
										id="inputTitle2" maxlength="60" name="inputTitle"
										onkeyup="show_result()" value="" required>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="textarea">
							<label for="inputContent2">Nội dung 2</label>
							<textarea class="form-control" id="inputContent2" rows="3"
								onkeyup="show_result()" style="font-size: 1.4rem;"
								maxlength="160"></textarea>
						</div>
					</div>
					<div class="form-group" style="margin-top: -4rem;">
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary" id="btnUpload"
							data-toggle="modal" data-target="#uploadPost">Hình
							ảnh/video</button>

						<div class="modal fade" id="uploadPost" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalCenterTitle"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLongTitle">Tải
											lên</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<ul class="list-group">
											<li class="list-group-item"><div id="button-container">
													<div class="button" id="button">Ảnh 1</div>
													<input type="file" id="file-input1" name="file-input1"
														onchange="document.getElementById('image').src = window.URL.createObjectURL(this.files[0])">
												</div></li>
											<li class="list-group-item"><div id="button-container">
													<div class="button" id="button">Ảnh 2</div>
													<input type="file" id="file-input2" name="file-input2"
														onchange="document.getElementById('image1').src = window.URL.createObjectURL(this.files[0])">
												</div></li>
											<li class="list-group-item"><div id="button-container">
													<div class="button" id="button">Ảnh 3</div>
													<input type="file" id="file-input3" name="file-input3"
														onchange="document.getElementById('image2').src = window.URL.createObjectURL(this.files[0])">
												</div></li>
											<li class="list-group-item"><div id="button-container">
													<div class="button" id="button">video</div>
													<input type="file" id="file-input4" name="file-input4"
														onchange="document.getElementById('preview').src = window.URL.createObjectURL(this.files[0])">
												</div></li>


										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div style="display: flex;">
					<button type="submit" class="btn btn-primary mx-auto">tiếp tục</button>
					</div>
				</form>
			</div>
			<div class="col-lg-6">
				<div class="main-content">
					<!-- Banner starts -->
					<section class="banner banner__single-post banner__standard">
						<div class="container">
							<i
								style="position: absolute; top: 1rem; background: #B2FEFA; /* fallback for old browsers */ background: -webkit-linear-gradient(to right, #0ED2F7, #B2FEFA); /* Chrome 10-25, Safari 5.1-6 */ background: linear-gradient(to right, #0ED2F7, #B2FEFA); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */; font-style: italic;"
								class="far fa-edit"> preview</i>
							<div class="row align-items-center">
								<div class="col-lg-6">
									<div class="post-title-wrapper">

										<div class="btn-group">
											<label href="#" class="cat-btn bg-color-blue-one">Thể loại</label>
										</div>
										<div style="word-break: break-all;">
											<h2 class="m-t-xs-20 m-b-xs-0 axil-post-title hover-line"
												id="title">Tiêu đề</h2>
										</div>
										<div class="post-metas banner-post-metas m-t-xs-20">
											<ul class="list-inline">
												<li><a href="#" style="font-size: 1.2rem;"
													class="post-author post-author-with-img"><img
														src="assets/images/author/01.png" alt="author">Ashley
														Graham</a></li>

											</ul>
										</div>
										<!-- End of .post-metas -->
									</div>
									<!-- End of .post-title-wrapper -->
								</div>
								<!-- End of .col-lg-6 -->

								<div class="col-lg-6">
									<img src="assets/images/post/latest-post.jpg" alt=""
										class="img-fluid" width="280" height="280" id="image">
								</div>
							</div>
							<!-- End of .row -->
						</div>
						<!-- End of .container -->
					</section>
					<!-- End of .banner -->

					<!-- post-single-wrapper starts -->
					<div class="post-single-wrapper p-t-xs-30">
						<div class="container">
							<div class="row">
								<div class="col-lg-12">
									<main class="site-main">
										<article class="post-details">
											<div class="single-blog-wrapper">

												<!-- End of .social-share -->

												<h3 style="margin: 0 0 2rem 0;" id="title1">Tiêu đề phụ
													1</h3>

												<figure>
													<img
														src="assets/images/post-single-gallery/post-single-img-1.jpg"
														alt="img" id="image1">
													<figcaption style="font-size: 1.4rem; text-align: center;">chú
														thích 1</figcaption>
												</figure>
												<div class="break">
													<p style="font-size: 2rem; margin-top: -2rem;"
														id="content1">Nội dung 1</p>
												</div>
												<h3 id="title2">Tiêu đề phụ 2</h3>

												<figure>
													<img
														src="assets/images/post-single-gallery/post-single-img-1.jpg"
														alt="img" id="image2">
													<figcaption style="font-size: 1.4rem; text-align: center;">chú
														thích 2</figcaption>
												</figure>
												<!-- End of .gallery -->
												<div class="break">
													<p style="font-size: 2rem; margin-top: -2rem;"
														id="content2">Nội dung 2</p>
												</div>
												<h3>Video</h3>

												<figure class="post-media">
													<video class="plyr-post"
														poster="assets/images/video-post/post-format-video-1.jsp"
														id="preview" src="" controls>
														
															<source src="video.mp4" type="video/mp4">
  															<source src="video.ogg" type="video/ogg">
 															<source src="video.webm" type="video/webm">
													</video>
													<figcaption style="font-size: 1.4rem; text-align: center;">chú
														thích3</figcaption>
												</figure>


												<h3 style="margin: 1rem 0 1rem !important;">Liên kết:</h3>
												<a href="#" style="float: left; margin-bottom: 3rem;">liên
													kết của bạn</a>



												<!-- End of .post-shares -->

												<hr class="m-t-xs-50 m-b-xs-60">

												<div class="about-author m-b-xs-60"></div>
											</div>
										</article>
									</main>
									<!-- End of main -->
								</div>
								<!--End of .col-auto  -->


								<!-- End of .col-lg-4 -->
							</div>
							<!-- End of .row -->
						</div>
						<!-- End of .container -->
					</div>
					<!-- End of .post-single-wrapper -->


					<!-- End of .related-post -->

					<!-- footer starts -->

					<!-- End of footer -->

				</div>
			</div>
		</div>
	</div>

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
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
	<script type="text/javascript" src="assets/js/login.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script src="assets/js/jquery.character-counter.js"></script>
	<script type="text/javascript">
		$('#inputContent1,#inputContent2').characterCounter({
			maxlength : 160

		});
	</script>
</body>

</html>