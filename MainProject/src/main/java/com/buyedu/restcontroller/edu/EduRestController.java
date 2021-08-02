package com.buyedu.restcontroller.edu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.buyedu.service.academy.AcademyService;
import com.buyedu.service.edu.EduService;
import com.buyedu.service.user.UserService;

@RestController
@RequestMapping("/edu/*")
public class EduRestController {
	
	@Autowired
	UserService userService;
	@Autowired
	EduService eduService;
	@Autowired
	AcademyService acaService;
	
	// 페이지 버튼의 끝이 5의 배수이다.
	@Value("5")
	int pageUnit;
	
	// 한 페이지에 보여줄 개수
	@Value("6")
	int pageSize;
	
	// 원장이 수업을 삭제할 때 사용되는 메소드
	@PostMapping( "json/deleteEdu/{eduNo}" )
	public int deletePickEdu( @PathVariable int eduNo) throws Exception {
		
		eduService.deletePickEdu(eduNo);
		
		return eduService.deleteEdu(eduNo);
	}
	
}