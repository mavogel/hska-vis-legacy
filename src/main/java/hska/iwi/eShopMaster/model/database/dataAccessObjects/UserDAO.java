package hska.iwi.eShopMaster.model.database.dataAccessObjects;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import hska.iwi.eShopMaster.model.database.GenericHibernateDAO;
import hska.iwi.eShopMaster.model.database.dataobjects.User;
import hska.iwi.eShopMaster.model.sessionFactory.util.HibernateUtil;

public class UserDAO extends GenericHibernateDAO<User, Integer> {

	public User getUserByUsername(String name) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.getCurrentSession();
		try
		{
			User user = null;
			session.beginTransaction();
            Criteria crit = session.createCriteria(User.class);
            crit.add(Restrictions.eq("username",name));
            List<User> resultList = crit.list();
            if (resultList.size() > 0) {
            	user = (User) crit.list().get(0);
            }
            session.getTransaction().commit();
            return user;
		}
		catch (HibernateException e)
		{
			System.out.println("Hibernate Exception" + e.getMessage());
			session.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}



}
