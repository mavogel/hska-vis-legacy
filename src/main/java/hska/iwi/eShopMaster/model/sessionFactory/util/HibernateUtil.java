package hska.iwi.eShopMaster.model.sessionFactory.util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class HibernateUtil {

    private static SessionFactory sessionFactory = null;

//	static {
//		try {
//            // Create the SessionFactory from hibernate.cfg.xml
//			Configuration configuration = new Configuration().configure();
//			StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().
//					applySettings(configuration.getProperties());
//			sessionFactory = configuration.buildSessionFactory(builder.build());
//			System.out.println("Initial SessionFactory creation");
//		} catch (Throwable ex) {
//			System.out.println("Initial SessionFactory creation failed." + ex);
//			throw new ExceptionInInitializerError(ex);
//		}
//	}


    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            StandardServiceRegistry registry = new StandardServiceRegistryBuilder()
                    .configure() // configures settings from hibernate.cfg.xml
                    .build();
            try {
                sessionFactory = new MetadataSources(registry).buildMetadata().buildSessionFactory();
            } catch (Exception e) {
                // The registry would be destroyed by the SessionFactory, but we had trouble building the SessionFactory
                // so destroy it manually.
                StandardServiceRegistryBuilder.destroy(registry);
                throw new RuntimeException(e);
            }
        }
        return sessionFactory;
    }
}
