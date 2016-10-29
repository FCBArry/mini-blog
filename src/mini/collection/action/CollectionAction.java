package mini.collection.action;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import mini.collection.domain.Collection;
import mini.collection.service.CollectionService;
import mini.pager.PageBean;
import mini.post.domain.Post;
import mini.post.service.PostService;
import mini.user.domain.User;

import cn.itcast.commons.CommonUtils;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CollectionAction extends ActionSupport implements ModelDriven<Collection>{
	@Resource
	private CollectionService collectionService;
	
	@Resource
	private PostService postService;
	
	private Collection collection = new Collection();
	
	public Collection getModel() {
		return collection;
	}
	
	/**
	 * 获取当前页码
	 * @param req
	 * @return
	 */
	private int getPc(HttpServletRequest req) {
		int pc = 1;
		String param = req.getParameter("pc");
		if(param != null && !param.trim().isEmpty()) {
			try {
				pc = Integer.parseInt(param);
			} catch(RuntimeException e) {}
		}
		return pc;
	}
	
	/**
	 * 截取url，页面中的分页导航中需要使用它做为超链接的目标！
	 * @param req
	 * @return
	 */
	private String getUrl(HttpServletRequest req) {
		String url = req.getRequestURI() + "?" + req.getQueryString();
		/*
		 * 如果url中存在pc参数，截取掉，如果不存在那就不用截取。
		 */
		int index = url.lastIndexOf("&pc=");
		if(index != -1) {
			url = url.substring(0, index);
		}
		return url;
	}
	
	public void changeCollection() throws IOException {
		String pid = ServletActionContext.getRequest().getParameter("pid");
		Post post = postService.findByPid(pid);

		collection.setCoid(CommonUtils.uuid());
		collection.setPost(post);

		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("sessionUser");
		collection.setUser(user);
		
		boolean b = collectionService.changeCollection(collection);

		// 发送给客户端
		ServletActionContext.getResponse().getWriter().print(b);
	}
	
	public void status() throws IOException {
		String pid = ServletActionContext.getRequest().getParameter("pid");
		Post post = postService.findByPid(pid);

		collection.setCoid(CommonUtils.uuid());
		collection.setPost(post);

		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("sessionUser");
		collection.setUser(user);
		
		boolean b = collectionService.status(collection);

		// 发送给客户端
		ServletActionContext.getResponse().getWriter().print(b);
	}
	
	public String findByUid(){
		int pc = getPc(ServletActionContext.getRequest());
		String url = getUrl(ServletActionContext.getRequest());
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("sessionUser");
		String uid = user.getUid();
		
		PageBean<Collection> pb = collectionService.findByUid(uid, pc);
		pb.setUrl(url);
		ServletActionContext.getRequest().setAttribute("pb", pb);

		return "myroom";
	}
}
