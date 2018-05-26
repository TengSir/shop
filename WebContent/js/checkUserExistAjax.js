var xhr;//定义一个对象，一会准备用它存储创建的好XMLHttpRequest
function checkUsername(v)
{
	//使用ajax悄悄地到后台查询当前你输入的这个内容是否存在
	
	//1创建ajax 发送请求的对象(XMLHttpRequest)
	if(window.ActiveXObject){
		xhr = new ActiveXObject("Microsoft.XMLHTTP");
	}else if(window.XMLHttpRequest){
		xhr = new XMLHttpRequest();
	}else{
		alert("哥们，您可以换浏览器了!");
	}
	
	//2.用创建的ajax对象悄悄的发送请求到后台(静默)
	xhr.onreadystatechange=processResult;//提前设置好如果后台回发数据了，指定哪个函数处理
	xhr.open("get","UserServlet?method=checkUsername&username="+v);
	xhr.send(null);

}
//ajax回掉函数，后台发回结果后执行业务的地方
function  processResult(){
	if(xhr.readyState==4)
	{
		if(xhr.status==200)
		{
			if(xhr.responseText=='true')
			{
				
				document.getElementById("info").innerHTML="<b  style='color:red'>不可用</b>";
			}else
			{
				document.getElementById("info").innerHTML="<b style='color:green'>可用</b>";
			}
		}
	}
}