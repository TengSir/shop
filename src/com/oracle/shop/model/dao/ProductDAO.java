package com.oracle.shop.model.dao;

import java.util.ArrayList;
import java.util.List;

import com.oracle.shop.model.javabean.Product;


public interface ProductDAO extends BaseDAO {
	
	public List<Product>  listAllByProductType(String typeName);
	
	public  List<Product>  listAllProduct(int page,int count);  
	public  List<Product>  searchProduct(String key,int page,int count);  
	
	public Product  getProductDetailInfoById(int id);
	public  int  getAllProductCount();
	public  int  getAllProductCountBySearchKey(String key);
	public ArrayList<String>  ajaxSearch(String key);
	

}
