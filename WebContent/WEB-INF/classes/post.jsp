<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prince - ${view.title}</title>
<link rel="icon" type="image/png" sizes="192x192" href="assets/favicon/android-icon-192x192.png">
	<link rel="icon" type="image/png" sizes="32x32" href="assets/favicon/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/favicon/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="assets/favicon/favicon-16x16.png">
	<link rel="manifest" href="assets/favicon/manifest.json">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="assets/favicon/ms-icon-144x144.png">
	<meta name="theme-color" content="#ffffff">	
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>

</head>
</head>
<body>
	<c:import url="/WEB-INF/classes/header.jsp" />
	<c:if test="${!empty(view)}">
		<script type="text/javascript">
	window.onload = function () {
		document.getElementById("1").style.display = "none";
	    var 
	        display2 = document.querySelector('#time'),
	        timer2 = new CountDownTimer(60);

	  
	    timer2.onTick(format(display2)).start();

	    function format(display) {
	        return function (minutes, seconds) {
	            minutes = minutes < 10 ? "0" + minutes : minutes;
	            seconds = seconds < 10 ? "0" + seconds : seconds;
	            display.textContent = minutes + ':' + seconds;
	        };
	    }
	};
	function CountDownTimer(duration, granularity) {
	    this.duration = duration;
	    this.granularity = granularity || 1000;
	    this.tickFtns = [];
	    this.running = false;
	}
	CountDownTimer.prototype.start = function() {
	    if (this.running) {
	        return;
	    }
	    this.running = true;
	    var start = Date.now(),
	        that = this,
	        diff, obj;
	    (function timer() {
	        diff = that.duration - (((Date.now() - start) / 1000) | 0);
	        if (diff > 0) {
	            setTimeout(timer, that.granularity);
	        } else {
	            diff = 0;
	            document.getElementById("2").style.display = "none";
	            document.getElementById("1").style.display = "grid";
	            that.running = false;
	            
	        }
	        obj = CountDownTimer.parse(diff);
	        that.tickFtns.forEach(function(ftn) {
	            ftn.call(this, obj.minutes, obj.seconds);
	        }, that);
	    }());
	};
	CountDownTimer.prototype.onTick = function(ftn) {
	    if (typeof ftn === 'function') {
	        this.tickFtns.push(ftn);
	    }
	    return this;
	};
	CountDownTimer.prototype.expired = function() {
	    return !this.running;
	};
	CountDownTimer.parse = function(seconds) {
	    return {
	        'minutes': (seconds / 60) | 0,
	        'seconds': (seconds % 60) | 0
	    };
	};
	</script>
		<!-- Main contents
	================================================ -->
		<div class="main-content">

			<div class="breadcrumb-wrapper">
				<div class="container">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
							<li class="breadcrumb-item"><a
								href="${pageContext.request.contextPath}/MyListPost">Quảng
									cáo của tôi</a></li>
							<li class="breadcrumb-item active" aria-current="page">${view.title}</li>
						</ol>
						<!-- End of .breadcrumb -->
					</nav>
				</div>
				<!-- End of .container -->
			</div>
			<!-- End of .breadcrumb-container -->
			<c:if test="${view.format == 1}">
				<!-- Banner starts -->
				<section class="banner banner__single-post banner__standard">
					<div class="container">
						<div class="row align-items-center">
							<div class="col-lg-6">
								<div class="post-title-wrapper">
									<div class="btn-group">
										<a class="cat-btn bg-color-blue-one">${view.getCategoryName()}</a>
									</div>

									<h2 class="m-t-xs-20 m-b-xs-0 axil-post-title hover-line">${view.title}</h2>
									<div class="post-metas banner-post-metas m-t-xs-20">
										<ul class="list-inline">
											<li><a class="post-author post-author-with-img"><img
													src="assets/images/user/avatar.png" alt="author">${userName}</a></li>
											<li><a><i class="feather icon-activity"></i>${view.visiter }
													Lượt xem</a></li>
										</ul>
									</div>
									<!-- End of .post-metas -->
								</div>
								<!-- End of .post-title-wrapper -->
							</div>
							<!-- End of .col-lg-6 -->

							<div class="col-lg-6">
								<img src="${view.image}" alt="ảnh bìa" class="img-fluid rounded"
									width="600" height="600">
							</div>
						</div>
						<!-- End of .row -->
					</div>
					<!-- End of .container -->
				</section>
				<!-- End of .banner -->

				<!-- post-single-wrapper starts -->
				<div class="post-single-wrapper p-t-xs-60 p-b-xs-40 ">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<main class="site-main">
									<article class="post-details">
										<div class="single-blog-wrapper">

											<!-- End of .social-share -->


											<h3>${view.subTitle1}</h3>

											<figure>
												<img class="rounded" src="${view.image1}" alt="img"
													style="margin: 0 11rem; width: 80%;">
												<figcaption style="font-size: 1.4rem; text-align: center;">${view.figure1}</figcaption>
											</figure>


											<p>${view.content1}</p>



											<h3>${view.subTitle2}</h3>

											<figure>
												<img class="rounded" src="${view.image2}" alt="img"
													style="margin: 0 11rem; width: 80%;">
												<figcaption style="font-size: 1.4rem; text-align: center;">${view.figure2}</figcaption>
											</figure>
											<!-- End of .gallery -->

											<p>${view.content2}</p>
											<h3>Video</h3>

											<figure class="post-media">
												<video class="plyr-post" preload="metadata" id="preview"
													src="${view.video}" controls>
													<source src="video.mp4#t=0.1" type="video/mp4">
													<source src="video.ogg#t=0.1" type="video/ogg">
													<source src="video.webm#t=0.1" type="video/webm">
												</video>
												<figcaption style="font-size: 1.4rem; text-align: center;">${view.figure3}</figcaption>
											</figure>
			</c:if>
			<c:if test="${view.format == 2}">
			<script type="text/javascript">
			 $(document).ready(function () {	
				var videoElement = document.getElementById('video');  
				videoElement.focus();
				videoElement.load();
				videoElement.play();		
				if (document.webkitCancelFullScreen) { 
					document.documentElement.scrollTop = document.body.scrollTop = 250;
				}
				videoElement.webkitRequestFullScreen();
			 });
			 
			</script>
				<div class="post-single-wrapper p-t-xs-60 p-b-xs-40 ">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<main class="site-main">
									<article class="post-details">
										<div class="single-blog-wrapper">
											<figure class="post-media">
												<video class="plyr-post" preload="metadata" id="video" 
													src="${view.video}" controls autoplay  >
													<source src="video.mp4#t=1" type="video/mp4">
													<source src="video.ogg#t=1" type="video/ogg">
													<source src="video.webm#t=1" type="video/webm">
												</video>
											</figure>
										<script type="text/javascript">
			</script>
			</c:if>
			<!--  -->

			<div class="col-6">
				<a href="" class="paw-button">
					<div class="text">
						<svg>
            <use xlink:href="#heart">
        </svg>
						<span>Like</span>
					</div> <span>12</span>
					<div class="paws">
						<svg class="paw">
            <use xlink:href="#paw">
        </svg>
						<div class="paw-effect">
							<div></div>
						</div>
						<svg class="paw-clap">
            <use xlink:href="#paw-clap">
        </svg>
					</div>
				</a>

				<!-- Symbols -->
				<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 21 19"
						id="heart">
        <path
						d="M10.7146252,2.79863032 C12.7012563,0.931232655 14.9323041,0.436636741 17.303155,1.3849771 C20.1742369,2.53340984 21.379939,5.46245395 20.2209696,8.35987762 C19.6094364,9.88871051 17.374953,12.5020804 13.4593886,16.3167815 L12.4216841,17.3182725 C11.3603119,18.3334838 9.68851069,18.3354777 8.62471989,17.322801 L7.91413528,16.6420566 C3.86646758,12.738617 1.52252172,10.0157042 0.832966246,8.37137962 C-0.41863058,5.38680258 0.803066105,2.56217827 3.74606902,1.3849771 C5.99801057,0.484200479 8.20491678,0.982789394 10.280801,2.80379411 L10.5027119,3.00395851 L10.7146252,2.79863032 Z"
						fill="var(--border)"></path>
        <path
						d="M16.746069,2.77769213 C14.6991759,1.9589349 12.8646007,2.52341959 11.0917453,4.57210939 L10.5493822,5.19885746 L9.97978137,4.59675633 C8.07203164,2.58015418 6.22092676,2.01058345 4.30315504,2.77769213 C2.13116413,3.6464885 1.29186971,5.5869795 2.21625782,7.79128961 C2.80060177,9.18472518 5.06951474,11.8148892 8.97366525,15.5798429 L9.65895765,16.2363608 C10.142501,16.6966703 10.9024138,16.695764 11.3840599,16.2350667 L12.3934356,15.260969 L13.3524601,14.3169524 C16.5267562,11.1578139 18.3665388,8.9570809 18.8282545,7.80279161 C19.6830863,5.66571221 18.8388588,3.61480804 16.746069,2.77769213 Z"
						fill="var(--background)"></path>
        <path
						d="M11.2640718,4.39338901 L11.1990259,4.45003381 C12.9386445,2.50122541 14.7404343,1.97543825 16.746069,2.77769213 C18.8388588,3.61480804 19.6830863,5.66571221 18.8282545,7.80279161 C18.3963269,8.88261062 17.6718097,9.565648 18.0773108,8.55189509 C18.9321426,6.41481569 18.0879151,4.36391153 15.9951253,3.52679561 C14.3011449,2.84920342 12.7525807,3.11899214 11.2640718,4.39338901 L11.1990259,4.45003381 L11.2640718,4.39338901 Z"
						fill="var(--shadow-light)"></path>
        <path
						d="M4.30315504,2.77769213 C5.1840079,2.42535099 6.05079631,2.35500405 6.91546905,2.57734431 C6.71200283,2.6290933 6.50795909,2.69577051 6.30315504,2.77769213 C4.13116413,3.6464885 3.29186971,5.5869795 4.21625782,7.79128961 C4.80060177,9.18472518 7.06951474,11.8148892 10.9736653,15.5798429 L11.5197324,16.1027938 L11.3840599,16.2350667 C10.9368171,16.6628571 10.2496402,16.694195 9.76660209,16.3279397 L9.65895765,16.2363608 L8.97366525,15.5798429 L8.30168234,14.9272399 C4.80841276,11.5097375 2.7662286,9.10275838 2.21625782,7.79128961 C1.29186971,5.5869795 2.13116413,3.6464885 4.30315504,2.77769213 Z"
						fill="var(--shadow-dark)"></path>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 37"
						id="paw">
        <path
						d="M29.5,13.1428571 C29.5,10.2731801 27.9339013,8.22572388 24.9356506,7.09074873 C24.5060635,4.10962466 23.2255501,2.04210672 21.0854102,0.97203675 C18.9713961,-0.0849702928 16.8221988,0.0215138899 14.726671,1.27088412 C12.9760568,0.361959777 11.0555026,0.250453528 9.01282918,0.931344669 C6.80047326,1.66879664 5.34226875,3.75843749 4.59894815,7.09619125 C1.88946192,8.25783275 0.5,10.4828381 0.5,13.6428571 C0.5,16.7274666 1.50305875,19.3423638 3.5,21.4476618 L3.5,37 L5,37 L26,37 L26,21.4218665 C28.3223642,18.6969403 29.5,15.9336988 29.5,13.1428571 Z"
						fill="var(--paw-background)"></path>
        <path
						d="M12.5510071,2.08359581 L12.3699777,2.11684999 C12.080837,2.17532308 11.7866606,2.25446 11.4871708,2.35428994 C9.84726969,2.90092365 8.68967842,4.56898134 8.05392526,7.46323001 L7.98543551,7.78986457 L7.90367876,8.19864828 L7.51334258,8.34502435 C5.14457644,9.23331165 4,10.9501763 4,13.6427775 C4,16.3251292 4.84482735,18.5538216 6.54341216,20.3676718 L6.78033009,20.6124474 L7,20.8321173 L7,37 L5,37 L5,20.8321173 L4.78033009,20.6124474 C2.92337534,18.7554926 2,16.4470543 2,13.6427775 C2,10.9501763 3.14457644,9.23331165 5.51334258,8.34502435 L5.90367876,8.19864828 L5.98543551,7.78986457 C6.60459253,4.69407947 7.78653261,2.92116934 9.48717082,2.35428994 C10.5739986,1.99201401 11.5908529,1.90224716 12.5510071,2.08359581 Z"
						fill="var(--paw-shadow)"></path>
        <path
						d="M14.726671,1.27088412 C16.8221988,0.0215138899 18.9713961,-0.0849702928 21.0854102,0.97203675 C23.2255501,2.04210672 24.5060635,4.10962466 24.9356506,7.09074873 C27.9339013,8.22572388 29.5,10.2731801 29.5,13.1428571 C29.5,15.9336988 28.3223642,18.6969403 26,21.4218665 L26,21.4218665 L26,37 L24.5,37 L24.5,20.8610558 L24.9573772,20.3318354 C26.9962284,17.9020144 28,15.5090865 28,13.1428571 C28,10.8190336 26.722442,9.2575739 24.0128292,8.35436962 L24.0128292,8.35436962 L23.5575804,8.20262004 L23.5045872,7.72568079 C23.1972701,4.95982682 22.1638979,3.18833157 20.4145898,2.31367754 C18.6608767,1.43682096 16.9468873,1.57965341 15.1660251,2.76689486 L15.1660251,2.76689486 L14.7711145,3.03016863 L14.3641282,2.78597684 C12.8897645,1.90135863 11.2841096,1.75539001 9.48717082,2.35436962 C7.78653261,2.92124902 6.60459253,4.69415915 5.98543551,7.78994424 L5.98543551,7.78994424 L5.90367876,8.19872796 L5.51334258,8.34510403 C3.14457644,9.23339133 2,10.950256 2,13.6428571 C2,16.447134 2.92337534,18.7555723 4.78033009,20.6125271 L4.78033009,20.6125271 L5,20.832197 L5,37 L3.5,37 L3.5,21.4476618 C1.50305875,19.3423638 0.5,16.7274666 0.5,13.6428571 C0.5,10.4828381 1.88946192,8.25783275 4.59894815,7.09619125 C5.34226875,3.75843749 6.80047326,1.66879664 9.01282918,0.931344669 C11.0555026,0.250453528 12.9760568,0.361959777 14.726671,1.27088412 Z M16.638062,12.5195284 L16.9751913,12.7601688 C18.0967789,13.5694838 18.9749332,14.293632 19.612949,14.9387355 L20.4989182,15.8729074 L20.7275495,16.1198892 C22.287511,17.8257331 23,19.06095 23,20.6428571 C23,22.748712 21.7937122,24.2093565 20.0022523,24.8491636 C18.9997434,25.2072025 17.5693092,24.7939391 15.5897122,23.7023129 C15.4916937,23.6482617 15.3696945,23.6659395 15.2777616,23.7587157 L15.0962469,23.9332613 C14.0702327,24.8715531 12.8663041,25.1950155 11.5680983,24.870464 C9.23960588,24.2883409 8,22.8481455 8,20.6428571 C8,19.4464248 8.41219153,18.5150362 9.30032474,17.3580767 L9.49794706,17.1065253 L10.4509499,15.9471049 L10.8327975,15.4568873 L11.2281207,14.9649287 C11.5787918,14.5376029 11.9825802,14.0668257 12.4397068,13.5522181 L13.013875,12.9136261 C13.9478461,11.8864129 15.5009892,11.7164518 16.638062,12.5195284 Z M14.2188164,13.8286484 L14.1237093,13.9227187 L13.565323,14.5437006 L13.0582509,15.1219097 C12.6570954,15.5858882 12.3094806,16.0051601 12.0156272,16.3793463 L11.6250373,16.880668 C11.5474831,16.9778167 11.4648982,17.0794322 11.3741223,17.1896922 L10.7635094,17.9277201 L10.497234,18.2622383 C9.79053097,19.1808965 9.5,19.8386072 9.5,20.6428571 C9.5,22.1284827 10.2444388,22.9933845 11.9319017,23.4152503 C12.7338477,23.6157368 13.4233225,23.4304939 14.0697076,22.8397189 L14.2236793,22.6916816 C14.7741221,22.1342076 15.628003,22.0104801 16.3140407,22.3887878 C17.9353381,23.2828338 19.0369863,23.6011084 19.4977477,23.4365507 C20.7300594,22.9964394 21.5,22.0641498 21.5,20.6428571 C21.5,19.5464758 20.9372875,18.5728913 19.6185239,17.1299681 L19.4039869,16.8981515 L18.5391359,15.986118 C17.9689582,15.4108027 17.1542319,14.739096 16.1006156,13.9788165 L15.769682,13.7425992 C15.2910354,13.4045518 14.6481234,13.4470184 14.2188164,13.8286484 Z M6.25,10.6428571 C7.90685425,10.6428571 9.25,12.2098605 9.25,14.1428571 C9.25,16.0758538 7.90685425,17.6428571 6.25,17.6428571 C4.59314575,17.6428571 3.25,16.0758538 3.25,14.1428571 C3.25,12.2098605 4.59314575,10.6428571 6.25,10.6428571 Z M23.25,9.64285714 C24.9068542,9.64285714 26.25,11.2098605 26.25,13.1428571 C26.25,15.0758538 24.9068542,16.6428571 23.25,16.6428571 C21.5931458,16.6428571 20.25,15.0758538 20.25,13.1428571 C20.25,11.2098605 21.5931458,9.64285714 23.25,9.64285714 Z M6.25,12.1428571 C5.47730131,12.1428571 4.75,12.9913753 4.75,14.1428571 C4.75,15.2943389 5.47730131,16.1428571 6.25,16.1428571 C7.02269869,16.1428571 7.75,15.2943389 7.75,14.1428571 C7.75,12.9913753 7.02269869,12.1428571 6.25,12.1428571 Z M23.25,11.1428571 C22.4773013,11.1428571 21.75,11.9913753 21.75,13.1428571 C21.75,14.2943389 22.4773013,15.1428571 23.25,15.1428571 C24.0226987,15.1428571 24.75,14.2943389 24.75,13.1428571 C24.75,11.9913753 24.0226987,11.1428571 23.25,11.1428571 Z M18.25,3.64285714 C19.9068542,3.64285714 21.25,5.20986052 21.25,7.14285714 C21.25,9.07585377 19.9068542,10.6428571 18.25,10.6428571 C16.5931458,10.6428571 15.25,9.07585377 15.25,7.14285714 C15.25,5.20986052 16.5931458,3.64285714 18.25,3.64285714 Z M11.25,3.64285714 C12.9068542,3.64285714 14.25,5.20986052 14.25,7.14285714 C14.25,9.07585377 12.9068542,10.6428571 11.25,10.6428571 C9.59314575,10.6428571 8.25,9.07585377 8.25,7.14285714 C8.25,5.20986052 9.59314575,3.64285714 11.25,3.64285714 Z M18.25,5.14285714 C17.4773013,5.14285714 16.75,5.99137534 16.75,7.14285714 C16.75,8.29433895 17.4773013,9.14285714 18.25,9.14285714 C19.0226987,9.14285714 19.75,8.29433895 19.75,7.14285714 C19.75,5.99137534 19.0226987,5.14285714 18.25,5.14285714 Z M11.25,5.14285714 C10.4773013,5.14285714 9.75,5.99137534 9.75,7.14285714 C9.75,8.29433895 10.4773013,9.14285714 11.25,9.14285714 C12.0226987,9.14285714 12.75,8.29433895 12.75,7.14285714 C12.75,5.99137534 12.0226987,5.14285714 11.25,5.14285714 Z"
						fill="var(--paw-border)"></path>
        <path
						d="M14.2188164,13.8286484 C14.6481234,13.4470184 15.2910354,13.4045518 15.769682,13.7425992 L15.769682,13.7425992 L16.1006156,13.9788165 C17.1542319,14.739096 17.9689582,15.4108027 18.5391359,15.986118 L18.5391359,15.986118 L19.4039869,16.8981515 L19.6185239,17.1299681 C20.9372875,18.5728913 21.5,19.5464758 21.5,20.6428571 C21.5,22.0641498 20.7300594,22.9964394 19.4977477,23.4365507 C19.0369863,23.6011084 17.9353381,23.2828338 16.3140407,22.3887878 C15.628003,22.0104801 14.7741221,22.1342076 14.2236793,22.6916816 L14.2236793,22.6916816 L14.0697076,22.8397189 C13.4233225,23.4304939 12.7338477,23.6157368 11.9319017,23.4152503 C10.2444388,22.9933845 9.5,22.1284827 9.5,20.6428571 C9.5,19.8386072 9.79053097,19.1808965 10.497234,18.2622383 L10.497234,18.2622383 L10.7635094,17.9277201 L11.3741223,17.1896922 C11.4648982,17.0794322 11.5474831,16.9778167 11.6250373,16.880668 L11.6250373,16.880668 L12.0156272,16.3793463 C12.3094806,16.0051601 12.6570954,15.5858882 13.0582509,15.1219097 L13.0582509,15.1219097 L13.565323,14.5437006 L14.1237093,13.9227187 Z M6.25,12.1428571 C7.07842712,12.1428571 7.75,13.0382876 7.75,14.1428571 C7.75,15.2474266 7.07842712,16.1428571 6.25,16.1428571 C5.42157288,16.1428571 4.75,15.2474266 4.75,14.1428571 C4.75,13.0382876 5.42157288,12.1428571 6.25,12.1428571 Z M23.25,11.1428571 C24.0784271,11.1428571 24.75,12.0382876 24.75,13.1428571 C24.75,14.2474266 24.0784271,15.1428571 23.25,15.1428571 C22.4215729,15.1428571 21.75,14.2474266 21.75,13.1428571 C21.75,12.0382876 22.4215729,11.1428571 23.25,11.1428571 Z M11.25,5.14285714 C12.0784271,5.14285714 12.75,6.03828764 12.75,7.14285714 C12.75,8.24742664 12.0784271,9.14285714 11.25,9.14285714 C10.4215729,9.14285714 9.75,8.24742664 9.75,7.14285714 C9.75,6.03828764 10.4215729,5.14285714 11.25,5.14285714 Z M18.25,5.14285714 C19.0784271,5.14285714 19.75,6.03828764 19.75,7.14285714 C19.75,8.24742664 19.0784271,9.14285714 18.25,9.14285714 C17.4215729,9.14285714 16.75,8.24742664 16.75,7.14285714 C16.75,6.03828764 17.4215729,5.14285714 18.25,5.14285714 Z"
						fill="var(--paw-inner)"></path>
        <path
						d="M15.6564811,13.6713241 L15.769682,13.7425992 L15.7989878,13.7631232 L15.7188164,13.8286484 L15.6237093,13.9227187 L15.065323,14.5437006 L14.5582509,15.1219097 C14.1570954,15.5858882 13.8094806,16.0051601 13.5156272,16.3793463 L13.1250373,16.880668 L12.8741223,17.1896922 L12.2635094,17.9277201 L11.997234,18.2622383 C11.290531,19.1808965 11,19.8386072 11,20.6428571 C11,22.0705306 11.6874927,22.9249629 13.2387185,23.3638482 C12.8332452,23.5177596 12.4018884,23.5327469 11.9319017,23.4152503 C10.2444388,22.9933845 9.5,22.1284827 9.5,20.6428571 C9.5,19.9004726 9.74755301,19.2829499 10.3414792,18.4697896 L10.497234,18.2622383 L10.7635094,17.9277201 L11.504538,17.0302633 L11.6250373,16.880668 L12.0156272,16.3793463 C12.2507099,16.0799973 12.5201999,15.7517935 12.8239843,15.394929 L13.0582509,15.1219097 L13.565323,14.5437006 L14.1237093,13.9227187 L14.2188164,13.8286484 C14.6150998,13.4763746 15.1933898,13.413092 15.6564811,13.6713241 Z M6.25,12.1428571 C6.33532091,12.1428571 6.41897804,12.1523552 6.50040906,12.1706015 C5.79087888,12.3287352 5.25,13.1515768 5.25,14.1428571 C5.25,15.1341375 5.79087888,15.9569791 6.50060472,16.1153394 C6.41897804,16.1333591 6.33532091,16.1428571 6.25,16.1428571 C5.42157288,16.1428571 4.75,15.2474266 4.75,14.1428571 C4.75,13.0382876 5.42157288,12.1428571 6.25,12.1428571 Z M23.25,11.1428571 C23.3353209,11.1428571 23.418978,11.1523552 23.5004091,11.1706015 C22.7908789,11.3287352 22.25,12.1515768 22.25,13.1428571 C22.25,14.1341375 22.7908789,14.9569791 23.5006047,15.1153394 C23.418978,15.1333591 23.3353209,15.1428571 23.25,15.1428571 C22.4215729,15.1428571 21.75,14.2474266 21.75,13.1428571 C21.75,12.0382876 22.4215729,11.1428571 23.25,11.1428571 Z M11.25,5.14285714 C11.3353209,5.14285714 11.418978,5.15235519 11.5004091,5.17060154 C10.7908789,5.32873521 10.25,6.15157682 10.25,7.14285714 C10.25,8.13413746 10.7908789,8.95697908 11.5006047,9.11533943 C11.418978,9.1333591 11.3353209,9.14285714 11.25,9.14285714 C10.4215729,9.14285714 9.75,8.24742664 9.75,7.14285714 C9.75,6.03828764 10.4215729,5.14285714 11.25,5.14285714 Z M18.25,5.14285714 C18.3353209,5.14285714 18.418978,5.15235519 18.5004091,5.17060154 C17.7908789,5.32873521 17.25,6.15157682 17.25,7.14285714 C17.25,8.13413746 17.7908789,8.95697908 18.5006047,9.11533943 C18.418978,9.1333591 18.3353209,9.14285714 18.25,9.14285714 C17.4215729,9.14285714 16.75,8.24742664 16.75,7.14285714 C16.75,6.03828764 17.4215729,5.14285714 18.25,5.14285714 Z"
						fill="var(--paw-shadow-dark)"></path>
        <path
						d="M18.3607518,15.8106395 L18.5391359,15.986118 L19.4039869,16.8981515 L19.6185239,17.1299681 C20.9372875,18.5728913 21.5,19.5464758 21.5,20.6428571 C21.5,22.0641498 20.7300594,22.9964394 19.4977477,23.4365507 C19.3094393,23.5038037 19.0140855,23.4904106 18.6199622,23.3900272 L18.4977477,23.4365507 C19.7300594,22.9964394 20.5,22.0641498 20.5,20.6428571 C20.5,19.5464758 20.5687636,18.5857803 19.25,17.1428571 C18.2857494,15.8980028 17.9893333,15.4539302 18.3607518,15.8106395 Z"
						fill="var(--paw-shadow-light)"></path>
    </symbol>
    <symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 29 34"
						id="paw-clap">
        <path
						d="M4.5,34 L4.5,20.5024009 L4.28033009,20.282731 C2.42337534,18.4257762 1.5,16.1173379 1.5,13.313061 C1.5,10.6471662 2.60979812,9.12119381 4.93190172,8.54066791 L5.40134193,8.42330786 L5.48790243,7.94722512 C6.11076052,4.52150561 7.30156981,2.58644052 8.98717082,2.02457351 C10.7449132,1.4386594 12.3127354,1.72371798 13.7814787,2.89871265 L14.2596812,3.28127461 L14.7301383,2.889227 C16.5115081,1.40475216 18.1951255,1.12414927 19.9145898,1.98388143 C21.651916,2.85254456 22.6936777,4.78724477 23.0037221,7.88768883 L23.0577045,8.42751297 L23.5873022,8.54520133 C26.260051,9.13914552 27.5,10.5168667 27.5,12.813061 C27.5,15.28217 26.4070465,17.7803495 24.1855675,20.3191826 L24,20.5312597 L24,34 L4.5,34 Z"
						fill="var(--paw-clap-background)"></path>
        <path
						d="M12.146803,1.97288306 L11.9871708,2.02457351 C10.359694,2.56706579 9.19347364,4.38968566 8.55435901,7.59815296 L8.48790243,7.94722512 L8.40134193,8.42330786 L7.93190172,8.54066791 C5.60979812,9.12119381 4.5,10.6471662 4.5,13.313061 C4.5,15.9954128 5.34482735,18.2241051 7.04341216,20.0379554 L7.28033009,20.282731 L7.5,20.5024009 L7.5,34 L4.5,34 L4.5,20.5024009 L4.28033009,20.282731 C2.42337534,18.4257762 1.5,16.1173379 1.5,13.313061 C1.5,10.6471662 2.60979812,9.12119381 4.93190172,8.54066791 L5.40134193,8.42330786 L5.48790243,7.94722512 C6.11076052,4.52150561 7.30156981,2.58644052 8.98717082,2.02457351 C10.1099844,1.65030233 11.1553025,1.63142458 12.146803,1.97288306 Z"
						fill="var(--paw-clap-shadow)"></path>
        <path
						d="M29,12.813061 C29,9.9391533 27.4240531,8.03364289 24.4355571,7.21065466 C24.0076525,3.9347868 22.7345972,1.71683414 20.5854102,0.642240647 C18.464427,-0.418250938 16.3124373,-0.158512501 14.2369156,1.37034347 C12.4952684,0.178909945 10.5640578,-0.0821942985 8.51282918,0.601548566 C6.29105947,1.34213847 4.84205262,3.58191705 4.10108646,7.21697394 C1.39604257,8.06878334 0,10.155857 0,13.313061 C0,16.3976705 1.00305875,19.0125677 3,21.1178657 L3,34 L4.5,34 L4.5,20.5024009 L4.28033009,20.282731 C2.42337534,18.4257762 1.5,16.1173379 1.5,13.313061 C1.5,10.6471662 2.60979812,9.12119381 4.93190172,8.54066791 L5.40134193,8.42330786 L5.48790243,7.94722512 C6.11076052,4.52150561 7.30156981,2.58644052 8.98717082,2.02457351 C10.7449132,1.4386594 12.3127354,1.72371798 13.7814787,2.89871265 L14.2596812,3.28127461 L14.7301383,2.889227 C16.5115081,1.40475216 18.1951255,1.12414927 19.9145898,1.98388143 C21.651916,2.85254456 22.6936777,4.78724477 23.0037221,7.88768883 L23.0577045,8.42751297 L23.5873022,8.54520133 C26.260051,9.13914552 27.5,10.5168667 27.5,12.813061 C27.5,15.28217 26.4070465,17.7803495 24.1855675,20.3191826 L24,20.5312597 L24,34 L25.5,34 L25.5,21.0920704 C27.8223642,18.3671442 29,15.6039027 29,12.813061 Z"
						fill="var(--paw-clap-border)"></path>
    </symbol>
</svg>



			</div>
		</div>
		<c:if test="${view.format==1}">
		<div class="row">
			<div class="contai mb-5 " id="1">

				<a href="${view.url}" target="_blank"><span class="pulse-button"
					id="recive">Nhận 10</span></a>
			</div>
			<div class='contai mb-5' id="2">
				<span class="pulse-button" id="time"></span>

			</div>
		</div>
		</c:if>
		</article>

		<hr class="m-t-xs-50 m-b-xs-30">

		<div class="ui huge comments" id="commentbox">

			<h2 class="ui dividing header">Bình luận</h2>
			<form class="ui reply form">
				<input type="hidden" value="${view.post_id}" id="idView"> <input
					type="hidden" value="${valuecmt}" id="valuecmt">
				<div class="field">
					<textarea id="content"></textarea>
				</div>
				<div class="ui primary submit labeled icon button" id="addcmt">
					<i class="icon edit"></i> Gửi
				</div>
				<script type="text/javascript">
        $(document).ready(function () {
            $("#addcmt").click(function(){
                var content = $('#content').val();
                var postId = $('#idView').val();
                var userId = ${user_id};
               
              if(content!='' && $('#valuecmt').val() < 10){
                $.ajax({
                    url: 'Comment',
                    type: 'POST',
                    data: {content : content,
                    		postId : postId,
                    		userId : userId
                    		
                    },
                    success: function (data) {
                    	$('#commentbox').load("/Prince/CommentView");	
                    	 $("#content").val('');
                    	
                    },
                    error: function (e) {
                        console.log(e.message);
                    }
                });
            	  
              }else{
        		  alert("Xin lỗi, có lẽ bạn đang spam bình luận \nHãy dừng lại!");
        	  }
            });
        });
 </script>
			</form>

			<c:forEach items="${listCMT}" var="item" varStatus="loop">
				<script type="text/javascript">
									$(document).ready(function(){
										  $("#replycmt${item.comment_id}").click(function(){
											  document.getElementById("form${item.comment_id}").classList.remove('d-none');
										  });
										  $("#cancelcmt${item.comment_id}").click(function(){
											  document.getElementById("form${item.comment_id}").classList.add('d-none');
										  });
										  $("#sendcmt${item.comment_id}").click(function(){
								                var content = $('#content${item.comment_id}').val();
								                var postId = $('#idView').val();
								                var userId = ${user_id};
								                var rootId = ${item.comment_id};
								                var replyId = ${item.comment_id};
								               
								              if(content!='' && $('#valuecmt').val() < 10){
								                $.ajax({
								                    url: 'Comment',
								                    type: 'POST',
								                    data: { content : content,
								                    		postId : postId,
								                    		userId : userId,
								                    		rootId : rootId,
								                    		replyId : replyId
								                    		
								                    },
								                    success: function (data) {
								                    	$('#commentbox').load("/Prince/CommentView");	
								                    	 $("#content${item.comment_id}").val('');
								                    	
								                    },
								                    error: function (e) {
								                        console.log(e.message);
								                    }
								                });
								            	  
								              }else{
								        		  alert("Xin lỗi, có lẽ bạn đang spam bình luận \nHãy dừng lại!");
								        	  }
								            });
										  $("#delcmt${item.comment_id}").click(function(){
								                var delId = ${item.comment_id};
								              if(content!='' && $('#valuecmt').val() < 10){
								                $.ajax({
								                    url: 'Comment',
								                    type: 'GET',
								                    data: { delId : delId,
								                    },
								                    success: function (data) {
								                     document.getElementById("comment${item.comment_id}").classList.add('d-none');
								                    	
								                    },
								                    error: function (e) {
								                        console.log(e.message);
								                    }
								                });
								            	  
								              }else{
								        		  alert("Xin lỗi, có lẽ bạn đang spam bình luận \nHãy dừng lại!");
								        	  }
								            });
										 
										});
									
									</script>
				<div class="comment" id="comment${item.comment_id}">
					<a class="avatar"> <img src="${item.getAvatar()}">
					</a>
					<div class="content">
						<a class="author">${item.getName()}</a>
						<div class="metadata">
							<span class="date">${item.getStringTime()}</span>
						</div>
						<div class="text">
							<p>${item.content}</p>
						</div>
						<div class="actions">
							<a class="reply" id="replycmt${item.comment_id}">Trả lời</a>
							<c:if test="${item.user_id == user_id}">
								<a class="delete" id="delcmt${item.comment_id}">xóa</a>
							</c:if>
						</div>
						<form class="ui reply form d-none" id="form${item.comment_id}">
							<input type="hidden" value="${view.post_id}" id="idView">
							<div class="field">
								<textarea id="content${item.comment_id}"></textarea>
							</div>
							<div class="ui primary submit labeled icon button"
								id="sendcmt${item.comment_id}">
								<i class="icon edit"></i> Gửi
							</div>
							<div class="ui primary submit labeled icon button"
								id="cancelcmt${item.comment_id}">
								<i class="icon cancel"></i> hủy
							</div>
						</form>
					</div>
					<c:forEach items="${item.getSubCmt()}" var="sub" varStatus="loopp">
						<script type="text/javascript">
									$(document).ready(function(){
										  $("#replycmt${sub.comment_id}").click(function(){
											  document.getElementById("form${sub.comment_id}").classList.remove('d-none');
										  });
										  $("#cancelcmt${sub.comment_id}").click(function(){
											  document.getElementById("form${sub.comment_id}").classList.add('d-none');
										  });
										  $("#sendcmt${sub.comment_id}").click(function(){
								                var content = $('#content${sub.comment_id}').val();
								                var postId = $('#idView').val();
								                var userId = ${user_id};
								                var rootId = ${item.comment_id};
								                var replyId = ${sub.comment_id};
								                
								              if(content!='' && $('#valuecmt').val() < 10){
								                $.ajax({
								                    url: 'Comment',
								                    type: 'POST',
								                    data: { content : content,
								                    		postId : postId,
								                    		userId : userId,
								                    		rootId : rootId,
								                    		replyId : replyId
								                    		
								                    },
								                    success: function (data) {
								                    	$('#commentbox').load("/Prince/CommentView");	
								                    	 $("#content${sub.comment_id}").val('');
								                    	
								                    },
								                    error: function (e) {
								                        console.log(e.message);
								                    }
								                });
								            	  
								              }else{
								        		  alert("Xin lỗi, có lẽ bạn đang spam bình luận \nHãy dừng lại!");
								        	  }
								            });
										});
									
									</script>
						<div class="comments" id="comment${sub.comment_id}">
							<div class="comment">
								<a class="avatar"> <img src="${sub.getAvatar()}">
								</a>
								<div class="content">
									<a class="author">${sub.getName()}</a>
									<div class="metadata">
										<span class="date">${sub.getStringTime()}</span>
									</div>
									<div class="text">
										<strong>${sub.getAuthor()}</strong> ${sub.content}
									</div>
									<div class="actions">
										<a class="reply" id="replycmt${sub.comment_id}">trả lời</a>
										<c:if test="${sub.user_id == user_id}">
											<a class="delete" id="delcmt${sub.comment_id}">xóa</a>
										</c:if>
									</div>
									<form class="ui reply form d-none" id="form${sub.comment_id}">
										<input type="hidden" value="${view.post_id}" id="idView">
										<div class="field">
											<textarea id="content${sub.comment_id}"></textarea>
										</div>
										<div class="ui primary submit labeled icon button"
											id="sendcmt${sub.comment_id}">
											<i class="icon edit"></i> gửi
										</div>
										<div class="ui primary submit labeled icon button"
											id="cancelcmt${sub.comment_id}">
											<i class="icon cancel"></i> hủy
										</div>
									</form>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:forEach>

		</div>

		<!-- End of .comment-box -->

		<!-- End of .post-navigation -->
		</main>
		<!-- End of main -->
		</div>
		<!--End of .col-auto  -->


		<!-- footer starts -->

		</div>

		<!-- End of footer -->
		<!-- End of .main-content -->
		</div>
		</div>
		<c:import url="/WEB-INF/classes/footer.jsp" />
		</div>
	</c:if>
	<c:if test="${empty(view)}">
		<div class="row">
			<div class="col-12 m-t-xs-100" style="text-align: center;">Quảng
				cáo không tồn tại</div>
		</div>
	</c:if>
</body>
<script type="text/javascript">
let confettiAmount = 60,
confettiColors = [
    '#7d32f5',
    '#f6e434',
    '#63fdf1',
    '#e672da',
    '#295dfe',
    '#6e57ff'
],
random = (min, max) => {
    return Math.floor(Math.random() * (max - min + 1) + min);
},
createConfetti = to => {
    let elem = document.createElement('i'),
        set = Math.random() < 0.5 ? -1 : 1;
    elem.style.setProperty('--x', random(-260, 260) + 'px');
    elem.style.setProperty('--y', random(-160, 160) + 'px');
    elem.style.setProperty('--r', random(0, 360) + 'deg');
    elem.style.setProperty('--s', random(.6, 1));
    elem.style.setProperty('--b', confettiColors[random(0, 5)]);
    to.appendChild(elem);
};

document.querySelectorAll('.paw-button').forEach(elem => {
elem.addEventListener('click', e => {
    let number = elem.children[1].textContent;
    if(!elem.classList.contains('animation')) {
        elem.classList.add('animation');
        for(let i = 0; i < confettiAmount; i++) {
            createConfetti(elem);
        }
        setTimeout(() => {
            elem.classList.add('confetti');
            setTimeout(() => {
                elem.classList.add('liked');
                elem.children[1].textContent = parseInt(number) + 1;
            }, 400);
            setTimeout(() => {
                elem.querySelectorAll('i').forEach(i => i.remove());
            }, 600);
        }, 260);
    } else {
        elem.classList.remove('animation', 'liked', 'confetti');
        elem.children[1].textContent = parseInt(number) - 1;
    }
    e.preventDefault();
});
});


</script>
</html>