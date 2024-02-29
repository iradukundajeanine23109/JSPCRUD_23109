package com.example.studyw.service;

import com.example.studyw.model.User;

import java.util.List;

public interface UserService {
    public boolean addUser(User user);
    public List<User> getUser();
    public User userById(int id);
    public boolean updateUser(User newUser, int id);
    public boolean deleteUser(Integer id);
//    void deleteUser
}
