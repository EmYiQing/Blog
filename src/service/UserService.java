package service;

import domain.User;

public interface UserService {


	void saveUser(User user);

	User getUserByUsernameAndPassword(User user);

	void setAvatarByUid(String u_id, String file1FileName);

}
