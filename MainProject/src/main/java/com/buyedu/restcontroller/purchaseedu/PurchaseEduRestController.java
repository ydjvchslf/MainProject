package com.buyedu.restcontroller.purchaseedu;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.buyedu.service.academy.AcademyService;
import com.buyedu.service.edu.EduService;
import com.buyedu.service.user.UserService;

public class PurchaseEduRestController {
	
	@Autowired
	UserService userService;
	@Autowired
	EduService eduService;
	@Autowired
	AcademyService acaService;
	
	public PurchaseEduRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("5")
	int pageUnit;
	
	@Value("4")
	int pageSize;

}
