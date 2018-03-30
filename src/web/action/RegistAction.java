package web.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import domain.User;
import service.UserService;
@SuppressWarnings("all")
public class RegistAction extends ActionSupport implements ModelDriven<User> {

	private User user = new User();
	
	private UserService userService;
	
	private String checkCode;

	public String getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@Override
	public User getModel() {
		
		return user;
	}
	
	public String regist() throws Exception {
		checkCode = user.getCheckCode();

		HttpSession session = ServletActionContext.getRequest().getSession();

		String checkCode2 = (String) session.getAttribute("checkCode");
		if (!checkCode.equals(checkCode2)) {
			throw new RuntimeException("输入的验证码不正确，请重新输入！");
		} else {
			userService.saveUser(user);
			return "toLogin";
		}
	}
	
}
