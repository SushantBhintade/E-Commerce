package com.MainApp.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.MainApp.Pojo.ProductInfo;
import com.MainApp.Service.ProductInfoService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Controller
@Transactional
public class AdminProduct 
{
	@Autowired
	ProductInfoService pService;
	
	@RequestMapping(value = "/addproduct")
	public String processAddProduct(@ModelAttribute ProductInfo pInfo, 
			@RequestParam("file") MultipartFile part,@RequestParam("pid") int pid, HttpServletRequest req) 
	{
		HttpSession s = req.getSession();
		if(pid == 0)
		{
			System.out.println(req.getMethod());
			pService.addProduct(pInfo, part);
			s.setAttribute("apl", pService.getAllProduct(pInfo.getAname()));
			return "AdminHome";
		}
		else
		{
			
			pInfo.setId(pid);
			
			String pin=pService.getProduct(pid, pInfo.getAname()).getpImagename();
		
			pInfo.setpImagename(pin);
			pService.addProduct(pInfo, part);

			s.setAttribute("apl", pService.getAllProduct(pInfo.getAname()));
			return "AdminHome";
		}
		
	}
	@RequestMapping(value="/deleteproduct")
	 public String processDeleteProduct(@RequestParam("pid") int id,
			    @RequestParam("aname") String aname, HttpServletRequest req)
	   {
		   HttpSession s = req.getSession();
		   pService.deleteProduct(id);
		   s.setAttribute("apl", pService.getAllProduct(aname));
		return "AdminHome";
		   
	   }
	@RequestMapping(value = "/updateproduct")
	public ModelAndView processUpdateProduct(@RequestParam("pid") int id,
			@RequestParam("aname") String aname,HttpServletRequest req)
	{
		ModelAndView mv = new ModelAndView("AdminHome");
		ProductInfo p = pService.getProduct(id, aname);
		mv.addObject("p", p);
		return mv;
	}
}
