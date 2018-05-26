package com.oracle.shop.model.javabean;

public class ProductImage {
	private int id;
	private String path;
	private int enable;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getEnable() {
		return enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
	}

	public ProductImage(int id, String path, int enable) {
		super();
		this.id = id;
		this.path = path;
		this.enable = enable;
	}

	@Override
	public String toString() {
		return "ProductImage [id=" + id + ", path=" + path + ", enable=" + enable + "]";
	}

	public ProductImage() {
		super();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + enable;
		result = prime * result + id;
		result = prime * result + ((path == null) ? 0 : path.hashCode());
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
		ProductImage other = (ProductImage) obj;
		if (enable != other.enable)
			return false;
		if (id != other.id)
			return false;
		if (path == null) {
			if (other.path != null)
				return false;
		} else if (!path.equals(other.path))
			return false;
		return true;
	}

}
