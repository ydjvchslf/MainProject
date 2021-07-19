package com.buyedu.domain;

import java.util.ArrayList;
import java.util.List;

public class Search {
	
	///Field
	private int currentPage;
	private String searchCondition;
	private String searchConditionb;
	private String searchKeyword;
	private String searchAcademyName;
	private String searchAcademyAddr;
	private String searchAcademyGrade;
	private String searchAcademySubject;
	private int pageSize;
	
	private List<String> searchRole = new ArrayList<>();
	private List<String> searchAccountState = new ArrayList<>();
	
	private String searchEduState;

	private int endRowNum;
	private int startRowNum;
	
	private int searchUserNo;
	
	///Constructor
	public Search() {
	}
	
	///Method
	
	
	
	public int getPageSize() {
		return pageSize;
	}
	public int getSearchUserNo() {
		return searchUserNo;
	}

	public void setSearchUserNo(int searchUserNo) {
		this.searchUserNo = searchUserNo;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public void setPageSize(int paseSize) {
		this.pageSize = paseSize;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	
	public String getSearchConditionb() {
		return searchConditionb;
	}

	public void setSearchConditionb(String searchConditionb) {
		this.searchConditionb = searchConditionb;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	public String getSearchAcademyName() {
		return searchAcademyName;
	}

	public void setSearchAcademyName(String searchAcademyName) {
		this.searchAcademyName = searchAcademyName;
	}

	public String getSearchAcademyAddr() {
		return searchAcademyAddr;
	}

	public void setSearchAcademyAddr(String searchAcademyAddr) {
		this.searchAcademyAddr = searchAcademyAddr;
	}

	public String getSearchAcademyGrade() {
		return searchAcademyGrade;
	}

	public void setSearchAcademyGrade(String searchAcademyGrade) {
		this.searchAcademyGrade = searchAcademyGrade;
	}

	public String getSearchAcademySubject() {
		return searchAcademySubject;
	}

	public void setSearchAcademySubject(String searchAcademySubject) {
		this.searchAcademySubject = searchAcademySubject;
	}


	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}

	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}

	public List<String> getSearchRole() {
		return searchRole;
	}

	public void setSearchRole(List<String> searchRole) {
		this.searchRole = searchRole;
	}

	public List<String> getSearchAccountState() {
		return searchAccountState;
	}

	public void setSearchAccountState(List<String> searchAccountState) {
		this.searchAccountState = searchAccountState;
	}
	
	public String getSearchEduState() {
		return searchEduState;
	}

	public void setSearchEduState(String searchEduState) {
		this.searchEduState = searchEduState;
	}

	
	
	@Override
	public String toString() {
		return "Search [currentPage=" + currentPage + ", searchCondition=" + searchCondition + ", searchConditionb="
				+ searchConditionb + ", searchKeyword=" + searchKeyword + ", searchAcademyName=" + searchAcademyName
				+ ", searchAcademyAddr=" + searchAcademyAddr + ", searchAcademyGrade=" + searchAcademyGrade
				+ ", searchAcademySubject=" + searchAcademySubject + ", pageSize=" + pageSize + ", searchRole="
				+ searchRole + ", searchAccountState=" + searchAccountState + ", searchEduState=" + searchEduState
				+ ", endRowNum=" + endRowNum + ", startRowNum=" + startRowNum + ", searchUserNo=" + searchUserNo + "]";
	}

	

	
}