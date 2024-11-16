package com.MainApp.Pojo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table
public class BuyProductInfo 
{
   @Id
   @GeneratedValue(strategy = GenerationType.AUTO)
   int id;
   @Column
   int Quantity;
   @Column
   int pid;
   @Column
   String uname;
   @Column
   String aname;
   @Column
   int aid;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getQuantity() {
	return Quantity;
}
public void setQuantity(int quantity) {
	Quantity = quantity;
}
public int getPid() {
	return pid;
}
public void setPid(int pid) {
	this.pid = pid;
}
public String getUname() {
	return uname;
}
public void setUname(String uname) {
	this.uname = uname;
}
public String getAname() {
	return aname;
}
public void setAname(String aname) {
	this.aname = aname;
}
public int getAid() {
	return aid;
}
public void setAid(int aid) {
	this.aid = aid;
}
   
   
}
