<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>时尚街-收货地址</title>
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
<!-- slide -->
</head>
<body>
<c:import url="head.jsp"></c:import>
<div class="account">
	<div class="container">
		<h1>收货地址</h1>
		<div class="account_grid">
				<div  style="border:1px  dotted gray;padding: 10px;border-radius:10px;margin-bottom: 20px;">
					<c:forEach var="a"  items="${requestScope.user.adds }">
						<table class="table-bordered" >
						<tr>
							<td>${a.province }</td>
							<td>${a.city }</td>
							<td>${a.area }</td>
							<td>${a.street }</td>
							<td>${a.user }</td>
							<td>${a.tel }</td>
						</tr>
						<tr>
							<td colspan="6">${a.detail }</td>
						</tr>
						</table>
					
					</c:forEach>
					</div>
			   <div class="clearfix"> </div>
			 </div>
	</div>
</div>

<c:import url="foot.jsp"></c:import>
</body>
</html>