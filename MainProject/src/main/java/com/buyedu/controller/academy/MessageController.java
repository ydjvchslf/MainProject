//package com.buyedu.controller.academy;
//
//import java.io.IOException;
//import java.net.Socket;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.websocket.OnMessage;
//import javax.websocket.OnOpen;
//import javax.websocket.Session;
//import javax.websocket.server.ServerEndpoint;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//
//@Controller
//@ServerEndpoint("/websocket")
//public class MessageController extends Socket{
//	private static final List<Session> session = new ArrayList<Session>();
//	
//	@GetMapping("/")
//	public String index() {
//		return "index";
//	}
//	
//	@OnOpen
//	public void open(Session newUser) {
//		System.out.println("connected");
//		session.add(newUser);
//		System.out.println(newUser.getId());
//		// 사용자 증가시 getId +1
//	}
//	
//	@OnMessage
//	// 사용자로부터 메시지를 받았을때 실행 (세션 가져오기)
//	public void getMsg(Session receiveSession, String msg) {
//		for (int i = 0; i < session.size(); i++) {
//			if (!receiveSession.getId().equals(session.get(i).getId())) {
//				try {
//					session.get(i).getBasicRemote().sendText("상대 : " + msg);
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//			}else {
//				try {
//					session.get(i).getBasicRemote().sendText("나 : "+msg);
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//			}
//		}
//	}
//}
//
//
//
//
//
//
//
//
//
//
//
