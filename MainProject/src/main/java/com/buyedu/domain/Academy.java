package com.buyedu.domain;

import lombok.Data;

@Data
public class Academy {
	
	private User user;
	private Edu edu;
		
	private String academyCode;
	private String academyName;
	private String academyPhone;
	private String academyAddr;
	private String academyLat;
	private String academyLng;
	private String academyIntro;
	private String academyHistory;
	
	
	private String academyImage;
	private String academyVideo;
	
	private int multimediano;
	private String multimedia;
	private String multimediarole;
	
	private int count;
	
	//추가
	private String academyArea;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Edu getEdu() {
		return edu;
	}
	public void setEdu(Edu edu) {
		this.edu = edu;
	}
	public String getAcademyCode() {
		return academyCode;
	}
	public void setAcademyCode(String academyCode) {
		this.academyCode = academyCode;
	}
	public String getAcademyName() {
		return academyName;
	}
	public void setAcademyName(String academyName) {
		this.academyName = academyName;
	}
	public String getAcademyPhone() {
		return academyPhone;
	}
	public void setAcademyPhone(String academyPhone) {
		this.academyPhone = academyPhone;
	}
	public String getAcademyAddr() {
		return academyAddr;
	}
	public void setAcademyAddr(String academyAddr) {
		this.academyAddr = academyAddr;
	}
	public String getAcademyLat() {
		return academyLat;
	}
	public void setAcademyLat(String academyLat) {
		this.academyLat = academyLat;
	}
	public String getAcademyLng() {
		return academyLng;
	}
	public void setAcademyLng(String academyLng) {
		this.academyLng = academyLng;
	}
	public String getAcademyIntro() {
		return academyIntro;
	}
	public void setAcademyIntro(String academyIntro) {
		this.academyIntro = academyIntro;
	}
	public String getAcademyHistory() {
		return academyHistory;
	}
	public void setAcademyHistory(String academyHistory) {
		this.academyHistory = academyHistory;
	}
	public String getAcademyImage() {
		return academyImage;
	}
	public void setAcademyImage(String academyImage) {
		this.academyImage = academyImage;
	}
	public String getAcademyVideo() {
		return academyVideo;
	}
	public void setAcademyVideo(String academyVideo) {
		this.academyVideo = academyVideo;
	}

	public String getAcademyArea() {
		return academyArea;
	}
	public void setAcademyArea(String academyArea) {
		this.academyArea = academyArea;
	}
	public int getMultimediano() {
		return multimediano;
	}
	public void setMultimediano(int multimediano) {
		this.multimediano = multimediano;
	}
	public String getMultimedia() {
		return multimedia;
	}
	public void setMultimedia(String multimedia) {
		this.multimedia = multimedia;
	}
	public String getMultimediarole() {
		return multimediarole;
	}
	public void setMultimediarole(String multimediarole) {
		this.multimediarole = multimediarole;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "Academy [user=" + user + ", edu=" + edu + ", academyCode=" + academyCode + ", academyName="
				+ academyName + ", academyPhone=" + academyPhone + ", academyAddr=" + academyAddr + ", academyLat="
				+ academyLat + ", academyLng=" + academyLng + ", academyIntro=" + academyIntro + ", academyHistory="
				+ academyHistory + ", academyImage=" + academyImage + ", academyVideo=" + academyVideo
				+ ", multimediano=" + multimediano + ", multimedia=" + multimedia + ", multimediarole=" + multimediarole
				+ ", count=" + count + ", academyArea=" + academyArea + "]";
	}

	
	
	
	
}
