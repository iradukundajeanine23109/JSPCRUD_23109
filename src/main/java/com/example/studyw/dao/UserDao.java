package com.example.studyw.dao;

import com.example.studyw.model.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

public class UserDao {
    Session session = HibernateUtil.getSessionFactory().openSession();

    public boolean addUser(User user  ) {
        Transaction tx = session.beginTransaction();
        session.merge(user);
        tx.commit();
        session.close();
        return true;
    }

    public List<User> findAll() {
        Session session = null;
        List<User> result = new ArrayList<>();
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            result = session.createQuery("from User ").list();
        } catch (HibernateException ex) {
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return result;
    }

//    public boolean deleteUser(User user) {
//        Transaction tx = session.beginTransaction();
//        session.remove(user);
//        tx.commit();
//        session.close();
//        return true;
//    }
    public User userById(int id){
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            String hql = "FROM User WHERE id = :id";
            Query<User> query = session.createQuery(hql, User.class);
            query.setParameter("id", id);

            return query.uniqueResult();
        }
    }
    public boolean deleteUser(Integer id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            User userToDelete = session.get(User.class, id);
            if (userToDelete != null) {
                session.delete(userToDelete);
                tx.commit();
                return true;
            } else {
                return false; // User with given id not found
            }
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }


    public boolean updateUser(int id, User updatedUser) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            User existingUser = session.get(User.class, updatedUser.getId());
            if (existingUser != null) {
                existingUser.setName(updatedUser.getName());
                existingUser.setPassword(updatedUser.getPassword());
                existingUser.setEmail(updatedUser.getEmail());
                existingUser.setSex(updatedUser.getSex());
                existingUser.setCountry(updatedUser.getCountry());
                // Set other fields as needed
                session.update(existingUser);
                tx.commit();
                return true;
            } else {
                return false; // User with given id not found
            }
        } catch (HibernateException ex) {
            ex.printStackTrace();
            return false;
        }
    }

}
