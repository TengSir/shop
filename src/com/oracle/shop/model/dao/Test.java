package com.oracle.shop.model.dao;

import com.oracle.shop.model.javabean.User;

public class Test {

	public static void main(String[] args) {
		UserDAO  dao=new UserDAOImp();
//		User user=dao.login("username_1", "pass_1");
		User u=new User(0, "tengsir", "111111", "老滕", "男", 18, "images/1.png", false);
		boolean b=dao.add(u);
		System.out.println(b);
//		System.out.println(user);
	}
}
