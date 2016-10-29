package mini.post.domain;

import java.util.Date;
import java.util.Set;

import mini.collection.domain.Collection;
import mini.comment.domain.Comment;
import mini.favour.domain.Favour;
import mini.user.domain.User;

public class Post {
	private String pid;
	private User user;
	private String ptitle;
	private String pimg;
	private String pcontent;
	private int pzan;
	private int pcomment;
	private Date ptime;
	private int pstatus;
	private Set<Comment> comments;
	private Set<Favour> favours;
	private Set<Collection> collections;
	
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getPtitle() {
		return ptitle;
	}
	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	public String getPimg() {
		return pimg;
	}
	public void setPimg(String pimg) {
		this.pimg = pimg;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public int getPzan() {
		return pzan;
	}
	public void setPzan(int pzan) {
		this.pzan = pzan;
	}
	public int getPcomment() {
		return pcomment;
	}
	public void setPcomment(int pcomment) {
		this.pcomment = pcomment;
	}
	public Date getPtime() {
		return ptime;
	}
	public void setPtime(Date ptime) {
		this.ptime = ptime;
	}
	public int isPstatus() {
		return pstatus;
	}
	public void setPstatus(int pstatus) {
		this.pstatus = pstatus;
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
	
}
