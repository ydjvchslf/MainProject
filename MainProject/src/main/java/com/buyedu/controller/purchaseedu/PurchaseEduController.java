package com.buyedu.controller.purchaseedu;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.buyedu.domain.Edu;
import com.buyedu.domain.Page;
import com.buyedu.domain.PickEdu;
import com.buyedu.domain.PurchaseEdu;
import com.buyedu.domain.Search;
import com.buyedu.domain.User;
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
		
		PurchaseEdu purchase = new PurchaseEdu();
		
		purchase.setBuyer( userService.getUserByUserNo(userNo) );
		purchase.setPurchaseEdu( eduService.getEdu(eduNo) );
		purchase.setPurchaseAcademy( acaService.getAcademy( acaService.getAcademyCodeforEdu(eduNo) ) );
		purchase.setPurchaseUid(uid);
		
		System.err.println("완벽한 디버깅이어야 하는데........");
		
		eduService.addPurchaseEdu(purchase);
		
		return "edu/listEdu";
	}
	
	@RequestMapping ( "listPurchaseEdu" )
	public String listPickEdu( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/pickedu/listPickEdu : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map= eduService.getPickEduList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		System.out.println("listPickEdu End");
		
		return "/pickedu/listPickEdu";
	}

}
