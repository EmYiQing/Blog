package web.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import domain.User;
import service.UserService;
@SuppressWarnings("all")
public class UserAction extends ActionSupport implements ModelDriven<User> {
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

	public String login() throws Exception {

		checkCode = user.getCheckCode();

		HttpSession session = ServletActionContext.getRequest().getSession();

		String checkCode2 = (String) session.getAttribute("checkCode");

		if (!checkCode.equals(checkCode2)) {
			throw new RuntimeException("输入的验证码不正确，请重新输入！");
		} else {
			User u = userService.getUserByUsernameAndPassword(user);
			session.setAttribute("user", u);
			return "toHome";
		}
	}
	
	public String logout() throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("user");
		return "toLogin";
	} 

	@Override
	public User getModel() {
		return user;
	}

}
