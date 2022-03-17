<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Manager Web App</title>
        
        <!--Bootstrap CSS and JS reference links-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        
    </head>
    <body class="bg-secondary">
        <h1 class="text-center text-white py-2">Mark's User Management System</h1>
        
        <p class="text-center">
        <c:if test="${message eq 'Create'}"><strong>User Added</strong></c:if>
        <c:if test="${message eq 'Edit'}"><strong>User Edited</strong></c:if>
             <c:if test="${message eq 'Delete'}"><strong>User Deleted</strong></c:if>
             <c:if test="${message eq 'error'}">Sorry, something went wrong on our side.</c:if>
        </p>
        
        <div class="container me-6">  
            <div class="row px-3 ">
               
             
                 <!-- Column Add  user -->  
                <div class="col">
                    <h5 class="text-white bg-dark">Add User</h5>
                     <form action="users" method="post" >
                         <div class="form-floating mb-1">
                             <input type="email"    name="email"  class="form-control form-control-sm" id="floatingInput" placeholder="Email" required><br /> 
                             <label for="floatingInput">Email</label>
                         </div>
                         
                         <div class="form-floating mb-1">
                             <input type="text"     name="firstName" class="form-control form-control-sm" placeholder="Firstname" id="floatingfirstName" required><br /> 
                             <label for="floatingfirstName">First Name</label>
                         </div>
                         
                         <div class="form-floating mb-1">
                             <input type="text" name="lastName" class="form-control form-control-sm" placeholder="floatinglastName" id="floatinglastName"  required><br />  
                             <label for="floatinglastName">Last Name</label>
                         </div>
                         
                         <div class="form-floating mb-1">
                             <input type="password" name="password"  class="form-control form-control-sm" placeholder="Password" id="floatingPassword"  required ><br /> 
                             <label for="floatingPassword">Password</label>
                         </div>
                         
                        
                         <select name="roleId" class="form-select form-select-md mb-1">
                             <option value ="1">1-system admin</option>
                             <option value ="2">2-regular user</option>
                             <option value ="3">3-company admin</option>
                         </select><br /> 
                         
                         <input type="submit"  value="Create" name="action">
                         <a href="users" class="link-dark text-decoration-none text-white bg-dark p-2">Back to Main</a>
                     </form>
                
                </div>
                          
                 <div class="col-7">
                      <h5 class="text-center text-white bg-dark">Users list</h5> 
                        <table class ="table table-striped ">
                    <thead>
                        <tr class="table-light">
                            <th>E-mail</th>
                            <th>First name</th>
                            <th>Last name</th>
                            <th>Active</th>
                            <th>Role</th>
                            <th>Edit</th>
                       
                        </tr>
                    </thead>

                    
                    <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr class="table-dark ">
                               
                             <td>${user.email}</td>
                             <td>${user.firstName}</td>
                             <td>${user.lastName}</td>
                             <td>${user.active ? "Y" : "N"}</td>
                             <td>${user.role}</td>
                             <td><a href= "users?action=view&amp;email=${user.email.replace("+","%2B")}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 15 14">
                                 <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                 <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                             </svg></a> </td>
       
                            </tr>
                        </c:forEach>
                    </tbody>     
                </table>
                     
                </div> <!--End of 2nd column for displaying user-->
          
                
                <div class="col">
                      <h5 class="text-white bg-dark">Edit/Delete User</h5> 
                    <!--Edit and Delete user --> 
                     <form action="users" method="post">
                          <div class="form-floating mb-1">
                             <input type="email"  name="email" class="form-control"  placeholder="Email"  value="${selectedEmail.email}" id="floatingeEmail" required><br />
                             <label for="floatingeEmail">Email</label>
                         </div>
                             
                          <div class="form-floating mb-1">
                               <input type="text"  name="firstName" class="form-control form-control-sm"  placeholder="Firstname"  value="${selectedEmail.firstName}" id="floatingefirstName" required><br /> 
                             <label for="floatingefirstName">First Name</label>
                         </div>
                       
                          <div class="form-floating mb-1">
                               <input type="text"  name="lastName" class="form-control form-control-sm"  placeholder="lastName"  value="${selectedEmail.lastName}" id="floatinglLastName" required><br /> 
                             <label for="floatinglLastName">Last Name</label>
                         </div>
                             
                          <div class="form-floating mb-1">
                                <input type="password" name="password"  class="form-control form-control-sm"  placeholder="Password" value="${selectedEmail.password}" id="floatingpPassword" required><br /> 
                             <label for="floatingpPassword">Password </label>
                         </div>
                       
                         <select name="roleId" class="form-select form-select-md mb-1">
                             <option value ="1">1-system admin</option>
                             <option value ="2">2-regular user</option>
                             <option value ="3">3-company admin</option>
                         </select><br /> 
                         
                         <input type="submit"  value="Edit" name="action">
                           <input type="submit" value="Delete" name="action">
                     </form>
           
                </div> <!--End tag of 3rd column-->             
            </div>
        </div>   <!--End of container tag -->
    </body> <!--End of body tag-->
</html> <!--End of html tag-->
