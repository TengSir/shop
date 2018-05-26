<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>时尚街-登陆</title>
<link rel="shortcut icon" type="image/x-icon" href="images/systemImages/logo.gif" media="screen" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Fashion Mania Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- start menu -->
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>$(document).ready(function(){$(".memenu").memenu();});</script>
<script src="js/simpleCart.min.js"> </script>
<script type="text/javascript">
	function changeImage(x)
	{
		x.src='UtilServlet?method=generateCode&time='+new Date();
	}
</script>
<!-- slide -->
</head>
<body>
<c:import url="head.jsp"></c:import>
<div class="account">
	<div class="container">
		<h1>Account</h1>
		<div class="account_grid">
			   <div class="col-md-6 login-right">
			   <c:if test="${requestScope.errorMessage ne null }">
			    	<span style="color:red">${requestScope.errorMessage }</span>
			   </c:if>
				<form action="UserServlet?method=login" method="post">
					<span>Username</span>
					<input style="width: 400px;height: 30px;"  type="text" name="username"   value="${cookie.username.value }"> 
				
					<span>Password</span>
					<input style="width: 400px;height: 30px;"  type="password"  name="password"  value="${cookie.password.value }">
					<c:if test="${cookie.password.value ne  null }">
						<input type="checkbox" name="isRemember" checked="checked" value="1"/>记住密码三天
					</c:if>
					<c:if test="${cookie.password.value eq  null }">
						<input type="checkbox" name="isRemember"   value="1"/>记住密码三天
					</c:if>
					<span>验证码</span>
					<input style="width: 300px;height: 30px;"  type="text"  name="code">
					<img onclick="changeImage(this)"  style="border: 1px solid black" src="UtilServlet?method=generateCode" width="100" height="30" />
					<div class="word-in">
				  		<a class="forgot" href="#">Forgot Your Password?</a>
				 		 <input type="submit" value="Login">
				  	</div>
			    </form>
			   </div>	
			    <div class="col-md-6 login-left">
			  	 <h4>NEW CUSTOMERS</h4>
				 <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
				 <a class="acount-btn" href="register.jsp">Create an Account</a>
			   </div>
			   <div class="clearfix"> </div>
			 </div>
	</div>
</div>
<c:import url="foot.jsp"></c:import>
</body>
</html>