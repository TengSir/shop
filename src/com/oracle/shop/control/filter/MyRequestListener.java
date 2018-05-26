package com.oracle.shop.control.filter;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;

public class MyRequestListener implements ServletRequestListener {

	@Override
	public void requestDestroyed(ServletRequestEvent arg0) {
		System.out.println("请求结束了，销毁了");
	}

	@Override
	public void requestInitialized(ServletRequestEvent arg0) {
		System.out.println("用户发起了一个新的请求");

	}

}
