package com.buyedu.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Edu {
	
	private Academy academy;
	private User user;
	
	private int eduNo;
	private int eduPrice;
	private int eduMember;
	private int eduRest;
	
	private String eduName;
	private String eduTeacher;
	private String eduIntro;
	private String eduStartDate;
	private String eduEndDate;
	private String eduStartTime;
	private String eduEndTime;
	private String eduState;
	private String eduDay;
	private String eduGrade;
	private String eduSubject;
	private Date eduDate;
	public Academy getAcademy() {
		return academy;
	}
	public void setAcademy(Academy academy) {
		this.academy = academy;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getEduNo() {
		return eduNo;
	}
	public void setEduNo(int eduNo) {
		this.eduNo = eduNo;
	}
	public int getEduPrice() {
		return eduPrice;
	}
	public void setEduPrice(int eduPrice) {
		this.eduPrice = eduPrice;
	}
	public int getEduMember() {
		return eduMember;
	}
	public void setEduMember(int eduMember) {
		this.eduMember = eduMember;
	}
	public int getEduRest() {
		return eduRest;
	}
	public void setEduRest(int eduRest) {
		this.eduRest = eduRest;
	}
	public String getEduName() {
		return eduName;
	}
	public void setEduName(String eduName) {
		this.eduName = eduName;
	}
	public String getEduTeacher() {
		return eduTeacher;
	}
	public void setEduTeacher(String eduTeacher) {
		this.eduTeacher = eduTeacher;
	}
	public String getEduIntro() {
		return eduIntro;
	}
	public void setEduIntro(String eduIntro) {
		this.eduIntro = eduIntro;
	}
	public String getEduStartDate() {
		return eduStartDate;
	}
	public void setEduStartDate(String eduStartDate) {
		this.eduStartDate = eduStartDate;
	}
	public String getEduEndDate() {
		return eduEndDate;
	}
	public void setEduEndDate(String eduEndDate) {
		this.eduEndDate = eduEndDate;
	}
	public String getEduStartTime() {
		return eduStartTime;
	}
	public void setEduStartTime(String eduStartTime) {
		this.eduStartTime = eduStartTime;
	}
	public String getEduEndTime() {
		return eduEndTime;
	}
	public void setEduEndTime(String eduEndTime) {
		this.eduEndTime = eduEndTime;
	}
	public String getEduState() {
		return eduState;
	}
	public void setEduState(String eduState) {
		this.eduState = eduState;
	}
	public String getEduDay() {
		return eduDay;
	}
	public void setEduDay(String eduDay) {
		this.eduDay = eduDay;
	}
	public String getEduGrade() {
		return eduGrade;
	}
	public void setEduGrade(String eduGrade) {
		this.eduGrade = eduGrade;
	}
	public String getEduSubject() {
		return eduSubject;
	}
	public void setEduSubject(String eduSubject) {
		this.eduSubject = eduSubject;
	}
	public Date getEduDate() {
		return eduDate;
	}
	public void setEduDate(Date eduDate) {
		this.eduDate = eduDate;
	}
	@Override
	public String toString() {
		return "Edu [academy=" + academy + ", user=" + user + ", eduNo=" + eduNo + ", eduPrice=" + eduPrice
				+ ", eduMember=" + eduMember + ", eduRest=" + eduRest + ", eduName=" + eduName + ", eduTeacher="
				+ eduTeacher + ", eduIntro=" + eduIntro + ", eduStartDate=" + eduStartDate + ", eduEndDate="
				+ eduEndDate + ", eduStartTime=" + eduStartTime + ", eduEndTime=" + eduEndTime + ", eduState="
				+ eduState + ", eduDay=" + eduDay + ", eduGrade=" + eduGrade + ", eduSubject=" + eduSubject
				+ ", eduDate=" + eduDate + "]";
	}
	

}