<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prince - Đổi Điểm</title>
<link rel="stylesheet" type="text/css"
	href="assets/redeempoints/RedeemPoints.css">
</head>
<body>
	<script type="text/javascript">
		// JavaScript Document
		function validateForm() {
			//Họ phải được điền
			var sa = document.forms["redeempointsform"]["sandboxaccount"].value;
			if (sa == "") {
				alert("Xin hãy nhập sandbox account");
				return false;
			}

		}
	</script>
	<c:import url="/WEB-INF/classes/header.jsp" />
	<%
		if (request.getAttribute("lw_err") != null) {
			out.print(
					"<div class=\"notification\"><div class=\"congratulation__container\"><div class=\"notification__close\"><i class=\"fas fa-times\"></i></div><div class=\"congratulation__emotion\"><i class=\"fas fa-smile\"></i></div><p class=\"congratulation__note\">"
							+ (String) request.getAttribute("lw_err") + "</p></div></div>");

		}
	%>
	<div class="container-fluid mt-5 mb-5 pb-5">
		<div class="row justify-content-center mt-5 mb-5">
			<div class="col-6">

				<form action="RedeemPointsServlet" method="get" role="form"
					autocomplete="off" name="redeempointsform">
					<h4>Đổi Điểm</h4>
					<div class="form-group row justify-content-between">
						<label class="col-md-3 col-form-label">Điểm Của Bạn</label> <label
							class="col-md-3 col-form-label">${score}Điểm</label>
					</div>
					<div class="form-group row justify-content-between">
						<label class="col-md-4 col-form-label">Sandbox Account</label> <input
							type="text" id="timeCheckOut" value="" name="sandboxaccount"
							class="form-control col-md-7"
							placeholder="sb-xcf3f792452@business.example.com"
							required="required" /> <label class="col-md-1 col-form-label"></label>
					</div>

					<div class="justify-content-between">

						<div class="pricing_table_wdg">
							<h4>
								<small>Chọn số điểm bạn muốn đổi</small>
							</h4>
							<ul>
								<li>Nhỏ</li>
								<li>-2000 điểm</li>
								<li>Đổi 2000 điểm sang tài khoản paypal</li>
								<li>Paypal</li>
								<li><a class="buy_now"><button type="submit"
											value="2000" name="index">2000 điểm</button></a></li>
							</ul>
							<ul>
								<li>Vừa</li>
								<li>-3000 điểm</li>
								<li>Đổi 3000 điểm sang tài khoản paypal</li>
								<li>Paypal</li>
								<li><a class="buy_now"><button type="submit"
											value="3000" name="index">3000 điểm</button></a></li>
							</ul>
							<ul>
								<li>Lớn</li>
								<li>-5000 điểm</li>
								<li>Đổi 5000 điểm sang tài khoản paypal</li>
								<li>Paypal</li>
								<li><a class="buy_now"><button type="submit"
											value="5000" name="index">5000 điểm</button></a></li>
							</ul>
							<ul>
								<li>Rất Lớn</li>
								<li>-7000 điểm</li>
								<li>Đổi 7000 điểm sang tài khoản paypal</li>
								<li>Paypal</li>
								<li><a class="buy_now">
										<button type="submit" value="7000" name="index">7000 điểm</button>
								</a></li>
							</ul>
						</div>
					</div>

				</form>

			</div>

		</div>
	</div>

	<c:import url="/WEB-INF/classes/footer.jsp" />
</body>
</html>