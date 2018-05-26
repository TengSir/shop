package com.oracle.shop.control.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SessionChecker implements Filter {

	@Override
	public void destroy() {
		//销毁时需要执行的释放资源的业务代码

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		//这里是书写过滤规则的区域
		
		HttpServletRequest  request=(HttpServletRequest)arg0;//将过滤器穿件来的对象转化成request对象
		HttpServletResponse  response=(HttpServletResponse)arg1;
		String requestParamters=request.getQueryString();
		String requestURI=request.getRequestURI();
		
		//根据请求的url信息判断哪些url是不许要拦截，不需要拦截直接放行
		
		//如果是必须要登陆才能访问的url资源，则需要判断sesison中是否存储的有登陆的用户信息
		//如果有登录，则放行，如果没有登录，则跳转到登录页面
		
		if(requestURI.contains("OrderServlet"))
		{
			if(request.getSession().getAttribute("loginedUser")==null)//判断用户为登录，则跳转到登录页面
			{
				response.sendRedirect("account.jsp");
			}else
			{
				arg2.doFilter(arg0, arg1);
			}
		}else if(requestURI.contains("UserServlet")&&requestParamters.contains("loadUserInfo")){
			if(request.getSession().getAttribute("loginedUser")==null)//判断用户为登录，则跳转到登录页面
			{
				response.sendRedirect("account.jsp");
			}else
			{
				arg2.doFilter(arg0, arg1);
			}
		}
		else//除了前面那些if里面的要连接，else里面都是不应该拦截页面
		{
			arg2.doFilter(arg0, arg1);
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		//这里一般书写需要在过滤之前提前初始化的业务代码

	}

}
