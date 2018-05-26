package com.oracle.shop.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.oracle.shop.model.javabean.Order;
import com.oracle.shop.model.javabean.Product;

public interface OrderDAO extends BaseDAO {
	
	public boolean  saveOrder(Order o,HashMap<Product, Integer>  orderItems);
	public  Order  loadOrderById(String orderId);
	public  ArrayList<Order> listAllOrdersByUserid(String userid);
}
