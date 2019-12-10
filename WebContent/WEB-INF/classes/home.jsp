<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@page import="util.GlobalConstants"%>
    <%@page import="beans.*"%>
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
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Page Title
    	======================================== -->
	<title>Prince - Trang chủ</title>
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
<style type="text/css">
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

video::-webkit-media-controls {
  display: none;
}
video::-webkit-media-controls-play-button {display: none;}

video::-webkit-media-controls-volume-slider {display: none;}

video::-webkit-media-controls-mute-button {display: none;}

video::-webkit-media-controls-timeline {display: none;}

video::-webkit-media-controls-current-time-display {display: none;}

	</style>
</head>
<body>
<div class="main-content">
	<c:import url="/WEB-INF/classes/header.jsp"/>
	<% 
	ArrayList<Post> videoPresent = new ArrayList();
	ArrayList<Post> postPresent = new ArrayList();
	ArrayList<Post> postRandom = new ArrayList();
		try{
				 videoPresent = PostDAO.selectVideoPresent(String.valueOf(request.getSession().getAttribute(GlobalConstants.USER_ID)));
				 postPresent = PostDAO.selectPostPresent(String.valueOf(request.getSession().getAttribute(GlobalConstants.USER_ID)));		
				 postRandom = PostDAO.selectRandomPost(String.valueOf(request.getSession().getAttribute(GlobalConstants.USER_ID)));
			}catch(Exception e){
			}%>
		<div class="recent-news-wrapper section-gap p-t-xs-15 p-t-sm-60">
			<div class="container">
			
			<%if(postPresent.size()>0){
				%>
				<div class="row">
					<div class="col-lg-6">
						<div class="axil-latest-post">
							<div class="media post-block m-b-xs-20">
								<figure class="fig-container">
									<a ><img id="view<%=postPresent.get(0).getPost_id()%>" src="<%=postPresent.get(0).getImage() %>"
											alt="latest post"></a>
									<div class="post-cat-group m-b-xs-10">
										<a href="business.jsp"
											class="post-cat cat-btn bg-color-blue-one"><%=postPresent.get(0).getCategoryName()%></a>
									</div>
								</figure>
								<div class="media-body">
									<h3 id="viewTitle<%=postPresent.get(0).getPost_id()%>" class="axil-post-title hover-line hover-line" style=" word-wrap: break-word;cursor: default;"><a
											><%=postPresent.get(0).getTitle()%></a></h3>
									<div class="post-metas">
										<ul class="list-inline">
											<li>Đăng bởi <a class="post-author"style="font-weight: bold;"><%=postPresent.get(0).getAuthorName() %></a></li>
											<li><i class="dot">.</i><%=postPresent.get(0).getStartDate()%></li>
											<li><a><i class="feather icon-activity"></i><%=postPresent.get(0).getVisiter()%> lượt xem</a></li>
											
										</ul>
									</div>
								</div>
								<script>
        $(document).ready(function () {
            jQuery("#view<%=postPresent.get(0).getPost_id()%>,#viewTitle<%=postPresent.get(0).getPost_id()%>").click(function(){
                var id = <%=postPresent.get(0).getPost_id()%>;
                var location = "home";
                $.ajax({
                    url: 'View',
                    type: 'POST',
                    data: {id : id ,
                    location : location	
                    },
                    success: function (data) {
                    	window.location.href = data.url;
                    },
                    error: function (e) {
                        console.log(e.message);
                    }
                });
            });
        });
 </script>
							</div>
							<!-- End of .post-block -->
						</div>
						<!-- End of .latest-post -->
					</div>
					<!-- End of .col-lg-6 -->
					<div class="col-lg-6">
						<div class="axil-recent-news">
							<div class="section-title d-flex m-b-xs-30">
								<h2 class="axil-title">Mới nhất</h2>
							</div>
							<!-- End of .section-title -->
							<div class="axil-content">
							<% if(postPresent.size()>2){
							for(int i = 1 ; i< postPresent.size(); i++){ %>
								<div class="media post-block m-b-xs-30">
									<a class="align-self-center"><img id="view<%=postPresent.get(i).getPost_id()%>"
											class=" m-r-xs-30" src="<%=postPresent.get(i).getImage()%>" alt="Ảnh bìa"></a>
									<div class="media-body">
										<div class="post-cat-group m-b-xs-10">
											<a href="business.jsp"
												class="post-cat cat-btn bg-color-purple-one"><%=postPresent.get(i).getCategoryName()%></a>
										</div>
										<h3 id="viewTitle<%=postPresent.get(0).getPost_id()%>" class="axil-post-title hover-line hover-line" style=" word-wrap: break-word;cursor: default;"><a
												><%=postPresent.get(i).getTitle()%></a></h3>
										<div class="post-metas">
											<ul class="list-inline">
												<li>Đăng bởi <a  class="font-weight-bold"><%=postPresent.get(i).getAuthorName()%></a></li>
											</ul>
										</div>
									</div>
								</div>
								<script>
        $(document).ready(function () {
            jQuery("#view<%=postPresent.get(i).getPost_id()%>,#viewTitle<%=postPresent.get(i).getPost_id()%>").click(function(){
                var id = <%=postPresent.get(i).getPost_id()%>;
                var location = "home";
                $.ajax({
                    url: 'View',
                    type: 'POST',
                    data: {id : id ,
                    	location : location},
                    success: function (data) {
                    	window.location.href = data.url;
                    },
                    error: function (e) {
                        console.log(e.message);
                    }
                });
            });
        });
 </script>
								<%}
							}else{
							%>
							<div class="col-5 mx-auto">Chưa có quảng cáo mới</div>
							<%} %>
							</div>
							<!-- End of .content -->
						</div>
						<!-- End of .recent-news -->
					</div>
					<!-- End of .col-lg-6 -->
					
				</div>
			<%} %>
				<!-- End of .row -->
			</div>
			<!-- End of .container -->
		</div>
	
		<%if(videoPresent.size()>0){ %>
		<section class="axil-video-posts section-gap section-gap-top__with-text bg-grey-dark-one">
			<div class="container">
				<div class="section-title title-white m-b-xs-40">
					<h2 class="axil-title">Videos</h2>
				</div>
				<!-- End of .section-title -->
				<div class="row">
					<div class="col-lg-6">
						<div class="axil-img-container flex-height-container" id="view<%=videoPresent.get(0).getPost_id()%>">
							<a class="d-block h-100" >
								<video class="plyr-post postVideo" preload="metadata"  style="object-fit:contain;"
													src="<%=videoPresent.get(0).getVideo()%>"controls="false">
													<source src="video.mp4#t=1" type="video/mp4">
													<source src="video.ogg#t=1" type="video/ogg">
													<source src="video.webm#t=1" type="video/webm">
												</video>
							</a>
							<div class="media post-block grad-overlay__transparent position-absolute m-b-xs-30">
								<div class="media-body media-body__big">
									<div class="axil-media-bottom mt-auto">
										<h3 class="axil-post-title hover-line hover-line" id="viewTitle<%=videoPresent.get(0).getPost_id()%>"style=" word-wrap: break-word;cursor: default;"><a
												><%=videoPresent.get(0).getTitle()%></a></h3>
										<div class="post-metas">
											<ul class="list-inline">
												<li>Đăng bởi <a class="post-author font-weight-bold"><%=videoPresent.get(0).getAuthorName()%></a></li>
												<li><i class="dot">.</i><%=videoPresent.get(0).getStringTime()%></li>
												<li><a><i class="feather icon-activity"></i><%=videoPresent.get(0).getVisiter()%> lượt xem</a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- End of .media-body -->
							</div>
							<!-- End of .post-block -->
							<script>
        $(document).ready(function () {
            jQuery("#view<%=videoPresent.get(0).getPost_id()%>,#viewTitle<%=videoPresent.get(0).getPost_id()%>").click(function(){
                var id = <%=videoPresent.get(0).getPost_id()%>;
                var location = "home";
                $.ajax({
                    url: 'View',
                    type: 'POST',
                    data: {id : id ,
                    location : location	
                    },
                    success: function (data) {
                    	window.location.href = data.url;
                    },
                    error: function (e) {
                        console.log(e.message);
                    }
                });
            });
        });
 </script>
						</div>
						<!-- End of .axil-img-container -->
					</div>
					<!-- End of .col-lg-8 -->
					<div class="col-lg-4">
					
						<div class="axil-content">
						<% if(postPresent.size()>2){
							for(int i = 1 ; i< videoPresent.size(); i++){ %>
						
							<div class="media post-block post-block__small post-block__on-dark-bg m-b-xs-30" id="view<%=videoPresent.get(i).getPost_id()%>">
								<a class="align-self-center">
									<span class="video-play-btn video-play-btn__small"></span>
									<video class="plyr-post d-none" preload="metadata" 
													src="<%=videoPresent.get(i).getVideo()%>"  controls>
													<source src="video.mp4#t=5" type="video/mp4">
													<source src="video.ogg#t=5" type="video/ogg">
													<source src="video.webm#t=5" type="video/webm">
												</video>
								</a>
								<div class="media-body">
									<div class="post-cat-group">
										<a class="post-cat color-blue-three"></a>
									</div>
									<h3 class="axil-post-title hover-line hover-line" id="viewTitle<%=videoPresent.get(i).getPost_id()%>" style=" word-wrap: break-word;cursor: default;"><a
											><%=videoPresent.get(i).getTitle()%></a></h3>
									<div class="post-metas">
										<ul class="list-inline">
											<li>Đăng bởi <a class="post-author"><%=videoPresent.get(i).getAuthorName()%></a></li>		
										</ul>
									</div>
								</div>
							</div>
							<script>
        $(document).ready(function () {
            jQuery("#view<%=videoPresent.get(i).getPost_id()%>,#viewTitle<%=videoPresent.get(i).getPost_id()%>").click(function(){
                var id = <%=videoPresent.get(i).getPost_id()%>;
                var location = "home";
                $.ajax({
                    url: 'View',
                    type: 'POST',
                    data: {id : id ,
                    location : location	
                    },
                    success: function (data) {
                    	window.location.href = data.url;
                    },
                    error: function (e) {
                        console.log(e.message);
                    }
                });
            });
        });
 </script>
							<%}
							}else{
								%>
							<div class="col-8 mx-auto mt-5">chưa có video mới</div>
							<%} %>
						</div>
						<!-- End of .axil-content -->
					</div>
					<!-- End of .col-lg-4 -->
				</div>
				<!-- End of .row -->
			</div>
			<!-- End of .container -->
		</section>
		<%} %>
		<!-- End of .axil-video-posts -->
		<%if(postRandom.size()>0){ %>
		<div class="random-posts section-gap">
			<div class="container">
				<div class="row">
					<div class="col-lg-8">
						<div class="add-container m-b-xs-60">
							<a href="#"><img src="assets/images/clientbanner/clientbanner.jpg" alt="add one"
									class="img-fluid"></a>
						</div>
						<main class="axil-content">
						<%for(Post item : postRandom){ 
						if(item.getFormat()==1){
						%>
							<div class="media post-block post-block__mid m-b-xs-30">
								<a class="align-self-center"><img class=" m-r-xs-30"
										src="<%=item.getImage()%>" alt="ảnh bìa"></a>
								<div class="media-body">
									<div class="post-cat-group m-b-xs-10">
										<a class="post-cat cat-btn bg-color-blue-one"><%=item.getCategoryName() %></a>
									</div>
									<h3 class="axil-post-title hover-line hover-line"><a><%=item.getTitle()%></a></h3>
									<p class="mid"><%=item.getContent1()%></p>
									<div class="post-metas">
										<ul class="list-inline">
											<li>Đăng bởi<a class="font-weight-bold"><%=item.getAuthorName()%></a></li>
										</ul>
									</div>
								</div>
							</div>
							<%} if(item.getFormat()==2){ %>
							<div class="media post-block post-block__mid m-b-xs-30">
								
								<video class="plyr-post d-none" preload="metadata" id="video" width="140px"
								style=":-webkit-media-controls:display: none;
								pointer-events: none;
								:-webkit-media-controls-play-button :  display: none;

								:-webkit-media-controls-volume-slider:  display: none;

								:-webkit-media-controls-mute-button : display: none;

								:-webkit-media-controls-timeline :  display: none;

								:-webkit-media-controls-current-time-display : display: none; "
													src="<%=item.getVideo()%>"controls="false">
													<source src="video.mp4#t=0.8" type="video/mp4">
													<source src="video.ogg#t=0.8" type="video/ogg">
													<source src="video.webm#t=0.8" type="video/webm">
												</video>
								<div class="media-body">
									<div class="post-cat-group m-b-xs-10">
										<a class="post-cat cat-btn bg-color-blue-one"><%=item.getCategoryName() %></a>
									</div>
									<h3 class="axil-post-title hover-line hover-line"><a><%=item.getTitle()%></a></h3>
									<p class="mid"><%=item.getContent1()%></p>
									<div class="post-metas">
										<ul class="list-inline">
											<li>Đăng bởi<a  class="font-weight-bold"><%=item.getAuthorName()%></a></li>
										</ul>
									</div>
								</div>
							</div>
							<%}} %>
						</main>
						<!-- End of .axil-content -->
					</div>
					<!-- End of .col-lg-8 -->
					<div class="col-lg-4">
						<aside class="post-sidebar">
							<div class="add-block-widget m-b-xs-40">
								<a href="#"><img src="assets/images/clientbanner/clientbanner2.jpg" alt="sidebar add"
										class="img-fluid"></a>
							</div>
							<div class="newsletter-widget weekly-newsletter bg-grey-light-three m-b-xs-40">
								<div class="newsletter-content">
									<div class="newsletter-icon">
										<i class="feather icon-send"></i>
									</div>
									<div class="section-title">
										<h3 class="axil-title">Subscribe To Our Weekly
											Newsletter</h3>
										<p class="mid m-t-xs-10 m-b-xs-20">No spam, notifications only about new
											products,
											updates.</p>
									</div>
									<!-- End of .section-title -->
									<div class="subscription-form-wrapper">
										<form action="#" class="subscription-form">
											<div class="form-group form-group-small m-b-xs-20">
												<label for="subscription-email-2">Enter Email Address</label>
												<input type="text" name="subscription-email-2"
													id="subscription-email-2">
											</div>
											<div class="m-b-xs-0">
												<button class="btn btn-primary btn-small">SUBSCRIBE</button>
											</div>
										</form>
										<!-- End of .subscription-form -->
									</div>
									<!-- End of .subscription-form-wrapper -->
								</div>
								<!-- End of .newsletter-content -->
							</div>
							<!-- End of  .newsletter-widget -->
							<div class="category-widget m-b-xs-40">
								<div class="widget-title">
									<h3>Categories</h3>
									<div class="owl-nav">
										<button class="custom-owl-prev"><i
												class="feather icon-chevron-left"></i></button>
										<button class="custom-owl-next"><i
												class="feather icon-chevron-right"></i></button>
									</div>
								</div>
								<div class="category-carousel">
									<div class="owl-carousel owl-theme" data-owl-items="1" data-owl-loop="true"
										data-owl-autoplay="true" data-owl-dots="false" data-owl-nav="false"
										data-owl-margin="10">
										<div class="cat-carousel-inner">
											<ul class="category-list-wrapper">
												<li class="category-list perfect-square">
													<a href="post-format-standard.jsp" class="list-inner"
														style="background-image: url(assets/images/category-bg/category-bg-1.png)">
														<div class="post-info-wrapper overlay">
															<div class="counter-inner"><span class="counter">20</span>+
															</div>
															<h4 class="cat-title">Top Stories</h4>
														</div>
														<!-- End of .counter-wrapper -->
													</a>
												</li>
												<!-- End of .category-list -->
												<li class="category-list perfect-square">
													<a href="post-format-standard.jsp" class="list-inner"
														style="background-image: url(assets/images/category-bg/category-bg-2.png)">
														<div class="post-info-wrapper overlay">
															<div class="counter-inner"><span class="counter">100</span>+
															</div>
															<h4 class="cat-title">Business</h4>
														</div>
														<!-- End of .counter-wrapper -->
													</a>
												</li>
												<!-- End of .category-list -->
												<li class="category-list perfect-square">
													<a href="post-format-standard.jsp" class="list-inner"
														style="background-image: url(assets/images/category-bg/category-bg-3.png)">
														<div class="post-info-wrapper overlay">
															<div class="counter-inner"><span class="counter">10</span>+
															</div>
															<h4 class="cat-title">Travel</h4>
														</div>
														<!-- End of .counter-wrapper -->
													</a>
												</li>
												<!-- End of .category-list -->
												<li class="category-list perfect-square">
													<a href="post-format-standard.jsp" class="list-inner"
														style="background-image: url(assets/images/category-bg/category-bg-4.png)">
														<div class="post-info-wrapper overlay">
															<div class="counter-inner"><span class="counter">10</span>+
															</div>
															<h4 class="cat-title">Food</h4>
														</div>
														<!-- End of .counter-wrapper -->
													</a>
												</li>
												<!-- End of .category-list -->
											</ul>
											<!-- End of .category-list-wrapper -->
										</div>
										<!-- End of .cat-carousel-inner -->
										<div class="cat-carousel-inner">
											<ul class="category-list-wrapper">
												<li class="category-list perfect-square">
													<a href="post-format-standard.jsp" class="list-inner"
														style="background-image: url(assets/images/category-bg/category-bg-5.jpg)">
														<div class="post-info-wrapper overlay">
															<div class="counter-inner"><span class="counter">20</span>+
															</div>
															<h4 class="cat-title">Top Stories</h4>
														</div>
														<!-- End of .counter-wrapper -->
													</a>
												</li>
												<!-- End of .category-list -->
												<li class="category-list perfect-square">
													<a href="post-format-standard.jsp" class="list-inner"
														style="background-image: url(assets/images/category-bg/category-bg-6.jpg)">
														<div class="post-info-wrapper overlay">
															<div class="counter-inner"><span class="counter">100</span>+
															</div>
															<h4 class="cat-title">Business</h4>
														</div>
														<!-- End of .counter-wrapper -->
													</a>
												</li>
												<!-- End of .category-list -->
												<li class="category-list perfect-square">
													<a href="post-format-standard.jsp" class="list-inner"
														style="background-image: url(assets/images/category-bg/category-bg-7.jpg)">
														<div class="post-info-wrapper overlay">
															<div class="counter-inner"><span class="counter">10</span>+
															</div>
															<h4 class="cat-title">Travel</h4>
														</div>
														<!-- End of .counter-wrapper -->
													</a>
												</li>
												<!-- End of .category-list -->
												<li class="category-list perfect-square">
													<a href="post-format-standard.jsp" class="list-inner"
														style="background-image: url(assets/images/category-bg/category-bg-8.jpg)">
														<div class="post-info-wrapper overlay">
															<div class="counter-inner"><span class="counter">10</span>+
															</div>
															<h4 class="cat-title">Food</h4>
														</div>
														<!-- End of .counter-wrapper -->
													</a>
												</li>
												<!-- End of .category-list -->
											</ul>
											<!-- End of .category-list-wrapper -->
										</div>
										<!-- End of .cat-carousel-inner -->
									</div>
									<!-- End of  .owl-carousel -->
								</div>
								<!-- End of .category-carousel -->
							</div>
							<!-- End of .category-widget -->
							<div class="sidebar-social-share-widget m-b-xs-40">
								<ul class="social-share-list-wrapper">
									<li class="social-share-list text-center perfect-square">
										<a href="#" class="list-inner bg-color-facebook">
											<i class="fab fa-facebook-f"></i>
											<div class="counts">2000+</div>
											<div class="title">Fans</div>
										</a>
									</li>
									<!-- End of .social-share-list -->
									<li class="social-share-list text-center perfect-square">
										<a href="#" class="list-inner bg-color-twitter">
											<i class="fab fa-twitter"></i>
											<div class="counts">4000+</div>
											<div class="title">Followers</div>
										</a>
									</li>
									<!-- End of .social-share-list -->
									<li class="social-share-list text-center perfect-square">
										<a href="#" class="list-inner bg-color-youtube">
											<i class="fab fa-youtube"></i>
											<div class="counts">1M+</div>
											<div class="title">Subscribers</div>
										</a>
									</li>
									<!-- End of .social-share-list -->
									<li class="social-share-list text-center perfect-square">
										<a href="#" class="list-inner bg-color-linkedin">
											<i class="fab fa-linkedin-in"></i>
											<div class="counts">600+</div>
											<div class="title">Connections</div>
										</a>
									</li>
									<!-- End of .social-share-list -->
									<li class="social-share-list text-center perfect-square">
										<a href="#" class="list-inner bg-color-vimeo">
											<i class="fab fa-vimeo"></i>
											<div class="counts">500+</div>
											<div class="title">Connections</div>
										</a>
									</li>
									<!-- End of .social-share-list -->
									<li class="social-share-list text-center perfect-square">
										<a href="#" class="list-inner bg-color-pinterest">
											<i class="fab fa-pinterest"></i>
											<div class="counts">600+</div>
											<div class="title">Followers</div>
										</a>
									</li>
									<!-- End of .social-share-list -->
									<li class="social-share-list text-center perfect-square">
										<a href="#" class="list-inner bg-color-twitch">
											<i class="fab fa-twitch"></i>
											<div class="counts">1K+</div>
											<div class="title">Followers</div>
										</a>
									</li>
									<!-- End of .social-share-list -->
									<li class="social-share-list text-center perfect-square">
										<a href="#" class="list-inner bg-color-instagram">
											<i class="fab fa-instagram"></i>
											<div class="counts">1K+</div>
											<div class="title">Followers</div>
										</a>
									</li>
									<!-- End of .social-share-list -->
								</ul>
								<!-- End of .social-share-list-wrapper -->
							</div>
							<!-- End of .sidebar-social-share -->
							<div class="post-widget sidebar-post-widget m-b-xs-40">
								<ul class="nav nav-pills row no-gutters">
									<li class="nav-item col">
										<a class="nav-link active" data-toggle="pill" href="#recent-post">Recent</a>
									</li>
									<li class="nav-item col">
										<a class="nav-link" data-toggle="pill" href="#popular-post">Popular</a>
									</li>
									<li class="nav-item col">
										<a class="nav-link" data-toggle="pill" href="#comments">Comments</a>
									</li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane fade show active" id="recent-post">
										<div class="axil-content">
											<div class="media post-block post-block__small">
												<a href="post-format-standard.jsp" class="align-self-center"><img
														class=" m-r-xs-30" src="assets/images/media/small-media-1.jpg"
														alt="media image"></a>
												<div class="media-body">
													<div class="post-cat-group">
														<a href="post-format-standard.jsp"
															class="post-cat color-blue-three">BEAUTY,</a>
														<a href="post-format-standard.jsp"
															class="post-cat color-yellow-one">TRADE,</a>
														<a href="post-format-standard.jsp"
															class="post-cat color-red-one">MUSIC</a>
													</div>
													<h4 class="axil-post-title hover-line hover-line"><a
															href="post-format-standard.jsp">Stocking Your Restaurant
															Kitchen Finding Reliable
															Sellers</a></h4>
													<div class="post-metas">
														<ul class="list-inline">
															<li>By <a href="#">Amachea Jajah</a></li>
														</ul>
													</div>
												</div>
											</div>
											<!-- End of .post-block -->
											<div class="media post-block post-block__small">
												<a href="post-format-standard.jsp" class="align-self-center"><img
														class=" m-r-xs-30" src="assets/images/media/small-media-2.jpg"
														alt="media image"></a>
												<div class="media-body">
													<a href="post-format-standard.jsp"
														class="post-cat color-green-three">TRAVEL</a>
													<h4 class="axil-post-title hover-line hover-line"><a
															href="post-format-standard.jsp">Trip
															To Iqaluit In Nunavut A
															Canadian Arctic
															City</a>
													</h4>
													<div class="post-metas">
														<ul class="list-inline">
															<li>By <a href="#">Xu Jianhong</a></li>
														</ul>
													</div>
												</div>
											</div>
											<!-- End of .post-block -->
											<div class="media post-block post-block__small">
												<a href="post-format-standard.jsp" class="align-self-center"><img
														class=" m-r-xs-30" src="assets/images/media/small-media-3.jpg"
														alt="media image"></a>
												<div class="media-body">
													<a href="post-format-standard.jsp"
														class="post-cat color-red-two">SPORTS</a>
													<h4 class="axil-post-title hover-line hover-line"><a
															href="post-format-standard.jsp">Thousands Now Adware
															Removal Who Never Thought They Could</a></h4>
													<div class="post-metas">
														<ul class="list-inline">
															<li>By <a href="#">Ahmad Nazeri</a></li>
														</ul>
													</div>
												</div>
											</div>
											<!-- End of .post-block -->
											<div class="media post-block post-block__small">
												<a href="post-format-standard.jsp" class="align-self-center"><img
														class=" m-r-xs-30" src="assets/images/media/small-media-4.jpg"
														alt="media image"></a>
												<div class="media-body">
													<a href="post-format-standard.jsp"
														class="post-cat color-blue-one">FASHION</a>
													<h4 class="axil-post-title hover-line hover-line"><a
															href="post-format-standard.jsp">To
															Keep Makeup Looking Fresh
															Take A Powder</a></h4>
													<div class="post-metas">
														<ul class="list-inline">
															<li>By <a href="#">Sergio Pliego</a></li>
														</ul>
													</div>
												</div>
											</div>
											<!-- End of .post-block -->
										</div>
										<!-- End of .content -->
									</div>
									<!-- End of .tab-pane -->
									<div class="tab-pane fade" id="popular-post">
										<div class="axil-content">
											<div class="media post-block post-block__small">
												<a href="post-format-standard.jsp" class="align-self-center"><img
														class=" m-r-xs-30" src="assets/images/media/small-media-3.jpg"
														alt="media image"></a>
												<div class="media-body">
													<a href="post-format-standard.jsp"
														class="post-cat color-blue-one">FASHION</a>
													<h4 class="axil-post-title hover-line hover-line"><a
															href="post-format-standard.jsp">To
															Keep Makeup Looking Fresh
															Take A Powder</a></h4>
													<div class="post-metas">
														<ul class="list-inline">
															<li>By <a href="#">Sergio Pliego</a></li>
														</ul>
													</div>
												</div>
											</div>
											<!-- End of .post-block -->
											<div class="media post-block post-block__small">
												<a href="post-format-standard.jsp" class="align-self-center"><img
														class=" m-r-xs-30" src="assets/images/media/small-media-2.jpg"
														alt="media image"></a>
												<div class="media-body">
													<a href="#post-format-standard.jsp"
														class="post-cat color-blue-three">BEAUTY</a>
													<h4 class="axil-post-title hover-line hover-line"><a
															href="post-format-standard.jsp">Stocking Your Restaurant
															Kitchen Finding Reliable
															Sellers</a></h4>
													<div class="post-metas">
														<ul class="list-inline">
															<li>By <a href="#">Amachea Jajah</a></li>
														</ul>
													</div>
												</div>
											</div>
											<!-- End of .post-block -->
											<div class="media post-block post-block__small">
												<a href="post-format-standard.jsp" class="align-self-center"><img
														class=" m-r-xs-30" src="assets/images/media/small-media-1.jpg"
														alt="media image"></a>
												<div class="media-body">
													<a href="post-format-standard.jsp"
														class="post-cat color-green-three">TRAVEL</a>
													<h4 class="axil-post-title hover-line hover-line"><a
															href="post-format-standard.jsp">Trip
															To Iqaluit In Nunavut A
															Canadian Arctic
															City</a>
													</h4>
													<div class="post-metas">
														<ul class="list-inline">
															<li>By <a href="#">Xu Jianhong</a></li>
														</ul>
													</div>
												</div>
											</div>
											<!-- End of .post-block -->
											<div class="media post-block post-block__small">
												<a href="post-format-standard.jsp" class="align-self-center"><img
														class=" m-r-xs-30" src="assets/images/media/small-media-4.jpg"
														alt="media image"></a>
												<div class="media-body">
													<a href="post-format-standard.jsp"
														class="post-cat color-red-two">SPORTS</a>
													<h4 class="axil-post-title hover-line hover-line"><a
															href="post-format-standard.jsp">RCB
															vs RR, IPL 2019:
															Bangalore, Rajasthan desperate
															for
															win</a></h4>
													<div class="post-metas">
														<ul class="list-inline">
															<li>By <a href="#">Ahmad Nazeri</a></li>
														</ul>
													</div>
												</div>
											</div>
											<!-- End of .post-block -->
										</div>
										<!-- End of .content -->
									</div>
									<!-- End of .tab-pane -->
									<div class="tab-pane fade" id="comments">
										<div class="axil-content">
											<div class="media post-block post-block__small">
												<a href="post-format-standard.jsp" class="align-self-center"><img
														class=" m-r-xs-30" src="assets/images/media/small-media-2.jpg"
														alt="media image"></a>
												<div class="media-body">
													<a href="post-format-standard.jsp"
														class="post-cat color-red-two">SPORTS</a>
													<h4 class="axil-post-title hover-line hover-line"><a
															href="post-format-standard.jsp">RCB
															vs RR, IPL 2019:
															Bangalore, Rajasthan desperate
															for
															win</a></h4>
													<div class="post-metas">
														<ul class="list-inline">
															<li>By <a href="#">Ahmad Nazeri</a></li>
														</ul>
													</div>
												</div>
											</div>
											<!-- End of .post-block -->
											<div class="media post-block post-block__small">
												<a href="post-format-standard.jsp" class="align-self-center"><img
														class=" m-r-xs-30" src="assets/images/media/small-media-1.jpg"
														alt="media image"></a>
												<div class="media-body">
													<a href="post-format-standard.jsp"
														class="post-cat color-blue-three">BEAUTY</a>
													<h4 class="axil-post-title hover-line hover-line"><a
															href="post-format-standard.jsp">Stocking Your Restaurant
															Kitchen Finding Reliable
															Sellers</a></h4>
													<div class="post-metas">
														<ul class="list-inline">
															<li>By <a href="#">Amachea Jajah</a></li>
														</ul>
													</div>
												</div>
											</div>
											<!-- End of .post-block -->
											<div class="media post-block post-block__small">
												<a href="post-format-standard.jsp" class="align-self-center"><img
														class=" m-r-xs-30" src="assets/images/media/small-media-3.jpg"
														alt="media image"></a>
												<div class="media-body">
													<a href="post-format-standard.jsp"
														class="post-cat color-green-three">TRAVEL</a>
													<h4 class="axil-post-title hover-line hover-line"><a
															href="post-format-standard.jsp">Trip
															To Iqaluit In Nunavut A
															Canadian Arctic
															City</a>
													</h4>
													<div class="post-metas">
														<ul class="list-inline">
															<li>By <a href="post-format-standard.jsp">Xu Jianhong</a>
															</li>
														</ul>
													</div>
												</div>
											</div>
											<!-- End of .post-block -->
											<div class="media post-block post-block__small">
												<a href="post-format-standard.jsp" class="align-self-center"><img
														class=" m-r-xs-30" src="assets/images/media/small-media-4.jpg"
														alt="media image"></a>
												<div class="media-body">
													<a href="post-format-standard.jsp"
														class="post-cat color-blue-one">FASHION</a>
													<h4 class="axil-post-title hover-line hover-line"><a
															href="post-format-standard.jsp">To
															Keep Makeup Looking Fresh
															Take A Powder</a></h4>
													<div class="post-metas">
														<ul class="list-inline">
															<li>By <a href="#">Sergio Pliego</a></li>
														</ul>
													</div>
												</div>
											</div>
											<!-- End of .post-block -->
										</div>
										<!-- End of .content -->
									</div>
									<!-- End of .tab-pane -->
								</div>
								<!-- End of .tab-content -->
							</div>
							<!-- End of .sidebar-post-widget -->
							<div class="instagram-widget m-b-xs-40">
								<div class="widget-title">
									<h3>Instagram</h3>
								</div>
								<div class="axil-content">
									<ul class="instagram-post-list-wrapper">
										<li class="instagram-post-list perfect-square">
											<a href="#" class="list-inner"
												style="background-image: url(assets/images/instagram-post/instagram-post-1.jpg)">
												<div class="post-info-wrapper overlay">
													<div class="post-info">
														<i class="feather icon-heart"></i>
														20K+
													</div>
													<!-- End of .post-info -->
													<div class="post-info">
														<i class="feather icon-message-square"></i>
														200+
													</div>
													<!-- End of .post-info -->
												</div>
												<!-- End of .post-info-wrapper overlay -->
											</a>
										</li>
										<!-- End of .instagram-post-list -->
										<li class="instagram-post-list perfect-square">
											<a href="#" class="list-inner"
												style="background-image: url(assets/images/instagram-post/instagram-post-2.jpg)">
												<div class="post-info-wrapper overlay">
													<div class="post-info">
														<i class="feather icon-heart"></i>
														20K+
													</div>
													<!-- End of .post-info -->
													<div class="post-info">
														<i class="feather icon-message-square"></i>
														200+
													</div>
													<!-- End of .post-info -->
												</div>
												<!-- End of .post-info-wrapper overlay -->
											</a>
										</li>
										<!-- End of .instagram-post-list -->
										<li class="instagram-post-list perfect-square">
											<a href="#" class="list-inner"
												style="background-image: url(assets/images/instagram-post/instagram-post-3.jpg)">
												<div class="post-info-wrapper overlay">
													<div class="post-info">
														<i class="feather icon-heart"></i>
														20K+
													</div>
													<!-- End of .post-info -->
													<div class="post-info">
														<i class="feather icon-message-square"></i>
														200+
													</div>
													<!-- End of .post-info -->
												</div>
												<!-- End of .post-info-wrapper overlay -->
											</a>
										</li>
										<!-- End of .instagram-post-list -->
										<li class="instagram-post-list perfect-square">
											<a href="#" class="list-inner"
												style="background-image: url(assets/images/instagram-post/instagram-post-4.jpg)">
												<div class="post-info-wrapper overlay">
													<div class="post-info">
														<i class="feather icon-heart"></i>
														20K+
													</div>
													<!-- End of .post-info -->
													<div class="post-info">
														<i class="feather icon-message-square"></i>
														200+
													</div>
													<!-- End of .post-info -->
												</div>
												<!-- End of .post-info-wrapper overlay -->
											</a>
										</li>
										<!-- End of .instagram-post-list -->
										<li class="instagram-post-list perfect-square">
											<a href="#" class="list-inner"
												style="background-image: url(assets/images/instagram-post/instagram-post-5.jpg)">
												<div class="post-info-wrapper overlay">
													<div class="post-info">
														<i class="feather icon-heart"></i>
														20K+
													</div>
													<!-- End of .post-info -->
													<div class="post-info">
														<i class="feather icon-message-square"></i>
														200+
													</div>
													<!-- End of .post-info -->
												</div>
												<!-- End of .post-info-wrapper overlay -->
											</a>
										</li>
										<!-- End of .instagram-post-list -->
										<li class="instagram-post-list perfect-square">
											<a href="#" class="list-inner"
												style="background-image: url(assets/images/instagram-post/instagram-post-6.jpg)">
												<div class="post-info-wrapper overlay">
													<div class="post-info">
														<i class="feather icon-heart"></i>
														20K+
													</div>
													<!-- End of .post-info -->
													<div class="post-info">
														<i class="feather icon-message-square"></i>
														200+
													</div>
													<!-- End of .post-info -->
												</div>
												<!-- End of .post-info-wrapper overlay -->
											</a>
										</li>
										<!-- End of .instagram-post-list -->
									</ul>
									<!-- End of .instagram-post-list-wrapper -->
									<div class="m-t-xs-20">
										<button class="btn btn-primary btn-small">FOLLOW US</button>
									</div>
								</div>
								<!-- End of .content -->
							</div>
							<!-- End of .instagram-widget -->
						</aside>
						<!-- End of .post-sidebar -->
					</div>
					<!-- End of .col-lg-4 -->
				</div>
				<!-- End of .row -->
			</div>
			<!-- End of .container -->
		</div>
		<%} %>
		
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
	<script src="https://cdn.jsdelivr.net/npm/css-vars-ponyfill@2"></script>
	<!-- Plugins -->
	<script src="assets/js/plugins.js"></script>
	<!-- Custom Script -->
	<script src="assets/js/main.js"></script>
</body>

</html>