package mini.comment.action;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import mini.comment.domain.Comment;
import mini.comment.service.CommentService;
import mini.pager.PageBean;
import mini.post.domain.Post;
import mini.post.service.PostService;
import mini.user.domain.User;

import org.apache.struts2.ServletActionContext;

import cn.itcast.commons.CommonUtils;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CommentAction extends ActionSupport implements ModelDriven<Comment>{
	@Resource private CommentService commentService;
	@Resource private PostService postService;
	
	private Comment comment = new Comment();
	
	public Comment getModel() {
		return comment;
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
	
	public String add(){
		HttpServletRequest request = ServletActionContext.getRequest();
		
		comment.setCid(CommonUtils.uuid());
		comment.setCtime(new Date());
		Post post = (Post) request.getSession().getAttribute("post");
		comment.setPost(post);
		User user = (User) request.getSession().getAttribute("sessionUser");
		comment.setUser(user);
		commentService.add(comment);
		
		post.setPcomment(post.getPcomment() + 1);
		postService.update(post);//评论数加一
		
		return findByPid(post.getPid());
	}
	
	public String findByPid(String pid){
		Post post = postService.findByPid(pid);
		ServletActionContext.getRequest().getSession().setAttribute("post", post);//保存到session中
		
		int pc = getPc(ServletActionContext.getRequest());
		String url = getUrl(ServletActionContext.getRequest());
		
		PageBean<Comment> pb = commentService.findByPid(pid, pc);
		pb.setUrl(url);
		ServletActionContext.getRequest().setAttribute("pb", pb);

		return "post";
	}
	
}
