package test;

import java.util.Date;
import org.hibernate.Session;
import com.example.HibernateUtil;
import com.example.bean.Dbuser;

/**
 * Created by hengqiangcao on 24/10/16.
 */
public class App {

    public static void main(String[] args) {

        Session session = HibernateUtil.getSessionFactory().openSession();

        session.beginTransaction();
        Dbuser user = new Dbuser();

        user.setUserId("123");
        user.setUsername("leioolei");
        user.setCreatedBy("system");
        user.setCreatedDate(new Date());

        session.save(user);
        session.getTransaction().commit();
    }
}
