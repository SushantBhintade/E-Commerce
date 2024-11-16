package com.MainApp.Repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.MainApp.Pojo.Address;

@Repository
public interface AddressRepository extends CrudRepository<Address, Integer>
{
   List<Address> findAll();
   
   List<Address> findByUname(String uname);
}
