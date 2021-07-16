package com.buyedu.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Connect {
	
	private User user;
	private Academy academy;
	
	private String connectState;
	private int connectCnt;
	private int connectNo;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Academy getAcademy() {
		return academy;
	}
	public void setAcademy(Academy academy) {
		this.academy = academy;
	}
	public String getConnectState() {
		return connectState;
	}
	public void setConnectState(String connectState) {
		this.connectState = connectState;
	}
	public int getConnectCnt() {
		return connectCnt;
	}
	public void setConnectCnt(int connectCnt) {
		this.connectCnt = connectCnt;
	}
	public int getConnectNo() {
		return connectNo;
	}
	public void setConnectNo(int connectNo) {
		this.connectNo = connectNo;
	}
	@Override
	public String toString() {
		return "Connect [user=" + user + ", academy=" + academy + ", connectState=" + connectState + ", connectCnt="
				+ connectCnt + ", connectNo=" + connectNo + "]";
	}

	
	
}
