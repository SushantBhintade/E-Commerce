package com.MainApp.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.MainApp.Pojo.AdminInfo;
import com.MainApp.Service.AdminInfoService;
import com.MainApp.Service.ProductInfoService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminSignUpLoginLogout {
	@Autowired
	AdminInfoService aService;
	
	@Autowired
	ProductInfoService pService;

	@RequestMapping(value = "/adminSignUp")
	public String processAdminSignUp() {
		return "AdminSignUp";

	}

	@RequestMapping(value = "/adminLogin")
	public String processAdminLogin() {
		return "AdminLogin";

	}

	@RequestMapping(value = "/registeradmin")
	public ModelAndView processRegisterAdmin(@RequestParam("name") String n ,@ModelAttribute AdminInfo adinfo)
	{
		
			String res=aService.insertAdmin(adinfo);
			if(res.equals("added"))
			{
				ModelAndView mv = new ModelAndView("AdminSignUp", "msg", "SignUp successfully Done");
				
				return mv;
			}
			else
			{
				{
					ModelAndView mv = new ModelAndView("AdminSignUp", "msg", "SignUp Failed");
					
					return mv;
				}
			}
	}

	@RequestMapping(value = "/adminlogin")
	public ModelAndView processLoginAdmin(@RequestParam("name") String name, @RequestParam("password") String pass,
			HttpServletRequest req) 
	{
		String res = aService.checkAdmin(name, pass);
		HttpSession s = req.getSession();
		if (res.equals("exist")) 
		{
			ModelAndView mv = new ModelAndView("AdminHome");
			s.setAttribute("acheck", name);
			s.setAttribute("apl",pService.getAllProduct(name));
			return mv;
		} else 
		{
			ModelAndView mv = new ModelAndView("AdminLogin", "msg", "Invalid Credential");
			return mv;
		}

	}

	@RequestMapping(value = "/adminlogout")
	public String processAdminLogout(HttpServletRequest req) 
	{
		HttpSession s = req.getSession();
		s.removeAttribute("acheck");
		return "AdminLogin";

	}
}
