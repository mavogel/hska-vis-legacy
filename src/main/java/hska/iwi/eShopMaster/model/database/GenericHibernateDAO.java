package hska.iwi.eShopMaster.model.database;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.apache.logging.log4j.*;
//import org.apache.logging.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import hska.iwi.eShopMaster.model.database.dataAccessObjects.IGenericDAO;
import hska.iwi.eShopMaster.model.sessionFactory.util.HibernateUtil;


public  class GenericHibernateDAO<E, PK extends Serializable> implements IGenericDAO<E, PK> {

	
	/**
	 * The class of the pojo being persisted.
	 */
	protected Class<E> entityClass;
	 
//	private static Logger log = Logger.class(GenericHibernateDAO.class);
 //   private static final Logger log = LogManager.getLogger("GenericHibernateDAO");

	
		@SuppressWarnings("unchecked")
		protected GenericHibernateDAO() {
//			ParameterizedType genericSuperclass = (ParameterizedType) getClass().getGenericSuperclass();
//			this.entityClass = (Class<E>) genericSuperclass.getActualTypeArguments()[1];
			final Type thisType = getClass().getGenericSuperclass();
			final Type type;
			if (thisType instanceof ParameterizedType) {
				type = ((ParameterizedType) thisType).getActualTypeArguments()[0];
			} else if (thisType instanceof Class) {
				type = ((ParameterizedType) ((Class) thisType).getGenericSuperclass()).getActualTypeArguments()[0];
			} else {
				throw new IllegalArgumentException("Problem handling type construction for " + getClass());
			}
			
			if (type instanceof Class) {
				this.entityClass = (Class<E>) type;
			} else if (type instanceof ParameterizedType) {
				this.entityClass = (Class<E>) ((ParameterizedType) type).getRawType();
			} else {
				throw new IllegalArgumentException("Problem determining the class of the generic for " + getClass());
			}
	 
		}
	 
		public void saveObject(E entity) { 		
		    Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	 		try
			{
				session.beginTransaction();
				session.save(entity);
	            session.getTransaction().commit();
			}
			catch (HibernateException e)
			{
				//log.error("Hibernate Exception" + e.getMessage());
				session.getTransaction().rollback();
				throw new RuntimeException(e);
			}

		}
	 
		@SuppressWarnings("unchecked")
		public E getObjectById(PK id) {
					
		    Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		    
		    session.beginTransaction();

		    E entity = (E) session.get(entityClass, id);
		    session.getTransaction().commit();
		    return (E) entity;
		}

		
		@SuppressWarnings("unchecked")
		public E getObjectByName(String name) {
		    Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			try
			{
				E entity = null;
				session.beginTransaction();
	            Criteria crit = session.createCriteria(entityClass);
	            crit.add(Restrictions.eq("name",name));
	            List<E> resultList = crit.list();
	            if (resultList.size() > 0) {
	            	entity = (E) crit.list().get(0);
	            }
	            session.getTransaction().commit();
	            return entity;
			}
			catch (HibernateException e)
			{
				//log.error("Hibernate Exception" + e.getMessage());
				session.getTransaction().rollback();
				throw new RuntimeException(e);
			}
		}
	

		public void deleteObject(E entity) {
		    Session session = HibernateUtil.getSessionFactory().getCurrentSession();

			try
			{
				session.beginTransaction();
				session.delete(entity);
				session.getTransaction().commit();
			}
			catch (HibernateException e)
			{
				//log.error("Hibernate Exception" + e.getMessage());
				session.getTransaction().rollback();
				throw new RuntimeException(e);
			}
	 
		}
	 
		
		public void deleteById(PK id) {
			    Session session = HibernateUtil.getSessionFactory().getCurrentSession();

				try
				{
					session.beginTransaction();
				    E entity = (E) session.get(entityClass, id);
					session.delete(entity);
					session.getTransaction().commit();
				}
				catch (HibernateException e)
				{
					//log.error("Hibernate Exception" + e.getMessage());
					session.getTransaction().rollback();
					throw new RuntimeException(e);
				}
		 
			
		}


		@SuppressWarnings("unchecked")
		public List<E> get(E entity) {
		    Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		    try
		    {
		    
		    session.beginTransaction();
		    Criteria crit = session.createCriteria(entityClass);
		    crit.add(Restrictions.idEq(entity));
		    List <E> resultList = crit.list();
		    session.getTransaction().commit();
			return resultList;
		    }
			catch (HibernateException e)
			{
				//log.error("Hibernate Exception" + e.getMessage());
				session.getTransaction().rollback();
				throw new RuntimeException(e);
			}
		}

		
		@SuppressWarnings("unchecked")
		public List<E> getObjectList() {
		    Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		    
			try
			{		
				session.beginTransaction();
				
				Criteria crit = session.createCriteria(entityClass);
	            List<E> resultList = crit.list();
	            session.getTransaction().commit();
				return resultList;
			}
			catch (HibernateException e)
			{
				//log.error("Hibernate Exception" + e.getMessage());
				session.getTransaction().rollback();
				throw new RuntimeException(e);
			}

		}


		
		@SuppressWarnings("unchecked")
		public List<E> getSortedList(String sortOrder, String sortProperty) {
		    Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		    
			try
			{		
				session.beginTransaction();
				
				Criteria crit = session.createCriteria(entityClass);
				if (!sortProperty.equals("")){
					if (sortOrder.equals("asc")){
					crit.addOrder(Order.asc(sortProperty));
					}
					else if (sortOrder.equals("desc")){
						crit.addOrder(Order.desc(sortProperty));
						}
				}
	            List<E> resultList = crit.list();
	            session.getTransaction().commit();
				return resultList;
			}
			catch (HibernateException e)
			{
				//log.error("Hibernate Exception" + e.getMessage());
				session.getTransaction().rollback();
				throw new RuntimeException(e);
			}

		}

		public void updateObject(E entity) {
		    Session session = HibernateUtil.getSessionFactory().getCurrentSession();

			try
			{
				session.beginTransaction();
				session.update(entity);
				session.getTransaction().commit();
			}
			catch (HibernateException e)
			{
				//log.error("Hibernate Exception" + e.getMessage());
				session.getTransaction().rollback();
				throw new RuntimeException(e);
			}
		}



}
