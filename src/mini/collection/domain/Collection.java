package mini.collection.domain;

import mini.post.domain.Post;
import mini.user.domain.User;

public class Collection {
	private String coid;
	private User user;
	private Post post;
	private int colstatus;
	
	public String getCoid() {
		return coid;
	}
	public void setCoid(String colid) {
		this.coid = colid;
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
	public int getColstatus() {
		return colstatus;
	}
	public void setColstatus(int colstatus) {
		this.colstatus = colstatus;
	}
	
}
