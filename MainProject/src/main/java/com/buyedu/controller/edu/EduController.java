package com.buyedu.controller.edu;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.buyedu.domain.Academy;
import com.buyedu.domain.Edu;
import com.buyedu.domain.Page;
import com.buyedu.domain.Search;
import com.buyedu.domain.User;
import com.buyedu.service.academy.AcademyService;
import com.buyedu.service.edu.EduService;
import com.buyedu.service.user.UserService;

@Controller
@RequestMapping("/edu/*")
public class EduController {
	
	@Autowired
	private EduService eduService;
	@Autowired
	private UserService userService;
	@Autowired
	private AcademyService acaService;
	
	public EduController() {
		System.out.println(this.getClass());
	}
	
	@Value("5")
	int pageUnit;
	
	@Value("6")
	int pageSize;
	
	@RequestMapping ( value = "addEdu", method=RequestMethod.GET )
	public String addEduView(@RequestParam String academyCode, Model model) throws Exception {
		
		System.out.println(academyCode);
		
		// 여기 모델 추가
		model.addAttribute("code",academyCode);
		
		System.out.println("/edu/addEdu : GET ");
		
		return "/edu/addEduView";
	}
	
	@RequestMapping ( value = "addEdu", method=RequestMethod.POST )
	public String addEdu( @ModelAttribute("edu") Edu edu, 
							@RequestParam("academyCode") String acaCode , Model model, HttpServletRequest httpRequest ) throws Exception {
		
		String userEmail = ((User)httpRequest.getSession().getAttribute("user")).getEmail();   
		
		edu.setUser( userService.getUser(userEmail));
		edu.setAcademy( acaService.getAcademy(acaCode) );
		edu.setEduRest( edu.getEduMember() );
		
		if( edu.getEduState() == null ) {
			edu.setEduState("0");
		}
		
		System.out.println("/edu/addEdu : POST ");
		
		System.err.println(edu);
		
		eduService.addEdu(edu);
		
		return "forward:/edu/getEdu?eduNo="+edu.getEduNo();
	}
	
	@RequestMapping ("getEdu")
	public String getEdu( @RequestParam("eduNo") int eduNo, Model model ) throws Exception {
		
		System.out.println("/edu/getEdu : GET");
		
		Edu edu = eduService.getEdu(eduNo);
		
		System.err.println("get edu 테스트 :" + edu);
		
		model.addAttribute("edu", edu);
		
		return "/edu/getEdu";
	}
	
	@GetMapping ( "updateEdu" )
	public String updateEdu( @RequestParam("eduNo") int eduNo, Model model) throws Exception {
		
		System.out.println("/edu/updateEdu : GET");
		
		Edu edu = eduService.getEdu(eduNo);
		
		model.addAttribute("edu", edu);
		
		return "/edu/updateEduView";
	}
	
	@PostMapping ("updateEdu" )
	public String updateEdu( @ModelAttribute("edu") Edu edu, Model model ) throws Exception {
		
		System.out.println("/edu/updateEdu : POST");
		
		if( edu.getEduState() == null ) {
			edu.setEduState("0");
		}
		
		eduService.updateEdu(edu);
		
		return "forward:/edu/getEdu?eduNo="+edu.getEduNo();
	}
	
	@RequestMapping( value="listEdu" )
	public String listEdu( @ModelAttribute("search") Search search , 
							@ModelAttribute("edu") Edu edu , Model model ,
							@RequestParam("acaCode") String acaCode , HttpServletRequest request) throws Exception{
		
		System.out.println("/edu/listEdu : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		String role = ((User)request.getSession().getAttribute("user")).getRole();
		int userNo = ((User)request.getSession().getAttribute("user")).getUserNo();
		Academy academy = acaService.getAcademy(acaCode);
		
		search.setSearchRoleByEdu(role);
		search.setPageSize(pageSize);
		search.setSearchAcademyCode(acaCode);
		search.setSearchEduState(search.getSearchEduState());

		System.out.println("삭제하지말 것 =========== " + search.getSearchEduState() );
		
		Map<String , Object> map= eduService.getEduList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		Map<String, Object> map2 = acaService.getAcademyCodeList(userNo);
		
		model.addAttribute("list", map2.get("list"));
		model.addAttribute("eduList", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("academy", academy);
		
		System.out.println("listEdu End");
		
		return "/edu/listEdu";
	}
}
