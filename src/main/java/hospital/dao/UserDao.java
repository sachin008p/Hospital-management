package hospital.dao;

import hospital.entity.User;

public interface UserDao {
	
	public boolean registerUser(User u);
	
	public User loginUser(String email,String password);
	
	User getUserById(int id);
	
	void updateUser(User user);
	
	int countUserlist();

}
