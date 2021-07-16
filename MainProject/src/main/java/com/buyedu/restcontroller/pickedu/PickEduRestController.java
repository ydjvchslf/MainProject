package com.buyedu.restcontroller.pickedu;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.buyedu.domain.PickEdu;
import com.buyedu.domain.User;
import com.buyedu.service.academy.AcademyService;
import com.buyedu.service.edu.EduService;
import com.buyedu.service.user.UserService;

@RestController
@RequestMapping("/pickedu/*")
public class PickEduRestController {
	
	@Autowired
	UserService userService;
	@Autowired
	EduService eduService;
	@Autowired
	AcademyService acaService;
	
	public PickEduRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("5")
	int pageUnit;
	
	@Value("4")
	int pageSize;
	
	@PostMapping( "json/addPickEdu/{eduNo}/{acaCode}" )
	public int addPickEdu( @PathVariable("eduNo") int eduNo, 
								@PathVariable("acaCode") String academyCode, HttpServletRequest request ) throws Exception {
		
		String userEmail = ((User)request.getSession().getAttribute("user")).getEmail();
		
		System.out.println(" /json/addPickEdu : 시작 ");
		
		System.err.println(eduNo);
		System.err.println(academyCode);
		
		PickEdu pick = new PickEdu();
		
		pick.setPickAcademy( acaService.getAcademy(academyCode) );
		pick.setPicker( userService.getUser(userEmail) );
		pick.setEduNo(eduNo);
		
		return eduService.addPickEdu(pick);
		
	}
	
	@PostMapping( "json/deletePickEdu/{eduNo}" )
	public int deletePickEdu( @PathVariable int eduNo, HttpServletRequest request ) throws Exception {
		
		System.out.println(" /json/deletePickEdu : 시작 ");
		
		System.err.println(eduNo);
		
		return eduService.deletePickEdu(eduNo);
		
	}

}
