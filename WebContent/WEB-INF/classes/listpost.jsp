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

<!-- Mobile specific metas
    	======================================== -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Page Title
    	======================================== -->
<title>Prince - Posts</title>
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
<style type="text/css">
span {
	font-size: 1.5rem;
}

.col-lg-10 {
	background-color: #EDF3F8;
}

.bg {
	background: mistyrose;
}

.bg-teal {
background-image: linear-gradient(-20deg, #00cdac 0%, #8ddad5 100%);
box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
		transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
		padding: -1rem;
}
span, h5 {
	word-break: break-word;
}

.border-10 {
	border-right-width: 10px !important;
	border-color: aliceblue !important;
}

.item {
	display: flex;
	width: 12rem;
	margin: 2.5rem 3.5rem;
}

.actions-block {
	position: relative;
	overflow: hidden;
	display: inline-block;
	width: 36px;
	background-color: #29B67B;
	border-radius: 20px;
	transition: all 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

.actions-block:hover {
	width: 160px; /* adjust to fit # of icons */
	background-color: #29B67B;
}

.actions-list {
	margin: 0;
	padding: 0px;
	width: 11rem;
}

.actions-list li {
	list-style-type: none;
	display: inline;
}

.actions-list a {
	display: inline-block;
	padding: 3px 10px;
	color: #EFEAF5;
	font-weight: bold;
	font-size: 14px;
	text-decoration: none;
}

.actions-list a:hover {
	color: rgba(255, 255, 255, 1.0);
}

.rowdata:after {
	content: ""; /* This is necessary for the pseudo element to work. */
	display: block; /* This will put the pseudo element on its own line. */
	margin: 0 auto; /* This will center the border. */
	width: 69%; /* Change this to whatever width you want. */
	padding-top: 1.5rem;
	/* This creates some space between the element and the border. */
	border-bottom: 1px solid darkgray;
	/* This creates the border. Replace black with whatever color you want. */
}

.box {
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
	transition: all 0.3s cubic-bezier(.25, .8, .25, 1);
}

.box:hover {
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/classes/header.jsp" />
	<div class="container-fluid ">
		<div class="row">
			<div class="col-lg-2 bg-teal px-0 mx-0 ">
				<div class="col-lg-12 bg-teal px-0 mx-0 ">
				<div class="row justify-content-md-center text-center pt-5 mx-auto">
					<div class="col-6 col-lg-12 mb-2 ">
						<img
							src="https://cdn.dribbble.com/users/3399/screenshots/5826529/rework_4x.png"
							alt="img" class="rounded-circle" width="150px" height="150px">
					</div>
					<div class="col-6 col-lg-12 mb-2 ">
						<span><c:out value="${userName}"></c:out></span>
					</div>
					</div>
				</div>
			</div>
			<div class="col-lg-10 pt-5 pb-5 mx-0 rounded">
				<c:if test="${!empty(listPost)}">
					<!-- bai viet -->
					<div class="row mx-auto mb-3 ">
						<h4 class="mb-2">Bài viết</h4>
					</div>

					<div class="box col-lg-11 mx-auto px-0 pt-4 mb-5 bg-white"
						style="border-radius: .5rem;">

						<c:forEach items="${listPost}" var="item" varStatus="loop">

							<div id="detail${item.post_id}" style="display: none;">
								<div clas="container-fluid">
									<div class="row">
										<div class="col-6">Thể loại</div>
										<div class="col-6">${item.getCategoryName()}</div>
									</div>
									<div class="row">
										<div class="col-sm-6  mx-auto">Tiền 1 click</div>
										<div class="col-sm-6 ">${item.costPerClick} &#36;</div>
									</div>
									<div class="row">
										<div class="col-lg-6">Tổng tiền</div>
										<div class="col-lg-6">${item.cost} &#36;</div>
									</div>
									<div class="row">
										<div class="col-6">Tổng click</div>
										<div class="col-6">${item.getClickGuess()}click</div>
									</div>
									<div class="row">
										<div class="col-6">Ngày cuối</div>
										<div class="col-6">${item.endDate}</div>
									</div>
								</div>
							</div>
							<!--bat dau the quang cao-->
							<c:if test="${item.status==1}">
								<div
									class="<c:if test="${!loop.last}">rowdata </c:if> <c:if test="${loop.last}">pb-5 </c:if>row  pt-4 px-4 mx-4 rounded"
									style="background: #ffffff;">
									<div class="col-md-2 col-sm-2 px-0">
										<img height="85px" width="136px" src="${item.image}" alt="img"
											class="rounded">
									</div>
									<div class="col-md-8 col-sm-8 px-0 mx-auto showdetail">
										<div class="row mx-auto h-100">
											<div class="col-4 col-sm-4 px-2">
												<div class="row mx-auto h-50">
													<h5 class="mb-1">${item.title}</h5>
												</div>

												<div class="row align-items-end h-50">
													<div class="col" style="display: contents;">
														<span
															style="word-break: break-word; font-size: 1.3rem; color: #259B78;"
															contenteditable="true">
															${item.createTimeToString()} </span>
													</div>
												</div>
											</div>
											<div class=" col-2 col-sm-2 px-0 mx-2 ml-2  ">

												<div class="row mt-5 mx-auto">
													<span class="mx-auto"> 10 lần xem</span>
												</div>
											</div>
											<div class="col-1 col-sm-2 px-0 mx-2 ">

												<div class="row mt-5 mx-auto">
													<span class="mx-auto">10 lần click</span>
												</div>
											</div>
											<div class=" col-2 col-sm-3 px-0 mx-2 ">

												<div class="row mt-5 mx-auto">
													<span class="mx-auto">còn 300 click</span>
												</div>
											</div>
										</div>
									</div>
									<div class=" col-1 col-sm-1 px-0 mx-auto">
										<div class="item">
											<div class="actions-block">
												<ul class="actions-list">
													<li class="actions-expand"><a href="#"><i
															aria-hidden class="fas fa-ellipsis-h"></i><span
															class="sr-only">Show Actions</span></a></li>

													<li><a href="#" class="action"
														data-tippy-content="Xem"><i aria-hidden
															class="fas fa-clone"></i><span class="sr-only">Xem</span></a></li>
													<li><a
														href="${pageContext.request.contextPath}/MyListPost?action=delete&id=${item.post_id}"
														class="action" data-tippy-content="Xóa"><i aria-hidden
															class="fas fa-trash"></i><span class="sr-only">Xóa</span></a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</c:if>
							<c:if test="${item.status==5}">
								<div class="rowdata row  pt-4 px-4 mx-4 rounded"
									style="background: #ffffff;">
									<div class="col-2 col-sm-2"
										style="position: absolute; text-align: center;">hết hạn</div>
									<div class="col-md-2 col-sm-2 px-0" style="opacity: .4;">
										<img height="85px" width="136px" src="${item.image}" alt="img"
											class="rounded">
									</div>
									<div class="col-md-8 col-sm-8 px-0 mx-auto showdetail"
										style="opacity: .4;">
										<div class="row mx-auto h-100">
											<div class="col-4 col-sm-4 px-2">
												<div class="row mx-auto h-50">
													<h5 class="mb-1">${item.title}</h5>
												</div>

												<div class="row align-items-end h-50">
													<div class="col" style="display: contents;">
														<span
															style="word-break: break-word; font-size: 1.3rem; color: #259B78"
															contenteditable="true">${item.createTimeToString()} </span>
													</div>
												</div>
											</div>
											<div class=" col-2 col-sm-2 px-0 mx-2 ml-2  ">

												<div class="row mt-5 mx-auto">
													<span class="mx-auto"> 10 lần xem</span>
												</div>
											</div>
											<div class="col-1 col-sm-2 px-0 mx-2 ">

												<div class="row mt-5 mx-auto">
													<span class="mx-auto">10 lần click</span>
												</div>
											</div>
											<div class=" col-2 col-sm-3 px-0 mx-2 ">

												<div class="row mt-5 mx-auto">
													<span class="mx-auto">còn 300 click</span>
												</div>
											</div>
										</div>
									</div>
									<div class=" col-1 col-sm-1 px-0 mx-auto">
										<div class="item">
											<div class="actions-block"
												onmouseover="this.style.width='36px';"
												onmouseout="this.style.width='36px';">
												<ul class="actions-list">
													<li><a href="${pageContext.request.contextPath}/Extend?id=${item.post_id}" id="extend${item.post_id}" class="action-expand plus"
														data-tippy-content="Gia hạn"><i aria-hidden
															class="fas fa-cart-plus"></i><span class="sr-only">Gia hạn</span></a></li>
												</ul>
											</div>
										</div>
										<c:forEach items="${listPayment}" var="itempay" varStatus="loop">
										<c:if test="${item.post_id == itempay.post_id}">
										<script type="text/javascript">
										$( document ).ready(function() {
											 $('extend${item.post_id}').first().removeAttr('href');
										})
										</script>
										</c:if>
										</c:forEach>
									</div>

								</div>
							</c:if>
							<script type="text/javascript">
								 
							const template${item.post_id} = document.getElementById('detail${item.post_id}');
							tippy('.showdetail', {
							 	content: template${item.post_id}.innerHTML,
								arrow : true,
								interactive:false,
								followCursor: false,
								placement : "left-end",
								lazy: false
						});
							</script>
						</c:forEach>
						<!-- end -->
					</div>
				</c:if>
				<!-- video -->
				<c:if test="${! empty(listVideo) }">
					<div class="row mx-auto mb-3 ">
						<h4 class="mb-2">Video</h4>
					</div>
				</c:if>
				<!-- banner -->
				<c:if test="${! empty(listBanner) }">
					<div class="row mx-auto mb-3 ">
						<h4 class="mb-2">Banner</h4>
					</div>
				</c:if>
				<c:if test="${empty(listPost)}">
					<div class="row mx-auto mb-3 ">
					<div class="col-8 mx-auto"><h5 class="mb-2">Bạn chưa đăng quảng cáo nào</h5></div>
						<div class="col-8 mx-auto"><a href="${pageContext.request.contextPath}/Create?step=1"><i
							class="fas fa-cart-plus"> Tạo quảng cáo</i></a></div>
						
					</div>
				</c:if>

			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	tippy('.action', {
		delay : 50,
		arrow : true,
		arrowType : 'round',
		animation : 'scale',
		duration : 100
	})
	tippy('.plus', {
		delay : 50,
		arrow : true,
		arrowType : 'round',
		animation : 'scale',
		duration : 100
	});
	
</script>
</html>