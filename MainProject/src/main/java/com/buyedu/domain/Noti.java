package com.buyedu.domain;

import lombok.Data;

@Data
public class Noti {
	
	private User user;
	private Academy academy;
	private Board board;
	
	private int notiNo;
	private String notiContent;
	private String notiDate;
}
