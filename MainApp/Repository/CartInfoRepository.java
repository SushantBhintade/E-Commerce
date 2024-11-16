package com.MainApp.Repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.MainApp.Pojo.CartInfo;

@Repository
public interface CartInfoRepository extends CrudRepository<CartInfo, Integer>
{
   List<CartInfo> findByUname(String uname);
   
   List<CartInfo> deleteByPidAndUname(int pid, String uname);
}
