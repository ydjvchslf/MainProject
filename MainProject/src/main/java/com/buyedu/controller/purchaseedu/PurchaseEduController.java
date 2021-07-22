package com.buyedu.controller.purchaseedu;

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

import com.buyedu.domain.Edu;
import com.buyedu.domain.Page;
import com.buyedu.domain.PurchaseEdu;
import com.buyedu.domain.Search;
import com.buyedu.service.academy.AcademyService;
import com.buyedu.service.edu.EduService;
import com.buyedu.service.user.UserService;

@Controller
@RequestMapping("/purchaseedu/*")
public class PurchaseEduController {
	
	@Autowired
	UserService userService;
	@Autowired
	EduService eduService;
	@Autowired
	AcademyService acaService;
	
	public PurchaseEduController() {
		System.out.println(this.getClass());
	}
	
	@Value("5")
	int pageUnit;
	
	@Value("4")
	int pageSize;
	
	@RequestMapping ( value = "addPurchaseEdu", method=RequestMethod.GET )
	public String addPurchaseEduView( @RequestParam("eduNo") int eduNo, Model model ) throws Exception {
		
		System.out.println("/purchase/addPurchaseEdu : GET ");
		
		Edu edu = eduService.getEdu(eduNo);
		
		model.addAttribute("edu", edu);
		
		return "/purchase/addPurchaseEduView";
	}
	
	@RequestMapping ( value = "addPurchaseEduUid", method=RequestMethod.GET )
	public String addPurchaseEduUid( @RequestParam("eduNo") int eduNo ,
										@RequestParam("userNo") int userNo , 
										@RequestParam("uid") String uid) throws Exception {
		
		System.out.println("/purchase/addPurchaseEduUid : GET");
		
		PurchaseEdu purchase = new PurchaseEdu();
		Edu edu = eduService.getEdu(eduNo);
		
		purchase.setBuyer( userService.getUserByUserNo(userNo) );
		purchase.setPurchaseEdu( edu );
		edu.setEduRest( edu.getEduRest() - 1);
		if ( edu.getEduRest() == 0 ) {
			edu.setEduState("2");
			eduService.updateEduRest(edu);
		} else {
			eduService.updateEduRest(edu);
		}
		purchase.setPurchaseAcademy( acaService.getAcademy( acaService.getAcademyCodeforEdu(eduNo) ) );
		purchase.setPurchaseUid(uid);
		
		eduService.addPurchaseEdu(purchase);
		
		return "forward:/purchaseedu/listPurchaseEdu";
	}
	
	@RequestMapping ( "listPurchaseEdu" )
	public String listPurchaseEdu( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/purchase/listPurchase : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map= eduService.getPurchaseEduList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		System.out.println("listPurchaseEdu End");
		
		return "/purchase/listPurchaseEdu";
	}
	
	@RequestMapping ( "listPurchaseAcademy" )
	public String listPurchaseAcademy( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/purchase/listPurchaseAcademy : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map= eduService.getPurchaseAcademyList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		System.out.println("listPurchaseAcademy End");
		
		return "/purchase/listPurchaseAcademy";
	}

}
