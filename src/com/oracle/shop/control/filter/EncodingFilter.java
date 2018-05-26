package com.oracle.shop.control.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class EncodingFilter implements Filter {
	@Override
	public void destroy() {
		
	}
	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest  request=(HttpServletRequest)arg0;
		request.setCharacterEncoding("UTF-8");
		chain.doFilter(arg0, arg1);

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}
}