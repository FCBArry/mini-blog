package mini.favour.domain;

import mini.post.domain.Post;
import mini.user.domain.User;

public class Favour {
	private String fid;
	private User user;
	private Post post;
	private int fstatus;
	
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
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
	public int getFstatus() {
		return fstatus;
	}
	public void setFstatus(int fstatus) {
		this.fstatus = fstatus;
	}
	
}
