package com.dwirty.gestion;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;


public class HibernateUtil {
    private static StandardServiceRegistry registry;
    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            try {
                // Create registry
                StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder()
                        .configure("hibernate.cfg.xml");
                applyEnvironmentSetting(builder, "DB_URL", "hibernate.connection.url");
                applyEnvironmentSetting(builder, "DB_USERNAME", "hibernate.connection.username");
                applyEnvironmentSetting(builder, "DB_PASSWORD", "hibernate.connection.password");
                applyEnvironmentSetting(builder, "DB_DIALECT", "hibernate.dialect");
                registry = builder.build();
                // Create MetadataSources
                MetadataSources sources = new MetadataSources(registry);
                // Create Metadata
                Metadata metadata = sources.getMetadataBuilder().build();
                // Create SessionFactory
                sessionFactory = metadata.getSessionFactoryBuilder().build();
            } catch (Exception e) {
                e.printStackTrace();
                if (registry != null) {
                    StandardServiceRegistryBuilder.destroy(registry);
                }
            }
        }
        return sessionFactory;
    }

    private static void applyEnvironmentSetting(StandardServiceRegistryBuilder builder,
                                                String environmentName, String settingName) {
        String value = System.getenv(environmentName);
        if (value != null && !value.isEmpty()) {
            builder.applySetting(settingName, value);
        }
    }

    public static void shutdown() {
        if (registry != null) {
            StandardServiceRegistryBuilder.destroy(registry);
        }
    }
}
