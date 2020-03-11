<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
	<a href="LuckyWheelDay">LuckyWheel</a>
	<%
		if (request.getAttribute("lw_err") != null) {
			out.print(
					"<div class=\"notification\"><div class=\"congratulation__container\"><div class=\"notification__close\"><i class=\"fas fa-times\"></i></div><div class=\"congratulation__emotion\"><i class=\"fas fa-smile\"></i></div><p class=\"congratulation__note\">"
							+ (String) request.getAttribute("lw_err") + "</p></div></div>");

		}
	%>





</body>
</html>