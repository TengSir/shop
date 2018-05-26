<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>时尚街-个人信息</title>
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

<script type="text/javascript">    
 function preview(file)  
 {  
 var prevDiv = document.getElementById('preview');  
 if (file.files && file.files[0])  
 {  
 var reader = new FileReader();  
 reader.onload = function(evt){  
 prevDiv.innerHTML = '<img style="width:240px;height:240px;" src="' + evt.target.result + '" />';  
}    
 reader.readAsDataURL(file.files[0]);  
}  
 else    
 {  
 prevDiv.innerHTML = '<div style="width:240px;height:240px;" class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';  
 }  
 }  
 </script>  
</head>
<body>
<c:import url="head.jsp"></c:import>
<div class="account">
	<div class="container">
		<h1>个人信息&nbsp;${requestScope.updateResult} </h1>
		<div class="account_grid">
				<form action="UserServlet?method=update" method="post" enctype="multipart/form-data">
			   <div class="col-md-6 login-right">
			   		<input type="hidden"  name="userid"  value="${requestScope.user.userid}"  />
					<span>用户账号</span>
					<input style="width: 400px;height: 30px;" readonly="readonly" type="text" name="username" value="${requestScope.user.username }"> 
					<span>账号密码</span>
					<input style="width: 400px;height: 30px;"  type="password"  name="password" value="${requestScope.user.password }"> 
				  	<span>真实姓名</span>
					<input style="width: 400px;height: 30px;"  type="text"  name="realname"  value="${requestScope.user.realname }">
					<span>用户性别</span>
					<c:choose>
						<c:when test="${requestScope.user.sex eq 0 }">
							<input style="width: 40px;height: 20px;"  type="radio"  checked="checked" name="sex"  value="0">男
							<input style="width: 40px;height: 20px;"  type="radio"  name="sex"  value="1">女
						</c:when>
						<c:otherwise>
							<input type="radio" name="sex"  value="0">男
							<input type="radio"  checked="checked"  name="sex"  value="1">女
						</c:otherwise>
					</c:choose>
					<span>用户年龄</span>
					<select style="width: 400px;height: 30px;margin-bottom: 10px;" name="age">
						<c:forEach var="a"  begin="1" end="100" step="1">
							<c:if test="${requestScope.user.age eq a }">
									<option  selected="selected" value="${a }">${a }</option>
							</c:if>
							<c:if test="${requestScope.user.age ne a }">
									<option value="${a }">${a }</option>
							</c:if>
							
						</c:forEach>
					</select><br/>
					<a href="UserServlet?method=loadUserAddressInfo&userid=${requestScope.user.userid }">我的收货地址</a>
					<input type="submit"  value="修改"  />
			   </div>	
			    <div class="col-md-6 login-left">
			  	 <span>用户头像</span><br/>
				 <div id="preview"> 
				 <img style="border: 1px solid gray;border-radius:120px;" src="${requestScope.user.image }"  width="240" height="240"/>
				 </div> 
				 <br/>
				 <input name="image"  onchange="preview(this)" type="file" value="${requestScope.user.image }" />
			   </div>
			    </form>
			   <div class="clearfix"> </div>
			 </div>
	</div>
</div>

<c:import url="foot.jsp"></c:import>
</body>
</html>