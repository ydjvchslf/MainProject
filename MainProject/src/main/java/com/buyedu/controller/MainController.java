package com.buyedu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.buyedu.domain.Search;
import com.buyedu.service.academy.AcademyService;

// 여기는 네비게인션 담당 컨트롤 임당

@Controller
@RequestMapping("/main/*")
public class MainController {
	
	@Autowired
	public AcademyService academyService;
	
	@RequestMapping("userMain")
	public String userMain() throws Exception {
		
		return "userMain";
	}
	
	@RequestMapping("academyMain")
	public String academyMain() throws Exception {
		
		return "academyMain";
	}

	@RequestMapping("adminMain")
	public String adminMain() throws Exception {
		
		return "adminMain";
	}
}
