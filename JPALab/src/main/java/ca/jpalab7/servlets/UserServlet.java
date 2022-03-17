package ca.jpalab7.servlets;


import ca.jpalab7.models.Role;
import ca.jpalab7.models.User;
import ca.jpalab7.services.UserService;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

/**
 *
 * @author neild
 */
public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UserService sv = new UserService();
        
        try{
            List<User> users = sv.getAll();
            
            request.setAttribute("users", users);
            
        }catch(Exception ex){
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", "error");
        }  
        
        String action = request.getParameter("action");
        if (action != null && action.equals("view")) {
            try {
                String email = request.getParameter("email");
                User user = sv.get(email);
                request.setAttribute("selectedEmail", user);
            } catch (Exception ex) {
                Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }       
       }
      getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
    }
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        //HttpSession session = request.getSession();
       
        UserService sv = new UserService();
       
        String action = request.getParameter("action");
        String email = request.getParameter("email");      
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String password = request.getParameter("password"); 
        String roleId = request.getParameter("roleId");
        String roleName = "";
              
        try{
             switch (roleId) {
             case "1":
                 roleName = "system admin";
                 break;
             case "2":
                 roleName = "regular user";
                 break;
             case "3":
                 roleName = "company admin";       
           }
        }catch(Exception e) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, e);
            request.setAttribute("message", "error");
        }
         
        Role role = new Role(Integer.parseInt(roleId), roleName);
        
        try{
             switch (action) {
                case "Create":
                   sv.insert(email, true, firstName, lastName, password, role);
                   break;
                case "Edit":
                   sv.update(email, true, firstName, lastName, password, role);
                    break;
                case "Delete":
                   sv.delete(email);
            }
              request.setAttribute("message", action);
        } catch(Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", "error");
        }
        
      getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);    
    }
    
}
