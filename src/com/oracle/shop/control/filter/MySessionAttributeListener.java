package com.oracle.shop.control.filter;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

public class MySessionAttributeListener implements HttpSessionAttributeListener {

	@Override
	public void attributeAdded(HttpSessionBindingEvent arg0) {
		System.out.println("添加了"+arg0.getName()+"\t"+arg0.getSession().getId());
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent arg0) {
		System.out.println("移除了"+arg0.getName()+"\t"+arg0.getSession().getId());
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent arg0) {
		System.out.println("替换了"+arg0.getName()+"\t"+arg0.getSession().getId());
	}

}
