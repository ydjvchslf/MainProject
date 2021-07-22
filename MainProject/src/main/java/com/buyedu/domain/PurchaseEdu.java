package com.buyedu.domain;

import java.sql.Date;

public class PurchaseEdu {
	
	private User buyer;
	private Edu purchaseEdu;
	private Academy purchaseAcademy;
	
	private int payNo;
	private int payState;
	private Date payDate;
	private String purchaseUid;
	
	public User getBuyer() {
		return buyer;
	}
	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}
	public Edu getPurchaseEdu() {
		return purchaseEdu;
	}
	public void setPurchaseEdu(Edu purchaseEdu) {
		this.purchaseEdu = purchaseEdu;
	}
	public Academy getPurchaseAcademy() {
		return purchaseAcademy;
	}
	public void setPurchaseAcademy(Academy purchaseAcademy) {
		this.purchaseAcademy = purchaseAcademy;
	}
	public int getPayNo() {
		return payNo;
	}
	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}
	public int getPayState() {
		return payState;
	}
	public void setPayState(int payState) {
		this.payState = payState;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public String getPurchaseUid() {
		return purchaseUid;
	}
	public void setPurchaseUid(String purchaseUid) {
		this.purchaseUid = purchaseUid;
	}
	@Override
	public String toString() {
		return "PurchaseEdu [buyer=" + buyer + ", purchaseEdu=" + purchaseEdu + ", purchaseAcademy=" + purchaseAcademy
				+ ", payNo=" + payNo + ", payState=" + payState + ", payDate=" + payDate + ", purchaseUid="
				+ purchaseUid + "]";
	}

	
	
}
