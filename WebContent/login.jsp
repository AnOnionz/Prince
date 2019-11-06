<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="util.GlobalConstants"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Prince - đăng nhập</title>
	<link rel="stylesheet" type="text/css" href="assets/css/login.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
</head>
<body>

	<img class="wave" src="assets/images/login/wave.png">
	<div class="container">
		<div class="img">
			<img style="width: 150px;position: absolute;top: 1rem;left: 1.5rem;" src = "assets/images/prince.png">
			<img src="assets/images/login/bg.svg">
		</div>
		
		<div class="login-content">
			<form data-toggle="validator" role="form" action="Login" method="post">
				<img src="assets/images/login/avatar.svg">
				<h2 class="title">đăng nhập</h2>
           		<div class="input-div one">
           		   <div class="i">
           		   		<i class="fas fa-envelope"></i>
           		   </div>
           		   <div class="div">
           		   		<h5>email</h5>
           		   		<input type="text" class="input" pattern="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$" name="inputEmail" data-error="Enter valid Email" required>
           		   </div>
           		</div>
           		<div class="input-div pass">
           		   <div class="i"> 
           		    	<i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
           		    	<h5>mật khẩu</h5>
           		    	<input type="password" class="input" name="inputPassword" pattern="[A-Za-z0-9@#$%!^&*]{6,30}" required>
            	   </div>
            	</div>
            	<% if(request.getAttribute("error")!=null){ %>
           				<div >
           		   		<p style="font-size: 14px;color: red;font-style: italic;"><%
           		   			String error =(String)request.getAttribute("error");%>
           		   		<%=error %></p>
           		   		</div>
           		   		<% } %>
            	<a href="forgotpassword.jsp">quên mật khẩu?</a>
            	<input type="submit" class="btn" value="đăng nhập">
            	<div style="display: flex; justify-content: space-between;">
            	<p >bạn chưa có tài khoản?</p>
            	<a style="font-size: 1.1rem;margin-top: -.11rem" href="register.jsp">tạo tài khoản</a>
            	</div>
            </form>
        </div>	
    </div>

    <script type="text/javascript" src="assets/js/login.js"></script>
</body>
</html>