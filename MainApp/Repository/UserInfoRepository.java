package com.MainApp.Repository;

import org.springframework.data.repository.CrudRepository;

import com.MainApp.Pojo.UserInfo;

public interface UserInfoRepository extends CrudRepository<UserInfo, String>
{
     UserInfo findByName(String name);
     
     UserInfo findByNameAndPassword(String name, String pass);
}
