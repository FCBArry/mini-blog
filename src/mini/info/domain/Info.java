package mini.info.domain;

import mini.user.domain.User;

public class Info {
	private String iid;
	
	private String iname;
	private String iaddress;
	private int isex;
	private int iemotion;
	private String iblog;
	private String ime;
	
	private String iqq;
	private String iemail;
	private String iphone;
	
	private String icompany;
	private String icomaddress;
	private String ijob;
	
	private String ischool;
	private String ischaddress;
	private String idegree;
	
	private User user;
	
	public String getIid() {
		return iid;
	}
	public void setIid(String iid) {
		this.iid = iid;
	}
	public String getIname() {
		return iname;
	}
	public void setIname(String iname) {
		this.iname = iname;
	}
	public String getIaddress() {
		return iaddress;
	}
	public void setIaddress(String iaddress) {
		this.iaddress = iaddress;
	}
	public int getIsex() {
		return isex;
	}
	public void setIsex(int isex) {
		this.isex = isex;
	}
	public int getIemotion() {
		return iemotion;
	}
	public void setIemotion(int iemotion) {
		this.iemotion = iemotion;
	}
	public String getIblog() {
		return iblog;
	}
	public void setIblog(String iblog) {
		this.iblog = iblog;
	}
	public String getIme() {
		return ime;
	}
	public void setIme(String ime) {
		this.ime = ime;
	}
	public String getIqq() {
		return iqq;
	}
	public void setIqq(String iqq) {
		this.iqq = iqq;
	}
	public String getIemail() {
		return iemail;
	}
	public void setIemail(String iemail) {
		this.iemail = iemail;
	}
	public String getIphone() {
		return iphone;
	}
	public void setIphone(String iphone) {
		this.iphone = iphone;
	}
	public String getIcompany() {
		return icompany;
	}
	public void setIcompany(String icompany) {
		this.icompany = icompany;
	}
	public String getIcomaddress() {
		return icomaddress;
	}
	public void setIcomaddress(String icomaddress) {
		this.icomaddress = icomaddress;
	}
	public String getIjob() {
		return ijob;
	}
	public void setIjob(String ijob) {
		this.ijob = ijob;
	}
	public String getIschool() {
		return ischool;
	}
	public void setIschool(String ischool) {
		this.ischool = ischool;
	}
	public String getIschaddress() {
		return ischaddress;
	}
	public void setIschaddress(String ischaddress) {
		this.ischaddress = ischaddress;
	}
	public String getIdegree() {
		return idegree;
	}
	public void setIdegree(String idegree) {
		this.idegree = idegree;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Info [iid=" + iid + ", iname=" + iname + ", iaddress="
				+ iaddress + ", isex=" + isex + ", iemotion=" + iemotion
				+ ", iblog=" + iblog + ", ime=" + ime + ", iqq=" + iqq
				+ ", iemail=" + iemail + ", iphone=" + iphone + ", icompany="
				+ icompany + ", icomaddress=" + icomaddress + ", ijob=" + ijob
				+ ", ischool=" + ischool + ", ischaddress=" + ischaddress
				+ ", idegree=" + idegree + ", user=" + user + "]";
	}
	
}
