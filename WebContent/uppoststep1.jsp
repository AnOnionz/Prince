<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

</head>
<style>
#datepicker {
	margin: 0 auto;
	padding: 50px 0;
	width: 400px;
}

.input-group-addon {
	background-color: #efefef;
}

.mt-7 {
	margin-top: 7rem;
}
</style>
<body>
	<c:import url="/header.jsp" />
	<div class="container mt-7">
		<div class="row">
			<div class="col-md"></div>
			<div class="col-md">
				<form>
					<div class="form-group ">
						<label for="inputState">thể loại</label> <select id="inputState"
							class="form-control">
							<option selected>chọn</option>
							<option>du lịch</option>
							<option>tín dụng</option>
							<option>gia dụng</option>
							<option>mua sắm</option>
							<option>ăn uống</option>
							<option>dịch vụ</option>
							<option>công nghệ</option>
							<option>khác</option>
						</select>
					</div>
					<div class="form-row">
						<div class="form-group col-md-5">
							<div class='input-group date' id='datetimepicker6'>
								<input type='text' class="form-control" /> <span
									class="input-group-addon"> <span
									class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
						<div class="form-group col-md-5">
							<div class='input-group date' id='datetimepicker7'>
								<input type='text' class="form-control" /> <span
									class="input-group-addon"> <span
									class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div id="datepicker" class="input-group input-daterange"
							data-provide="datepicker">

							<input type="text" class="form-control" placeholder="Start Date">

							<span class="input-group-addon">TO</span> <input type="text"
								class="form-control" placeholder="End Date">

						</div>
					</div>
					<div class="form-group">
						<label for="inputAddress2">Address 2</label> <input type="text"
							class="form-control" id="inputAddress2"
							placeholder="Apartment, studio, or floor">
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputCity">City</label> <input type="text"
								class="form-control" id="inputCity">
						</div>

						<div class="form-group col-md-2">
							<label for="inputZip">Zip</label> <input type="text"
								class="form-control" id="inputZip">
						</div>
					</div>
					<div class="form-group">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="gridCheck">
							<label class="form-check-label" for="gridCheck"> Check me
								out </label>
						</div>
					</div>
					<button type="submit" class="btn btn-primary">Sign in</button>
				</form>
			</div>
			<div class="col-md"></div>
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
	!-- jquery JS -->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

	<!-- Propeller Bootstrap datetimepicker -->
	<script type="text/javascript" language="javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
<script type="text/javascript">
<script type="text/javascript">
$(function () {
    $('#datetimepicker6').datetimepicker();
    $('#datetimepicker7').datetimepicker({
        useCurrent: false //Important! See issue #1075
    });
    $("#datetimepicker6").on("dp.change", function (e) {
        $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
    });
    $("#datetimepicker7").on("dp.change", function (e) {
        $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
    });
});
</script>
</script>
</body>

</html>