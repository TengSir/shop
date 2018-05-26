package com.oracle.shop.model.javabean;

public class ProductModelType {
	private int id;
	private String size;
	private String color;
	private float price;
	private int counts;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getCounts() {
		return counts;
	}
	public void setCounts(int counts) {
		this.counts = counts;
	}
	public ProductModelType(int id, String size, String color, float price, int counts) {
		super();
		this.id = id;
		this.size = size;
		this.color = color;
		this.price = price;
		this.counts = counts;
	}
	public ProductModelType() {
		super();
	}
	@Override
	public String toString() {
		return "ProductModelType [id=" + id + ", size=" + size + ", color=" + color + ", price=" + price + ", counts="
				+ counts + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((color == null) ? 0 : color.hashCode());
		result = prime * result + counts;
		result = prime * result + id;
		result = prime * result + Float.floatToIntBits(price);
		result = prime * result + ((size == null) ? 0 : size.hashCode());
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
		ProductModelType other = (ProductModelType) obj;
		if (color == null) {
			if (other.color != null)
				return false;
		} else if (!color.equals(other.color))
			return false;
		if (counts != other.counts)
			return false;
		if (id != other.id)
			return false;
		if (Float.floatToIntBits(price) != Float.floatToIntBits(other.price))
			return false;
		if (size == null) {
			if (other.size != null)
				return false;
		} else if (!size.equals(other.size))
			return false;
		return true;
	}

}
