<%@page import="beans.UserAccount"%>
<%@page import="beans.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Prince - Đăng tin</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
<link href="assets/css/vendor/bootstrap.min.css" rel="stylesheet" />
<link href="assets/css/vendor/datepicker.css" rel="stylesheet" />
<style type="text/css">
input[type=radio], input[type=checkbox] {
	margin: 5.8px 0 0 -20px;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/classes/header.jsp" />

	<div class="container-fluid mt-5 mb-5 pb-5">
		<div class="row justify-content-center mt-5 mb-5">
			<div class="col-6">
			<c:if test="${empty(extend)}">
				<form action="CreatePostStep1"  method="post" role="form"
					autocomplete="off" >
					<h4>Đăng Ký Quảng cáo</h4>
					<div class="form-group row justify-content-between">
						<label for="inputType" class="col-md-2 col-form-label">Thể
							loại</label> <select id="inputType" class="form-control col-md-9"
							name="category" required="required">
							
							<option value="1" checked>khoa học</option>
							<option value="2">thể thao</option>
							<option value="3">làm đẹp</option>
							<option value="4">ăn uống</option>
							
						</select>
					</div>
					<div class="form-group row justify-content-between">
						<label class="col-md-2 col-form-label">Thời gian</label> <input
							type="text" id="timeCheckIn" name="startDate" autofocus="false"
							value="${post.startDate}" class="form-control col-md-4"
							placeholder="bắt đầu" required="required" /> <input type="text"
							id="timeCheckOut" value="${post.endDate}" name="endDate"
							class="form-control col-md-4" placeholder="kết thúc"
							required="required" />

					</div>
					<fieldset class="form-group">
						<div class="row justify-content-between">
							<legend class="col-form-label col-md-2 pt-0">Hình thức</legend>
							<div class="col-md-9">
								<div class="form-check ">
									<input class="form-check-input" type="radio" name="gridRadios"
										id="gridRadios1" value="1" checked> 
										<label class="form-check-label" for="gridRadios1"> bài viết </label>
								</div>
								<div class="form-check ">
									<input class="form-check-input " type="radio" name="gridRadios"
										id="gridRadios2" value="2"> <label
										class="form-check-label" for="gridRadios2"> video </label>
								</div>
								<div class="form-check ">
									<input class="form-check-input" type="radio" name="gridRadios" disabled="disabled"
										id="gridRadios3" value="3"> <label
										class="form-check-label" for="gridRadios3"> banner(chưa ra mắt) </label>
								</div>
							</div>
						</div>
					</fieldset>
					<div class="form-group row ">

						<label for="inputCost" class="col col-form-label">Chi phí</label>
						<select id="inputCost" name="inputCost" class="form-control col "
							required="required">
							<option value="45">45&#36;</option>
							<option value="90" checked>90&#36;</option>
							<option value="135">135&#36;</option>
							<option value="180">180&#36;</option>
						</select> <label for="inputCost" class="col col-form-label">Giá 1
							lần click</label> <select id="inputCostperClick" name="inputCostPerClick"
							class="form-control col " required="required">
							<option value="0.3" checked>0.3&#36;</option>
							<option value="0.2">0.2&#36;</option>
							<option value="0.1">0.1&#36;</option>
						</select>

					</div>
					<div class="form-group row ">
						<div class="col-md-12">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="gridCheck1"
									required="required"> <label class="form-check-label"
									for="gridCheck1"> chấp nhận nghĩa là bạn đồng ý với
									<a href="#" style="color: teal;">điều khoản
									</a>và <a href="#" style="color: teal;">chính sách
									</a> của chúng tôi </label>
							</div>
						</div>
					</div>
					
					<div style="display: flex; font-size: 1.7rem;"
						class="justify-content-between mt-5">
						<button type="submit" class="btn btn-primary mx-auto " id="next">Tiếp
							tục</button>

					</div>
				</form>
				</c:if>
				<c:if test="${!empty(extend)}">
				<form action="Extend" method="post" role="form"
					autocomplete="off" >
					<h4>Đăng Ký Quảng cáo</h4>
					<div class="form-group row justify-content-between">
						<label for="inputType" class="col-md-2 col-form-label">Thể
							loại</label> <select id="inputType" class="form-control col-md-9"
							name="category" required="required">
							
							<option value="${post.category_id}" checked >${post.getCategoryName()}</option>
							
						</select>
					</div>
					<div class="form-group row justify-content-between">
						<label class="col-md-2 col-form-label">Thời gian</label> <input
							type="text" id="timeCheckIn" name="startDate" autofocus="false"
							value="${post.startDate}" class="form-control col-md-4"
							placeholder="bắt đầu" required="required" /> <input type="text"
							id="timeCheckOut" value="${post.endDate}" name="endDate"
							class="form-control col-md-4" placeholder="kết thúc"
							required="required" />

					</div>
					<fieldset class="form-group">
						<div class="row justify-content-between">
							<legend class="col-form-label col-md-2 pt-0">Hình thức</legend>
							<div class="col-md-9">
								<div class="form-check">
									<input class="form-check-input " type="radio" name="gridRadios" <c:if test="${post.format==2}"> disabled</c:if>
										id="gridRadios1" value="1" <c:if test="${post.format==1}"> checked</c:if>  > 
										<label class="form-check-label" for="gridRadios1"> bài viết </label>
								</div>
								<div class="form-check">
									<input class="form-check-input " type="radio" name="gridRadios" <c:if test="${post.format==1}"> disabled</c:if>
										id="gridRadios2" value="2" <c:if test="${post.format==2}"> checked</c:if>> <label
										class="form-check-label" for="gridRadios2"> video </label>
								</div>
							</div>
						</div>
					</fieldset>
					<div class="form-group row ">

						<label for="inputCost" class="col col-form-label">Chi phí</label>
						<select id="inputCost" name="inputCost" class="form-control col "
							required="required">
							<option value="45">45&#36;</option>
							<option value="90">90&#36;</option>
							<option value="135">135&#36;</option>
							<option value="180">180&#36;</option>
						</select> <label for="inputCost" class="col col-form-label">Tiền 1
							lần click</label> <select id="inputCostperClick" name="inputCostPerClick"
							class="form-control col " required="required">
							<option value="0.3">0.3&#36;</option>
							<option value="0.2">0.2&#36;</option>
							<option value="0.1">0.1&#36;</option>
						</select>

					</div>
					<div class="form-group row ">
						<div class="col-md-12">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="gridCheck1"
									required="required"> <label class="form-check-label"
									for="gridCheck1"> chấp nhận nghĩa là bạn đồng ý với
									<a href="#" style="color: teal;">điều khoản
									</a>và <a href="#" style="color: teal;">chính sách
									</a> của chúng tôi </label>
							</div>
						</div>
					</div>
					
					
					<div style="display: flex; font-size: 1.7rem;"
						class="justify-content-between mt-5">
						<button type="submit" class="btn btn-primary mx-auto " id="next">Xác nhận</button>
					</div>
					
				</form>
				</c:if>

			</div>
			<div class="col-1">
				<div style="display: flex; margin: 0 auto;" class="col-6 px-0">
					<a href="${pageContext.request.contextPath}/Create?step=cancle">
						<i class="fas fa-window-close"
						style="color: red; font-size: 2.5rem;" id="cancle"></i>
					</a>
				</div>
			</div>
		</div>	
	</div>
	<c:import url="/WEB-INF/classes/footer.jsp" />	

	<script src="assets/js/vendor/jquery.min.js"></script>
	<script src="assets/js/vendor/bootstrap.min.js"></script>
	<script src="assets/js/vendor/bootstrap-datepicker.js"></script>
	<script>
					$(function() {
						'use strict';
						var nowTemp = new Date();
						var now = new Date(nowTemp.getFullYear(), nowTemp
								.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

						var checkin = $('#timeCheckIn')
								.datepicker(
										{
											onRender : function(date) {
												return date.valueOf() < now
														.valueOf() ? 'disabled'
														: '';
											}
										})
								.on(
										'changeDate',
										function(ev) {
											if (ev.date.valueOf() > checkout.date
													.valueOf()) {
												var newDate = new Date(ev.date)
												newDate.setDate(newDate
														.getDate() + 1);
												checkout.setValue(newDate);
											}
											checkin.hide();
											$('#timeCheckOut')[0].focus();
										}).data('datepicker');
						var checkout = $('#timeCheckOut').datepicker(
								{
									onRender : function(date) {
										return date.valueOf() <= checkin.date
												.valueOf() ? 'disabled' : '';
									}
								}).on('changeDate', function(ev) {
							checkout.hide();
						}).data('datepicker');
					});
					tippy('#cancle', {
						animation : 'shift',
						placement : 'right',
						inertia : true,
						theme : 'lightning',
						arrow : false,
						content : 'Hủy',
					});
					tippy('#next', {
						content : 'Tiếp tục',
					});
				</script>
</body>
</html>
