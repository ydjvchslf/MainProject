package com.buyedu.controller.complain;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.buyedu.domain.Board;
import com.buyedu.domain.Complain;
import com.buyedu.domain.Page;
import com.buyedu.domain.Search;
import com.buyedu.domain.User;
import com.buyedu.service.complain.ComplainService;
import com.buyedu.util.UserUtil;

@Controller
@RequestMapping("/complain/*")
public class ComplainController {
	
	@Autowired
	private ComplainService complainService;
	
	@Value("5")
	int pageUnit;
	
	@Value("10")
	int pageSize;
	
	@RequestMapping(value = "getComplainList")
	public String getComplainList(@ModelAttribute("search") Search search, Model model, HttpServletRequest request) throws Exception {
		System.out.println("/complain/getComplainList");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = complainService.getComplainList(search);
		
		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue()
				,pageUnit,pageSize);
		
		model.addAttribute("comlist", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		
		
		System.out.println("complainList map = "+map);
		
		return "complain/listComplain";
	}

}
