<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>时尚街-我的订单</title>
<link rel="shortcut icon" type="image/x-icon" href="images/systemImages/logo.gif" media="screen" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

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
<style>
th,td{
font-size: 14px;
}
b{color:black}
</style>
</head>
<body>
<c:import url="head.jsp"></c:import>
<!---->
<div class="container">
	<div class="check-out">
		<c:choose>
			<c:when test="${empty requestScope.o}">
					<h1>订单列表</h1>
					<c:forEach var="o" items="${requestScope.orders}">
					<div onmouseover="this.style.border='2px solid #67D1C5'"  onmouseout="this.style.border='none'">
		    	    <table class="table table-bordered ">
					  <tr>
						<th style="height: 20px;width: 500px;"><b>订单编号:</b>${o.orderid}</th>
						<th><b>下单时间:</b>${o.time}</th>		
						<th><b>订单状态:</b>
						<c:choose>
							<c:when test="${o.status eq 1 }"><span class="label label-default">未发货</span></c:when>
							<c:when test="${o.status eq 2 }"><span class="label label-primary">已发货</span></c:when>
							<c:when test="${o.status eq 3 }"><span class="label label-success">派送中</span></c:when>
							<c:when test="${o.status eq 4 }"><span class="label label-info">已签收</span></c:when>
							<c:when test="${o.status eq 5 }"><span class="label label-warning">已确认</span></c:when>
						</c:choose>
						</th>
					  </tr>
					  <tr>
					  	<th colspan="3"><b>收货地址:</b>${o.add.province}&nbsp;${o.add.city}&nbsp;${o.add.area}&nbsp;${o.add.street}&nbsp;${o.add.user}&nbsp;${o.add.tel }<br/>&nbsp;${o.add.detail }</th>
					  </tr>
					  <tr>
					  	<th colspan="2"><b>买家留言:</b>${o.message}</th>
					  	<th  width="200" align="center">
						  	<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
								展开详细
							</button>
						  </th>
					  </tr>
					  <tr height="0">
					  	 <th colspan="3" width="100" align="center">
					  	 <div class="collapse" id="collapseExample">
							  <div class="well">
					  	 	<table class="table table-bordered  table-striped  table-hover">
					  	 		<tr>
					  	 			<th style="font-size: 14px;">商品</th>
					  	 			<th style="font-size: 14px;">价格</th>
					  	 			<th style="font-size: 14px;">数量</th>
					  	 			<th style="font-size: 14px;">折扣</th>
					  	 			<th style="font-size: 14px;">小计</th>
					  	 		</tr>
					  	 		<c:forEach var="it" items="${o.items}">
						  	 		<tr>
						  	 			<td style="font-size: 14px;">${it.productId }</td>
						  	 			<td style="font-size: 14px;">￥100.0</td>
						  	 			<td style="font-size: 14px;">${it.count }</td>
						  	 			<td style="font-size: 14px;">${it.discount}</td>
						  	 			<td style="font-size: 14px;">￥200.0</td>
						  	 		</tr>
					  	 		</c:forEach>
					  	 	</table>
					  	 	</div>
							</div>
						  </th>
					  </tr>
				</table>
				</div>
				</c:forEach>
				<div class="clearfix"> </div>
			</c:when>
			<c:otherwise>
				<h1>客官，你已经成功下单，坐等收货吧!</h1>
		    	    <table class="table-bordered">
					  <tr>
						<th style="height: 20px;width: 500px;"><b>订单编号:</b>${requestScope.o.orderid}</th>
						<th><b>下单时间:</b>${requestScope.o.time}</th>		
						<th><b>订单状态:</b>
						<c:choose>
							<c:when test="${requestScope.o.status eq 1 }"><span class="label label-default">未发货</span></c:when>
							<c:when test="${requestScope.o.status eq 2 }"><span class="label label-primary">已发货</span></c:when>
							<c:when test="${requestScope.o.status eq 3 }"><span class="label label-success">派送中</span></c:when>
							<c:when test="${requestScope.o.status eq 4 }"><span class="label label-info">已签收</span></c:when>
							<c:when test="${requestScope.o.status eq 5 }"><span class="label label-warning">已确认</span></c:when>
						</c:choose>
						</th>
					  </tr>
					  <tr>
					  	<th colspan="3"><b>收货地址:</b>${requestScope.o.add.province}&nbsp;${requestScope.o.add.city}&nbsp;${requestScope.o.add.area}&nbsp;${requestScope.o.add.street}&nbsp;${requestScope.o.add.user}&nbsp;${requestScope.o.add.tel }<br/>&nbsp;${requestScope.o.add.detail }</th>
					  </tr>
					  <tr>
					  	<th colspan="3"><b>买家留言:</b>${requestScope.o.message}</th>
					  </tr>
					  <tr>
						  <th colspan="3" width="100" align="center">
						  	<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
								展开详细
							</button>
						  </th>
					  </tr>
					  <tr height="0">
					  	 <th colspan="3" width="100" align="center">
					  	 <div class="collapse" id="collapseExample">
							  <div class="well">
					  	 	<table class="table table-bordered  table-striped  table-hover">
					  	 		<tr>
					  	 			<th style="font-size: 14px;">商品</th>
					  	 			<th style="font-size: 14px;">价格</th>
					  	 			<th style="font-size: 14px;">数量</th>
					  	 			<th style="font-size: 14px;">折扣</th>
					  	 			<th style="font-size: 14px;">小计</th>
					  	 		</tr>
					  	 		<c:forEach var="it" items="${requestScope.o.items}">
						  	 		<tr>
						  	 			<td style="font-size: 14px;">${it.productId }</td>
						  	 			<td style="font-size: 14px;">￥100.0</td>
						  	 			<td style="font-size: 14px;">${it.count }</td>
						  	 			<td style="font-size: 14px;">${it.discount}</td>
						  	 			<td style="font-size: 14px;">￥200.0</td>
						  	 		</tr>
					  	 		</c:forEach>
					  	 	</table>
					  	 	</div>
							</div>
						  </th>
					  </tr>
				</table>
				<a href="#" class=" to-buy">去购物</a>
				<div class="clearfix"> </div>
			</c:otherwise>
		</c:choose>
    </div>
</div>
<c:import url="foot.jsp"></c:import>
</body>
</html>