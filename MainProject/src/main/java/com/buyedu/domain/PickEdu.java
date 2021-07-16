package com.buyedu.domain;

import lombok.Data;
import lombok.ToString;

@Data
public class PickEdu {
	
	private User picker;
	private Academy pickAcademy;
	private Edu pickEdu;

	private String eduStartDate;
	private String eduEndDate;
	private String eduName;
	private String eduGrade;
	private String eduSubject;
	private int eduPrice;
	private int eduRest;
	private int eduNo;
	
	private int pickNo;

	public User getPicker() {
		return picker;
	}

	public void setPicker(User picker) {
		this.picker = picker;
	}

	public Academy getPickAcademy() {
		return pickAcademy;
	}

	public void setPickAcademy(Academy pickAcademy) {
		this.pickAcademy = pickAcademy;
	}

	public Edu getPickEdu() {
		return pickEdu;
	}

	public void setPickEdu(Edu pickEdu) {
		this.pickEdu = pickEdu;
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

	public String getEduName() {
		return eduName;
	}

	public void setEduName(String eduName) {
		this.eduName = eduName;
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

	public int getEduPrice() {
		return eduPrice;
	}

	public void setEduPrice(int eduPrice) {
		this.eduPrice = eduPrice;
	}

	public int getEduRest() {
		return eduRest;
	}

	public void setEduRest(int eduRest) {
		this.eduRest = eduRest;
	}

	public int getEduNo() {
		return eduNo;
	}

	public void setEduNo(int eduNo) {
		this.eduNo = eduNo;
	}

	public int getPickNo() {
		return pickNo;
	}

	public void setPickNo(int pickNo) {
		this.pickNo = pickNo;
	}

	@Override
	public String toString() {
		return "PickEdu [picker=" + picker + ", pickAcademy=" + pickAcademy + ", pickEdu=" + pickEdu + ", eduStartDate="
				+ eduStartDate + ", eduEndDate=" + eduEndDate + ", eduName=" + eduName + ", eduGrade=" + eduGrade
				+ ", eduSubject=" + eduSubject + ", eduPrice=" + eduPrice + ", eduRest=" + eduRest + ", eduNo=" + eduNo
				+ ", pickNo=" + pickNo + "]";
	}
	
	
	
}
