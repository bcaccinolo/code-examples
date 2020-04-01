package net.codejava.hibernate;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class Main {
    static EntityManagerFactory factory;
    static EntityManager entityManager;

    static void initEntityManager() {
        // CONFIGURATION FOR MYSQL
        //Main.factory = Persistence.createEntityManagerFactory("UsersDB");

        // CONFIGURATIO FOR H2 DATABASE
        Main.factory = Persistence.createEntityManagerFactory("H2");

        Main.entityManager = factory.createEntityManager();
    }

    static void closeEntityMananger() {
        Main.entityManager.close();
        Main.factory.close();
    }

    static void createUser(String email, String fullName, String password) {
        entityManager.getTransaction().begin();

        User newUser = new User();
        newUser.setEmail(email);
        newUser.setFullname(fullName);
        newUser.setPassword(password);

        entityManager.persist(newUser);
        entityManager.getTransaction().commit();
    }

    static void updateUserEmail(Integer primaryKey, String email) {
        entityManager.getTransaction().begin();

        User user = entityManager.find(User.class, primaryKey);
        user.setEmail(email);

        entityManager.merge(user);
        entityManager.getTransaction().commit();
    }

    public static void main(String[] args) {
        Main.initEntityManager();

        Main.createUser("benoit@gmail.com", "Benoit C.", "my secret pass");

        // Running this a second time will throw an exception
        // java.sql.SQLIntegrityConstraintViolationException: Duplicate entry
        Main.createUser("benoit@gmail.com", "Benoit C.", "my secret pass");

        // Will throw a NullPointerException
        //  Main.updateUserEmail(13, "new_benoit@gmail.com"); // will fail

        Main.closeEntityMananger();
    }
}
