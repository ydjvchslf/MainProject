package com.buyedu.controller.complain;


import java.util.List;


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


@Controller

@RequestMapping("/complain/*")
public class ComplainController {
	
	@Autowired
	private ComplainService complainService;
	
	@Value("5")
	int pageUnit;
	
	@Value("10")
	int pageSize;
	
	@RequestMapping( value="addComplainView", method=RequestMethod.GET)
	public String addComplain(@ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception {
		System.out.println("애드컴플레인겟 시작");
		

		
		
		return "/complain/addComplainView";
	}
	
	@RequestMapping (value="addComplain", method=RequestMethod.POST)
	public String addComplain(@ModelAttribute("complain") Complain complain , @ModelAttribute("uesr") User user ,  HttpServletRequest httpRequest) throws Exception {
		
		System.out.println("애드컴플레인포스트 시작");
		
		int userNo = ((User)httpRequest.getSession().getAttribute("user")).getUserNo();
		System.out.println(userNo);
		

		user.setUserNo(userNo);
		complain.setComplainUserNo(user);
		
		System.out.println("Complain :" + complain);
		
		
		return "redirect:/complain/listComplain?complainNo="+complain.getComplainNo();
	}
	
	@RequestMapping (value = "updateComplain", method=RequestMethod.GET)
	public String updateComplain(@RequestParam("complainNo") int complainNo , Model model , HttpServletRequest request) throws Exception {
		
		int complain = complainService.getComplain(complainNo);
		
		
		model.addAttribute("complain",complain);
		System.out.println("컴플레인"+complain);
		
		return "/complain/updateComplainView";
	}
	
	@RequestMapping( value="updateComplain", method=RequestMethod.POST)
	public String updateComplain( @ModelAttribute("complainNo") Complain complain , HttpServletRequest request) throws Exception{
		
		
		complainService.updateComplain(complain);
		
		
		return "redirect:/complain/getComplain?complainNo="+complain.getComplainNo();
		
	}
	
	@RequestMapping (value = "getComplain" , method=RequestMethod.GET)
	public String getComplain (@RequestParam("complainNo") int complainNo, Model model , HttpServletRequest request) throws Exception {
		System.out.println("컴플레인넘버 : "+complainNo);
		int complain = complainService.getComplain(complainNo);
		
		int userNo = ((User)request.getSession().getAttribute("user")).getUserNo();  
		//String name = ((User)httpRequest.getSession().getAttribute("user")).getName();

		
		
		model.addAttribute("complain" , complain);
		model.addAttribute("userNo", userNo);
		System.out.println(userNo);
		System.out.println(complain);
		
		
		return "/complain/getComplain";
	}
	
	@RequestMapping (value="listComplain")
	public String listComplain(@ModelAttribute("search") Search search ,@ModelAttribute("complain") Complain complain ,  Model model , HttpServletRequest request ) throws Exception{
		
		if(search.getCurrentPage() ==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		System.out.println("서치 :"+search);
		
		//System.out.println("컴플레인넘버 : "+complainNo);
		System.out.println("터지기 1초전 ");
		int complainNo = ((Complain)request.getAttribute("complainNo")).getComplainNo();
		System.err.println("컴플레인넘버 : "+complainNo);
	
		
		
		System.out.println("여기서 터지냐..?22222");
		
		
		List<Complain> list = complainService.getComplainList(search);
		System.out.println("여기서터지나 3333333");
		int totalCount = list.get(0).getTotalCount();
		Page resultPage = new Page (search.getCurrentPage(),totalCount,pageUnit,pageSize);
		System.out.println("여기서터지나 44444444");

			
		
		model.addAttribute("complainNo" , complainNo);
		model.addAttribute("list",list);
		model.addAttribute("resultPage" , resultPage);
		model.addAttribute("search",search);
		model.addAttribute("complain" , complain);
		
		System.err.println(list);
		
	
		return "/complain/listComplain";
	}
	
	
	
	

}
