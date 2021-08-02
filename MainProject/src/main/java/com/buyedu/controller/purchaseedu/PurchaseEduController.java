package com.buyedu.controller.purchaseedu;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.buyedu.domain.Academy;
import com.buyedu.domain.Edu;
import com.buyedu.domain.Page;
import com.buyedu.domain.PurchaseEdu;
import com.buyedu.domain.Search;
import com.buyedu.domain.User;
import com.buyedu.service.academy.AcademyService;
import com.buyedu.service.edu.EduService;
import com.buyedu.service.user.UserService;
import com.buyedu.util.UserUtil;

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
	
	// 페이지 버튼의 끝이 5의 배수이다.
	@Value("5")
	int pageUnit;
	
	// 한 페이지에 보여줄 개수
	@Value("5")
	int pageSize;
	
	// 학생, 학부모가 수업 구매를하면 결제정보를 디비에 담고 구매목록으로 네비게이터
	@RequestMapping ( value = "addPurchaseEduUid", method=RequestMethod.GET )
	public String addPurchaseEduUid( @RequestParam("eduNo") int eduNo ,
										@RequestParam("userNo") int userNo , 
										@RequestParam("uid") String uid) throws Exception {
		
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
	
	// 학생, 학부모가 자신이 구매한 수업의 목록을 보여주는 메소드
	@RequestMapping ( "listPurchaseEdu" )
	public String listPurchaseEdu( @ModelAttribute("search") Search search , 
									@RequestParam("userNo") int UserNo , Model model) throws Exception{
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setSearchUserNo(UserNo);
		
		Map<String , Object> map= eduService.getPurchaseEduList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		System.out.println("listPurchaseEdu End");
		
		return "/purchase/listPurchaseEdu";
	}
	
	// 원장이 자신의 학원에 등록된 수업을 구매한 구매자의 목록을 보여주는 메소드
	@RequestMapping ( "listPurchaseAcademy" )
	public String listPurchaseAcademy( @ModelAttribute("search") Search search ,
										@RequestParam("academyCode") String academyCode , Model model) throws Exception{
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setSearchAcademyCode(academyCode);
		
		User user = UserUtil.user();
		Academy academy = acaService.getAcademy(academyCode);
		
		Map<String , Object> map= eduService.getPurchaseAcademyList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		Map<String, Object> map2 = acaService.getAcademyCodeList(user.getUserNo());
		
		model.addAttribute("list", map2.get("list"));
		model.addAttribute("purchaseList", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("academy", academy);
		
		return "/purchase/listPurchaseAcademy";
	}

}
