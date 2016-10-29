package mini.post.action;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mini.comment.domain.Comment;
import mini.comment.service.CommentService;
import mini.pager.PageBean;
import mini.post.domain.Post;
import mini.post.service.PostService;
import mini.user.domain.User;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.struts2.ServletActionContext;

import cn.itcast.commons.CommonUtils;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class PostAction extends ActionSupport implements ModelDriven<Post> {
	@Resource
	private PostService postService;
	@Resource
	private CommentService commentService;

	private Post post = new Post();

	public Post getModel() {
		return post;
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

	public String add() throws UnsupportedEncodingException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();

		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setFileSizeMax(2048 * 2048);

		try {
			List<FileItem> fileItemList = sfu.parseRequest(request);
			Map<String, String> map = new HashMap<String, String>();
			for (FileItem fileItem : fileItemList) {
				if (fileItem.isFormField()) {
					map.put(fileItem.getFieldName(),
							fileItem.getString("UTF-8"));
				}
			}
			post = CommonUtils.toBean(map, Post.class);
			post.setPid(CommonUtils.uuid());
			User user = (User) request.getSession().getAttribute("sessionUser");
			post.setUser(user);
			post.setPtime(new Date());

			// 得到保存的目录
			String savepath = ServletActionContext.getServletContext()
					.getRealPath("/post_img");
			// 得到文件名称：给原来文件名称添加uuid前缀！避免文件名冲突
			String filename = CommonUtils.uuid() + "_"
					+ fileItemList.get(3).getName();

			/*
			 * 校验文件的扩展名
			 */
			if (!filename.toLowerCase().endsWith("jpg")) {
				request.setAttribute("msg", "您上传的图片不是JPG扩展名！");
				return "posting";
			}

			// 使用目录和文件名称创建目标文件
			File destFile = new File(savepath, filename);
			// 保存上传文件到目标文件位置
			fileItemList.get(3).write(destFile);
			post.setPimg("post_img/" + filename);
			postService.add(post);
		} catch (Exception e) {
			if (e instanceof FileUploadBase.FileSizeLimitExceededException) {
				request.setAttribute("msg", "您上传的文件超出了1024KB");
				return "posting";
			}
		}

		return findByStatus();
	}

	public String findByPid() {
		String pid = ServletActionContext.getRequest().getParameter("pid");
		Post post = postService.findByPid(pid);

		// ServletActionContext.getRequest().setAttribute("post", post);
		ServletActionContext.getRequest().getSession()
				.setAttribute("post", post);// 保存到session中

		int pc = getPc(ServletActionContext.getRequest());
		String url = getUrl(ServletActionContext.getRequest());

		PageBean<Comment> pb = commentService.findByPid(pid, pc);
		pb.setUrl(url);
		ServletActionContext.getRequest().setAttribute("pb", pb);

		return "post";
	}

	public String findByStatus() {
		int pc = getPc(ServletActionContext.getRequest());
		String url = getUrl(ServletActionContext.getRequest());
		int status = 1;

		PageBean<Post> pb = postService.findByStatus(status, pc);
		pb.setUrl(url);
		ServletActionContext.getRequest().setAttribute("pb", pb);

		return initInfo();
	}
	
	public String findHot() {
		int pc = getPc(ServletActionContext.getRequest());
		String url = getUrl(ServletActionContext.getRequest());

		PageBean<Post> pb = postService.findHot(pc);
		pb.setUrl(url);
		ServletActionContext.getRequest().setAttribute("pb", pb);

		return initInfo();
	}
	
	//待优化
	public String findByTitle() {
		int pc = getPc(ServletActionContext.getRequest());
		String url = getUrl(ServletActionContext.getRequest());
		String title = (String) ServletActionContext.getRequest().getSession()
				.getAttribute("title");
		if (title == null)
			title = ServletActionContext.getRequest().getParameter("title");
		PageBean<Post> pb = postService.findByTitle(title, pc);
		pb.setUrl(url);

		ServletActionContext.getRequest().setAttribute("pb", pb);
		ServletActionContext.getRequest().getSession()
				.setAttribute("title", title);

		return initInfo();
	}

	public String initInfo() {
		// hot zan
		List<Post> zanList = postService.findHotZan();
		// hot comment
		List<Post> commentList = postService.findHotComment();

		ServletActionContext.getRequest().setAttribute("zanList", zanList);
		ServletActionContext.getRequest().setAttribute("commentList",
				commentList);

		return "index";
	}

}
