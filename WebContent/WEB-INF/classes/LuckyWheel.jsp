<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="assets/luckywheelcss/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/luckywheelcss/fontawesome.min.css">
<link rel="stylesheet" href="assets/luckywheelcss/fontawesome.css">
<link rel="stylesheet" type="text/css"
	href="assets/luckywheelcss/LuckyWheel.css">

<script type="text/javascript"
	src="assets/luckywheeljs/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="assets/luckywheeljs/luckywheel.js"></script>
</head>
<body>

	<div class="wheel">
		<div class="wheel__inner">
			<div class="wheel__sec">
				<p class="wheel__note">10</p>
			</div>
			<div class="wheel__sec">
				<p class="wheel__note">20</p>
			</div>
			<div class="wheel__sec">
				<p class="wheel__note">30</p>
			</div>
			<div class="wheel__sec">
				<p class="wheel__note">40</p>
			</div>
			<div class="wheel__sec">
				<p class="wheel__note">50</p>
			</div>
			<div class="wheel__sec">
				<p class="wheel__note">60</p>
			</div>
		</div>
		<div class="wheel__arrow">
			<button class="wheel__button">QUAY</button>
		</div>
	</div>
	<div class="popup">
		<div class="popup__container">
			<div class="popup__emotion">
				<i class="fas fa-meh"></i>
			</div>
			<p class="popup__note"></p>
		</div>
	</div>
	<div class="congratulation">
		<div class="congratulation__container">
			<div class="congratulation__close">
				<i class="fas fa-times"></i>
			</div>
			<div class="congratulation__emotion">
				<i class="fas fa-smile"></i>
			</div>
			<p class="congratulation__note">CHÚC MỪNG BẠN ĐÃ TẠCH</p>

			<a href="LuckyWheelHandling?index=4"><button
					class="congratulation__button">OK</button></a>
		</div>
	</div>
</body>
</html>