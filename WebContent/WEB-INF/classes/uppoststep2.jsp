<%@page import="beans.UserAccount"%>
<%@page import="beans.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Prince - Đăng tin</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="assets/favicon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<link rel="icon" type="image/png" sizes="192x192"
	href="assets/favicon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="assets/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="assets/favicon/favicon-16x16.png">
<link rel="manifest" href="assets/favicon/manifest.json">
<link rel="stylesheet" href="assets/css/step2.css">
</head>
<body>
	<c:import url="/WEB-INF/classes/header.jsp" />
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
			var figure1 = document.getElementById("figure1");
			var figure2 = document.getElementById("figure2");
			var figure3 = document.getElementById("figure3");
			var inputFigure1 = document.getElementById("inputFigure1");
			var inputFigure2 = document.getElementById("inputFigure2");
			var inputFigure3 = document.getElementById("inputFigure3");
			var inputURL = document.getElementById("inputURL");
			var url = document.getElementById("url");
			// Gán nội dung ô input vào thẻ div

			title.innerHTML = inputTitle.value;
			title1.innerHTML = inputTitle1.value;
			title2.innerHTML = inputTitle2.value;
			content1.innerHTML = inputContent1.value;
			content2.innerHTML = inputContent2.value;
			figure1.innerHTML = inputFigure1.value;
			figure2.innerHTML = inputFigure2.value;
			figure3.innerHTML = inputFigure3.value;
			url.innerHTML = inputURL.value;
			if (inputTitle.value == '') {
				title.innerHTML = "Tiêu đề";
			}
			if (inputTitle1.value == "") {
				title1.innerHTML = "Tiêu đề phụ 1";
			}
			if (inputTitle2.value == "") {
				title2.innerHTML = "Tiêu đề phụ 2";
			}
			if (inputContent1.value == "") {
				content1.innerHTML = "Nội dung 1";
			}
			if (inputContent2.value == "") {
				content2.innerHTML = "Nội dung 2";
			}
			if (inputFigure1.value == "") {
				figure1.innerHTML = "chú thích 1";
			}
			if (inputFigure1.value == "") {
				figure2.innerHTML = "chú thích 2";
			}
			if (inputFigure1.value == "") {
				figure3.innerHTML = "chú thích 3";
			}
			if (inputURL.value == "") {
				url.innerHTML = "liên kết của bạn";
			}

		};
	setTimeout(() => {
	var Main = {
			methods: {
			  open1() {
		        this.$notify.info({
		          title: 'Mẹo',
		          message: 'nhìn bên phải màn hình để xem preview!',
		          showClose: false,
		          duration: 2800,
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
	},1000);
	
	
	</script>
	<div class="main-content">
		<c:if test="${post.format == 1}">
			<div class="row mt-3 mb-4">
				<div class="col-lg-6">
					<div class="row br mx-5 mt-4 pb-5" style="background: aliceblue">
						<form data-toggle="validator" action="CreatePostStep2"
							name="formPayment" method="POST" autocomplete="off"
							enctype="multipart/form-data">
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
												id="inputTitle1" maxlength="60" name="inputTitle1"
												onkeyup="show_result()" value="" autocomplete="off">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class=textarea>
									<label for="inputContent1">Nội dung 1</label>
									<textarea class="form-control" id="inputContent1"
										name="content1" rows="3" onkeyup="show_result()"
										style="font-size: 1.4rem;" maxlength="160"></textarea>
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
												id="inputTitle2" maxlength="60" name="inputTitle2"
												onkeyup="show_result()" value="">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="textarea">
									<label for="inputContent2">Nội dung 2</label>
									<textarea class="form-control" id="inputContent2"
										name="content2" rows="3" onkeyup="show_result()"
										style="font-size: 1.4rem;" maxlength="160"></textarea>
								</div>
							</div>
							<div class="form-group" style="margin-top: -4rem;">
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-info" id="btnUpload"
									style="margin-left: 20rem;" data-toggle="modal"
									data-target="#uploadPost">Hình ảnh/video</button>
								<i class="fal fa-exclamation-circle text-warning" id="note"></i>
								<div class="modal fade exampleModalCenter" id="uploadPost"
									tabindex="-1" role="dialog"
									aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
									<div
										class="modal-dialog modal-md rounded-md modal-dialog-centered"
										role="document" style="max-width: 600px;">
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
													<div class="conatiner">
														<div class="row">
															<div class="col-3 ml-5 mx-auto">
																<label class="btn btn-info"> <i
																	class="fa fa-image"></i>Ảnh bìa<input type="file" accept="image/*" capture
																	style="display: none;" id="file-input1"
																	name="file-input1"
																	onchange="document.getElementById('image').src = window.URL.createObjectURL(this.files[0])">
																</label>

															</div>
														</div>
														<div class="row">
															<div class="col-3 ml-5">

																<label class="btn btn-info"> <i
																	class="fa fa-image"></i>Ảnh 1<input type="file" accept="image/*" capture
																	style="display: none;" id="file-input2"
																	name="file-input2"
																	onchange="document.getElementById('image1').src = window.URL.createObjectURL(this.files[0])"
																	
																	>
																</label>

															</div>
															<div class="col-8 px-0">
																<label
																	class="labels d-inline-flex p-2 bd-highlight ml-1">chú
																	thích cho ảnh</label> <input
																	class="justify-content-center ml-2 px-2"
																	id="inputFigure1" type="text" name="figure2"
																	placeholder="" onkeyup="show_result()">
															</div>
														</div>
														<div class="row">
															<div class="col-3 ml-5">

																<label class="btn btn-info"> <i
																	class="fa fa-image"></i>Ảnh 2<input type="file" accept="image/*" capture
																	style="display: none;" id="file-input3"
																	name="file-input3"
																	onchange="document.getElementById('image2').src = window.URL.createObjectURL(this.files[0])">
																</label>

															</div>
															<div class="col-8 px-0">
																<label
																	class="labels d-inline-flex p-2 bd-highlight ml-1">chú
																	thích cho ảnh</label> <input
																	class="justify-content-center ml-2 px-2"
																	id="inputFigure2" type="text" name="figure2"
																	placeholder="" onkeyup="show_result()">
															</div>
														</div>
														<div class="row">
															<div class="col-3 ml-5">

																<label class="btn btn-info"> <i
																	class="fa fa-video"></i>video<input type="file" accept="video/*" capture
																	style="display: none;" id="file-input4"
																	name="file-input4"
																	onchange="document.getElementById('preview').src = window.URL.createObjectURL(this.files[0])">
																</label>

															</div>
															<div class="col-8 px-0">
																<label class="  d-inline-flex p-2 bd-highlight ml-1">chú
																	thích cho video</label> <input
																	class="justify-content-center ml-2 px-2"
																	id="inputFigure3" type="text" name="figure3"
																	placeholder="" onkeyup="show_result()">
															</div>
														</div>
												</ul>

											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="textarea">
									<label for="inputURL">Liên kết của bạn</label> <input
										type="text" class="form-control" id="inputURL" name="inputURL"
										onkeyup="show_result()" style="font-size: 1.4rem;">
								</div>
							</div>

							<div style="display: flex; font-size: 1.7rem;"
								class="justify-content-between ">
								<input type="submit" class="btn btn-primary mx-auto"
									value="Tiếp tục">
							</div>

						</form>
						<div style="position: absolute; right: 0; margin: 0 5.5rem;"
							class=" mt-3 pb-5">
							<a href="${pageContext.request.contextPath}/Create?step=cancle">
								<i class="fas fa-window-close"
								style="color: red; font-size: 2.5rem;" id="cancle"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6 px-0 pr-4" style="background: aliceblue">
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
												<label class="cat-btn bg-color-blue-one">${post.getCategoryName()}</label>
											</div>
											<div style="word-break: break-all;">
												<h2
													class="m-t-xs-20 m-b-xs-0 axil-post-title hover-line text-wrap"
													id="title">Tiêu đề</h2>
											</div>
											<div class="post-metas banner-post-metas m-t-xs-20">
												<ul class="list-inline">
													<li><a href="#" style="font-size: 1.2rem;"
														class="post-author post-author-with-img"><img
															src="assets/images/user/avatar.png" alt="author">${userName}</a></li>

												</ul>
											</div>
											<!-- End of .post-metas -->
										</div>
										<!-- End of .post-title-wrapper -->
									</div>
									<!-- End of .col-lg-6 -->

									<div class="col-lg-6 px-auto">
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

													<h3 style="margin: 0 0 2rem 0;" id="title1">Tiêu đề
														phụ 1</h3>

													<figure>
														<img
															src="assets/images/post-single-gallery/post-single-img-1.jpg"
															alt="img" id="image1">
														<figcaption style="font-size: 1.4rem; text-align: center;"
															id="figure1">chú thích 1</figcaption>
													</figure>
													<div class="break">
														<p style="font-size: 2rem; margin-top: -2rem;"
															id="content1">Nội dung 1</p>
													</div>
													<h3 id="title2">Tiêu đề phụ 2</h3>

													<figure>
														<div class="col-12">
															<img
																src="assets/images/post-single-gallery/post-single-img-1.jpg"
																alt="img" id="image2" class="img-fluid mx-auto">
														</div>

														<figcaption style="font-size: 1.4rem; text-align: center;"
															id="figure2">chú thích 2</figcaption>
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
														<figcaption style="font-size: 1.4rem; text-align: center;"
															id="figure3">chú thích 3</figcaption>
													</figure>


													<h3 style="margin: 1rem 0 1rem !important;">Liên kết:</h3>
													<a href="#" style="float: left; margin-bottom: 3rem;"
														id="url">liên kết của bạn</a>



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
		</c:if>
		<c:if test="${post.format == 2}">
		<script type="text/javascript">
		var videoMaxTime = "03:00"; //minutes:seconds   //video
		var uploadMax = 31457280; //bytes  //30MP

		//for seconds to time
		function secondsToTime(in_seconds) {

		  var time = '';
		  in_seconds = parseFloat(in_seconds.toFixed(2));

		  var hours = Math.floor(in_seconds / 3600);
		  var minutes = Math.floor((in_seconds - (hours * 3600)) / 60);
		  var seconds = in_seconds - (hours * 3600) - (minutes * 60);
		  //seconds = Math.floor( seconds );
		  seconds = seconds.toFixed(0);

		  if (hours < 10) {
		    hours = "0" + hours;
		  }
		  if (minutes < 10) {
		    minutes = "0" + minutes;
		  }
		  if (seconds < 10) {
		    seconds = "0" + seconds;
		  }
		  var time = minutes + ':' + seconds;

		  return time;

		}

		function checkFileDuration() {

		  var file = document.querySelector('input[type=file]').files[0];
		  var reader = new FileReader();
		  var fileSize = file.size;

		  if (fileSize > uploadMax) {
		    alert('Kích thước file quá lớn');
		    $('#vid').val("");
		  } else {
		    $('#pross').show();
		    reader.onload = function(e) {

		      if (file.type == "video/mp4" || file.type == "video/ogg" || file.type == "video/webm") {
		        var videoElement = document.createElement('video');
		        videoElement.src = e.target.result;
		        var timer = setInterval(function() {
		          if (videoElement.readyState === 4) {
		            getTime = secondsToTime(videoElement.duration);
		            if (getTime > videoMaxTime) {
		              alert('Thời gian video tối đa là 3 phút')
		              $('#vid').val("");
		            }
		            $('#pross').hide();
		            clearInterval(timer);
		          }
		        }, 500)
		      } else {
		        var timer = setInterval(function() {
		          if (file) {

		            alert('Hãy thêm một video')
		            $('#vid').val("");
		            $('#pross').hide();
		            clearInterval(timer);
		          }
		        }, 500)

		      }

		    };
		    if (file) {
		      reader.readAsDataURL(file);

		    } else {
		      alert('không có video');
		    }

		  }
		}
		</script>
			<div id="pross"
				style="background: rgba(0, 0, 0, .5); position: fixed; width: 100%; text-align: center; height: 500px; color: #fff; display: none">
				<p>Analysing Your File</p>
				<img src="https://cdn.bdswiss.com/img/platformv2/loader.gif"
					width="50" />
			</div>
			<div class="row mt-3 mb-4">
				<div class="col-lg-6">
					<div class="row br mx-5 mt-4 pb-5" style="background: aliceblue">
						<form action="CreatePostStep2" name="formPayment1" method="POST"
							autocomplete="off" enctype="multipart/form-data">
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


							<div class="form-group mt-5">
								<label class="btn btn-info"> <i class="fa fa-video"></i> video<input
									type="file" accept="video/*" capture style="display: none;" id="file-input4"
									name="file-input4" required="required"
									onchange="document.getElementById('previewvideo').src = window.URL.createObjectURL(this.files[0])"
									>
								</label>

							</div>
							<div class="form-group">
								<div class="textarea">
									<label for="inputURL">Liên kết của bạn</label> <input
										type="text" class="form-control" id="inputURL" name="inputURL"
										onkeyup="show_result()" style="font-size: 1.4rem;">
								</div>
							</div>

							<div style="display: flex; font-size: 1.7rem;"
								class="justify-content-between ">
								<input type="submit" class="btn btn-primary mx-auto"
									value="Tiếp tục">
							</div>

						</form>
						<div style="position: absolute; right: 0; margin: 0 5.5rem;"
							class=" mt-3 pb-5">
							<a href="${pageContext.request.contextPath}/Create?step=cancle">
								<i class="fas fa-window-close"
								style="color: red; font-size: 2.5rem;" id="cancle"></i>
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6 px-0 pr-4" style="background: aliceblue">
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
												<label class="cat-btn bg-color-blue-one">${post.getCategoryName()}</label>
											</div>
											<div style="word-break: break-all;">
												<h2
													class="m-t-xs-20 m-b-xs-0 axil-post-title hover-line text-wrap"
													id="title">Tiêu đề</h2>
											</div>
											<div class="post-metas banner-post-metas m-t-xs-20">
												<ul class="list-inline">
													<li><a href="#" style="font-size: 1.2rem;"
														class="post-author post-author-with-img"><img
															src="assets/images/user/avatar.png" alt="author">${userName}</a></li>

												</ul>
											</div>
											<!-- End of .post-metas -->
										</div>
										<!-- End of .post-title-wrapper -->
									</div>
									<!-- End of .col-lg-6 -->

									<div class="col-lg-6 px-auto">
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

													<figure class="post-media">
														<video class="plyr-post" preload="metadata" width="100%"
															id="previewvideo" src="" controls autoplay>
															<source src="video.mp4#t=1" type="video/mp4">
															<source src="video.ogg#t=1" type="video/ogg">
															<source src="video.webm#t=1" type="video/webm">
														</video>

													</figure>
													<h3 style="margin: 1rem 0 1rem !important;">Liên kết:</h3>
													<a href="#" style="float: left; margin-bottom: 3rem;"
														id="url">liên kết của bạn</a>



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
		</c:if>
		<div class="row mx-auto">
			<c:import url="/WEB-INF/classes/footer.jsp" />
		</div>
	</div>
	<script src="assets/js/jquery.character-counter.js"></script>
	<script type="text/javascript">
		$('#inputContent1,#inputContent2').characterCounter({
			maxlength : 160

		})
		tippy('#note', {
			animation : 'shift',
			placement : 'right',
			inertia : true,
			theme : 'lightning',
			arrow : false,
			content : 'Đừng quên chọn ảnh cho bài viết của bạn!',
		});
		tippy('#cancle', {
			animation : 'shift',
			placement : 'right',
			inertia : true,
			theme : 'lightning',
			arrow : false,
			content : 'Hủy',
		});
	</script>
</html>
