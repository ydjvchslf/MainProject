package com.buyedu.domain;



public class Complain {
	
	private int complainNo;
	private int boardNo;
	private int commentNo;
	private int reviewNo;
	private int complainUserNo;
	private String complainReasonCode;
	private String complainSort;
	
	
	
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
	public int getComplainUserNo() {
		return complainUserNo;
	}
	public void setComplainUserNo(int complainUserNo) {
		this.complainUserNo = complainUserNo;
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
	
	

}
