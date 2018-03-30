package service.impl;

import dao.UserDao;
import domain.User;
import service.UserService;
import utils.MD5Utils;

public class UserServiceImpl implements UserService {

	private UserDao userdao;
	

	public void setUserdao(UserDao userdao) {
		this.userdao = userdao;
	}

	@Override
	public void saveUser(User user){
		User existU = userdao.getByUsername(user.getUsername());
		if (existU != null) {
			throw new NullPointerException("用户名已经存在");
		}
		user.setU_password(MD5Utils.md5(user.getU_password()));
		userdao.save(user);
	}

	@Override
	public User getUserByUsernameAndPassword(User user) {
		User existU = userdao.getByUsername(user.getUsername());
		if (existU == null) {
			throw new RuntimeException("用户名不存在!");
		}
		// 3 判断用户密码是否正确=>不正确=>抛出异常,提示密码错误
		if (!existU.getU_password().equals(MD5Utils.md5(user.getU_password()))) {
			throw new RuntimeException("密码错误!");
		}
		return existU;
	}

	@Override
	public void setAvatarByUid(String u_id, String file1FileName) {
		userdao.setAvatarByUid(u_id, file1FileName);
		
	}
}
