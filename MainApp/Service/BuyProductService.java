package com.MainApp.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MainApp.Pojo.BuyProductInfo;
import com.MainApp.Repository.BuyProductInfoRepository;

@Service
public class BuyProductService 
{
	@Autowired
	BuyProductInfoRepository bRepo;
	
	public void addToOrder(BuyProductInfo b)
	{
		bRepo.save(b);
	}

}
