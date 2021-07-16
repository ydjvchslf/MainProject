package com.buyedu.domain;

public class Chart {
	
	private String userRole;
	private int userCnt;
	private String area;
	private int academyCnt;
	
	
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	public int getUserCnt() {
		return userCnt;
	}
	public void setUserCnt(int userCnt) {
		this.userCnt = userCnt;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public int getAcademyCnt() {
		return academyCnt;
	}
	public void setAcademyCnt(int academyCnt) {
		this.academyCnt = academyCnt;
	}
	@Override
	public String toString() {
		return "Chart [userRole=" + userRole + ", userCnt=" + userCnt + ", area=" + area + ", academyCnt=" + academyCnt
				+ "]";
	}
	

	
	

}
