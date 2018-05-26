<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>时尚街-出错啦</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link rel="shortcut icon" type="image/x-icon" href="images/systemImages/logo.gif"
	media="screen" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Fashion Mania Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- start menu -->
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>
	$(document).ready(function() {
		$(".memenu").memenu();
	});
</script>
<script src="js/simpleCart.min.js">
	
</script>
<!-- slide -->
<script src="js/responsiveslides.min.js"></script>
<script>
	$(function() {
		$("#slider").responsiveSlides({
			auto : true,
			speed : 500,
			namespace : "callbacks",
			pager : true,
		});
	});
</script>
</head>
<body>
	<img src="images/systemImages/backTop.png" title="点击返回顶部" id="backNav"
		style="display: none; position: fixed; cursor: pointer; z-index: 2" />
	<!--header-->
	<div class="header">
		<div class="header-top">
			<div class="container">
				<div class="col-md-4 world">
					<ul>
						<li><select class="in-drop" style="width: 50px;">
								<option>英语</option>
								<option>日语</option>
								<option>法语</option>
						</select></li>
						<!-- 						<li><select class="in-drop1"> -->
						<!-- 							  <option>美元</option> -->
						<!-- 							  <option>欧元</option> -->
						<!-- 							  <option>人民币</option> -->
						<!-- 							</select> -->
						<!-- 						</li> -->
					</ul>
				</div>
				<div class="col-md-4 logo">
					<a href="index.jsp"><img src="images/systemImages/logo.png" alt=""></a>
				</div>

				<div class="clearfix"></div>
			</div>
		</div>
		<div class="container">
			<div class="clearfix"></div>
			<!---pop-up-box---->
			<script type="text/javascript" src="js/modernizr.custom.min.js"></script>
			<link href="css/popuo-box.css" rel="stylesheet" type="text/css"
				media="all" />
			<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
			<!---//pop-up-box---->
			<div id="small-dialog" class="mfp-hide">
				<div class="search-top">
					<div class="login">
						<input type="submit" value=""> <input type="text"
							value="Type something..." onfocus="this.value = '';"
							onblur="if (this.value == '') {this.value = '';}">
					</div>
					<p>购买</p>
				</div>
			</div>
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
					setTimeout("changeTime(8)", 1000);
				});
				function  changeTime(n){
					if(n>0){
						$("#time").text(n+"秒钟后跳回首页");
						setTimeout("changeTime("+(n-1)+")", 1000);
					}else
					{
						window.location.href=".";	
					}
				}
			</script>
		</div>
	</div>
	<!--//header-->
	<!--content-->
	<div class="content">
		<div class="container">
			<div class="content-top" style="text-align: center;">
				<h1 class="acount-btn" >哎哟,系统出错了,程序员正在疯狂加班中... ...</h1><br /> <span id="time"></span><br /> <a
					class="acount-btn" href="#">立即回首页</a>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!--//content-->
	<%@include file="foot.jsp"%>
</body>
</html>