<%@ page language="java" contentType="text/html; charset=UTF-8"  isELIgnored="false" pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${requestScope.ps eq null }">
<jsp:forward page="ProductServlet?method=listProductByPage&page=1&count=40"></jsp:forward>
</c:if>
<!DOCTYPE html>
<html>
<head>
<fmt:setLocale value="${sessionScope.Locale}"/>
<fmt:setBundle basename="source" var="sss"/>
<title><fmt:message key="indexPagetitle" bundle="${sss}"></fmt:message></title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link rel="shortcut icon" type="image/x-icon" href="images/systemImages/logo.gif" media="screen" />
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
<script src="js/json.js"> </script>
<!-- slide -->
<script src="js/responsiveslides.min.js"></script>
   <script>
    $(function () {
      $("#slider").responsiveSlides({
      	auto: true,
      	speed: 500,
        namespace: "callbacks",
        pager: true,
      });
    });
    
    
    
    $(window).scroll(function(){
		var scrollTop = $(this).scrollTop();
		var scrollHeight = $(document).height();
		var windowHeight = $(this).height();
		if(Math.round(scrollTop) + windowHeight >= scrollHeight){
			if($("#info").html()!="没有更多商品了")
			{
				$("#info").html("<img src='images/systemImages/loading.gif'  width='300' height='150'/>");
				setTimeout(function (){
					var url="ProductServlet?method=listProductByPage&ajax=true&page="+$("#nextpage").val()+"&count="+$("#count").val();
					$.get(url,function(data){
						if(data.length>0)
						{
							for(var  x=0;x<data.length;x++)
							{
								var  newProductInfo="<div class='col-md-3 col-md2'><div class='col-md1 simpleCart_shelfItem'><a href='ProductServlet?method=loadProductDetailInfo&id="+data[x].id+"'><img style='width: 200px;height: 240px;'	src='"+data[x].firstImage+"' alt='' /></a><h3><a href='ProductServlet?method=loadProductDetailInfo&id="+data[x].id+"' style='font-size: 14px;'>"+data[x].name+"</a></h3><div class='price'><h5 class='item_price'>"+data[x].price+"</h5><a href='ProductServlet?method=addProductToShopcar&productId="+data[x].id+"&count=1' class='item_add'>加入购物车</a><div class='clearfix'> </div></div></div></div>	"
								$("#allProduct").append(newProductInfo);
							}
							$("#nextpage").val(parseInt($("#nextpage").val())+1);
							$("#info").html("滚动加载更多");
						}else
						{
							$("#info").html("没有更多商品了");
						}
					});
				},2000);
			}
		}
	});
    
  </script>
</head>
<body>
<input type="hidden"  id="nextpage" value="${requestScope.page.nextPage }"> 
<input type="hidden"  id="count" value="${requestScope.page.count}"> 
<c:import url="head.jsp"></c:import>
<!--banner-->
<div class="banner">
	<div class="col-sm-3 banner-mat">
		<img  class="img-responsive"  src="images/systemImages/ba1.jpg">
	</div>
	<div class="col-sm-6 matter-banner">
	
	 	<div class="slider">
	    	<div class="callbacks_container">
	      		<ul class="rslides" id="slider">
	        		<li>
	          			<img src="images/systemImages/1.jpg" alt="">
	       			 </li>
			 		 <li>
	          			<img src="images/systemImages/2.jpg" alt="">   
	       			 </li>
					 <li>
	          			<img src="images/systemImages/1.jpg" alt="">
	        		</li>	
	      		</ul>
	 	 	</div>
		</div>
	</div>
	<div class="col-sm-3 banner-mat">
		<img class="img-responsive" src="images/systemImages/ba.jpg" alt="">
	</div>
	<div class="clearfix"> </div>
</div>
<!--//banner-->
<!--content-->
<div class="content">
	<div class="container">
		<div class="content-top">
			<h1><fmt:message key="indexPagerexiaotitle"  bundle="${sss }"></fmt:message></h1>
			<div class="content-top1" id="allProduct">
				<c:forEach var="p"  items="${requestScope.ps}">
					<div class="col-md-3 col-md2">
						<div class="col-md1 simpleCart_shelfItem">
							<a href="ProductServlet?method=loadProductDetailInfo&id=${p.id }">
								<img style="width: 200px;height: 240px;"	src="${p.firstImage }" alt="" />
							</a>
							<h3><a href="ProductServlet?method=loadProductDetailInfo&id=${p.id }" style="font-size: 14px;">${p.name }</a></h3>
							<div class="price">
									<h5 class="item_price">${p.basicprice}</h5>
									<a href="ProductServlet?method=addProductToShopcar&productId=${p.id}&count=1" class="item_add">加入购物车</a>
									<div class="clearfix"> </div>
							</div>
						</div>
					</div>	
				</c:forEach>
				
<!-- 			<div style="text-align: center;margin-top: 40px;padding-top: 100px;"> -->
<%-- 			<a style="margin-top: 40px;" class="acount-btn" href="ProductServlet?method=listProductByPage&page=${requestScope.page.firstPage }&count=${requestScope.page.count}">首页</a>&nbsp; --%>
<%-- 			<a style="margin-top: 40px;"  class="acount-btn" href="ProductServlet?method=listProductByPage&page=${requestScope.page.previousPage }&count=${requestScope.page.count}">上一页</a>&nbsp; --%>
<%-- 			<a style="margin-top: 40px;" class="acount-btn" href="ProductServlet?method=listProductByPage&page=${requestScope.page.nextPage }&count=${requestScope.page.count}">下一页</a>&nbsp; --%>
<%-- 			<a style="margin-top: 40px;" class="acount-btn" href="ProductServlet?method=listProductByPage&page=${requestScope.page.wagePage }&count=${requestScope.page.count}">尾页</a>&nbsp; --%>
<%-- 			<a style="margin-top: 40px;" class="acount-btn">当前第${requestScope.page.nowPage}页/总共${requestScope.page.wagePage}页</a> --%>
<!-- 			</div> -->
			<div class="clearfix"> </div>
			</div>	
			<div style="text-align: center;"><span id="info" style="font-size: 12px;color: #36D2B6">滚动加载更多</span></div>
		</div>
	</div>
</div>
<!--//content-->
<c:import url="foot.jsp"></c:import>
</body>
</html>