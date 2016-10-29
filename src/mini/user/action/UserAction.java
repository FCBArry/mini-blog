package mini.user.action;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import mini.user.domain.User;
import mini.user.service.UserService;
import mini.user.service.exception.UserException;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User> {
	@Resource
	private UserService userService;

	// 模型驱动使用的对象
	private User user = new User();

	@Override
	public User getModel() {
		return user;
	}
	
	public String quit() {
		//销毁session
		ServletActionContext.getRequest().getSession().invalidate();
		return "login";
	}
	
	public String login() throws UnsupportedEncodingException {
		Map<String, String> errors = validateLogin(user, ServletActionContext
				.getRequest().getSession());
		if (errors.size() > 0) {
			ServletActionContext.getRequest().setAttribute("form", user);
			ServletActionContext.getRequest().setAttribute("errors", errors);
			return "login";
		}

		User muser = userService.login(user);

		if (muser == null) {
			ServletActionContext.getRequest().setAttribute("msg", "用户名或密码错误！");
			ServletActionContext.getRequest().setAttribute("form", user);
			return "login";
		} else {
			if (!muser.isStatus()) {
				ServletActionContext.getRequest()
						.setAttribute("msg", "您还没有激活！");
				ServletActionContext.getRequest().setAttribute("form", user);
				return "login";
			} else {
				// 保存用户到session
				ServletActionContext.getRequest().getSession()
						.setAttribute("sessionUser", muser);
				// 获取用户名保存到cookie中
				String loginname = user.getUsername();
				loginname = URLEncoder.encode(loginname, "utf-8");
				Cookie cookie = new Cookie("username", loginname);
				cookie.setMaxAge(60 * 60 * 24 * 10);// 保存10天
				ServletActionContext.getResponse().addCookie(cookie);
				return "index";
			}
		}
	}

	private Map<String, String> validateLogin(User formUser, HttpSession session) {
		Map<String, String> errors = new HashMap<String, String>();

		String loginname = formUser.getUsername();
		if (loginname == null || loginname.trim().isEmpty()) {
			errors.put("username", "用户名不能为空！");
		} else if (loginname.length() < 3 || loginname.length() > 20) {
			errors.put("username", "用户名长度必须在3~20之间！");
		}

		String loginpass = formUser.getPassword();
		if (loginpass == null || loginpass.trim().isEmpty()) {
			errors.put("password", "密码不能为空！");
		} else if (loginpass.length() < 3 || loginpass.length() > 20) {
			errors.put("password", "密码长度必须在3~20之间！");
		}

		return errors;
	}

	public String activation() {
		String code = ServletActionContext.getRequest().getParameter(
				"activationCode");
		try {
			userService.activatioin(code);
			ServletActionContext.getRequest().setAttribute("msg",
					"恭喜，激活成功，请马上登录！");
		} catch (UserException e) {
			// 说明service抛出了异常
			ServletActionContext.getRequest().setAttribute("msg",
					e.getMessage());
		}
		return "login";
	}

	public String regist() {
		Map<String, String> errors = validateRegist(user, ServletActionContext
				.getRequest().getSession());

		if (errors.size() > 0) {
			ServletActionContext.getRequest().setAttribute("form", user);
			ServletActionContext.getRequest().setAttribute("errors", errors);
			return "regist";
		}

		userService.regist(user);
		ServletActionContext.getRequest().setAttribute("msg", "注册成功，请马上到邮箱激活！");
		return "login";
	}

	private Map<String, String> validateRegist(User formUser,
			HttpSession session) {
		Map<String, String> errors = new HashMap<String, String>();

		String loginname = formUser.getUsername();
		if (loginname == null || loginname.trim().isEmpty()) {
			errors.put("username", "用户名不能为空！");
		} else if (loginname.length() < 3 || loginname.length() > 20) {
			errors.put("username", "用户名长度必须在3~20之间！");
		} else if (!userService.ajaxValidateLoginname(loginname)) {
			errors.put("username", "用户名已被注册！");
		}

		String loginpass = formUser.getPassword();
		if (loginpass == null || loginpass.trim().isEmpty()) {
			errors.put("password", "密码不能为空！");
		} else if (loginpass.length() < 3 || loginpass.length() > 20) {
			errors.put("password", "密码长度必须在3~20之间！");
		}

		String email = formUser.getEmail();
		if (email == null || email.trim().isEmpty()) {
			errors.put("email", "Email不能为空！");
		} else if (!email
				.matches("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\\.[a-zA-Z0-9_-]{2,3}){1,2})$")) {
			errors.put("email", "Email格式错误！");
		} else if (!userService.ajaxValidateEmail(email)) {
			errors.put("email", "Email已被注册！");
		}

		return errors;
	}
}
