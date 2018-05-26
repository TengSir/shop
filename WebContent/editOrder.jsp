<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>时尚街-填写订单</title>
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
	<div class="check-out">
	<form action="OrderServlet?method=addOrder" method="post">
    	    <table border="1" class="table-bordered">
    	    <tr>
    	    <td colspan="5"><h3>订单详细项目如下:</h3></td>
    	    </tr>
		  <tr>
			<th>商品</th>
			<th>数量</th>		
			<th>价格</th>
			<th>折扣</th>
			<th>小计</th>
		  </tr>
		  <c:set var="total" value="0"  scope="page"></c:set>
		  <c:forEach var="s"  items="${sessionScope.shopCars }">
		  <tr>
			<td class="ring-in"><a href="ProductServlet?method=loadProductDetailInfo&id=${s.key.id}" class="at-in"><img width="100" height="115" src="${s.key.firstImage }" class="img-responsive" alt=""></a>
			<div class="sed">
				<h5>${s.key.name }</h5>
				<p>${s.key.description }</p>
			</div>
			<div class="clearfix"></div></td>
			<td>${s.value }</td>		
			<td>${s.key.basicprice }</td>
			<td>${s.key.discount }</td>
			<td><fmt:formatNumber value="${s.key.basicprice*(1-s.key.discount)*s.value}" pattern="￥0.00"></fmt:formatNumber> </td>
		  </tr>
		  	<c:set  var="total" value="${pageScope.total+s.key.basicprice*(1-s.key.discount)*s.value}"></c:set>
		 </c:forEach>
		 <tr>
		 	<td colspan="5"  align="right">订单总计:<fmt:formatNumber value="${pageScope.total}" pattern="￥0.00"></fmt:formatNumber> </td>
		 </tr>
		 <tr>
		 	<td>收货地址:</td>
		 	<td colspan="4"  align="left">
		 	<select name="address"  style="width:83%">
		 		<c:forEach var="a"  items="${requestScope.user.adds }">
		 			<option value="${a.addressId }">${a.province}&nbsp;${a.city}&nbsp;${a.area}&nbsp;${a.street}&nbsp;${a.user}&nbsp;${a.tel }</option>
				</c:forEach>
		 	</select>
		 	<a href="addAddress.jsp">+添加新地址</a>
		 	</td>
		 </tr>
		 <tr>
		 	<td>买家留言:</td>
		 	<td colspan="4" >
		 	<textarea  name="message" style="width: 100%;height: 60px;"></textarea>
		 	</td>
		 </tr>
	</table>
	</form>
	<a href="javascript:document.forms[0].submit()" class=" to-buy">结算</a>
	</div>
</div>
<c:import url="foot.jsp"></c:import>
</body>
</html>