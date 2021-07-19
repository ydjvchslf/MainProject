package com.buyedu.restcontroller.academy;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.buyedu.domain.Academy;
import com.buyedu.service.academy.AcademyService;

@Controller
@RequestMapping("/academy/*")
public class AcademyRestController {

	@Autowired
	private AcademyService academyService;
	
	public AcademyRestController() {
		System.out.println(this.getClass());
	}
	
	@ResponseBody
	@RequestMapping(value = "json/modifyhistory/{academyCode}", method = RequestMethod.POST)
	private String history(HttpServletRequest httpRequest,@PathVariable String academyCode) throws Exception{
		
		System.out.println("(수정 실적)json 으로 받은 academyCode"+academyCode);
		
		String history = httpRequest.getParameter("history");
		
		Academy academy = new Academy();
		
		academy.setAcademyHistory(history);
		
		System.out.println("수정 된 학원 실적"+history);
		
		//academyService.updateAcademyHistory(academy);
		
		
		return history;
	}
	

}
