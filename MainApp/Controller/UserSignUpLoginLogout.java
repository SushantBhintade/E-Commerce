package com.MainApp.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.MainApp.Pojo.UserInfo;
import com.MainApp.Service.UserInfoService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserSignUpLoginLogout 
{
	@Autowired
    UserInfoService uService;
	
	
	
	@RequestMapping(value = "/userSignUp")
	public String processUserSignUp()
	{
		return "UserSignUp";
		
	}
	
	@RequestMapping(value = "/userLogin")
	public String processUserLogin()
	{
		return "UserLogin";
		
	}
	@RequestMapping(value = "/registeruser")
	public ModelAndView processRegisterUser(@ModelAttribute UserInfo uinfo)
	{
		String res = uService.addUser(uinfo);
		if(res.equals("added"))
		{
			ModelAndView mv = new ModelAndView("UserSignUp", "msg", "Account created successgfully");
			return mv;
		}
		else
		{
			ModelAndView mv = new ModelAndView("UserSignUp", "msg", "Account creation Failed .");
			return mv;			
		}
		
	}
	@RequestMapping(value = "/userlogin")
	public ModelAndView processUserlogin(@RequestParam("name") String name, 
			@RequestParam("password") String pass, HttpServletRequest req)
	{
		String res = uService.checkUser(name, pass);
		if(res.equals("exist"))
		{
			ModelAndView mv = new ModelAndView("UserHome");
			HttpSession s = req.getSession();
			s.setAttribute("ucheck", name);
			s.setAttribute("Allp", uService.getAllProduct());
			return mv;
		}
		else
		{
			ModelAndView mv = new ModelAndView("UserLogin", "msg", "Invalid credentials");
			return mv;
		}
	}
	
	@RequestMapping(value = "/userlogout")
	public String processUserLogout(HttpServletRequest req)
	{
		HttpSession s = req.getSession();
		s.removeAttribute("ucheck");
		return "UserLogin";
	}
	
	
}
