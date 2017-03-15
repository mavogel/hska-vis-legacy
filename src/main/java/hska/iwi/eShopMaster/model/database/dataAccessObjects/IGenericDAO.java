package hska.iwi.eShopMaster.model.database.dataAccessObjects;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;


/**
 * A generic DAO interface definition. This interface should be extended even if
 * the new interface will add no additional functions.
 * 
 * @author knad0001
 * 
 * @param <E>
 *            The class of the pojo being persisted.
 * @param <PK>
 *            the class of the pojo's id property.
 */
public interface IGenericDAO<E, PK extends Serializable> {
	
	  	/**
	  	 * Get the object with the id specified.
	  	 * 
	  	 * @param id
	  	 *            the id of the instance to retrieve.
	  	 * 
	  	 * @return the instance with the given id.
	  	 */
	    E getObjectById(PK id);
	    
	    
	    
	  	/**
	  	 * Get the object with the name specified, property "name" must exist 
	  	 * 
	  	 * @param name
	  	 *            the name of the instance to retrieve.
	  	 * 
	  	 * @return the instance with the given name.
	  	 */
		E getObjectByName(String name);

		
		/**
		 * Get all instances of this entity that have been persisted.
		 * 
		 * @return  a list of all instances
		 */
		List<E> getObjectList();
	    
	    
		/**
		 * Get all instances that match the properties that are set in the given
		 * object using a standard Query by Example method.
		 * 
		 * @param t
		 *            the example entity
		 * 
		 * @return a list of entities that match the example.
		 */
		List<E> get(E entity);
		
		

		/**
		 * Get all instances of this entity that have been persisted.
		 * 
		 * @param sortOrder asc desc
		 * @param sortProperty
		 * @return a list of all instances, sorted by sortProperty in sortOrder
		 */
		List<E> getSortedList(String sortOrder, String sortProperty);
		
		

		/**
		 * Persist the given entity.
		 * 
		 * @param t
		 *            the entity to persist.
		 */
	      
		void saveObject(E entity);
		
		

		/**
		 * Delete the entity passed. same as remove(t.<idPropertyGetter>())
		 * 
		 * @param entity
		 *            the object to remove.
		 */
		void deleteObject(E entity);
		
		

		/**
		 * Delete the entity passed. same as remove(t.<idPropertyGetter>())
		 * 
		 * @param entity
		 *            the object to remove.
		 */
		void deleteById(PK id);
		
		

		/**
		 * update the entity passed.
		 * 
		 * @param entity
		 *            the object to update.
		 */
		void updateObject(E entity);
		
		
}
