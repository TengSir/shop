package com.oracle.shop.util.tester;

import org.json.JSONArray;
import org.json.JSONObject;

public class TestJSOn {

	
	public static void main(String[] args) throws Exception {
		String name="aaa";
		String sex="male";
		int age=23;
		
		
		//如何将多个属性封装成一个合格的json字符串
		
		JSONObject  o=new JSONObject();
		o.put("name", name);
		o.put("sex", sex);
		o.put("age", age);
		
		JSONObject  o1=new JSONObject();
		o1.put("name", "jack");
		o1.put("sex", "male");
		o1.put("age", 22);
		
		
		String ajaxSendData="[{'name':'tengsir','age':12,'sex':'male'},{'name':'tengsir','age':12,'sex':'male'}]";
		
		JSONObject  ob=new JSONObject(ajaxSendData);
		System.out.println(ob.getString("name"));
		System.out.println(ob.getString("sex"));
		System.out.println(ob.getInt("age"));
		
		JSONArray  objs=new JSONArray(ajaxSendData);
//		objs.put(o);
//		objs.put(o1);
		System.out.println(objs.toString());
		
		
		
	}
}
