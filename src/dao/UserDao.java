package dao;

import domain.User;

public interface UserDao {

	User getByUsername(String username);

	void save(User user);

	void setAvatarByUid(String u_id, String file1FileName);

}
