<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>时尚街-添加收货地址</title>
<link rel="shortcut icon" type="image/x-icon"
	href="images/productImages/logo.gif" media="screen" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
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
<script type="text/javascript" src="js/address.js"></script>
<script>
	$(document).ready(function() {
		setup();
		preselect('北京市');
		promptinfo();
	});
</script>
<script src="js/simpleCart.min.js"></script>
	<style type="text/css">
		#allmap {width: 100%;height: 400px;overflow: hidden;margin:0;font-family:"微软雅黑";}
	</style>
	<style type="text/css">
		td,th{
		font-size: 12px;
		}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Ri3mC4soQVBj7nBKiQlVyKhZhbwrWGHf"></script>
<!-- slide -->
<script type="text/javascript">
function promptinfo()
{
 var address = document.getElementById('address').value;
 var s1 = document.getElementById('s1').value;
 var s2 = document.getElementById('s2').value;
 var s3 = document.getElementById('s3').value;
 address=""+s1+ s2 + s3;
 return address;
}
 
</script>
</head>
<body>
	<c:import url="head.jsp"></c:import>
	<!---->
	<div class="container">
		<div class="check-out">
			<h1>添加新的收货地址</h1>
			<form action="AddressServlet?method=addAddress" method="post">
				<input type="hidden" name="userid" value="${sessionScope.loginedUser.userid}" />
					 <input id="address" name="address" type="hidden" value="" />
				<table border="1" class="table-bordered">
					<tr>
						<th>省份:<select class="select" name="province" id="s1" style="width: 100px;"></select></th>
						<th>城市:<select class="select" name="city" id="s2" style="width: 100px;"></select></th>
						<th>区域:<select class="select" name="town" id="s3" style="width: 100px;"></select></th>
						<th>街道:<input id="street" type="text"  style="width: 200px;"/></th>
						<th>名称:<input id="user" type="text"  style="width: 100px;"/></th>
						<th>电话:<input id="tel" type="text"  style="width: 150px;"/></th>
					</tr>
					<tr>
						<th valign="top" colspan="6">详细地址:<textarea id="detail" style="width: 1000px;height: 80px;"></textarea> </th>
					</tr>
					<tr>
						<th valign="top" colspan="6">地图选取:
						<div id="allmap"></div>
						</th>
					</tr>
					<tr>
						<th valign="top" colspan="6"><a href="javascript:document.forms[0].submit()" class=" to-buy">确认添加</a></th>
					</tr>
				</table>
			</form>
			<div class="clearfix"></div>
		</div>
	</div>
	<c:import url="foot.jsp"></c:import>
</body>
<script type="text/javascript">
//百度地图API功能
var map = new BMap.Map("allmap");
map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);
// 添加带有定位的导航控件
var navigationControl = new BMap.NavigationControl({
  // 靠左上角位置
  anchor: BMAP_ANCHOR_TOP_LEFT,
  // LARGE类型
  type: BMAP_NAVIGATION_CONTROL_LARGE,
  // 启用显示定位
  enableGeolocation: true
});
map.addControl(navigationControl);
// 添加定位控件
var geolocationControl = new BMap.GeolocationControl();
geolocationControl.addEventListener("locationSuccess", function(e){
  // 定位成功事件
  var address = '';
  address += e.addressComponent.province;
  address += e.addressComponent.city;
  address += e.addressComponent.district;
  address += e.addressComponent.street;
  address += e.addressComponent.streetNumber;
});
geolocationControl.addEventListener("locationError",function(e){
  // 定位失败事件
  alert(e.message);
});
map.addControl(geolocationControl);
var geoc = new BMap.Geocoder();    

map.addEventListener("click", function(e){        
	var pt = new BMap.Point(e.point.lng,e.point.lat);
	var myIcon = new BMap.Icon("images/systemImages/pointer.gif", new BMap.Size(20,20));
	var marker2 = new BMap.Marker(pt,{icon:myIcon});  // 创建标注
	map.addOverlay(marker2); 
	geoc.getLocation(pt, function(rs){
		var addComp = rs.addressComponents;
		
		//alert(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber);
		
		var ps=document.getElementById("s1").options;
		for(var x in ps)
		{
			if(ps[x].value==addComp.province)
			{
				ps[x].selected="selected";
				change(1);
			}
		}
		
		var cs=document.getElementById("s2").options;
		for(var x in cs)
		{
			if(cs[x].value==addComp.city)
			{
				cs[x].selected="selected";
				change(2);
			}
		}
		
		var as=document.getElementById("s3").options;
		for(var x in as)
		{
			if(as[x].value==addComp.district)
			{
				as[x].selected="selected";
				change(3);
			}
		}
		$("#street").val(addComp.street);
		$("#detail").val(addComp.streetNumber);
	});        
});
</script>
</html>
