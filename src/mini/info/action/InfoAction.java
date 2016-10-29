package mini.info.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import mini.collection.domain.Collection;
import mini.collection.service.CollectionService;
import mini.comment.service.CommentService;
import mini.fans.service.FansService;
import mini.favour.service.FavourService;
import mini.info.domain.Info;
import mini.info.service.InfoService;
import mini.pager.PageBean;
import mini.post.domain.Post;
import mini.post.service.PostService;
import mini.user.domain.User;
import mini.user.service.UserService;

import org.apache.struts2.ServletActionContext;

import cn.itcast.commons.CommonUtils;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class InfoAction extends ActionSupport implements ModelDriven<Info> {
	@Resource private InfoService infoService;
	@Resource private PostService postService;
	@Resource private CommentService commentService;
	@Resource private FansService fansService;
	@Resource private FavourService favourService;
	@Resource private CollectionService collectionService;
	@Resource private UserService userService;
	
	private Info info = new Info();

	public Info getModel() {
		return info;
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

	public String base() {
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("sessionUser");
		Info _info = infoService.findByUid(user.getUid());

		if (_info == null) {
			info.setIid(CommonUtils.uuid());
			info.setUser(user);
			infoService.add(info);
			ServletActionContext.getRequest().setAttribute("info", info);
			return "myinfo";
		}

		_info.setIname(info.getIname());
		_info.setIaddress(info.getIaddress());
		_info.setIsex(info.getIsex());
		_info.setIemotion(info.getIemotion());
		_info.setIblog(info.getIblog());
		_info.setIme(info.getIme());

		infoService.update(_info);
		
		ServletActionContext.getRequest().setAttribute("info", _info);

		return init();
	}

	public String connection() {
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("sessionUser");
		Info _info = infoService.findByUid(user.getUid());

		if (_info == null) {
			info.setIid(CommonUtils.uuid());
			info.setUser(user);
			infoService.add(info);
			ServletActionContext.getRequest().setAttribute("info", info);
			return "myinfo";
		}

		_info.setIqq(info.getIqq());
		_info.setIemail(info.getIemail());
		_info.setIphone(info.getIphone());

		infoService.update(_info);

		ServletActionContext.getRequest().setAttribute("info", _info);

		return init();
	}

	public String work() {
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("sessionUser");
		Info _info = infoService.findByUid(user.getUid());

		if (_info == null) {
			info.setIid(CommonUtils.uuid());
			info.setUser(user);
			infoService.add(info);
			ServletActionContext.getRequest().setAttribute("info", info);
			return "myinfo";
		}

		_info.setIcompany(info.getIcompany());
		_info.setIcomaddress(info.getIcomaddress());
		_info.setIjob(info.getIjob());

		infoService.update(_info);

		ServletActionContext.getRequest().setAttribute("info", _info);

		return init();
	}

	public String education() {
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("sessionUser");
		Info _info = infoService.findByUid(user.getUid());

		if (_info == null) {
			info.setIid(CommonUtils.uuid());
			info.setUser(user);
			infoService.add(info);
			ServletActionContext.getRequest().setAttribute("info", info);
			return "myinfo";
		}
		System.out.println(info.getIschool());
		_info.setIschool(info.getIschool());
		_info.setIschaddress(info.getIschaddress());
		_info.setIdegree(info.getIdegree());

		infoService.update(_info);

		ServletActionContext.getRequest().setAttribute("info", _info);

		return init();
	}

	public void findByUid(String uid) {
		Info _info = infoService.findByUid(uid);

		ServletActionContext.getRequest().setAttribute("info", _info);

		int numPost = postService.findPostNum(uid);
		int numMTO = fansService.findMTONum(uid);
		int numOTM = fansService.findOTMNum(uid);
		User user = userService.findByUid(uid);
		
		ServletActionContext.getRequest().setAttribute("numPost", numPost);
		ServletActionContext.getRequest().setAttribute("numMTO", numMTO);
		ServletActionContext.getRequest().setAttribute("numOTM", numOTM);
		ServletActionContext.getRequest().setAttribute("user", user);
	}

	public String findFriend() {
		int pc = getPc(ServletActionContext.getRequest());
		String url = getUrl(ServletActionContext.getRequest());

		PageBean<Info> pb = infoService.findFriend(info, pc);
		pb.setUrl(url);
		ServletActionContext.getRequest().setAttribute("pb", pb);
		System.out.println(pb.getBeanList().size()+"---------------------------------");
		return "find";
	}

	public String init() {
		// 得到资料
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("sessionUser");
		Info _info = infoService.findByUid(user.getUid());

		// 得到博客数据：文章
		int numPost = postService.findPostNum(user.getUid());
		// 得到博客数据：评论
		int numComment = commentService.findCommentNum(user.getUid());
		// 得到博客数据：赞
		int numFavour = favourService.findFavourNum(user.getUid());
		// 得到博客数据：关注
		int numMTO = fansService.findMTONum(user.getUid());
		// 得到博客数据：粉丝
		int numOTM = fansService.findOTMNum(user.getUid());

		ServletActionContext.getRequest().setAttribute("info", _info);
		ServletActionContext.getRequest().setAttribute("numPost", numPost);
		ServletActionContext.getRequest()
				.setAttribute("numComment", numComment);
		ServletActionContext.getRequest().setAttribute("numFavour", numFavour);
		ServletActionContext.getRequest().setAttribute("numMTO", numMTO);
		ServletActionContext.getRequest().setAttribute("numOTM", numOTM);

		return "myinfo";
	}

	public String myBlog() {
		// 得到我的博客
		int pc = getPc(ServletActionContext.getRequest());
		String url = getUrl(ServletActionContext.getRequest());
		String uid = ServletActionContext.getRequest().getParameter("uid");

		PageBean<Post> pb = postService.findPostByUid(uid, pc);
		pb.setUrl(url);
		ServletActionContext.getRequest().setAttribute("pb", pb);

		findByUid(uid);

		return "myroom";
	}

	public String myCollection() {
		// 得到我的收藏
		int pc = getPc(ServletActionContext.getRequest());
		String url = getUrl(ServletActionContext.getRequest());
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("sessionUser");
		String uid = user.getUid();

		PageBean<Collection> pb = collectionService.findByUid(uid, pc);
		pb.setUrl(url);
		ServletActionContext.getRequest().setAttribute("pb", pb);

		findByUid(uid);

		return "mycollection";
	}
	
}
