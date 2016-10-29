package mini.favour.action;

import java.io.IOException;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;

import mini.favour.domain.Favour;
import mini.favour.service.FavourService;
import mini.post.domain.Post;
import mini.post.service.PostService;
import mini.user.domain.User;

import cn.itcast.commons.CommonUtils;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class FavourAction extends ActionSupport implements ModelDriven<Favour> {
	@Resource private FavourService favourService;
	@Resource private PostService postService;

	private Favour favour = new Favour();

	public Favour getModel() {
		return favour;
	}

	public void changeFavour() throws IOException {
		String pid = ServletActionContext.getRequest().getParameter("pid");
		Post post = postService.findByPid(pid);

		favour.setFid(CommonUtils.uuid());
		favour.setPost(post);

		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("sessionUser");
		favour.setUser(user);
		
		boolean b = favourService.changeFavour(favour);

		// 发送给客户端
		ServletActionContext.getResponse().getWriter().print(b);
	}
	
	public void status() throws IOException {
		String pid = ServletActionContext.getRequest().getParameter("pid");
		Post post = postService.findByPid(pid);

		favour.setFid(CommonUtils.uuid());
		favour.setPost(post);

		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("sessionUser");
		favour.setUser(user);
		
		boolean b = favourService.status(favour);

		// 发送给客户端
		ServletActionContext.getResponse().getWriter().print(b);
	}
	
}
