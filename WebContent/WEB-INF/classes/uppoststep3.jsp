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
<title>Prince - Thanh toán</title>
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
	margin: 6rem 1.5rem;
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
	padding: 3px 11px;
	color: #EFEAF5;
	font-weight: bold;
	font-size: 15px;
	text-decoration: none;
}

.actions-list a:hover {
	color: rgba(255, 255, 255, 1.0);
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
		<c:if test="${!empty(listPayment)}">
			<div class="row">
				<div class="col-lg-4 col-sm-5 mx-5 pt-3 pb-3">
					<h5>Quảng cáo cần thanh toán</h5>
				</div>
				<div class="col-lg-7 col-sm-5 mx-0 mx-0 pt-3 pb-3 ">
					<button class="float-right">Thêm quảng cáo</button>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${listPayment}" var="item" varStatus="loop">
					<!--bat dau 1 order-->
					<div class="col-lg-6 pt-3 pb-3 mx-0 rounded">
						<!-- bai viet -->
						<div class="box col-lg-11 mx-auto px-0 pt-4 pb-4 mb-4 bg-white"
							style="border-radius: .5rem;">
							<div class="rowdata row px-0 mx-4 rounded"
								style="background: #ffffff;">

								<div class="col-md-4 col-sm-4 px-0">
									<img height="182px" width="152px" src="${item.image }"
										class="rounded">
								</div>
								<div class="col-md-7 col-sm-7 px-0 mx-auto">
									<div class="row mx-auto">
										<h5>${item.title}</h5>
									</div>
									<div class="row mx-auto">
										<div class=" col-md-6">
											<span>Giá lượt click :</span>
										</div>
										<div class=" col-md-6 font-italic">
											<span><strong>${item.costPerClick} &#36;</strong></span>
										</div>
									</div>
									<div class="row mx-auto">
										<div class=" col-md-6">
											<span>Thời gian :</span>
										</div>
										<div class=" col-md-6 font-italic">
											<span><strong>${item.startDate}</strong> đến <strong>${item.endDate}</strong></span>
										</div>
									</div>
									<div class="row mx-auto">
										<div class=" col-md-6">
											<span>Số lượng click :</span>
										</div>
										<div class=" col-md-6 font-italic">
											<span><strong>${item.getClickGuess()} click</strong></span>
										</div>
									</div>
								</div>

								<div class=" col-1 col-sm-1 px-0 mx-auto">
									<span><strong>&#36;${item.cost}</strong></span>
									<div class="item">
										<c:if test="${empty(extend)}">
											<div class="actions-block"
												onmouseover="this.style.width='36px';"
												onmouseout="this.style.width='36px';">
												<ul class="actions-list">
													<li><a
														href="${pageContext.request.contextPath}/deleteOrder?index=${loop.index}"
														class="action-expand plus" data-tippy-content="Xóa"><i
															aria-hidden class="fas fa-trash"></i><span
															class="sr-only">Xóa</span></a></li>



												</ul>
											</div>
										</c:if>
										<c:if test="${!empty(extend)}">
											<div class="actions-block"onmouseover="this.style.width='80px';" 
												onmouseout="this.style.width='36px';">
												<ul class="actions-list">
													<li><a href="${pageContext.request.contextPath}/Extend?edit=${loop.index}" class="action" data-tippy-content="Sửa"><i
															aria-hidden class="fas fa-edit"></i><span class="sr-only">Sửa</span></a></li>

													<li><a
														href="${pageContext.request.contextPath}/deleteOrder?index=${loop.index}"
														class="action-expand plus" data-tippy-content="Xóa"><i
															aria-hidden class="fas fa-trash"></i><span
															class="sr-only">Xóa</span></a></li>
												</ul>
											</div>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- end -->
				</c:forEach>
			</div>

			<div class="row ">
				<div class="col-lg-2 mx-2 px-5 mt-4 mb-5 pb-5 mx-auto">
					<a href="${pageContext.request.contextPath}/Create?step=1"
						style="text-align: left; display: block;">Thêm quảng cáo</a>
				</div>
				<div class="col-lg-2 mx-2 px-5 mt-4 mb-5 pb-5 mx-auto">
					<a href="${pageContext.request.contextPath}/CreatePayment"
						style="text-align: center; display: block;">Thanh toán</a>
				</div>
			</div>
		</c:if>
		<c:if test="${	empty(listPayment)}">
			<div class="row mx-auto mb-3 pt-5 mt-5 ">
				<div class="col-8 mx-auto">
					<h5 class="mb-2">Không tìm thấy quảng cáo nào cần thanh toán</h5>
				</div>
				<div class="col-8 mx-auto">
					<a href="${pageContext.request.contextPath}/Create?step=1"><i
						class="fas fa-cart-plus"> Tạo quảng cáo</i></a>
				</div>

			</div>
		</c:if>
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