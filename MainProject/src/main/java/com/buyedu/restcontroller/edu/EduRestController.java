package com.buyedu.restcontroller.edu;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.buyedu.domain.Edu;
import com.buyedu.domain.Page;
import com.buyedu.domain.Search;
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
	
	@Value("5")
	int pageUnit;
	
	@Value("6")
	int pageSize;
	
	@PostMapping( "json/deleteEdu/{eduNo}" )
	public int deletePickEdu( @PathVariable int eduNo, HttpServletRequest request ) throws Exception {
		
		System.out.println(" /json/deleteEdu : 시작 ");
		
		System.err.println(eduNo);
		
		eduService.deletePickEdu(eduNo);
		
		return eduService.deleteEdu(eduNo);
		
	}
	
	@RequestMapping( value="/json/listEdu" )
	public String listEdu( @ModelAttribute("search") Search search , 
							@ModelAttribute("edu") Edu edu , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/edu/listEdu : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map= eduService.getEduList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.err.println(map);
		
		// Model 怨� View �곌껐
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		System.out.println("listEdu End");
		
		return "/edu/listEdu";
	}

}
