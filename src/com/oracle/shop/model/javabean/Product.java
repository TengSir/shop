package com.oracle.shop.model.javabean;

import java.io.Serializable;
import java.util.Set;

public class Product  implements  Serializable{
	private int id;
	private String name;
	private String brand;
	private String type;
	private String description;
	private String  firstImage;
	private float discount;
	private float basicprice;
	private Set<ProductImage> images;
	private Set<ProductModelType> models;
	public Set<ProductModelType> getModels() {
		return models;
	}
	public void setModels(Set<ProductModelType> models) {
		this.models = models;
	}
	public Set<ProductImage> getImages() {
		return images;
	}
	public void setImages(Set<ProductImage> images) {
		this.images = images;
	}
	public Product(int id, String name, String brand, String type, String description, String firstImage,
			float discount, float basicprice) {
		super();
		this.id = id;
		this.name = name;
		this.brand = brand;
		this.type = type;
		this.description = description;
		this.firstImage = firstImage;
		this.discount = discount;
		this.basicprice = basicprice;
	}
	public float getBasicprice() {
		return basicprice;
	}
	public void setBasicprice(float basicprice) {
		this.basicprice = basicprice;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFirstImage() {
		return firstImage;
	}
	public void setFirstImage(String firstImage) {
		this.firstImage = firstImage;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public Product(int id, String name, String brand, String type, String description, String firstImage,
			float discount) {
		super();
		this.id = id;
		this.name = name;
		this.brand = brand;
		this.type = type;
		this.description = description;
		this.firstImage = firstImage;
		this.discount = discount;
	}
	public Product() {
		super();
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", brand=" + brand + ", type=" + type + ", description="
				+ description + ", firstImage=" + firstImage + ", discount=" + discount + ", basicprice=" + basicprice
				+ "]";
	}
	

}
