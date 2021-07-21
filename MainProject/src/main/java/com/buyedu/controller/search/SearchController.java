package com.buyedu.controller.search;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.buyedu.domain.Academy;
import com.buyedu.domain.Search;
import com.buyedu.service.academy.AcademyService;

@Controller
@RequestMapping("/search/*")
public class SearchController {
	
	@Autowired
	public AcademyService academyService;
	
	@RequestMapping("searchAcademy")
	public String searchAcademy(Model model,
							@ModelAttribute("search") Search search)	throws Exception {
		
		System.out.println("searchAcademy");
		System.out.println(search);
		
		System.out.println(academyService.getSearchList(search));

		if(academyService.getSearchList(search).size() != 0) {
			
			model.addAttribute("list", academyService.getSearchList(search));
			model.addAttribute("lat", academyService.getSearchList(search).get(0).getAcademyLat());
			model.addAttribute("lng", academyService.getSearchList(search).get(0).getAcademyLng());		
		}
		
		
		return "search/searchList";
	}
	
	
	@RequestMapping("searchInfo")
	public String searchInfo(Model model,@RequestParam("academyCode") String academyCode)	throws Exception {
		
		System.out.println("searchInfo 에서 받은 academyCode : " + academyCode);
		
		Academy academy = academyService.getAcademy(academyCode);
		
		model.addAttribute("academy", academy);
		
		return "search/searchInfo";
	}
	

}
