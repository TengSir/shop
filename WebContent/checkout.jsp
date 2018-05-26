<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>时尚街-购物车</title>
<link rel="shortcut icon" type="image/x-icon" href="images/productImages/logo.gif" media="screen" />
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
function  selectAll(x)
{
	var  cks=document.getElementsByName("productId");
		for(var  y in cks)
		{
			cks[y].checked=x;
		}
}
function  reveseSelect()
{
	var  cks=document.getElementsByName("productId");
		for(var  y in cks)
		{
			(cks[y].checked==true)?(cks[y].checked=false):(cks[y].checked=true);
		}
}

function  deleteProduct(id){
	var  result=confirm('确认删除吗?亲');
	if(result)
	{
		window.location.href='ProductServlet?method=deleteProductFromShopCar&productId='+id;
	}
}
function deleteSelect(){
	var ids="";
	var  cks=document.getElementsByName("productId");
	for(var  x in  cks)
	{
		if(cks[x].checked==true&&cks[x].type=='checkbox')
		{
			ids=ids+cks[x].value+",";
		}		
	}
	if(window.confirm("确认要删除选中的商品吗？"))
	{
		window.location.href='ProductServlet?method=deleteProductFromShopCar&productId='+ids;
	}
}
</script>
<!-- slide -->
</head>
<body>
<c:import url="head.jsp"></c:import>
<!---->
<div class="container">
	<div class="check-out">
		<c:choose>
			<c:when test="${empty sessionScope.shopCars }">
				客官，购物车空空如也，去买些东西吧~~~		
			</c:when>
			<c:otherwise>
				<h1>购物车清单</h1>
		    	    <table border="1" class="table-bordered">
						  <tr>
							<th>商品</th>
							<th>数量</th>		
							<th>价格</th>
							<th>折扣</th>
							<th>小计</th>
							<th>
								<input  onclick="selectAll(this.checked)" type="checkbox" style="font-size: 12px;"/><span  style="font-size: 12px;">全选</span>
								<input onclick="reveseSelect()" type="checkbox" style="font-size: 12px;"/><span  style="font-size: 12px;">反选</span>
								<a href="javascript:void()" onclick="deleteSelect()" style="font-size: 12px;">删除选中</a>
							</th>
						  </tr>
						  <c:forEach var="s"  items="${sessionScope.shopCars }">
						  <tr>
							<td class="ring-in"><a href="ProductServlet?method=loadProductDetailInfo&id=${s.key.id}" class="at-in"><img width="100" height="115" src="${s.key.firstImage }" class="img-responsive" alt=""></a>
							<div class="sed">
								<h5>${s.key.name }</h5>
								<p>${s.key.description }</p>
							</div>
							<div class="clearfix"></div></td>
							<td><span onclick="countMin()" style="cursor: pointer;text-shadow: 1px 1px 1px  gray;font-weight: bolder;padding-right: 10px;">--</span><input type="text" style="border:1px solid gray;width: 30px;height: 20px;text-align: center;" value="${s.value }"  id="count" /><span style="cursor: pointer;text-shadow: 1px 1px 1px  gray;font-weight: bolder;padding-left: 10px;padding-right: 10px;" onclick="countMax()">+</span></td>		
							<td>${s.key.basicprice }</td>
							<td>${s.key.discount }</td>
							<td><fmt:formatNumber value="${s.key.basicprice*(1-s.key.discount)*s.value}" pattern="￥0.00"></fmt:formatNumber> </td>
							<td>
								<a  href="javascript:deleteProduct(${s.key.id })"  style="font-size: 12px;">删除</a>
								<input style="margin-left: 10px;" type="checkbox" name="productId" value="${s.key.id }" />
							</td>
						  </tr>
						 </c:forEach>
					</table>
					
					<a style="margin-left: 40px;" href="UserServlet?method=loadUserAddressInfo&userid=${sessionScope.loginedUser.userid }&editOrder=true" class=" to-buy">提交订单</a>
					<a style="margin-left: 40px;" href="." class=" to-buy">再逛逛</a>
					<a style="margin-left: 40px;" href="javascript:if(window.confirm('您确认清空购物车吗?')){window.location.href='OrderServlet?method=clearShopCar'}" class=" to-buy">清空购物车</a>
					
			</c:otherwise>
		</c:choose>
		<div class="clearfix"> </div>
    </div>
</div>
<c:import url="foot.jsp"></c:import>
</body>
</html>