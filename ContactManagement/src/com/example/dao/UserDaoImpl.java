package com.example.dao;

import com.example.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.pojo.User;


@Repository
public class UserDaoImpl implements UserDao {


    @Autowired
    private UserMapper userMapperw;//这个私有字段用于存储UserMapper的实例，它将被用于执行数据库操作。

    @Override
    public User getUserByUsername(String username) {
        return userMapperw.getUserByUsername(username);
    }
    //实现了接口中定义的getUserByUsername方法。它接受一个String类型的username作为参数，并使用userMapperw的getUserByUsername方法来根据用户名查询用户信息。

    @Override
    public void addUser(User user) {
        userMapperw.addUser(user);
    }
    //实现了接口中定义的addUser方法。它接受一个User对象作为参数，并使用userMapperw的addUser方法将新用户添加到数据库中。
}
