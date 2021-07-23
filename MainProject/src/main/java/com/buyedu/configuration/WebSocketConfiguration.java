//package com.buyedu.configuration;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
//import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
//import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
//
//@Configuration
//@EnableWebSocketMessageBroker
//// 웹소켓 서버 사용 설정
//public class WebSocketConfiguration implements WebSocketMessageBrokerConfigurer{
//
//	@Override
//	// connection
//	public void registerStompEndpoints(StompEndpointRegistry registry) {
//		registry.addEndpoint("/").setAllowedOrigins("*").withSockJS();
//	}
//	
//}
