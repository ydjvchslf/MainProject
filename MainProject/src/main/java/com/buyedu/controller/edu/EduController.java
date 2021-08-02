package com.buyedu.controller.edu;

import java.util.Map;

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
import com.buyedu.util.UserUtil;

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
	
	// 페이지 버튼의 끝이 5의 배수이다.
	@Value("5")
	int pageUnit;
	
	// 한 페이지에 보여줄 개수
	@Value("5")
	int pageSize;
	
	// 수업 등록화면으로 가는 단순 네비게이터
	@RequestMapping ( value = "addEdu", method=RequestMethod.GET )
	public String addEduView(@RequestParam String academyCode, Model model) throws Exception {
		
		User user = UserUtil.user();
		Academy academy = acaService.getAcademy(academyCode);
		Map<String, Object> map2 = acaService.getAcademyCodeList(user.getUserNo());
		
		model.addAttribute("list", map2.get("list"));
		model.addAttribute("code", academy);
		
		return "/edu/addEduView";
	}
	
	// 수업등록시 입력한 정보를 디비에 담은 후 수업 상세보기화면으로 네비게이터
	@RequestMapping ( value = "addEdu", method=RequestMethod.POST )
	public String addEdu( @ModelAttribute("edu") Edu edu, 
							@RequestParam("academyCode") String acaCode , Model model) throws Exception {
		
		User user = UserUtil.user();
		
		edu.setUser( userService.getUser(user.getEmail()));
		edu.setAcademy( acaService.getAcademy(acaCode) );
		edu.setEduRest( edu.getEduMember() );
		
		if( edu.getEduState() == null ) {
			edu.setEduState("0");
		}
		
		eduService.addEdu(edu);
		
		Map<String, Object> map2 = acaService.getAcademyCodeList(user.getUserNo());
		
		model.addAttribute("list", map2.get("list"));
		
		return "forward:/edu/getEdu?eduNo="+edu.getEduNo();
	}
	
	// 상세보기화면으로 가는 단순네비게이터
	@RequestMapping ("getEdu")
	public String getEdu( @RequestParam("eduNo") int eduNo, 
						  @RequestParam("academyCode") String academyCode , Model model) throws Exception {
		
		Edu edu = eduService.getEdu(eduNo);
		Academy academy = acaService.getAcademy(academyCode);
		User user = UserUtil.user();
		
		Map<String, Object> map2 = acaService.getAcademyCodeList(user.getUserNo());
		
		model.addAttribute("list", map2.get("list"));		
		model.addAttribute("edu", edu);
		model.addAttribute("academy", academy);
		
		return "/edu/getEdu";
	}
	
	// 수업수정 화면으로 가는 단순 네비게이터
	@GetMapping ( "updateEdu" )
	public String updateEdu( @RequestParam("eduNo") int eduNo , Model model) throws Exception {
		
		Edu edu = eduService.getEdu(eduNo);
		User user = UserUtil.user();
		
		Map<String, Object> map2 = acaService.getAcademyCodeList(user.getUserNo());
		
		model.addAttribute("list", map2.get("list"));
		model.addAttribute("edu", edu);
		
		return "/edu/updateEduView";
	}
	
	// 수정된 수업을 디비에 업데이트한 후 상세보기화면으로 네비게이터
	@PostMapping ("updateEdu" )
	public String updateEdu( @ModelAttribute("edu") Edu edu, Model model ) throws Exception {
		
		if( edu.getEduState() == null ) {
			edu.setEduState("0");
		}
		
		eduService.updateEdu(edu);
		String academyCode = acaService.getAcademyCodeforEdu(edu.getEduNo());
		
		return "forward:/edu/getEdu?eduNo="+edu.getEduNo()+"&academyCode="+academyCode;
	}
	
	// 등록된 수업의 목록을 보여주는 메소드
	@RequestMapping( value="listEdu" )
	public String listEdu( @ModelAttribute("search") Search search , 
							@ModelAttribute("edu") Edu edu , Model model ,
							@RequestParam("acaCode") String acaCode) throws Exception{
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		
		Academy academy = acaService.getAcademy(acaCode);
		User user = UserUtil.user();
		
		search.setSearchRoleByEdu(user.getRole());
		search.setPageSize(pageSize);
		search.setSearchAcademyCode(acaCode);
		search.setSearchEduState(search.getSearchEduState());

		Map<String , Object> map= eduService.getEduList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		Map<String, Object> map2 = acaService.getAcademyCodeList(user.getUserNo());
		
		model.addAttribute("list", map2.get("list"));
		model.addAttribute("eduList", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("academy", academy);
		
		return "/edu/listEdu";
	}
	
}
