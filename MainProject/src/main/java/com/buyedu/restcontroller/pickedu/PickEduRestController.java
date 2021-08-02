package com.buyedu.restcontroller.pickedu;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.buyedu.domain.PickEdu;
import com.buyedu.domain.User;
import com.buyedu.service.academy.AcademyService;
import com.buyedu.service.edu.EduService;
import com.buyedu.service.user.UserService;
import com.buyedu.util.UserUtil;

@RestController
@RequestMapping("/pickedu/*")
public class PickEduRestController {
	
	@Autowired
	UserService userService;
	@Autowired
	EduService eduService;
	@Autowired
	AcademyService acaService;
	
	public PickEduRestController() {
		System.out.println(this.getClass());
	}
	
	// 페이지 버튼의 끝이 5의 배수이다.
	@Value("5")
	int pageUnit;
	
	// 한 페이지에 보여줄 개수
	@Value("4")
	int pageSize;
	
	// 관심수업을 등록할 때 사용되는 메소드
	@PostMapping( "json/addPickEdu/{eduNo}/{acaCode}" )
	public String addPickEdu( @PathVariable("eduNo") int eduNo, 
								@PathVariable("acaCode") String academyCode) throws Exception {
		
		User user = UserUtil.user();
		
		PickEdu pick = new PickEdu();
		
		pick.setEduNo(eduNo);
		pick.setPicker(user);
		
		System.out.println("확인1차 :: "+pick);
		
		PickEdu testPick = eduService.getPickNo(pick);
		
		if( testPick == null ) {
			pick.setPickCheck("1");
			pick.setPickAcademy( acaService.getAcademy(academyCode) );
			pick.setPicker( userService.getUser(user.getEmail()) );
			pick.setEduNo(eduNo);
			
			eduService.addPickEdu(pick);
			PickEdu asd = eduService.getPickEdu(pick.getPickNo());
			
			System.out.println("확인 2차 :: "+asd);
			
			return "관심수업이 등록되었습니다.";
		} else {
			return "이미 관심수업에 등록된 수업입니다.";
		}
		
	}
	
	// 관심수업을 삭제할 때 사용되는 메소드
	@PostMapping( "json/deletePickEdu/{eduNo}" )
	public int deletePickEdu( @PathVariable int eduNo, HttpServletRequest request ) throws Exception {
		
		return eduService.deletePickEdu(eduNo);
		
	}

}
