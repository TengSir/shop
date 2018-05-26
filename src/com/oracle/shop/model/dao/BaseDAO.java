package com.oracle.shop.model.dao;

public interface BaseDAO {
	
	public  boolean  add(Object obj);
	public  boolean  delete(Object obj);
	public  boolean  update(Object obj);
	public  Object  listAll();

}
