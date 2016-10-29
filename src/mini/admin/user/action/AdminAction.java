package mini.admin.user.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import mini.admin.user.domain.Admin;
import mini.admin.user.service.AdminService;
import mini.pager.PageBean;
import mini.user.domain.User;
import mini.user.service.UserService;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminAction extends ActionSupport implements ModelDriven<Admin>{
	@Resource private AdminService adminService;
	@Resource private UserService userService;
	
	private Admin admin =new Admin();

	@Override
	public Admin getModel() {
		return admin;
	}
	
	/**
	 * 获取当前页码
	 * 
	 * @param req
	 * @return
	 */
	private int getPc(HttpServletRequest req) {
		int pc = 1;
		String param = req.getParameter("pc");
		if (param != null && !param.trim().isEmpty()) {
			try {
				pc = Integer.parseInt(param);
			} catch (RuntimeException e) {
			}
		}
		return pc;
	}

	/**
	 * 截取url，页面中的分页导航中需要使用它做为超链接的目标！
	 * 
	 * @param req
	 * @return
	 */
	private String getUrl(HttpServletRequest req) {
		String url = req.getRequestURI() + "?" + req.getQueryString();
		/*
		 * 如果url中存在pc参数，截取掉，如果不存在那就不用截取。
		 */
		int index = url.lastIndexOf("&pc=");
		if (index != -1) {
			url = url.substring(0, index);
		}
		return url;
	}
	
	/**
	 * 登录功能
	 */
	public String login() {
		HttpServletRequest req = ServletActionContext.getRequest();

		//模型驱动
		Admin madmin = adminService.login(admin);
		
		if(madmin == null) {
			req.setAttribute("msg", "用户名或密码错误！");
			req.setAttribute("form", madmin);
			return "login";
		}
		
		req.getSession().setAttribute("admin", madmin);//保存在session
		return findAll();
	}
	
	/**
	 * 退出功能
	 */
	public String quit() {
		ServletActionContext.getRequest().getSession().invalidate();
		return "login";
	}
	
	public String findAll(){
		int pc = getPc(ServletActionContext.getRequest());
		String url = getUrl(ServletActionContext.getRequest());
		
		PageBean<User> pb = userService.findAll(pc);
		pb.setUrl(url);

		ServletActionContext.getRequest().setAttribute("pb", pb);
		
		return "user";
	}
	
	public String delete(){
		String uid = ServletActionContext.getRequest().getParameter("uid");
		User user = userService.findByUid(uid);
		
		userService.delete(user);
		
		return findAll();
	}
	
}
