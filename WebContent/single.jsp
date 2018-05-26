<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>时尚街-商品详情</title>
<link rel="shortcut icon" type="image/x-icon"
	href="images/systemImages/logo.gif" media="screen" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" />
<link href="css/popuo-box.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Fashion Mania Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<script type="text/javascript">
function addtoShopCar(url)
{
	var  count=document.getElementById("count").value;
	window.location.href=url+"&count="+count;
}
function countMin(){
	var  count=document.getElementById("count").value;
	if(count==1)
	{
		alert("客官不能再少了！");	
	}else
	{
		document.getElementById("count").value=parseInt(count)-1;
	}
}
function countMax(){
	var  count=document.getElementById("count").value;
		document.getElementById("count").value=parseInt(count)+1;
}
</script>
<!---->
</head>
<body>
	<c:import url="head.jsp"></c:import>
	<div class="single">

		<div class="container">
			<div class="col-md-9">
				<div class="col-md-5 grid">
					<div class="flexslider">
						<ul class="slides">
							<li data-thumb="${requestScope.p.firstImage }">
								<div class="thumb-image">
									<img src="${requestScope.p.firstImage }" data-imagezoom="true">
								</div>
							</li>
							<c:if test="${requestScope.p.images ne null }">
								<c:forEach var="i" items="${requestScope.p.images }">
									<li style="width: 20px; height: 100px;" data-thumb="${i.path }">
										<div class="thumb-image">
											<img src="${i.path }" data-imagezoom="true">
										</div>
									</li>
								</c:forEach>
							</c:if>
						</ul>
					</div>
				</div>
				<div class="col-md-7 single-top-in">
					<div class="single-para simpleCart_shelfItem">
						<h1>${requestScope.p.name }</h1>
						<div class="star-on">
							<ul>
								<li><a href="#"><i class="glyphicon glyphicon-star">
									</i></a></li>
								<li><a href="#"><i class="glyphicon glyphicon-star">
									</i></a></li>
								<li><a href="#"><i class="glyphicon glyphicon-star">
									</i></a></li>
								<li><a href="#"><i class="glyphicon glyphicon-star">
									</i></a></li>
								<li><a href="#"><i class="glyphicon glyphicon-star">
									</i></a></li>
							</ul>
							<div class="review">
								<a href="#"> 3 reviews </a>/ <a href="#"> Write a review</a>
							</div>
							<div class="clearfix"></div>
						</div>

						<label class="add-to item_price">${requestScope.p.basicprice }</label>

						<div class="available">
							<h6>选项</h6>
							<ul>
								<li>尺码:<select>
										<c:forEach var="s" items="${requestScope.p.models }">
											<option value="${s.size }">${s.size }</option>
										</c:forEach>
								</select></li>
								<li>颜色: <select>
										<c:forEach var="s" items="${requestScope.p.models }">
											<option value="${s.color }">${s.color }</option>
										</c:forEach>
								</select>
								</li>
								<li>库存: 
									<c:forEach var="s" items="${requestScope.p.models }" begin="0" end="0">
											<input type="text" readonly="readonly"
									value="${s.counts }"
									style="border: 1px solid gray; width: 40px" />
										</c:forEach>
								</li>
								<li>折扣: 
											<input type="text" readonly="readonly"
									value="${requestScope.p.discount }"
									style="border: 1px solid gray; width: 40px" />
								</li>
								<li>
								
								</li>
							</ul>
						</div>
						<span onclick="countMin()" style="cursor: pointer;text-shadow: 1px 1px 1px  gray;font-weight: bolder;padding-right: 10px;">--</span><input type="text" style="width: 40px;height: 20px; text-align: center;" value="1" id="count" /><span style="cursor: pointer;text-shadow: 1px 1px 1px  gray;font-weight: bolder;padding-left: 10px;padding-right: 10px;" onclick="countMax()">+</span><a href="javascript:addtoShopCar('ProductServlet?method=addProductToShopcar&productId=${requestScope.p.id }')" class="cart item_add">加入购物车</a>
					</div>
				</div>
				
				<div class="clearfix">
				
				</div>
				<div style="border:1px solid gray">
				${requestScope.p.description }
				</div>
				<hr />
				<div style="text-align: center;">
					<h3 class="cate">您也可以看看如下商品</h3>
				</div>
				<div class="content-top1">
					<div class="col-md-4 col-md3">
						<div class="col-md1 simpleCart_shelfItem">
							<a href="single.jsp"> <img class="img-responsive"
								src="images/productImages/pi6.png" alt="" />
							</a>
							<h3>
								<a href="single.jsp">Jeans</a>
							</h3>
							<div class="price">
								<h5 class="item_price">$300</h5>
								<a href="#" class="item_add">加入购物车</a>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<div class="col-md-4 col-md3">
						<div class="col-md1 simpleCart_shelfItem">
							<a href="single.jsp"> <img class="img-responsive"
								src="images/productImages/pi7.png" alt="" />
							</a>
							<h3>
								<a href="single.jsp">Tops</a>
							</h3>
							<div class="price">
								<h5 class="item_price">$300</h5>
								<a href="#" class="item_add">加入购物车</a>
								<div class="clearfix"></div>
							</div>

						</div>
					</div>
					<div class="col-md-4 col-md3">
						<div class="col-md1 simpleCart_shelfItem">
							<a href="single.jsp"> <img class="img-responsive"
								src="images/productImages/pi.png" alt="" />
							</a>
							<h3>
								<a href="single.jsp">Tops</a>
							</h3>
							<div class="price">
								<h5 class="item_price">$300</h5>
								<a href="#" class="item_add">加入购物车</a>
								<div class="clearfix"></div>
							</div>

						</div>
					</div>

					<div class="clearfix"></div>
				</div>
			</div>
			<!----->
			<div class="col-md-3 product-bottom">
				<!--categories-->
				<div class=" rsidebar span_1_of_left">
					<h3 class="cate">分类</h3>
					<ul class="menu-drop">
						<li class="item1"><a href="#">男装 </a>
							<ul class="cute">
								<li class="subitem1"><a href="single.jsp">Cute Kittens
								</a></li>
								<li class="subitem2"><a href="single.jsp">Strange Stuff
								</a></li>
								<li class="subitem3"><a href="single.jsp">Automatic
										Fails </a></li>
							</ul></li>
						<li class="item2"><a href="#">女装 </a>
							<ul class="cute">
								<li class="subitem1"><a href="single.jsp">Cute Kittens
								</a></li>
								<li class="subitem2"><a href="single.jsp">Strange Stuff
								</a></li>
								<li class="subitem3"><a href="single.jsp">Automatic
										Fails </a></li>
							</ul></li>
						<li class="item3"><a href="#">童装</a>
							<ul class="cute">
								<li class="subitem1"><a href="single.jsp">Cute Kittens
								</a></li>
								<li class="subitem2"><a href="single.jsp">Strange Stuff
								</a></li>
								<li class="subitem3"><a href="single.jsp">Automatic
										Fails</a></li>
							</ul></li>
						<li class="item4"><a href="#">配饰</a>
							<ul class="cute">
								<li class="subitem1"><a href="single.jsp">Cute Kittens
								</a></li>
								<li class="subitem2"><a href="single.jsp">Strange Stuff
								</a></li>
								<li class="subitem3"><a href="single.jsp">Automatic
										Fails</a></li>
							</ul></li>

						<li class="item4"><a href="#">鞋子</a>
							<ul class="cute">
								<li class="subitem1"><a href="single.jsp">Cute Kittens
								</a></li>
								<li class="subitem2"><a href="single.jsp">Strange Stuff
								</a></li>
								<li class="subitem3"><a href="single.jsp">Automatic
										Fails </a></li>
							</ul></li>
					</ul>
				</div>
				<!--initiate accordion-->
				<script type="text/javascript">
					$(function() {
						var menu_ul = $('.menu-drop > li > ul'), menu_a = $('.menu-drop > li > a');
						menu_ul.hide();
						menu_a.click(function(e) {
							e.preventDefault();
							if (!$(this).hasClass('active')) {
								menu_a.removeClass('active');
								menu_ul.filter(':visible').slideUp('normal');
								$(this).addClass('active').next().stop(true,
										true).slideDown('normal');
							} else {
								$(this).removeClass('active');
								$(this).next().stop(true, true).slideUp(
										'normal');
							}
						});

					});
				</script>
				<!--//menu-->
				<!--seller-->
				<div class="product-bottom">
					<h3 class="cate">热销产品</h3>
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="single.jsp"><img class="img-responsive "
								src="images/productImages/pr.jpg" alt=""></a>
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2">
								<a href="single.jsp">Lorem ipsum dolor sitamet consectetuer
								</a>
							</h6>
							<span class=" price-in1"> $40.00</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="single.jsp"><img class="img-responsive "
								src="images/productImages/pr1.jpg" alt=""></a>
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2">
								<a href="single.jsp">Lorem ipsum dolor sitamet consectetuer
								</a>
							</h6>
							<span class=" price-in1"> $40.00</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="single.jsp"><img class="img-responsive "
								src="images/productImages/pr2.jpg" alt=""></a>
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2">
								<a href="single.jsp">Lorem ipsum dolor sitamet consectetuer
								</a>
							</h6>
							<span class=" price-in1"> $40.00</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="single.jsp"><img class="img-responsive "
								src="images/productImages/pr3.jpg" alt=""></a>
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2">
								<a href="single.jsp">Lorem ipsum dolor sitamet consectetuer
								</a>
							</h6>
							<span class=" price-in1"> $40.00</span>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>

				<!--//seller-->
				<!--tag-->
				<div class="tag">
					<h3 class="cate">标签</h3>
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
							<div class="clearfix"></div>
						</ul>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<c:import url="foot.jsp"></c:import>
	<!-- slide -->
	<script src="js/jquery.min.js"></script>
	<script src="js/imagezoom.js"></script>
	<!-- start menu -->
	<script type="text/javascript" src="js/memenu.js"></script>
	<script>
		$(document).ready(function() {
			$(".memenu").memenu();
		});
	</script>
	<script src="js/simpleCart.min.js">
		
	</script>
	<!--initiate accordion-->
	<script type="text/javascript">
		$(function() {
			var menu_ul = $('.menu-drop > li > ul'), menu_a = $('.menu-drop > li > a');
			menu_ul.hide();
			menu_a.click(function(e) {
				e.preventDefault();
				if (!$(this).hasClass('active')) {
					menu_a.removeClass('active');
					menu_ul.filter(':visible').slideUp('normal');
					$(this).addClass('active').next().stop(true, true)
							.slideDown('normal');
				} else {
					$(this).removeClass('active');
					$(this).next().stop(true, true).slideUp('normal');
				}
			});

		});
	</script>
	<!-- FlexSlider -->
	<script defer src="js/jquery.flexslider.js"></script>

	<script>
		// Can also be used with $(document).ready()
		$(window).load(function() {
			$('.flexslider').flexslider({
				animation : "slide",
				controlNav : "thumbnails"
			});
		});
	</script>
	<!---pop-up-box---->

	<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
	<!---//pop-up-box---->
	<script>
		$(document).ready(function() {
			$('.popup-with-zoom-anim').magnificPopup({
				type : 'inline',
				fixedContentPos : false,
				fixedBgPos : true,
				overflowY : 'auto',
				closeBtnInside : true,
				preloader : false,
				midClick : true,
				removalDelay : 300,
				mainClass : 'my-mfp-zoom-in'
			});

		});
	</script>
</body>
</html>