package com.buyedu.domain;

import java.util.Date;

public class Complain {
	
	private int complainNo;
	private int boardNo;
	private int commentNo;
	private int reviewNo;
	private User complainUserNo;
	private String complainReasonCode;
	private String complainSort;
	private Date complainDate;
	private int totalCount;
	
	
	
	public int getComplainNo() {
		return complainNo;
	}
	public void setComplainNo(int complainNo) {
		this.complainNo = complainNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public User getComplainUserNo() {
		return complainUserNo;
	}
	public void setComplainUserNo(User user) {
		this.complainUserNo = user;
	}
	public String getComplainReasonCode() {
		return complainReasonCode;
	}
	public void setComplainReasonCode(String complainReasonCode) {
		this.complainReasonCode = complainReasonCode;
	}
	public String getComplainSort() {
		return complainSort;
	}
	public void setComplainSort(String complainSort) {
		this.complainSort = complainSort;
	}
	@Override
	public String toString() {
		return "Complain [complainNo=" + complainNo + ", boardNo=" + boardNo + ", commentNo=" + commentNo
				+ ", reviewNo=" + reviewNo + ", complainUserNo=" + complainUserNo + ", complainReasonCode="
				+ complainReasonCode + ", complainSort=" + complainSort + "]";
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public Date getComplainDate() {
		return complainDate;
	}
	public void setComplainDate(Date complainDate) {
		this.complainDate = complainDate;
	}
	
	

}
