package com.oracle.shop.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import com.oracle.shop.model.javabean.Address;
import com.oracle.shop.model.javabean.Order;
import com.oracle.shop.model.javabean.OrderItems;
import com.oracle.shop.model.javabean.Product;

public class OrderDAOImp extends BaseDAOImp implements OrderDAO {

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

	/**
	 * 生成订单，因为涉及到两种对象的数据操作，order(1个对象插入),orderitem(N个对象插入)
	 * 原子性--要么全部插入成功，要么一个都不插入
	 */
	@Override
	public boolean saveOrder(Order o, HashMap<Product, Integer> orderItems) {
		//生成订单
		Connection con=getConnection();//jdbc默认隐式事务
		try {
			con.setAutoCommit(false);//设置事务为手动提交模式(默认是自动提交)
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		PreparedStatement preSta=null;
		try {
			preSta=con.prepareStatement("insert into  orders values(?,now(),?,?,?,?)");
			preSta.setString(1, o.getOrderid());
			preSta.setInt(2, o.getStatus());
			preSta.setInt(3, o.getUserid());
			preSta.setInt(4, o.getAdd().getAddressId());
			preSta.setString(5, o.getMessage());
			int  result=preSta.executeUpdate();
			if(result==0)
			{
				con.rollback();//如果遇到sql失败的问题，应该手动控制事务撤销
				return false;
			}
			int count=0;
			for(Product p:orderItems.keySet())
			{
				preSta=con.prepareStatement("insert into  orderitems values(null,?,?,?,?)");
				preSta.setInt(1, orderItems.get(p));
				preSta.setFloat(2, p.getDiscount());
				preSta.setString(3, o.getOrderid());
				preSta.setInt(4, p.getId());
				count=preSta.executeUpdate();
				if(count==0){
					con.rollback();
					return false;
				}
			}
			con.commit();//如果上面都没有异常，则肯定会执行到这里，所以应当提交事务中所有的sql到数据库
			return  true;
		} catch (Exception e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			return false;
		}
	}

	@Override
	public Order loadOrderById(String orderId) {
		Order  o=null;
		Address a=null;
		Set<OrderItems>  items=null;
		Connection  con=getConnection();
		PreparedStatement pre=null;
		ResultSet  rs=null;
		try {
			pre=con.prepareStatement("select o.*,it.*,a.* from orders as o ,orderitems as it,address as a where o.orderid=it.orderid and o.addressid=a.addressid and o.orderid=?");
			pre.setString(1, orderId);
			rs=pre.executeQuery();
			while(rs.next()){
				if(o==null)
				{
					o=new Order();
					o.setOrderid(rs.getString("o.orderid"));
					o.setTime(rs.getString("time"));
					o.setMessage(rs.getString("message"));
					o.setStatus(rs.getInt("status"));
					o.setUserid(rs.getInt("userid"));
				}
				if(a==null)
				{
					a=new Address();
					a.setAddressId(rs.getInt("addressid"));
					a.setArea(rs.getString("area"));
					a.setProvince(rs.getString("province"));
					a.setCity(rs.getString("city"));
					a.setStreet(rs.getString("street"));
					a.setTel(rs.getString("tel"));
					a.setUser(rs.getString("user"));
					a.setDetail(rs.getString("detail"));
					o.setAdd(a);
				}
				if(items==null){items=new HashSet<>();}
				OrderItems  item=new OrderItems();
				item.setCount(rs.getInt("count"));
				item.setDiscount(rs.getFloat("discount"));
				item.setOrderid(rs.getString("o.orderid"));
				item.setOrderitemId(rs.getInt("orderitemid"));
				item.setProductId(rs.getInt("productid"));
				items.add(item);
			}
			o.setItems(items);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return o;
	}

	@Override
	public ArrayList<Order> listAllOrdersByUserid(String userid) {
		ArrayList<Order>  os=new ArrayList<>();
		Connection  con=getConnection();
		PreparedStatement pre=null;
		ResultSet  rs=null;
		try {
			pre=con.prepareStatement("select o.*,a.* from orders as o,address as a where  o.addressid=a.addressid and o.userid=?");
			pre.setInt(1, Integer.parseInt(userid));
			rs=pre.executeQuery();
			while(rs.next()){
					Order o=new Order();
					o.setOrderid(rs.getString("o.orderid"));
					o.setTime(rs.getString("time"));
					o.setMessage(rs.getString("message"));
					o.setStatus(rs.getInt("status"));
					o.setUserid(rs.getInt("userid"));
					Address a=new Address();
					a.setAddressId(rs.getInt("addressid"));
					a.setArea(rs.getString("area"));
					a.setProvince(rs.getString("province"));
					a.setCity(rs.getString("city"));
					a.setStreet(rs.getString("street"));
					a.setTel(rs.getString("tel"));
					a.setUser(rs.getString("user"));
					a.setDetail(rs.getString("detail"));
					o.setAdd(a);
					os.add(o);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return os;
	}

}
