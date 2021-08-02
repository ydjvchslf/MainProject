package com.buyedu.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Complain {
	
	private User user;
	private Board board;
	private Review review;
	
	private int complainNo;
	private int commentNo;
	private String complainSort;
	private String complainReasonCode;
	private String complainReason;
	private Date complainDate;
	private String complainState;
	
	private int totalCount;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}

	public int getComplainNo() {
		return complainNo;
	}

	public void setComplainNo(int complainNo) {
		this.complainNo = complainNo;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
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

	public Date getComplainDate() {
		return complainDate;
	}

	public void setComplainDate(Date complainDate) {
		this.complainDate = complainDate;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	

}
