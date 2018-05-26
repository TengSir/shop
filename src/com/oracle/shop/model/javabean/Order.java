package com.oracle.shop.model.javabean;

import java.io.Serializable;
import java.util.Set;

public class Order implements  Serializable{
	private String orderid;
	private String time;
	private int  status;
	private String message;
	private Address  add;
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((add == null) ? 0 : add.hashCode());
		result = prime * result + ((message == null) ? 0 : message.hashCode());
		result = prime * result + ((orderid == null) ? 0 : orderid.hashCode());
		result = prime * result + status;
		result = prime * result + ((time == null) ? 0 : time.hashCode());
		result = prime * result + userid;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Order other = (Order) obj;
		if (add == null) {
			if (other.add != null)
				return false;
		} else if (!add.equals(other.add))
			return false;
		if (message == null) {
			if (other.message != null)
				return false;
		} else if (!message.equals(other.message))
			return false;
		if (orderid == null) {
			if (other.orderid != null)
				return false;
		} else if (!orderid.equals(other.orderid))
			return false;
		if (status != other.status)
			return false;
		if (time == null) {
			if (other.time != null)
				return false;
		} else if (!time.equals(other.time))
			return false;
		if (userid != other.userid)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Order [orderid=" + orderid + ", time=" + time + ", status=" + status + ", message=" + message + ", add="
				+ add + ", userid=" + userid + "]";
	}
	public Order(String orderid, String time, int status, String message, Address add, int userid) {
		super();
		this.orderid = orderid;
		this.time = time;
		this.status = status;
		this.message = message;
		this.add = add;
		this.userid = userid;
	}
	public Order(String orderid, String time, int status, String message, Address add, Set<OrderItems> items,
			int userid) {
		super();
		this.orderid = orderid;
		this.time = time;
		this.status = status;
		this.message = message;
		this.add = add;
		this.items = items;
		this.userid = userid;
	}
	public Address getAdd() {
		return add;
	}
	public void setAdd(Address add) {
		this.add = add;
	}
	private  Set<OrderItems>  items;
	
	
	public Set<OrderItems> getItems() {
		return items;
	}
	public void setItems(Set<OrderItems> items) {
		this.items = items;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	private int userid;
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public Order() {
		super();
	}

}
