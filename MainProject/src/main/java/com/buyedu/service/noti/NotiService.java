package com.buyedu.service.noti;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.converter.StringMessageConverter;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import com.buyedu.domain.Board;
import com.buyedu.util.UserUtil;
import com.google.gson.Gson;

@Service
public class NotiService {
	
	@Autowired
    private SimpMessagingTemplate simpMessagingTemplate;
	
	public void noti(String code) {
		
		/**
		 * 1. 알람 테이블(알람의 대한 내용)을 저장한다.
		 * 2. 학원에 속해있는 모든 사용자를 조회한다.
		 * 3. 학원에 속해있는 사람들 만큼 알람 사용자(수신받을 사용자) 테이블을 저장한다.
		 * 4. 학원에 속해있는 사람들 만큼 테이블을 저장할때 웹소켓을 날린다.
		 */
		
		//notification 테이블에 저장할 데이터 셋팅
		Object noti = new Object();
		
		//notification 테이블에 저장 insert
		
		//학원에 속해있는 일반 유저 검색 select
		List<Object> notiUsers = new ArrayList();
		
		for(Object user : notiUsers) {
			
			//user No를 가져온다.
			int userNo = user.hashCode();
			
			//notification_user 테이블에 저장할 데이터 셋팅
			Object notiUser = new Object();
			
			//알람 수신자 notification_user  테이블을 저장한다.
			
			//알람테이블과 알람 수신자 테이블 조인을 데이터 조회한다. read_yn = N
			List<Object> notis = new ArrayList<Object>();
			
			Gson gson = new Gson();
			String notisJson = gson.toJson(notiUsers);
			
			//Noti를 날린다.
			simpMessagingTemplate.setMessageConverter(new StringMessageConverter());
	        simpMessagingTemplate.convertAndSend("/" + String.join("/", "subscribe", "noti", code, String.valueOf(userNo)), notisJson);
		}
		
	}

}
