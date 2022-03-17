package ca.jpalab7.dataaccess;

import ca.jpalab7.models.Role;
import java.util.*;
import javax.persistence.*; 

/**
 *
 * @author Mark DR
 */
public class RoleDB {
    
      public List<Role> getAll() throws Exception {

        EntityManager em = DBUtil.getEmFactory().createEntityManager();
        
            try {
                Query query = em.createNamedQuery("Role.findAll");
                return query.getResultList();
            } finally {
                em.close();
            }
      }
 }
