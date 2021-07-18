package com.buyedu.restcontroller.academy;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.buyedu.domain.Academy;
import com.buyedu.service.academy.AcademyService;

@RestController
@RequestMapping("/academy/*")
public class AcademyRestController {

	@Autowired
	private AcademyService academyService;
	
	public AcademyRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value = "json/getacademy/{academyCode}", method = RequestMethod.GET)
	public Academy academy(@PathVariable String academyCode) throws Exception{
		Academy academy = academyService.getAcademy(academyCode);
		
		return academy;
	}

	@ResponseBody
	@RequestMapping(value = "json/updateIntro/{academyCode}", method = RequestMethod.POST)
	private String history(HttpServletRequest httpRequest,@PathVariable String academyCode) throws Exception{
		
		System.out.println("(수정 실적)json 으로 받은 academyCode"+academyCode);
		
		String intro = httpRequest.getParameter("intro");
		
		Academy academy = new Academy();
		
		academy.setAcademyHistory(intro);
		
		System.out.println("수정 된 학원 소개"+intro);
		
		//academyService.updateAcademyHistory(academy);
		
		
		return intro;
	}
	

}
