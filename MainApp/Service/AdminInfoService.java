package com.MainApp.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MainApp.Pojo.AdminInfo;
import com.MainApp.Repository.AdminInfoRepository;

@Service
public class AdminInfoService 
{
  @Autowired
  AdminInfoRepository aRepo;
  
  String result="";
  
  public String insertAdmin(AdminInfo ainfo)
  {
	  AdminInfo admin = aRepo.findByName(ainfo.getName());
	  if(admin == null)
	  {
		  aRepo.save(ainfo);
		  result="added";
	  }
	  else
	  {
		  result="failed";
	  }
	return result;
	  
  }
  
  public String checkAdmin(String name, String pass)
  {
	  AdminInfo admin = aRepo.findByNameAndPassword(name, pass);
	  
	  if(admin!=null)
	  {
		  result="exist";
	  }
	  else
	  {
		  result="not exist";
	  }
	  return result;
  }
}
