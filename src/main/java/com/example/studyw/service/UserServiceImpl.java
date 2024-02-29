package com.example.studyw.service;

import com.example.studyw.dao.UserDao;
import com.example.studyw.model.User;


import java.rmi.RemoteException;
import java.util.List;

public class UserServiceImpl extends RemoteException implements UserService {
    UserDao userDao = new UserDao();
    @Override
    public boolean addUser(User user) {
        return userDao.addUser(user);
    }

    @Override
    public List<User> getUser() {
        return userDao.findAll();
    }

    @Override
    public User userById(int id) {
        return userDao.userById(id);
    }

    @Override
    public boolean updateUser(User newUser, int id) {
        return userDao.updateUser(id, newUser);
    }

    @Override
    public boolean deleteUser(Integer id) {
        return userDao.deleteUser(id);
    }
}
