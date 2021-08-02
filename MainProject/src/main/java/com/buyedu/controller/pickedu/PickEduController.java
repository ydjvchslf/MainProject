package com.buyedu.controller.pickedu;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.buyedu.domain.Page;
import com.buyedu.domain.Search;
import com.buyedu.service.academy.AcademyService;
import com.buyedu.service.edu.EduService;
import com.buyedu.service.user.UserService;

@Controller
@RequestMapping("/pickedu/*")
public class PickEduController {
	
	@Autowired
	UserService userService;
	@Autowired
	EduService eduService;
	@Autowired
	AcademyService acaService;
	
	public PickEduController() {
		System.out.println(this.getClass());
	}
	
	// 페이지 버튼의 끝이 5의 배수이다.
	@Value("5")
	int pageUnit;
	
	// 한 페이지에 보여줄 개수
	@Value("5")
	int pageSize;
	
	// 관심수업으로 등록한 수업의 목록을 보여주는 메소드
	@RequestMapping ( "listPickEdu" )
	public String listPickEdu( @ModelAttribute("search") Search search , 
								@RequestParam("userNo") int userNo , Model model) throws Exception{
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setSearchUserNo(userNo);		
		
		Map<String , Object> map= eduService.getPickEduList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "/pickedu/listPickEdu";
	}

}
