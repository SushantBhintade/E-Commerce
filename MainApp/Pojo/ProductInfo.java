package com.MainApp.Pojo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="product_info")
public class ProductInfo 
{
   @Id
   @GeneratedValue(strategy = GenerationType.AUTO)
   int id;
   @Column
   String name;
   @Column
   String drescription;
   @Column
   double price;
   @Column
   int quantity;
   @Column
   String category;
   @Column
   String pImagename;
   @Column
   String aname;
   
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
public String getDrescription() {
	return drescription;
}
public void setDrescription(String drescription) {
	this.drescription = drescription;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}

public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public String getpImagename() {
	return pImagename;
}
public void setpImagename(String pImagename) {
	this.pImagename = pImagename;
}
public String getAname() {
	return aname;
}
public void setAname(String aname) {
	this.aname = aname;
}
   
   
}
