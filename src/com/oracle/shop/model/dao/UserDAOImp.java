package com.oracle.shop.model.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

import com.oracle.shop.model.javabean.Address;
import com.oracle.shop.model.javabean.User;
public class UserDAOImp extends BaseDAOImp implements UserDAO {

	@Override
	public boolean add(Object obj) {
		Connection  c=getConnection();
		User regiserUser=(User)obj;
		PreparedStatement  pre=null;
		try {
			pre=c.prepareStatement("insert into users(username,password,realname,sex,age,image,status)   values(?,?,?,?,?,?,?)");
			pre.setString(1, regiserUser.getUsername());
			pre.setString(2, regiserUser.getPassword());
			pre.setString(3, regiserUser.getRealname());
			pre.setBoolean(4, regiserUser.getSex().equals("1")?true:false);
			pre.setInt(5, regiserUser.getAge());
			pre.setString(6, regiserUser.getImage());
			pre.setBoolean(7, regiserUser.getStatus());
			int n=pre.executeUpdate();
			return n>0?true:false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disposeResource(c, pre);
		return false;
	}

	@Override
	public boolean delete(Object obj) {
		return false;
	}

	@Override
	public boolean update(Object obj) {
		User user=(User)obj;
		Connection  con=null;
		PreparedStatement  pre=null;
		try {
			con=getConnection();
			pre=con.prepareStatement("update users set  username=?,password=?,realname=?,sex=?,age=?,image=? where userid=?");
			pre.setString(1, user.getUsername());
			pre.setString(2, user.getPassword());
			pre.setString(3, user.getRealname());
			pre.setInt(4, Integer.parseInt(user.getSex()));
			pre.setInt(5, user.getAge());
			pre.setString(6, user.getImage());
			pre.setInt(7, user.getUserid());
			
			return pre.executeUpdate()>0?true:false;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public Object listAll() {
		return null;
	}
	@Override
	public User login(String username, String password) {
		User user=null;
		Connection  c=getConnection();
		PreparedStatement  pre=null;
		ResultSet  rs=null;
		try {
			pre=c.prepareStatement("select *  from users where username=? and password=?");
			pre.setString(1, username);
			pre.setString(2, password);
			rs=pre.executeQuery();
			if(rs.next()){
				user=new User();
				user.setUserid(rs.getInt("userid"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setRealname(rs.getString("realname"));
				user.setAge(rs.getInt("age"));
				user.setSex(rs.getBoolean("sex")?"1":"0");
				user.setImage(rs.getString("image"));
				user.setStatus(rs.getBoolean("status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disposeResource(c, pre, rs);
		return user;
	}

	@Override
	public User getUserInfoByUserId(String userid) {
		User user=null;
		Connection  c=getConnection();
		PreparedStatement  pre=null;
		ResultSet  rs=null;
		Set<Address>  adds=null;
		try {
			pre=c.prepareStatement("select u.*,a.* from users as u left   join  address as a  on a.userid=u.userid and  u.userid=?");
			pre.setInt(1, Integer.parseInt(userid));
			rs=pre.executeQuery();
			while(rs.next()){
				if(user==null)
				{adds=new HashSet<>();
				user=new User();
				user.setUserid(rs.getInt("userid"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setRealname(rs.getString("realname"));
				user.setAge(rs.getInt("age"));
				user.setSex(rs.getBoolean("sex")?"1":"0");
				user.setImage(rs.getString("image"));
				user.setStatus(rs.getBoolean("status"));}
				Address a=new Address();
				a.setAddressId(rs.getInt("addressid"));
				a.setProvince(rs.getString("province"));
				a.setCity(rs.getString("city"));
				a.setArea(rs.getString("area"));
				a.setStreet(rs.getString("street"));
				a.setDetail(rs.getString("detail"));
				a.setTel(rs.getString("tel"));
				a.setUser(rs.getString("user"));
				adds.add(a);
			}
			user.setAdds(adds);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		disposeResource(c, pre, rs);
		return user;
	}

	@Override
	public boolean checkUsernameExsist(String username) {
		Connection  c=getConnection();
		PreparedStatement  pre=null;
		try {
			pre=c.prepareStatement("select *  from  users where username=?");
			pre.setString(1, username);
			ResultSet n=pre.executeQuery();
			if(n.next())return true;
			else return false;
		} catch (SQLException e) {
			e.printStackTrace();
			disposeResource(c, pre);
			return false;
		}
	}

}
