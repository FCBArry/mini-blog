package mini.comment.domain;

import java.util.Date;

import mini.post.domain.Post;
import mini.user.domain.User;

public class Comment {
	private String cid;
	private User user;
	private Post post;
	private String ccontent;
	private Date ctime;
	
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public Date getCtime() {
		return ctime;
	}
	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}
	@Override
	public String toString() {
		return "Comment [cid=" + cid + ", ccontent=" + ccontent + ", ctime="
				+ ctime + "]";
	}
	
}
