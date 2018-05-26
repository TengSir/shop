package com.oracle.shop.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.oracle.shop.model.javabean.Product;
import com.oracle.shop.model.javabean.ProductImage;
import com.oracle.shop.model.javabean.ProductModelType;

public class ProductDAOImp extends BaseDAOImp implements ProductDAO {
	@Override
	public boolean add(Object obj) {
		return false;
	}

	@Override
	public boolean delete(Object obj) {
		return false;
	}

	@Override
	public boolean update(Object obj) {
		return false;
	}

	@Override
	public Object listAll() {
		return null;
	}

	@Override
	public List<Product> listAllByProductType(String typeName) {
		List<Product>  ps=new ArrayList<>();
		Connection  c=getConnection();
		PreparedStatement pre=null;
		ResultSet rs=null;
		try {
			 pre=c.prepareStatement("select  * from  PRODUCTINFOBYTYPE   where typename=? ");
			 pre.setString(1, typeName);
			 rs=pre.executeQuery();
			 while(rs.next())
			 {
				 Product  p=new Product();
				 p.setId(rs.getInt("productid"));
				 p.setName(rs.getString("name"));
				 p.setBrand(rs.getString("brand"));
				 p.setType(rs.getString("type"));
				 p.setDiscount(rs.getFloat("discount"));
				 p.setDescription(rs.getString("description"));
				 p.setBasicprice(rs.getFloat("basicprice"));
				 p.setFirstImage(rs.getString("image"));
				 ps.add(p);
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disposeResource(c, pre, rs);
		return ps;
	}

	@Override
	public List<Product> listAllProduct(int page, int count) {
		List<Product>  ps=new ArrayList<>();
		Connection  c=getConnection();
		PreparedStatement pre=null;
		ResultSet rs=null;
		try {
			 pre=c.prepareStatement("select  * from  product  order by productId desc  limit ?,?");
			 pre.setInt(1, (page-1)*count);
			 pre.setInt(2, count);
			 rs=pre.executeQuery();
			 while(rs.next())
			 {
				 Product  p=new Product();
				 p.setId(rs.getInt("productid"));
				 p.setName(rs.getString("name"));
				 p.setBrand(rs.getString("brand"));
				 p.setType(rs.getString("type"));
				 p.setDiscount(rs.getFloat("discount"));
				 p.setDescription(rs.getString("description"));
				 p.setBasicprice(rs.getFloat("basicprice"));
				 p.setFirstImage(rs.getString("image"));
				 ps.add(p);
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disposeResource(c, pre, rs);
		return ps;
	}

	@Override
	public Product getProductDetailInfoById(int id) {
		Product p=null;
		Connection  c=getConnection();
		PreparedStatement pre=null;
		ResultSet rs=null;
		Set<ProductImage> pms=null;
		Set<ProductModelType> pts=null;
		try {
			 pre=c.prepareStatement("select p.*,pm.*  from product as p ,productImage as pm where  p.productId=pm.productId  and p.productId=?");
			 pre.setInt(1, id);
			 rs=pre.executeQuery();
			 while(rs.next())
			 {
				 if(p==null){
					p=new Product();
					pms=new HashSet<>();
					 p.setId(rs.getInt("productid"));
					 p.setName(rs.getString("name"));
					 p.setBrand(rs.getString("brand"));
					 p.setType(rs.getString("type"));
					 p.setDiscount(rs.getFloat("discount"));
					 p.setDescription(rs.getString("description"));
					 p.setBasicprice(rs.getFloat("basicprice"));
					 p.setFirstImage(rs.getString("image"));
				 }
				 ProductImage  pm=new ProductImage(rs.getInt("productImageId"),rs.getString("path"),rs.getInt("enable"));
				 pms.add(pm);
			 }
			 if(p==null)
			 {
				 pre=c.prepareStatement("select  *  from product where productId=?");
				 pre.setInt(1, id);
				 rs=pre.executeQuery();
				 rs.next();
						p=new Product();
						pms=new HashSet<>();
						 p.setId(rs.getInt("productid"));
						 p.setName(rs.getString("name"));
						 p.setBrand(rs.getString("brand"));
						 p.setType(rs.getString("type"));
						 p.setDiscount(rs.getFloat("discount"));
						 p.setDescription(rs.getString("description"));
						 p.setBasicprice(rs.getFloat("basicprice"));
						 p.setFirstImage(rs.getString("image"));
						 return p;
			 }
			 p.setImages(pms);
			 pre=c.prepareStatement("select *  from  productModelType where productId=?");
			 pre.setInt(1, id);
			 rs=pre.executeQuery();
			 while(rs.next())
			 {
				 if(pts==null){pts=new HashSet<>();}
				 ProductModelType  pt=new ProductModelType(rs.getInt("ModelTypeId"), rs.getString("size"), rs.getString("color"), rs.getFloat("price"), rs.getInt("counts"));
				 pts.add(pt);
			 }
			  p.setModels(pts);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return p;
	}

	@Override
	public int getAllProductCount() {
		Connection  c=getConnection();
		PreparedStatement pre=null;
		ResultSet rs=null;
		try {
			 pre=c.prepareStatement("select count(*)  from product");
			 rs=pre.executeQuery();
			 rs.next();
			 return  rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disposeResource(c, pre, rs);
		return 0;
	}

	@Override
	public List<Product> searchProduct(String key,int page,int count) {
		List<Product>  ps=new ArrayList<>();
		Connection  c=getConnection();
		PreparedStatement pre=null;
		ResultSet rs=null;
		try {
			 pre=c.prepareStatement("select  * from  product   where name like  ? order by productId limit ?,?  ");
			 pre.setString(1, "%"+key+"%");
			 pre.setInt(2, (page-1)*count);
			 pre.setInt(3, count);
			 rs=pre.executeQuery();
			 while(rs.next())
			 {
				 Product  p=new Product();
				 p.setId(rs.getInt("productid"));
				 p.setName(rs.getString("name"));
				 p.setBrand(rs.getString("brand"));
				 p.setType(rs.getString("type"));
				 p.setDiscount(rs.getFloat("discount"));
				 p.setDescription(rs.getString("description"));
				 p.setBasicprice(rs.getFloat("basicprice"));
				 p.setFirstImage(rs.getString("image"));
				 ps.add(p);
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disposeResource(c, pre, rs);
		return ps;
	}

	@Override
	public int getAllProductCountBySearchKey(String key) {
		Connection  c=getConnection();
		PreparedStatement pre=null;
		ResultSet rs=null;
		try {
			 pre=c.prepareStatement("select count(*)  from product where name like ?");
			 pre.setString(1, "%"+key+"%");
			 rs=pre.executeQuery();
			 rs.next();
			 return  rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disposeResource(c, pre, rs);
		return 0;
	}

	@Override
	public ArrayList<String> ajaxSearch(String key) {
		Connection  c=getConnection();
		PreparedStatement pre=null;
		ArrayList<String>  names=new ArrayList<>();
		ResultSet rs=null;
		try {
			 pre=c.prepareStatement("select name  from product where name like ?  limit 10");
			 pre.setString(1, "%"+key+"%");
			 rs=pre.executeQuery();
			 while(rs.next()){
				 names.add(rs.getString(1));
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disposeResource(c, pre, rs);
		return names;
	}

//	@Override
//	public boolean addProduct(admin.com.oracle.shop.model.javabeans.Product p) {
//		Connection  c=getConnection();
//		PreparedStatement pre=null;
//		try {
//			pre=c.prepareStatement("insert into product values(null,?,?,?,?,?,?,?,?,?)");
//			pre.setString(1, p.getName());
//			pre.setString(2, p.getBrand());
//			pre.setString(3, p.getType());
//			pre.setString(4, p.getSeris());
//			pre.setString(5, p.getImage());
//			pre.setString(6, p.getDescription());
//			pre.setFloat(7, p.getBasicPrice());
//			pre.setInt(8, p.getTypeId());
//			pre.setFloat(9, p.getDiscount());
//			return pre.executeUpdate()>0?true:false;
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			disposeResource(c, pre);
//		}
//		return false;
//	}

}
