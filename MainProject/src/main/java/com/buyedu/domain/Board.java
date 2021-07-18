package com.buyedu.domain;

import lombok.Data;

@Data
public class Board {
	

	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardDate;
	private int boardWriter;
	private String boardImage;
	private String boardState;
	private String cateCode;
	private int viewCnt;
	private String email;

	private int commentNo;
	private String commentContent;
	private String commentWriter;
	private String commentStateCode;
	private String commentDate;
	private int comment_cnt;
	
	private int recommendNo;
	private String recommender;
	private int recommendCnt;
	
	private int totalCount;

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}

	public int getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(int boardWriter) {
		this.boardWriter = boardWriter;
	}

	public String getBoardImage() {
		return boardImage;
	}

	public void setBoardImage(String boardImage) {
		this.boardImage = boardImage;
	}

	public String getBoardState() {
		return boardState;
	}

	public void setBoardState(String boardState) {
		this.boardState = boardState;
	}

	public String getCateCode() {
		return cateCode;
	}

	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentWriter() {
		return commentWriter;
	}

	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}

	public String getCommentStateCode() {
		return commentStateCode;
	}

	public void setCommentStateCode(String commentStateCode) {
		this.commentStateCode = commentStateCode;
	}

	public String getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}

	public int getComment_cnt() {
		return comment_cnt;
	}

	public void setComment_cnt(int comment_cnt) {
		this.comment_cnt = comment_cnt;
	}

	public int getRecommendNo() {
		return recommendNo;
	}

	public void setRecommendNo(int recommendNo) {
		this.recommendNo = recommendNo;
	}

	public String getRecommender() {
		return recommender;
	}

	public void setRecommender(String recommender) {
		this.recommender = recommender;
	}

	public int getRecommendCnt() {
		return recommendCnt;
	}

	public void setRecommendCnt(int recommendCnt) {
		this.recommendCnt = recommendCnt;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardDate=" + boardDate + ", boardWriter=" + boardWriter + ", boardImage=" + boardImage
				+ ", boardState=" + boardState + ", cateCode=" + cateCode + ", viewCnt=" + viewCnt + ", email=" + email
				+ ", commentNo=" + commentNo + ", commentContent=" + commentContent + ", commentWriter=" + commentWriter
				+ ", commentStateCode=" + commentStateCode + ", commentDate=" + commentDate + ", comment_cnt"
				+ comment_cnt + ", recommendNo=" + recommendNo + ", recommender=" + recommender + ", recommendCnt="
				+ recommendCnt + ", totalCount=" + totalCount + "]";
	}

	
	
	
}
