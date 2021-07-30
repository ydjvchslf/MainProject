package com.buyedu.restcontroller.purchaseedu;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.buyedu.domain.PurchaseEdu;
import com.buyedu.service.academy.AcademyService;
import com.buyedu.service.edu.EduService;
import com.buyedu.service.user.UserService;

@RestController
@RequestMapping("/purchaseedu/*")
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
	
	@PostMapping( "json/deletePurchaseEdu/{userNo}/{eduNo}" )
	public int deletePickEdu( @PathVariable("userNo") int userNo ,
								@PathVariable("eduNo") int eduNo , HttpServletRequest request ) throws Exception {
		
		System.out.println(" /json/deletePurchaseEdu : 시작 ");
		
		PurchaseEdu purchaseEdu = new PurchaseEdu();
		
		purchaseEdu.setUserNo(userNo);
		purchaseEdu.setEduNo(eduNo);
		
		System.err.println(userNo);
		System.out.println(eduNo);
		
		return eduService.deletePurchaseEdu(purchaseEdu);
	}

}
