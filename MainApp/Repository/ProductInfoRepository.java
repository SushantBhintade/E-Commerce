package com.MainApp.Repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.MainApp.Pojo.ProductInfo;

@Repository
public interface ProductInfoRepository extends CrudRepository<ProductInfo, Integer>
{
     List<ProductInfo> findByAname(String aname);
     
     ProductInfo findByIdAndAname(int id, String aname);
     
     List<ProductInfo> findAll();

	List<ProductInfo> findByNameOrCategory(String name, String category);

}
