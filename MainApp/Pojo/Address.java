package com.MainApp.Pojo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "address_info")
public class Address 
{
   @Id
   @GeneratedValue(strategy = GenerationType.AUTO)	
   int id;
   @Column
   String house;
   @Column
   String street;
   @Column
   String city;
   @Column   String pin;
   @Column
   String uname;
   
public String getUname() {
	return uname;
}
public void setUname(String uname) {
	this.uname = uname;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getHouse() {
	return house;
}
public void setHouse(String house) {
	this.house = house;
}
public String getStreet() {
	return street;
}
public void setStreet(String street) {
	this.street = street;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getPin() {
	return pin;
}
public void setPin(String pin) {
	this.pin = pin;
}
   
   
}
