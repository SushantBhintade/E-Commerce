package com.MainApp.Pojo;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Comments_info")
public class Comments 
{
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  int id;
  @Column
  String pid;
  @Column
  String uname;
  @Column
  String drescription;
  
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getPid() {
	return pid;
}
public void setPid(String pid) {
	this.pid = pid;
}
public String getUname() {
	return uname;
}
public void setUname(String uname) {
	this.uname = uname;
}
public String getDrescription() {
	return drescription;
}
public void setDrescription(String drescription) {
	this.drescription = drescription;
}
  
  
}
