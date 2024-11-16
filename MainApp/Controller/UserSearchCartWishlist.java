package com.MainApp.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.MainApp.Pojo.Address;
import com.MainApp.Pojo.BuyProductInfo;
import com.MainApp.Pojo.CartInfo;
import com.MainApp.Pojo.Comments;
import com.MainApp.Pojo.ProductInfo;
import com.MainApp.Service.AddressService;
import com.MainApp.Service.BuyProductService;
import com.MainApp.Service.CartInfoService;
import com.MainApp.Service.CommentsService;
import com.MainApp.Service.UserInfoService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Controller
@Transactional
public class UserSearchCartWishlist 
{
	@Autowired
    CartInfoService cService;
	
	@Autowired
	UserInfoService uService;
	
	@Autowired
	AddressService aService;
	
	@Autowired
	BuyProductService bService;
	
	@Autowired
	CommentsService cmService;
	
	@RequestMapping(value = "/searchkeyword")
	public String processSearchkeyword(@RequestParam("searchkeyword") String search
			,HttpServletRequest req)
	{
		List<ProductInfo> allpl = uService.getSearchProduct(search, search);
		HttpSession s = req.getSession();
		s.setAttribute("Allp", allpl);
		return "UserHome";
		
	}
	
	@RequestMapping(value = "/searchremoves")
	public String processSearchremoves(HttpServletRequest req)
	{
		HttpSession s = req.getSession();
		s.setAttribute("Allp", uService.getAllProduct());
		return "UserHome";
	}
	
	@RequestMapping(value = "/getcart")
	public String processGetcart(HttpServletRequest req)
	{
		HttpSession s = req.getSession();
        String uname = (String) s.getAttribute("ucheck");
        s.setAttribute("lci", cService.getcartinfo(uname));
        s.setAttribute("la", aService.getAllAddressesByuname(uname));

        return "cart";
		
	}
	@RequestMapping(value = "/gethome")
	public String processgetUserhome()
	{
		return "UserHome";
		
	}
	
	@RequestMapping(value = "/addtocart")
	public String processAddtocart(@ModelAttribute CartInfo cartinfo)
	{
		cService.addProductToCart(cartinfo);
		return "UserHome";
		
	}
	
	@RequestMapping(value = "/deletecartp")
	public String processRemovecartp(@RequestParam("pid") int pid,
			  @RequestParam("uname") String uname, HttpServletRequest req)
	{
		cService.removeCartinfo(pid, uname);
		HttpSession s = req.getSession();
		s.setAttribute("lci", cService.getcartinfo(uname));
		return "cart";
		
	}
	
	@RequestMapping(value = "getAddress")
	public String processGetAddress(HttpServletRequest req)
	{
		HttpSession s = req.getSession();
		s.setAttribute("ladd", aService.getAllAddresses());

		return "Address";
		
	}
	
	@RequestMapping(value = "/addAddress")
	public String processAddAddress(@ModelAttribute Address add
			,HttpServletRequest req)
	{
		HttpSession s = req.getSession();
		aService.addAdress(add);
		s.setAttribute("ladd", aService.getAllAddresses());
		return "Address";
		
	}
	
	@RequestMapping(value = "/deleteAddress")
	public String processdeleteAddress(@RequestParam ("aid") int id
			,HttpServletRequest req)
	{
		HttpSession s = req.getSession();
		aService.delAddress(id);
		s.setAttribute("ladd", aService.getAllAddresses());
		return "Address";
		
	}
	
	@RequestMapping(value = "/buyproduct")
	public String processBuyproduct(@ModelAttribute BuyProductInfo b
			,HttpServletRequest req)
	{
		bService.addToOrder(b);
		
		cService.removeCartinfo(b.getPid(), b.getUname());
		HttpSession s = req.getSession();
		s.setAttribute("lci", cService.getcartinfo(b.getUname()));
		
		return "cart";
		
	}
	
	@RequestMapping(value = "/comment")
	public String proceessComment(@ModelAttribute Comments uname)
	{
		cmService.AddComment(uname);
		return "Somthing";
		
	}
}
