package com.buyedu.dao.sms;

import org.apache.ibatis.annotations.Mapper;

import com.buyedu.domain.Sms;

@Mapper
public interface SmsDao {
	
	public void addSms(Sms sms) throws Exception;

	public Sms getSms(String phone) throws Exception;
	
}
