package com.buyedu.util;

import java.io.File;

public class test {

	public static void main(String[] args) {

		String fileRoot = "C:\\Users\\woan2\\git\\MainProject\\MainProject\\src\\main\\resources\\static\\image\\";
		
		File file = new File(fileRoot+"67b52c97-a9b8-4a3a-a668-416a6872ac0d.jpg");
		
		if (file.exists()) {
			if (file.delete()) {
				System.out.println("파일 삭제 성공!!");
			}else {
				System.err.println("파일 삭제 실패 ㅜ.ㅜ");
			}
		} else {
			System.err.println("폴더 안에 파일이 존재하지 않습니다.");
		}
		
		

	}

}
