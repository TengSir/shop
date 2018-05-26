package com.oracle.shop.model.javabean;

public class OrderItems {
	private int orderitemId;
	private int count;
	private float discount;
	private String orderid;
	private int productId;
	public int getOrderitemId() {
		return orderitemId;
	}
	public void setOrderitemId(int orderitemId) {
		this.orderitemId = orderitemId;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public OrderItems(int orderitemId, int count, float discount, String orderid, int productId) {
		super();
		this.orderitemId = orderitemId;
		this.count = count;
		this.discount = discount;
		this.orderid = orderid;
		this.productId = productId;
	}
	@Override
	public String toString() {
		return "OrderItems [orderitemId=" + orderitemId + ", count=" + count + ", discount=" + discount + ", orderid="
				+ orderid + ", productId=" + productId + "]";
	}
	public OrderItems() {
		super();
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + count;
		result = prime * result + Float.floatToIntBits(discount);
		result = prime * result + ((orderid == null) ? 0 : orderid.hashCode());
		result = prime * result + orderitemId;
		result = prime * result + productId;
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
		OrderItems other = (OrderItems) obj;
		if (count != other.count)
			return false;
		if (Float.floatToIntBits(discount) != Float.floatToIntBits(other.discount))
			return false;
		if (orderid == null) {
			if (other.orderid != null)
				return false;
		} else if (!orderid.equals(other.orderid))
			return false;
		if (orderitemId != other.orderitemId)
			return false;
		if (productId != other.productId)
			return false;
		return true;
	}
	

}
