package com.example.dao;

import com.example.pojo.User;

public interface UserDao {

    User getUserByUsername(String username);

    void addUser(User user);

}
