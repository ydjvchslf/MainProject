package com.buyedu.restcontroller.academy;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@RequestMapping(value = "json/modifyhistory", method = RequestMethod.POST)
	public String history(HttpServletRequest httpRequest) throws Exception{
		
		String history = httpRequest.getParameter("history");
		
		
		return history;
	}
	
}
