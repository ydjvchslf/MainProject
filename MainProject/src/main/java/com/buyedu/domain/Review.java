package com.buyedu.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Review {
	
	private User reviewWriter;
	
	private int reviewNo;
	private String reviewState;
	private String reviewTitle;
	private String reviewContent;
	private Date reviewDate;
	private int totalCount;
	private String academyCode;
	
	private int connectState;
	
	private int reviewcount;
	
	
	public int getConnectState() {
		return connectState;
	}
	
	public void setConnectState(int connectState) {
		this.connectState = connectState;
	}
	
	
	public String getAcademyCode() {
		return academyCode;
	}
	public void setAcademyCode(String academyCode) {
		this.academyCode = academyCode;
	}
	public User getReviewWriter() {
		return reviewWriter;
	}
	public void setReviewWriter(User reviewWriter) {
		this.reviewWriter = reviewWriter;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewState() {
		return reviewState;
	}
	public void setReviewState(String reviewState) {
		this.reviewState = reviewState;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	@Override
	public String toString() {
		return "Review [connectState=" + connectState + "academyCode=" + academyCode + ", reviewWriter=" + reviewWriter + ", reviewNo=" + reviewNo
				+ ", reviewState=" + reviewState + ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent
				+ ", reviewDate=" + reviewDate + ", totalCount=" + totalCount + "]////";
	}

}
