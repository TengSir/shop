package com.oracle.shop.model.javabean;

import java.util.Set;

public class User {
	private int userid;
	private String username;
	private String password;
	private String realname;
	private String sex;
	private int age;
	private String image;
	private boolean status;
	private  Set<Address>  adds;
	public Set<Address> getAdds() {
		return adds;
	}
	public void setAdds(Set<Address> adds) {
		this.adds = adds;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public boolean getStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public User(int userid, String username, String password, String realname, String sex, int age, String image,
			boolean status) {
		super();
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.realname = realname;
		this.sex = sex;
		this.age = age;
		this.image = image;
		this.status = status;
	}
	public User() {
		super();
	}
	@Override
	public String toString() {
		return "User [userid=" + userid + ", username=" + username + ", password=" + password + ", realname=" + realname
				+ ", sex=" + sex + ", age=" + age + ", image=" + image + ", status=" + status + "]";
	}

}
