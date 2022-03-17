package ca.jpalab7.services;

import ca.jpalab7.dataaccess.RoleDB;
import ca.jpalab7.models.Role;
import java.util.List;

/**
 *
 * @author neild
 */
public class RoleService {
    private RoleDB roleDB = new RoleDB();
    
    public List<Role> getAll() throws Exception {
        List<Role> roles = this.roleDB.getAll();
        
        return roles;
    }
}
