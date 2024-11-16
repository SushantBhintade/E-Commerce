package com.MainApp.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MainApp.Pojo.ProductInfo;
import com.MainApp.Pojo.UserInfo;
import com.MainApp.Repository.ProductInfoRepository;
import com.MainApp.Repository.UserInfoRepository;

@Service
public class UserInfoService 
{
	@Autowired
    UserInfoRepository uRepo;
	
	@Autowired
	ProductInfoRepository pRepo;
    
    String result="";
    
    public String addUser(UserInfo user)
    {
    	UserInfo u = uRepo.findByName(user.getName());
    	
    	if(u==null)
    	{
    		uRepo.save(user);
    		result="added";
    	}
    	else
    	{
    		result = "failed";
    	}
    	
		return result;
    	
    }
    
    public String checkUser(String name, String pass)
    {
    	UserInfo u = uRepo.findByNameAndPassword(name, pass);
    	if(u != null)
    	{
    		result="exist";
    	}
    	else
    	{
    		result="failed";
    	}
    	
		return result;
    	
    }
    
    public List<ProductInfo> getAllProduct()
    {
		return pRepo.findAll();
    	
    }

	public List<ProductInfo> getSearchProduct(String name, String category) 
	{
		return pRepo.findByNameOrCategory(name,category);
	}
    
}
