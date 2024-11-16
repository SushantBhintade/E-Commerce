package com.MainApp.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.MainApp.Pojo.Address;
import com.MainApp.Repository.AddressRepository;

@Service
public class AddressService 
{
	@Autowired
	AddressRepository aRepo;

	public void addAdress(Address add)
	{
		aRepo.save(add);
	}
	
	public List<Address> getAllAddresses()
	{
		return aRepo.findAll();
	}
	
	public void delAddress(int id)
	{
		aRepo.deleteById(id);
	}
	
	public List<Address> getAllAddressesByuname(String name)
	{
		return aRepo.findByUname(name);
	}
}
