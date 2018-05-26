<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="${sessionScope.Locale}"/>
<fmt:setBundle basename="source" var="sss"/>
<script src="js/jquery.min.js"></script>
<script src="js/json.js"></script>
<script>
	function loadMessage(){
		$.post("UtilServlet",{
			"method":"loadChatMessage"
		},function(data){
			var text=$("#chatMessages").val();
			if(data.length>0)
			$("#chatMessages").val(text+"\r\n\r\n"+data);
		});
		setTimeout("loadMessage()", 1000);
	}

	$(document).ready(function() {
		$("#chatlogo").click(function(){
			if($("#alreadyLogin").val()=='true')
			{
				$("#chat").css("display","block");
				loadMessage();
			}else
			{
				if(window.confirm("登录后才能开启聊天功能！现在去登录吗？"))
				window.location.href="account.jsp";
			}
		})
		$("#close").click(function(){
			$("#chat").css("display","none");
		})
		$("#send").click(function(){
			if($("#editMessages").val().length==0)
			{
				alert('不能发送空内容');
			}else
			{
				//1.将自己即将发送的消息先设置到上面的消息聊天界面中
				var text=$("#chatMessages").val();
				
				//2.用ajax将消息发给服务器
				$.post("UtilServlet",{
					"method":"processChat",
					"words":$("#editMessages").val(),
					"username":$("#username").text()
				},function(data ){
					if(text.length==0)
						$("#chatMessages").val(data);
					else
						$("#chatMessages").val(text+"\r\n"+data);
				});
				
				$("#editMessages").val("");
			}
		})
		var x=0;
		var y=($(window).height()-300-20);
		$("#chat").css("left",x);
		$("#chat").css("top",y);
		
		$(document).scroll(function() {
			
			var x=document.body.scrollLeft;
			var y=($(window).height()-300-20)+document.body.scrollTop;
			$("#chat").css("left",x);
			$("#chat").css("top",y);
			
			
			if (document.body.scrollTop > 1) {
				$("#backNav").css({
					"display" : "block",
					"left" : ($(window).width() - 150),
					"top" : ($(window).height() - 150)
				})
			} else {
				$("#backNav").css("display", "none");
			}
		});
		$("#backNav").click(function() {
			var h = document.body.scrollTop;
			setTimeout("moveTop(" + h + ")", 1);
		});

	})
	function moveTop(h) {
		if (h > 0) {
			document.body.scrollTop = h - 20;
			setTimeout("moveTop(" + (h - 20) + ")", 1);
		} else {
			$("#backNav").css("display", "none");
		}
	}
	function searchProduct() {
		var key = document.getElementById("key").value.trim();
		if (key.length == 0) {
			if (document.getElementById("key").value.length > 0)
				alert("不能只输入空格!");
			else
				alert("请输入搜索内容!");
		} else {
			window.location.href = "ProductServlet?method=searchProduct&key="
					+ key + "&page=1&count=30";
		}
	}
	
	function changelanguage(l){
		var url=encodeURI(window.location.href);
		window.location.href='UtilServlet?method=changeLocale&language='+l+'&url='+url;
	}
	
	function ajaxSearch(){
		var  key=document.getElementById("key").value;
		var  xhr;//定义一个ajax对象，一会创建该对象
		
		if(window.ActiveXObject){
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
		}else if(window.XMLHttpRequest){
			xhr = new XMLHttpRequest();
		}else{
			alert("can't create xhr object!");
		}
		
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4)
			{
				if(xhr.status==200)
				{
					var  pipeitable=document.getElementById("pipei");
					//后续处理结果的代码
					var  names=JSON.parse(xhr.responseText);
					var code="";
						for(var  x=0;x<names.length;x++)
						{
							code+="<tr onclick=showSelectedData('"+names[x]+"') style='cursor:pointer;height:20px;padding:0px;' onmouseover=this.style.backgroundColor='#eeeeee' onmouseout=this.style.backgroundColor='white'><td style='font-size:14px;padding:0px;margin:0px;'>"+names[x]+"</td></tr>"
						}
						pipeitable.innerHTML=code;
				}
			}
		}
		
		xhr.open("get","ProductServlet?method=ajaxSearch&key="+key);
		xhr.send(null);

	}
	
	function  showSelectedData(value){
		document.getElementById('key').value=value;
		document.getElementById("pipei").innerHTML="";
		window.location.href = "ProductServlet?method=searchProduct&key="
			+ value + "&page=1&count=30";
	}
	
	
// 	var lastX=0,lastY=0;
// 	function   moveChat(){
// 		var  nowX=event.screenX;
// 		var nowY=event.screenY;
// 		document.getElementById("chat").style.position='absolute';
// // 		window.document.title=(nowX-lastX)+"---"+(nowY-lastY);
// 		window.document.title=parseInt(document.getElementById("chat").style.left)+(nowX-lastX)+"---"+(parseInt(document.getElementById("chat").style.top)+(nowY-lastY));
// 		document.getElementById("chat").style.left=parseInt(document.getElementById("chat").style.left)+(nowX-lastX);
// 		document.getElementById("chat").style.top=parseInt(document.getElementById("chat").style.top)+(nowY-lastY);
// 	}
	
// 	function rememberPosition(){
// 		lastX=event.screenX;
// 		lastY=event.screenY;
// 		alert(lastX+"---"+lastY);
		
// 	}
</script>
<img src="images/systemImages/backTop.png" title="点击返回顶部" id="backNav"
	style="display: none; position: fixed; cursor: pointer; z-index: 2" />
<!--header-->
<div class="header">
	<div class="header-top">
		<div class="container">
			<div class="col-md-4 world">
				<ul>
					<li><select class="in-drop" style="width: 80px;"  onchange="changelanguage(this.value);">
							<option value="zh_CN" <c:if test="${sessionScope.Locale eq 'zh_CN'}">selected="selected"</c:if> >中文</option>
							<option value="en_US" <c:if test="${sessionScope.Locale eq 'en_US'}">selected="selected"</c:if> >english</option>
							<option value="ko_KR" <c:if test="${sessionScope.Locale eq 'ko_KR'}">selected="selected"</c:if> >한국어</option>
							<option value="ja_JP" <c:if test="${sessionScope.Locale eq 'ja_JP'}">selected="selected"</c:if> >日本語</option>
					</select></li>
					<!-- 						<li><select class="in-drop1"> -->
					<!-- 							  <option>美元</option> -->
					<!-- 							  <option>欧元</option> -->
					<!-- 							  <option>人民币</option> -->
					<!-- 							</select> -->
					<!-- 						</li> -->
				</ul>
			</div>
			<div class="col-md-4 logo"><a href=""><img src="images/systemImages/logo.png"
					alt=""></a>
			</div>

			<div class="col-md-4 header-left">
			<c:if test="${sessionScope.loginedUser ne null}">
				<input type="hidden"  id="alreadyLogin" value="true"  />
			</c:if>
				<c:choose>
					<c:when test="${sessionScope.loginedUser ne null }">
						<a
							href="UserServlet?method=loadUserInfo&userid=${sessionScope.loginedUser.userid }"><img
							style="width: 50px; height: 50px; border-radius: 25px; border: 2px solid green"
							src="${sessionScope.loginedUser.image }" /></a>
						<b id="username" style="text-shadow: 1px 1px 1px green;">${sessionScope.loginedUser.realname }</b>&nbsp;<a
							style="font-size: 12px;"
							href="UserServlet?method=logoff&userid=${sessionScope.loginedUser.userid }">退出</a>
					</c:when>
					<c:otherwise>
						<p class="log">
							<a href="account.jsp"><fmt:message key="login"  bundle="${sss}"></fmt:message> </a> <span>or</span><a
								href="register.jsp"><fmt:message key="register"  bundle="${sss}"></fmt:message> </a>
						</p>
					</c:otherwise>

				</c:choose>
				<div class="cart box_1">
					<a href="checkout.jsp" style="text-decoration: none">
						<h3>
							<div class="total">
								<span class="total">${sessionScope.total }</span>
							</div>
							<img src="images/systemImages/cart.png" alt="" />
						</h3>
					</a>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="container">
		<div class="head-top">
			<div class="col-md-1 number">
				<span><a><img  id="chatlogo" title="在线客服"
						src="images/systemImages/support.png"
						style="width: 20px; height: 20px; cursor: pointer;" /></a></span>
			</div>
			<div class="col-md-8 h_menu4">
				<ul class="memenu skyblue">
					<li class=" grid"><a href="index.jsp"><fmt:message key="menu1"  bundle="${sss}"></fmt:message> </a></li>
					<li><a href="#"><fmt:message key="menu2"  bundle="${sss}"></fmt:message> </a>
						<div class="mepanel">
							<div class="row">
								<div class="col1">
									<div class="h_nav">
										<h4>所有</h4>
										<ul>
											<li><a
												href="ProductServlet?method=listProductByType&type=Shirts">Shirts</a></li>
											<li><a
												href="ProductServlet?method=listProductByType&type=Sports Wear">Sports
													Wear</a></li>
											<li><a
												href="ProductServlet?method=listProductByType&type=Shorts">Shorts</a></li>
											<li><a href="ProductServlet">Suits & Blazers</a></li>
											<li><a href="ProductServlet">Formal Shirts</a></li>
											<li><a href="ProductServlet">Sweatpants</a></li>
											<li><a href="ProductServlet">Swimwear</a></li>
											<li><a href="products.jsp">Trousers & Chinos</a></li>
											<li><a href="products.jsp">T-Shirts</a></li>
											<li><a href="products.jsp">Underwear & Socks</a></li>

										</ul>
									</div>
								</div>
								<div class="col1">
									<div class="h_nav">
										<h4>鞋子</h4>
										<ul>
											<li><a href="products.jsp">Formal Shoes</a></li>
											<li><a href="products.jsp">Boots</a></li>
											<li><a href="products.jsp">Sports Shoes</a></li>
											<li><a href="products.jsp">Casual Shoes</a></li>
											<li><a href="products.jsp">Running Shoes</a></li>
											<li><a href="products.jsp">Sneakers</a></li>
											<li><a href="products.jsp">Loafers</a></li>
											<li><a href="products.jsp">Slippers</a></li>
											<li><a href="products.jsp">Sandals</a></li>
											<li><a href="products.jsp">Flip-flops</a></li>

										</ul>
									</div>
								</div>
								<div class="col1">
									<div class="h_nav">
										<h4>品牌</h4>
										<ul>
											<li><a href="products.jsp">Levis</a></li>
											<li><a href="products.jsp">Persol</a></li>
											<li><a href="products.jsp">Nike</a></li>
											<li><a href="products.jsp">Edwin</a></li>
											<li><a href="products.jsp">New Balance</a></li>
											<li><a href="products.jsp">Jack & Jones</a></li>
											<li><a href="products.jsp">Paul Smith</a></li>
											<li><a href="products.jsp">Ray-Ban</a></li>
											<li><a href="products.jsp">Wood Wood</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div></li>
					<li class="grid"><a href="#"><fmt:message key="menu3"  bundle="${sss}"></fmt:message> </a>
						<div class="mepanel">
							<div class="row">
								<div class="col1">
									<div class="h_nav">
										<h4>所有</h4>
										<ul>
											<li><a href="products.jsp">Shirts & Tops</a></li>
											<li><a href="products.jsp">Sports Wear</a></li>
											<li><a href="products.jsp">Kurtas & Kurties</a></li>
											<li><a href="products.jsp">Suits & Blazers</a></li>
											<li><a href="products.jsp">Sarees</a></li>
											<li><a href="products.jsp">Sweatpants</a></li>
											<li><a href="products.jsp">Swimwear</a></li>
											<li><a href="products.jsp">Night-Suits</a></li>
											<li><a href="products.jsp">T-Shirts</a></li>
											<li><a href="products.jsp">Jeans</a></li>

										</ul>
									</div>
								</div>
								<div class="col1">
									<div class="h_nav">
										<h4>鞋子</h4>
										<ul>
											<li><a href="products.jsp">Heels</a></li>
											<li><a href="products.jsp">Flats</a></li>
											<li><a href="products.jsp">Sports Shoes</a></li>
											<li><a href="products.jsp">Casual Shoes</a></li>
											<li><a href="products.jsp">Running Shoes</a></li>
											<li><a href="products.jsp">Wedges</a></li>
											<li><a href="products.jsp">Boots</a></li>
											<li><a href="products.jsp">Pumps</a></li>
											<li><a href="products.jsp">Slippers</a></li>
											<li><a href="products.jsp">Flip-flops</a></li>

										</ul>
									</div>
								</div>
								<div class="col1">
									<div class="h_nav">
										<h4>品牌</h4>
										<ul>
											<li><a href="products.jsp">Levis</a></li>
											<li><a href="products.jsp">Persol</a></li>
											<li><a href="products.jsp">Nike</a></li>
											<li><a href="products.jsp">Edwin</a></li>
											<li><a href="products.jsp">New Balance</a></li>
											<li><a href="products.jsp">Jack & Jones</a></li>
											<li><a href="products.jsp">Paul Smith</a></li>
											<li><a href="products.jsp">Ray-Ban</a></li>
											<li><a href="products.jsp">Wood Wood</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div></li>
					<li><a
						href="OrderServlet?method=listAllOrdersByUserid&userid=${sessionScope.loginedUser.userid }"><fmt:message key="menu4"  bundle="${sss}"></fmt:message> </a></li>
					<li><a class="color6" href="contact.jsp"><fmt:message key="menu5"  bundle="${sss}"></fmt:message> </a></li>
				</ul>
			</div>
			<div class="col-md-3 search">
				<table cellspacing="0" cellpadding="0" style="margin: 0px;padding: 0px;"  >
				<tr style="margin: 0px;padding: 0px;">
					<td style="margin: 0px;padding: 0px;">
						<input  oninput="ajaxSearch()" id="key" value="${param.key}" type="text"
					onmouseover="this.style.border='1px solid black'"
					onmouseout="this.style.border='1px solid #36D2B6'"
					style="width: 220px; height: 24px; border: 1px solid #36D2B6; position: relative; top: -3px;" />
					<a href="javascript:searchProduct()" style="cursor: pointer;"><i
					class="glyphicon glyphicon-search"> </i> </a>
					</td>
				</tr>
				<tr style="margin: 0px;padding: 0px;">
					<td style="margin: 0px;padding: 0px;"  align="center">
						<table frame="box" id="pipei"  style="margin: 0px;padding: 0px;width: 220px;position: absolute;z-index: 2;background-color: white;left: 31px;filter:alpha(opacity=0.2)">
						</table>
						
					</td>
				</tr>
				</table>
			</div>
			<div class="clearfix"></div>
			<!---pop-up-box---->
			<script type="text/javascript" src="js/modernizr.custom.min.js"></script>
			<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
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

				});
			</script>
			<!---->
		</div>
	</div>
</div>
<!--//header-->

<div ondragstart="rememberPosition()" ondrag="moveChat()" id="chat"
	style="position:absolute;left:0px;top:0px;z-index:20; width: 480px; height: 290px;display: none;">
	<img src="images/systemImages/support-window.png" style="position: absolute;z-index: -1;" usemap="#Map" />
		<map name="Map" id="Map">
		  <area shape="rect" coords="392,55,422,71" id="close" />
		  <area shape="rect" coords="361,226,414,264" id="send"/>
		</map>
	<textarea id="chatMessages"  readonly="readonly" style=" font-size:12px; width: 312px;height: 122px;margin-left: 100px;margin-top: 80px;overflow: scroll;"></textarea>
	<textarea id="editMessages"  style=" font-size:12px;width: 258px;height: 43px;margin-left: 97px;margin-top: 18px;"></textarea>
</div>