package sit.int202.classicmodels.repositories;

import jakarta.persistence.EntityManager;
import jakarta.validation.ConstraintViolationException;
import sit.int202.classicmodels.entities.Office;

import java.util.List;

public class OfficeRepository {

    // Existing code...
    private EntityManager entityManager;

    private EntityManager getEntityManager() {
        if
        (entityManager == null || !entityManager.isOpen()) {
            entityManager = EntityManagerBuilder.getEntityManager();
        }
        return entityManager;
    }

    public List findAll() {
        return getEntityManager().createQuery
                (
                        "select o from Office o").getResultList();
    }
    public void close() {
        if (entityManager != null && entityManager.isOpen()) {
            entityManager.close();
        }
    }


    public boolean insert(Office office) {
        EntityManager entityManager = getEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(office);
            entityManager.getTransaction().commit();
            return true;
        } catch (Exception e) {
            // Print the exception to the console for debugging
            e.printStackTrace();

            // Check for specific exceptions and handle them accordingly
            if (e.getCause() instanceof ConstraintViolationException) {
                throw new RuntimeException("Duplicate office code. Please use a unique office code.");
            } else {
                throw new RuntimeException("Error during office insertion: " + e.getMessage());
            }
        } finally {
            entityManager.close();
        }
    }

    // Delete office by object
    public boolean delete(Office office) {
        if (office != null) {
            EntityManager entityManager = getEntityManager();
            if (entityManager.contains(office)) {
                entityManager.getTransaction().begin();
                entityManager.remove(office);
                entityManager.getTransaction().commit();
                return true;
            } else {
                return delete(office.getOfficeCode());
            }
        }
        return false;
    }
    // Find office by officeCode
    public Office find(String officeCode) {
        return getEntityManager().find(Office.class, officeCode);
    }
    // Delete office by officeCode
    public boolean delete(String officeCode) {
        EntityManager entityManager = getEntityManager();
        Office office = find(officeCode);
        if (office != null) {
            entityManager.getTransaction().begin();
            entityManager.remove(office);
            entityManager.getTransaction().commit();
            return true;
        }
        return false;
    }

    // Update office
    public boolean update(Office newOffice) {
        if (newOffice != null) {
            EntityManager entityManager = getEntityManager();
            Office office = find(newOffice.getOfficeCode());
            if (office != null) {
                entityManager.getTransaction().begin();
                // Set all attributes of the office with newOffice
                office.setCity(newOffice.getCity());
                office.setCountry(newOffice.getCountry());
                // Set other attributes as needed
                entityManager.getTransaction().commit();
                return true;
            }
        }
        return false;
    }

    // Find offices by city and country
    public List<Office> findByCityAndCountry(String city, String country) {
        return getEntityManager().createQuery(
                        "select o from Office o where o.city = :city and o.country = :country", Office.class)
                .setParameter("city", city)
                .setParameter("country", country)
                .getResultList();
    }
}
