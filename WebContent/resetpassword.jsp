<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="util.GlobalConstants"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Prince-đặt lại mật khẩu</title>
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
			<form data-toggle="validator" role="form" action="ChangePassword" method = "post">
				<img src="assets/images/login/avatar.svg">
				<h2 style ="font-size: 2rem;"class="title">đặt lại mật khẩu</h2>
           		<div class="input-div pass">
           		   <div class="i"> 
           		    	<i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
           		    	<h5> mật khẩu mới</h5>
           		    	<input id="password" type="password" class="input" name="inputPassword" pattern="[A-Za-z0-9@#$%!^&*]{6,30}"  required="required"/>
            	   </div>
            	</div>
            	<div class="input-div pass">
           		   <div class="i"> 
           		    	<i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
           		    	<h5> nhập lại mật khẩu</h5>
           		    	<input id="confirm_password"type="password" class="input" name="inputPasswordConfirm" pattern="[A-Za-z0-9@#$%!^&*]{6,30}"  required="required"/>
            	   </div>
            	</div>
            	
            	<a><input id="submit" type="submit" class="btn" value="đăng nhập"></a>
            	
            </form>
        </div>	
    </div>
    <script type="text/javascript" src="assets/js/login.js"></script>
    <script type="text/javascript">
    var password = document.getElementById("password")
    , confirm_password = document.getElementById("confirm_password");

  function validatePassword(){
    if(password.value != confirm_password.value) {
      confirm_password.setCustomValidity("mật khẩu không trùng khớp");
    } else {
      confirm_password.setCustomValidity('');
    }
  }

  password.onchange = validatePassword;
  confirm_password.onkeyup = validatePassword;
    </script>
</body>
</html>