package mini.fans.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import mini.fans.domain.Fans;
import mini.fans.service.FansService;
import mini.user.domain.User;
import mini.user.service.UserService;

import cn.itcast.commons.CommonUtils;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class FansAction extends ActionSupport implements ModelDriven<Fans> {
	@Resource
	private FansService fansService;
	@Resource
	private UserService userService;

	private Fans fans = new Fans();

	public Fans getModel() {
		return fans;
	}

	public String friend() {
		List<Fans> focus = myfocus();
		List<Fans> fans = myfans();
		ServletActionContext.getRequest().setAttribute("focus", focus);
		ServletActionContext.getRequest().setAttribute("fans", fans);
		return "friend";
	}

	public List<Fans> myfocus() {
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("sessionUser");
		return fansService.findByMeid(user.getUid());
	}

	public List<Fans> myfans() {
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("sessionUser");
		return fansService.findByUid(user.getUid());
	}

	public void changeFan() throws IOException {
		String otheruid = ServletActionContext.getRequest().getParameter(
				"otheruid");

		User userO = userService.findByUid(otheruid);

		fans.setFanuid(CommonUtils.uuid());
		fans.setUserOther(userO);

		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("sessionUser");
		fans.setUserMe(user);

		boolean b = fansService.changeFan(fans);

		// 发送给客户端
		ServletActionContext.getResponse().getWriter().print(b);
	}

	public void status() throws IOException {
		String otheruid = ServletActionContext.getRequest().getParameter("otheruid");
		
		User userO = userService.findByUid(otheruid);

		fans.setFanuid(CommonUtils.uuid());
		fans.setUserOther(userO);

		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("sessionUser");
		fans.setUserMe(user);

		boolean b = fansService.status(fans);

		// 发送给客户端
		ServletActionContext.getResponse().getWriter().print(b);
	}

}
