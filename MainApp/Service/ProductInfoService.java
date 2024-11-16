package com.MainApp.Service;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

import org.hibernate.boot.registry.BootstrapServiceRegistry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.MainApp.Pojo.ProductInfo;
import com.MainApp.Repository.ProductInfoRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class ProductInfoService 
{
	@Autowired
   ProductInfoRepository pRepo;
   
   public void addProduct(ProductInfo pinfo, MultipartFile p)
   {
	   String pImageName = p.getOriginalFilename();
	   if(!p.getOriginalFilename().equals(""))
	   {
	      pinfo.setpImagename(pImageName);
	   }
	   System.out.println(p.getOriginalFilename());
	   pRepo.save(pinfo);
	   try
	   {
		   InputStream is = p.getInputStream();
		   byte[] b = is.readAllBytes();
		   
		   String path="C:\\Users\\Sushant Bhintade\\Desktop\\ADV_Java\\Springboot_Eclipse\\e-com\\src\\main\\webapp\\ProductImages\\"+pImageName;
		   
		   FileOutputStream fos = new FileOutputStream(path);
		   
		  fos.write(b);
		  
	   }
	   catch(Exception e)
	   {
		   System.out.println(e);
	   }
   }
   
   public List<ProductInfo> getAllProduct(String aname)
   {
	return pRepo.findByAname(aname);
	   
   }
   public void deleteProduct(int id)
   {
	   pRepo.deleteById(id);
   }
   public ProductInfo getProduct(int pid, String aname)
   {
	return pRepo.findByIdAndAname(pid, aname);
	   
   }
   
   
}
