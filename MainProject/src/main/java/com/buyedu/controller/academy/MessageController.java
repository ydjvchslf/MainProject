package com.buyedu.controller.academy;

import java.net.Socket;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.buyedu.domain.User;

import lombok.extern.log4j.Log4j2;

@RestController
public class MessageController {
	//자 이제 백엔드에서는 오류 안나게 처리했고 debug로 여기 호출했을때 user가 제대로 찍히는지 확인 하면됭^^ 알람 날리는건 나중에 하고 연결 하고 메시지 서로 주고 받는지 부터 확인해보자. 대박 bb
	
	@MessageMapping("/info")
	@SendToUser("/queue/info")
	public String Info(String message, SimpMessageHeaderAccessor messageHeaderAccessor) {
		HttpSession session = (HttpSession) messageHeaderAccessor.getSessionAttributes().get("session");
		User talker = (User) session.getAttribute("user");
		return message;
	}
	
	@MessageMapping("/chat")
	@SendTo("/topic/message")
	public String chat(String message, SimpMessageHeaderAccessor messageHeaderAccessor) {
		HttpSession session = (HttpSession) messageHeaderAccessor.getSessionAttributes().get("session");
		User talker = (User) session.getAttribute("user");
		if (talker == null) {
			return "not found";
		}
		return "test";
	}
	

}











