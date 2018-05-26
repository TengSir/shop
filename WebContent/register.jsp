<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>时尚街-注册</title>
<link rel="shortcut icon" type="image/x-icon" href="images/systemImages/logo.gif" media="screen" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/checkUserExistAjax.js"></script>
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
<!-- slide -->
</head>
<body>
<c:import url="head.jsp"></c:import>
<div class="container">
	<div class="register">
		<h1>新用户注册</h1>
		  	  <form action="UserServlet?method=register"  method="post"> 
				 <div class="col-md-6  register-bottom-grid">
					<div class="mation">
						<span>用户账户</span>
						<input onblur="checkUsername(this.value)"  style="width: 400px;height: 30px;"  type="text" name="username"><span id="info"></span>
					
						<span>真实姓名</span>
						<input  style="width: 400px;height: 30px;"  type="text"  name="realname"> 
					 
						 <span>性别</span>
						 <input  style="width: 40px;height: 20px;"  type="radio" name="sex" value="0">男<input  style="width: 40px;height: 20px;"  type="radio" name="sex" value="1">女 
					</div>
					 <div class="clearfix"> </div>
					 </div>
				     <div class=" col-md-6 register-bottom-grid">
							<div class="mation">
								<span>密码</span>
								<input  style="width: 400px;height: 30px;"  type="password"  name="password">
								<span>确认密码</span>
								<input  style="width: 400px;height: 30px;"  type="password">
								<span>年龄</span>
								<select  style="width: 400px;height: 30px;"  name="age" >
									<% for(int n=10;n<=100;n++)
									{%>
										<option value="<%=n%>"><%=n %></option>
									<%} %>
								</select>
								<input type="hidden" name="status"  value="0" />
							</div>
					 </div>
					  <input type="submit"  class="acount-btn"  value="注册">
					 <div class="clearfix"> </div>
				</form>
		   </div>
</div>

<c:import url="foot.jsp"></c:import>
</body>
</html>