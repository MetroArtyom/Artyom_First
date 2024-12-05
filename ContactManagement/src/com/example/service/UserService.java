package com.example.service;

import com.example.pojo.User;



public interface UserService {

    boolean isValidUser(String username, String password);

    User getByUsername(String username);

    void addUser(User user);
}
