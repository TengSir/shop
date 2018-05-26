<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>时尚街-商品列表</title>
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
<!--content-->
<div class="products">
	<div class="container">
		<c:choose>
		<c:when test="${not empty  requestScope.ps}">
			<h1>商品列表</h1>
		<div class="col-md-9">
			<div class="content-top1">
				<c:forEach var="p" items="${requestScope.ps }">
					<div class="col-md-4 col-md3">
						<div class="col-md1 simpleCart_shelfItem">
							<a href="ProductServlet?method=loadProductDetailInfo&id=${p.id }">
								<img style="width: 200px;height: 240px;"	 src="${p.firstImage }" alt="" />
							</a>
							<h3><a href="ProductServlet?method=loadProductDetailInfo&id=${p.id }"  style="font-size: 14px;">${p.name }</a></h3>
							<div class="price">
									<h5 class="item_price">${p.basicprice }</h5>
									<a href="ProductServlet?method=addProductToShopcar&productId=${p.id}&count=1" class="item_add">添加到购物车</a>
									<div class="clearfix"> </div>
							</div>
						</div>
					</div>	
				</c:forEach>
				<div style="text-align: center;margin-top: 40px;padding-top: 100px;">
				<a style="margin-top: 40px;" class="acount-btn" href="ProductServlet?method=searchProduct&key=${param.key}&page=${requestScope.page.firstPage }&count=${requestScope.page.count}">首页</a>&nbsp;
				<a style="margin-top: 40px;"  class="acount-btn" href="ProductServlet?method=searchProduct&key=${param.key}&page=${requestScope.page.previousPage }&count=${requestScope.page.count}">上一页</a>&nbsp;
				<a style="margin-top: 40px;" class="acount-btn" href="ProductServlet?method=searchProduct&key=${param.key}&page=${requestScope.page.nextPage }&count=${requestScope.page.count}">下一页</a>&nbsp;
				<a style="margin-top: 40px;" class="acount-btn" href="ProductServlet?method=searchProduct&key=${param.key}&page=${requestScope.page.wagePage }&count=${requestScope.page.count}&key=${param.key}">尾页</a>&nbsp;
				<a style="margin-top: 40px;" class="acount-btn">当前第${requestScope.page.nowPage}页/总共${requestScope.page.wagePage}页</a>
				</div>
			</div>	
		</div>
		
		</c:when>
		<c:otherwise>
			<div class="col-md-9">
			<div class="content-top1">
			<h2>抱歉,没有搜索到与<b style="color:red">"${param.key }"</b>相关的商品!</h2>
			</div>
			</div>
		</c:otherwise>
		</c:choose>
		<div class="col-md-3 product-bottom">
			<!--categories-->
				<div class=" rsidebar span_1_of_left">
						<h3 class="cate">分类</h3>
							 <ul class="menu-drop">
							<li class="item1"><a href="#">Men </a>
								<ul class="cute">
									<li class="subitem1"><a href="single.jsp">Cute Kittens </a></li>
									<li class="subitem2"><a href="single.jsp">Strange Stuff </a></li>
									<li class="subitem3"><a href="single.jsp">Automatic Fails </a></li>
								</ul>
							</li>
							<li class="item2"><a href="#">Women </a>
								<ul class="cute">
									<li class="subitem1"><a href="single.jsp">Cute Kittens </a></li>
									<li class="subitem2"><a href="single.jsp">Strange Stuff </a></li>
									<li class="subitem3"><a href="single.jsp">Automatic Fails </a></li>
								</ul>
							</li>
							<li class="item3"><a href="#">Kids</a>
								<ul class="cute">
									<li class="subitem1"><a href="single.jsp">Cute Kittens </a></li>
									<li class="subitem2"><a href="single.jsp">Strange Stuff </a></li>
									<li class="subitem3"><a href="single.jsp">Automatic Fails</a></li>
								</ul>
							</li>
							<li class="item4"><a href="#">Accesories</a>
								<ul class="cute">
									<li class="subitem1"><a href="single.jsp">Cute Kittens </a></li>
									<li class="subitem2"><a href="single.jsp">Strange Stuff </a></li>
									<li class="subitem3"><a href="single.jsp">Automatic Fails</a></li>
								</ul>
							</li>
									
							<li class="item4"><a href="#">Shoes</a>
								<ul class="cute">
									<li class="subitem1"><a href="product.jsp">Cute Kittens </a></li>
									<li class="subitem2"><a href="product.jsp">Strange Stuff </a></li>
									<li class="subitem3"><a href="product.jsp">Automatic Fails </a></li>
								</ul>
							</li>
						</ul>
					</div>
				<!--initiate accordion-->
						<script type="text/javascript">
							$(function() {
							    var menu_ul = $('.menu-drop > li > ul'),
							           menu_a  = $('.menu-drop > li > a');
							    menu_ul.hide();
							    menu_a.click(function(e) {
							        e.preventDefault();
							        if(!$(this).hasClass('active')) {
							            menu_a.removeClass('active');
							            menu_ul.filter(':visible').slideUp('normal');
							            $(this).addClass('active').next().stop(true,true).slideDown('normal');
							        } else {
							            $(this).removeClass('active');
							            $(this).next().stop(true,true).slideUp('normal');
							        }
							    });
							
							});
						</script>
<!--//menu-->
<!--seller-->
				<div class="product-bottom">
						<h3 class="cate">热销商品</h3>
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="single.jsp"><img class="img-responsive " src="images/productImages/pr.jpg" alt=""></a>	
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2"><a href="single.jsp" >Lorem ipsum dolor sitamet consectetuer  </a></h6>
							<span class=" price-in1"> $40.00</span>
						</div>	
						<div class="clearfix"> </div>
					</div>
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="single.jsp"><img class="img-responsive " src="images/productImages/pr1.jpg" alt=""></a>	
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2"><a href="single.jsp" >Lorem ipsum dolor sitamet consectetuer  </a></h6>
							<span class=" price-in1"> $40.00</span>
						</div>	
						<div class="clearfix"> </div>
					</div>
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="single.jsp"><img class="img-responsive " src="images/productImages/pr2.jpg" alt=""></a>	
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2"><a href="single.jsp" >Lorem ipsum dolor sitamet consectetuer  </a></h6>
							<span class=" price-in1"> $40.00</span>
						</div>	
						<div class="clearfix"> </div>
					</div>	
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="single.jsp"><img class="img-responsive " src="images/productImages/pr3.jpg" alt=""></a>	
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2"><a href="single.jsp" >Lorem ipsum dolor sitamet consectetuer  </a></h6>
							<span class=" price-in1"> $40.00</span>
						</div>	
						<div class="clearfix"> </div>
					</div>		
				</div>

<!--//seller-->
<!--tag-->
				<div class="tag">	
						<h3 class="cate">热搜</h3>
					<div class="tags">
						<ul>
							<li><a href="#">design</a></li>
							<li><a href="#">fashion</a></li>
							<li><a href="#">lorem</a></li>
							<li><a href="#">dress</a></li>
							<li><a href="#">fashion</a></li>
							<li><a href="#">dress</a></li>
							<li><a href="#">design</a></li>
							<li><a href="#">dress</a></li>
							<li><a href="#">design</a></li>
							<li><a href="#">fashion</a></li>
							<li><a href="#">lorem</a></li>
							<li><a href="#">dress</a></li>
						<div class="clearfix"> </div>
						</ul>
				</div>					
			</div>
		</div>
		<div class="clearfix"> </div>
	</div>
</div>
<!--//content-->
<c:import url="foot.jsp"></c:import>
</body>
</html>