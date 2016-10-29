package mini.admin.comment;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import mini.comment.domain.Comment;
import mini.comment.service.CommentService;
import mini.pager.PageBean;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class AdminComment extends ActionSupport {
	@Resource private CommentService commentService;
	
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
	
	public String findAll(){
		int pc = getPc(ServletActionContext.getRequest());
		String url = getUrl(ServletActionContext.getRequest());
		
		PageBean<Comment> pb = commentService.findAll(pc);
		pb.setUrl(url);

		ServletActionContext.getRequest().setAttribute("pb", pb);
		
		return "comment";
	}
	
	public String delete(){
		String cid = ServletActionContext.getRequest().getParameter("cid");
		Comment comment = commentService.findByCid(cid);
		
		commentService.delete(comment);
		
		return findAll();
	}
}
