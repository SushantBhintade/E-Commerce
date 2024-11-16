package com.MainApp.Repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.MainApp.Pojo.BuyProductInfo;

public interface BuyProductInfoRepository extends CrudRepository<BuyProductInfo, Integer>
{
  List<BuyProductInfo> findByUname(String uname);
}
