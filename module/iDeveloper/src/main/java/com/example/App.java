package com.example;

import com.example.bean.Dbuser;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;

import java.util.Date;

/**
 * Created by hengqiangcao on 24/10/16.
 */
public class App {

    public static void main(String[] args) {

        Session session = HibernateUtil.getSessionFactory().openSession();

        session.beginTransaction();
//        Dbuser user = new Dbuser();
//
//        user.setUserId("123");
//        user.setUsername("leioolei");
//        user.setCreatedBy("system");
//        user.setCreatedDate(new Date());
//
//        session.save(user);

        Object[] params = new String[]{"123"};

        String sql = "from Dbuser where userId='123'";

        Query queryS = session.createQuery(sql);



        session.getTransaction().commit();
    }
}
