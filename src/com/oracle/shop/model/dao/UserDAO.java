package com.oracle.shop.model.dao;

import com.oracle.shop.model.javabean.User;

public interface UserDAO extends BaseDAO {
	public User login(String username,String password);
	public User  getUserInfoByUserId(String userid);
	public boolean  checkUsernameExsist(String username);

}
