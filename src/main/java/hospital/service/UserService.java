package hospital.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import hospital.dao.UserDao;
import hospital.entity.User;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    @Transactional
    public boolean registerUser(User u) {
        return userDao.registerUser(u);
    }

    public User loginUser(String email, String password) {
        return userDao.loginUser(email, password);
    }

    // Optional method (ONLY if you need it)
    public int countUser() {
        return userDao.countUserlist();
    }
    
    public boolean changPassword(int uid,String oldPassword,String newPassword) {
    	User u = userDao.getUserById(uid);
    	if(u != null && u.getPassword().equals(oldPassword)) {
    	u.setPassword(newPassword);
    	userDao.updateUser(u);
    	return true;
    }
    return false;
    }
}