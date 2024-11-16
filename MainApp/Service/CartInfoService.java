package com.MainApp.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MainApp.Pojo.CartInfo;
import com.MainApp.Repository.CartInfoRepository;

@Service
public class CartInfoService 
{
	@Autowired
	CartInfoRepository cRepo;
	
   public void addProductToCart(CartInfo carti)
   {
	   cRepo.save(carti);
   }
   
   public List<CartInfo> getcartinfo(String uname)
   {
	   return cRepo.findByUname(uname);
   }
   
   public void removeCartinfo(int pid, String uname)
   {
	   cRepo.deleteByPidAndUname(pid, uname);
   }
}
