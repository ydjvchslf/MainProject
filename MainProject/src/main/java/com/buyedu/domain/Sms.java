package com.buyedu.domain;

public class Sms {
	
	int smsNo;
	String phone;
	int vaildNumber;
	
	
	public int getSmsNo() {
		return smsNo;
	}
	public void setSmsNo(int smsNo) {
		this.smsNo = smsNo;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getVaildNumber() {
		return vaildNumber;
	}
	public void setVaildNumber(int vaildNumber) {
		this.vaildNumber = vaildNumber;
	}
	
	
	@Override
	public String toString() {
		return "Sms [smsNo=" + smsNo + ", phone=" + phone + ", vaildNumber=" + vaildNumber + "]";
	}
	
	

}
