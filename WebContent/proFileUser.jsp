
<%@page import="java.util.ArrayList"%>
<%@page import="beans.UserAccount"%>
<%@page import="beans.UserDAO"%>
<%@page import="util.GlobalConstants"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

<!-- Icon fonts
	======================================== -->

</head>
<body>


	<%-- <%
		HttpSession ss = request.getSession();
		Integer userId = (Integer) request.getSession().getAttribute("user_id");
		response.getWriter().println(userId);
		UserAccount ua = UserDAO.selectUSER(userId.toString());
		
	%> --%>
	<%
		UserAccount u = (UserAccount) request.getAttribute("user");
	%>
	<div class="container">
		<div class="row my-2">
			<div class="col-lg-8 order-lg-2">
				<ul class="nav nav-tabs">
					<li class="nav-item"><a href="" data-target="#canhan"
						data-toggle="tab" class="nav-link active">Trang cá nhân</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">Thông
							tin</a>
						<div class="dropdown-menu" style="font-size: 15px">

							<a class="dropdown-item " href="" data-target="#tindaluu"
								data-toggle="tab">Tin đăng đã lưu</a> <a class="dropdown-item"
								href="" data-target="#lstimkiem" data-toggle="tab">Lịch sử
								tìm kiếm</a> <a class="dropdown-item" href="#">Bạn bè</a> <a
								class="dropdown-item" href="" data-target="#acc-tichdiem"
								data-toggle="tab">Tài khoản tích điểm</a> <a
								class="dropdown-item" href="" data-target="#history-gd"
								data-toggle="tab">Lịch sử giao dịch</a> <a class="dropdown-item"
								href="" data-target="#payment" data-toggle="tab">Thẻ liên
								kết</a> <a class="dropdown-item" href="login.jsp">Đăng xuất</a>
						</div></li>

					<li class="nav-item"><a href="" data-target="#edit"
						data-toggle="tab" class="nav-link">Chỉnh sửa thông tin</a></li>
				</ul>
				<div class="tab-content py-4">
					<div class="tab-pane active" id="canhan">
						<div class="row">
							<div class="col-md-6">
								<h5 class="mb-3"></h5>
								<div class="row">

									<div class="col-md-6">
										<div>
											<span>0</span> Người theo dõi
										</div>
									</div>
									<div class="col-md-6">
										<div>
											<span>0</span> Đang theo dõi
										</div>
									</div>
									<div class="col-md-12"></div>

								</div>
							</div>

							<div class="col-md-6">
								<h5>Điểm của bạn</h5>
								
								<hr />
							</div>
						</div>
						<br>
						<hr />
						<div class="tindang">
							<h5>Các tin đã đăng</h5>
							<br>
							<div class="contentTinDang" style="text-align: center;">
								<p>Bạn chưa có tin đăng</p>
								<input type="button" class="btn btn-primary" value="Đăng tin">
							</div>
						</div>

					</div>
					<div class="tab-pane" id="tindaluu">
					</div>
					<div class="tab-pane" id="lstimkiem"></div>
					<div class="tab-pane" id="friend"></div>
					<div class="tab-pane" id="acc-tichdiem"></div>
					<div class="tab-pane" id="history-gd"></div>
					<div class="tab-pane" id="payment"></div>


					<div class="tab-pane" id="edit">
						<form role="form" action="ChangeInformatonUser" method="post">
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Tên
									của bạn</label>
								<div class="col-lg-9">
									<input class="form-control" type="text" name="firstname"
										value="%>">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Họ
									của bạn</label>
								<div class="col-lg-9">
									<input class="form-control" type="text" name="lastname"
										value="">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Ngày
									sinh</label>
								<div class="col-lg-9">
									<input class="form-control" type="date" name="birthday"
										value="">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Email</label>
								<div class="col-lg-9">
									<p class="form-control disabled" type="email"></p>
								</div>
							</div>

							<!-- 							<div class="form-group row"> -->
							<!-- 								<label class="col-lg-3 col-form-label form-control-label">Số Điện Thoại</label> -->
							<!-- 								<div class="col-lg-9"> -->
							<!-- 									<input class="form-control" type="text" value="" -->
							<!-- 										placeholder="Street"> -->
							<!-- 								</div> -->
							<!-- 							</div> -->

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
									<p class="form-control disabled" type="text">
									</p>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label">Mật
									khẩu</label>
								<div class="col-lg-9  l-inline">
									<p>**********</p>
									<a href="resetpassword.jsp" style="color: red"> Thay đổi</a>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-lg-3 col-form-label form-control-label"></label>
								<div class="col-lg-9">
									<!-- 									<input type="reset" class="btn btn-secondary" value="Cancel"> -->
									<input type="submit" class="btn btn-primary"
										value="Save Changes">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="col-lg-4 order-lg-1 text-center">
				<!-- <img src="//placehold.it/150"
					class="mx-auto img-fluid img-circle d-block" alt="avatar"> -->
				<input type="file" id="file" name="image" accept="image/*" capture
					style="display: none" > <img src=""
					id="upfile" style="cursor: pointer"  >

				<div></div>
			</div>

		</div>
	</div>
	<script src="https://code.jquery.com/jquery-1.8.3.min.js"></script>
	<script src="WebContent/assets/js/proFile.js"></script>

</body>
</html>