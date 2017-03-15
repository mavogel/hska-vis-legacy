package hska.iwi.eShopMaster.model.database.dataAccessObjects;

import java.util.List;

import hska.iwi.eShopMaster.model.database.GenericHibernateDAO;
import hska.iwi.eShopMaster.model.database.dataobjects.Role;
import hska.iwi.eShopMaster.model.sessionFactory.util.HibernateUtil;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

public class RoleDAO extends GenericHibernateDAO<Role, Integer> {
	
	public Role getRoleByLevel(int roleLevel) {
		
		Role role = null;
	    Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try
		{
			session.beginTransaction();
            Criteria crit = session.createCriteria(Role.class);
            crit.add(Restrictions.eq("level",roleLevel));
            List<Role> resultList = crit.list();
            
            if (resultList.size() > 0) {
            	role = resultList.get(0);
            }
            session.getTransaction().commit();
            return role;
		}
		catch (HibernateException e)
		{
			System.out.println("Hibernate Exception" + e.getMessage());
			session.getTransaction().rollback();
			throw new RuntimeException(e);
		}

		

	}

}
