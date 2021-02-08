
/*

   This class for all operations possible between 
   the database and our system
   
   By : DGI | Dwery Group Inc.
*/

package com.dwerty.crud;

import com.dwerty.beans.User;
import com.dwerty.beans.UserSession;


public interface DAO {
    
    void addUser(User user);
    
    void deleteUser(User user);
    
    void updateUser();
    
    int testSessionUser(UserSession usersession);
    
}
