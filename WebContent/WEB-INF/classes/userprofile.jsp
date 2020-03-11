<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="beans.UserAccount"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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

<!-- Twitter -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:site" content="@Papr">
<meta name="twitter:creator" content="@Papr">
<meta name="twitter:title" content="Papr">
<meta name="twitter:description"
	content="Papr Trendy News and Megazine Template">
<meta name="twitter:image" content="assets/images/papr.png">


<!-- Page Title
    ======================================== -->
<title>Thông tin cá nhân</title>

<!-- links for favicon
    ======================================== -->
<link rel="apple-touch-icon" sizes="57x57"
	href="assets/favicon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="assets/favicon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="assets/favicon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/favicon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="assets/favicon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="assets/favicon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="assets/favicon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="assets/favicon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="assets/favicon/apple-icon-180x180.png">
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/bs/jq-3.3.1/dt-1.10.18/datatables.min.css" />
<style>
img {
	max-width: 180px;
}

input[type=file] {
	visibility: hidden;
	padding: 10px;
}

* {
	border: 0;
	outline: 0;
}

label#largeFile:after {
	position: absolute;
	width: 60%;
	max-width: 800px;
	content: "Chọn ảnh đại điện";
	left: 0;
	right: 0;
	margin: 50px auto;
	text-align: center;
	padding: 50px 0px 50px 0px;
	border-radius: 10px;
	border: 5px dashed #ccc;
	color: #ccc;
	font-family: "Helvetica Neue", Helvetica, Arial;
	font-size: 30px;
}

label#largeFile:hover:after {
	background: #ccc;
	color: #fff;
	cursor: pointer;
}

label#largeFile input#file {
	width: 0px;
	height: 0px;
}

#example_wrapper {
	display: block;
}

#example_paginate {
	float: right;
}

#example_length {
	float: left;
}

#example_filter {
	float: right;
}

.page-header {
	padding-bottom: 0 !important;
	margin: 0 !important;
	border-bottom: 0 !important;
}

.navbar {
	margin-bottom: 0px !important;
}
</style>
</head>
<body>
	<%
		if (request.getAttribute("user") != null) {
			UserAccount u = (UserAccount) request.getAttribute("user");
	%>
	<%@ include file="header.jsp"%>
	<div class="container pb-4 ">
		<div class="breadcrumb-wrapper">
			<div class="container">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							href="${pageContext.request.contextPath}/Home">Trang chủ</a></li>
						<li class="breadcrumb-item active" aria-current="page">Tài
							khoản của tôi</li>
					</ol>
					<!-- End of .breadcrumb -->
				</nav>
			</div>
			<!-- End of .container -->
		</div>
		<div class="row my-2">

			<div class="col-lg-12 order-lg-12">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a href="" data-target="#edit"
						data-toggle="tab" class="nav-link active">Thông tin tài khoản</a></li>
					<li class="nav-item"><a href="" data-target="#canhan"
						data-toggle="tab" class="nav-link ">Điểm của tôi</a></li>
					<li class="nav-item"><a href="" data-target="#history"
						data-toggle="tab" class="nav-link">Lịch sử giao dịch</a></li>
				</ul>
				<div class="tab-content py-4" id="content">

					<div class="tab-pane active" id="edit">
						<div class="row">
							<div class="col-lg-5">
								<div class="col-lg-8 order-lg-1 text-center">
									<label id="largeFile" for="file"> <input type="file"
										id="file" />
									</label>

								</div>
							</div>
							<div class="col-lg-5">
								<form role="form" action="ChangeInformatonUser" method="post">
									<div class="form-group row">
										<label class="col-lg-3 col-form-label form-control-label">Tên
											của bạn</label>
										<div class="col-lg-9">
											<input class="form-control" type="text" name="firstname"
												value="<%=u.getFIRSTNAME()%>">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-3 col-form-label form-control-label">Họ
											của bạn</label>
										<div class="col-lg-9">
											<input class="form-control" type="text" name="lastname"
												value="<%=u.getLASTNAME()%>">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-3 col-form-label form-control-label">Ngày
											sinh</label>
										<div class="col-lg-9">
											<input class="form-control" type="date" name="birthday"
												value="<%=u.getDATEOFBIRTH()%>">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-3 col-form-label form-control-label">Email</label>
										<div class="col-lg-9">
											<p class="form-control disabled" type="email"><%=u.getEMAIL()%></p>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-3 col-form-label form-control-label">Giới
											tính</label>
										<div class="col-lg-9">
											<input type="radio" name="gender" value="1" checked="checked">Nam
											<input type="radio" name="gender" value="0">Nữ
										</div>
									</div>

									<div class="form-group row">
										<label class="col-lg-3 col-form-label form-control-label ">Tài
											khoản</label>
										<div class="col-lg-9">
											<p class="form-control disabled" type="text"><%=u.getUSERNAME()%>
											</p>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-3 col-form-label form-control-label">Mật
											khẩu</label>
										<div class="col-lg-3">
											<p>**********</p>
										</div>
										<div class="col-lg-6">
											<a href="resetpassword.jsp" style="color: red"> Thay đổi</a>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-3 col-form-label form-control-label"></label>
										<div class="col-lg-9">
											<input type="submit" class="btn btn-primary"
												value="Save Changes">
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="tab-pane pb-md-5" id="canhan"
						style="margin-bottom: 140px;">
						<div class="row">
							<div class="col-md-6">
								<p style="font-weight: bold;">Điểm của bạn:</p>
								<span><%=u.getSCORE()%> điểm</span>
							</div>

							<div class="col-md-6">
								<a
									href="${pageContext.request.contextPath}/RedirectToPayoutPage"><button
										type="button" class="btn btn-primary" name="paypal">
										Đổi điểm</button></a>
							</div>
						</div>
						<br>
						<hr />
					</div>
					<div class="tab-pane" id="history">
						<c:if test="${!empty(listTran)}">
							<table id="example" class="table table-striped table-bordered"
								style="width: 100%;">
								<thead>
									<tr>
										<th>Tên giao dịch</th>
										<th>Trạng thái</th>
										<th>Số điểm</th>
										<th>Thời gian</th>
										<th>Mã giao dịch</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach items="${listTran}" var="item" varStatus="loop">
										<tr>
											<td>${item.transaction_name}</td>
											<c:if test="${item.status == 6}">
												<td>Thành công</td>
											</c:if>
											<c:if test="${item.status == 7}">
												<td>Thất bại</td>
											</c:if>
											<td>${item.score}</td>
											<td>${item.timetoString()}</td>
											<td>${item.transaction_id}</td>
										</tr>
									</c:forEach>

								</tbody>
								<tfoot>
									<tr>
										<th>Tên giao dịch</th>
										<th>Trạng thái</th>
										<th>Số điểm</th>
										<th>Thời gian</th>
										<th>Mã giao dịch</th>
									</tr>
								</tfoot>
							</table>
						</c:if>
						<c:if test="${empty(listTran)}">
						<table id="example" class="table table-striped table-bordered"
								style="width: 100%;">
								<thead>
									<tr>
										<th>Tên giao dịch</th>
										<th>Trạng thái</th>
										<th>Số điểm</th>
										<th>Thời gian</th>
										<th>Mã giao dịch</th>

									</tr>
								</thead>
								<tbody>

								</tbody>
								<tfoot>
									<tr>
										<th>Tên giao dịch</th>
										<th>Trạng thái</th>
										<th>Số điểm</th>
										<th>Thời gian</th>
										<th>Mã giao dịch</th>
									</tr>
								</tfoot>
							</table>
						</c:if>
					</div>
				</div>

			</div>
		</div>

	</div>
	<%
		}
	%>
	<script src="https://code.jquery.com/jquery-1.8.3.min.js"></script>
	<script>
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#blah').attr('src', e.target.result);
				};

				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
	<%@ include file="footer.jsp"%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/datatables.min.js"></script>

	<script>
		$(document).ready(function() {
			$('#example').DataTable();
		});
	</script>

</body>
</html>