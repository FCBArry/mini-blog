package mini.fans.domain;

import mini.user.domain.User;

public class Fans {
	private String fanuid;
	private User userMe;
	private User userOther;
	private int isfocus;
	
	public String getFanuid() {
		return fanuid;
	}
	public void setFanuid(String fanuid) {
		this.fanuid = fanuid;
	}
	public User getUserMe() {
		return userMe;
	}
	public void setUserMe(User userMe) {
		this.userMe = userMe;
	}
	public User getUserOther() {
		return userOther;
	}
	public void setUserOther(User userOther) {
		this.userOther = userOther;
	}
	public int getIsfocus() {
		return isfocus;
	}
	public void setIsfocus(int isfocus) {
		this.isfocus = isfocus;
	}
	
}
