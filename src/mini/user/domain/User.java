package mini.user.domain;

import java.util.Set;

import mini.collection.domain.Collection;
import mini.comment.domain.Comment;
import mini.fans.domain.Fans;
import mini.favour.domain.Favour;
import mini.info.domain.Info;
import mini.post.domain.Post;

public class User {
	private String uid;
	private String username;
	private String password;
	private String email;
	private boolean status;
	private String activationCode;
	private Set<Post> posts;
	private Set<Comment> comments;
	private Set<Favour> favours;
	private Set<Collection> collections;
	private Set<Fans> fans;
	private Set<Fans> focus;
	
	private Info info;
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getActivationCode() {
		return activationCode;
	}
	public void setActivationCode(String activationCode) {
		this.activationCode = activationCode;
	}
	public Set<Post> getPosts() {
		return posts;
	}
	public void setPosts(Set<Post> posts) {
		this.posts = posts;
	}
	public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	public Set<Favour> getFavours() {
		return favours;
	}
	public void setFavours(Set<Favour> favours) {
		this.favours = favours;
	}
	public Set<Collection> getCollections() {
		return collections;
	}
	public void setCollections(Set<Collection> collections) {
		this.collections = collections;
	}
	public Set<Fans> getFans() {
		return fans;
	}
	public void setFans(Set<Fans> fans) {
		this.fans = fans;
	}
	public Set<Fans> getFocus() {
		return focus;
	}
	public void setFocus(Set<Fans> focus) {
		this.focus = focus;
	}
	public Info getInfo() {
		return info;
	}
	public void setInfo(Info info) {
		this.info = info;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password="
				+ password + ", email=" + email + ", status=" + status
				+ ", activationCode=" + activationCode + "]";
	}
	
}
