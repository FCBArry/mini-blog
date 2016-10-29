package mini.intercept.front;

import mini.user.domain.User;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class ForegroundInterceptor extends MethodFilterInterceptor {

	@Override
	protected String doIntercept(ActionInvocation actionInvocation)
			throws Exception {
		// 判断是否登录,如果登录,放行,没有登录,跳转到登录页面.
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("sessionUser");
		if (user != null) {
			// 已经登录过
			return actionInvocation.invoke();
		} else {
			// 跳转到登录页面:
			/*
			 * ActionSupport support = (ActionSupport) actionInvocation
			 * .getAction(); support.addActionError("您还没有登录!没有权限访问!");
			 */
			ServletActionContext.getRequest().setAttribute("msg",
					"您还没有登录，不能访问本资源");
			return "login";
		}
	}

}
