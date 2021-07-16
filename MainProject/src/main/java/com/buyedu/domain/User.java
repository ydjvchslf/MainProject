package com.buyedu.domain;

import java.sql.Date;

public class User {
	
	private int userNo;
	private String email;
	private String password;
	private String name;
	private String phone;
	private String role;
	private Date outDate;
	private Date inDate;
	private String accountState;

	
	private int userCnt;

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Date getOutDate() {
		return outDate;
	}

	public void setOutDate(Date outDate) {
		this.outDate = outDate;
	}

	public Date getInDate() {
		return inDate;
	}

	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}

	public String getAccountState() {
		return accountState;
	}

	public void setAccountState(String accountState) {
		this.accountState = accountState;
	}

	public int getUserCnt() {
		return userCnt;
	}

	public void setUserCnt(int userCnt) {
		this.userCnt = userCnt;
	}

	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", email=" + email + ", password=" + password + ", name=" + name + ", phone="
				+ phone + ", role=" + role + ", outDate=" + outDate + ", inDate=" + inDate + ", accountState="
				+ accountState + ", userCnt=" + userCnt + "]";
	}
	
	
}
