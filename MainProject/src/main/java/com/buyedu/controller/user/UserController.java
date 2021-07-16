package com.buyedu.controller.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.buyedu.domain.Academy;
import com.buyedu.domain.Search;
import com.buyedu.domain.User;
import com.buyedu.service.academy.AcademyService;
import com.buyedu.service.user.UserService;
import com.buyedu.domain.Page;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	private static final String User = null;
	@Autowired
	private UserService userService;
	
	@Autowired
	private AcademyService academyService;
	
	public UserController(){
		System.out.println(this.getClass());
	}
	
	@Value("5")
	int pageUnit;
	
	@Value("10")
	int pageSize;
	
	
	@RequestMapping( value="addUser", method=RequestMethod.GET )
	public String addUser() throws Exception{
	
		System.out.println("/user/addUser : GET");
		
		return "/user/addUserView";
	}
	
	@RequestMapping( value="addUser", method=RequestMethod.POST )
	public String addUser( @ModelAttribute("user") User user ) throws Exception {

		System.out.println("/user/addUser : POST");
		//Business Logic
		userService.addUser(user);
		
		return "/user/loginView";
	}
	
	
	@RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser( @RequestParam("email") String email , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUser(email);
		// Model 과 View 연결
		model.addAttribute("user", user);
		
		System.err.println(user);
		
		return "/user/getUser";
	}
	
	
	@RequestMapping( value="updateUser", method=RequestMethod.GET )
	public String updateUser( @RequestParam("email") String email , Model model , HttpSession session ) throws Exception{

		System.out.println("/user/updateUser : GET");
		//Business Logic
		User user = userService.getUser(email);
		// Model 과 View 연결
		model.addAttribute("user", user);
		
		session.setAttribute("user", user);
		
		System.err.println(user);
		
		return "/user/updateUser";
	}
	
	
	@RequestMapping( value="updateUser", method=RequestMethod.POST )
	public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session ) throws Exception{

		System.out.println("/user/updateUser : POST");
		
		//Business Logic
		userService.updateUser(user);
		
		String sessionId=((User)session.getAttribute("user")).getEmail();
		
		if(sessionId.equals(user.getEmail())){
			session.setAttribute("user", user);
		}
		
		return "/user/getUser";
	}
	
	
	@RequestMapping( value="updatePassword", method=RequestMethod.GET )
	public String updatePassword( @RequestParam("email") String email , Model model , HttpSession session ) throws Exception{

		System.out.println("/user/updatePassword : GET");
		
		User user = userService.getUser(email);
		
		session.setAttribute("user", user);
		
		System.err.println("세션저장된 user ==> " + user);
		
		model.addAttribute("user", user);
		
		System.out.println( "세션저장된 유저 =>" + session.getAttribute("user") );
		
		System.out.println("비번변경화면으로 단순 네비게이션");
		
		return "/user/updatePassword";
	}
	
	@RequestMapping( value="updatePassword", method=RequestMethod.POST )
	public String updatePassword( @ModelAttribute("user") User user , Model model , HttpSession session ) throws Exception{

		System.out.println("/user/updatePassword : POST");
		
		User dbUser = (User)session.getAttribute("user");
		
		System.err.println("세션저장된 user==> " + dbUser);
		
		userService.updatePassword(dbUser);
		
		session.setAttribute("user", dbUser);
		
		model.addAttribute("user", dbUser);
		
		System.out.println("비번 변경완료->정보조회 화면으로 네비게이션");
		
		return "/user/getUser";
	}
	
	@RequestMapping( value="outUser", method=RequestMethod.GET )
	public String outUser( @RequestParam("email") String email , Model model , HttpSession session ) throws Exception{

		System.out.println("/user/outUser : GET");
		
		User user = userService.getUser(email);
		
		session.setAttribute("user", user);
		
		System.err.println("탈퇴하는 user => " + user);
		
		model.addAttribute("user", user);
		
		System.out.println("회원탈퇴 단순 네비게이션");
		
		return "/user/outUser";
	}
	
	
	@RequestMapping( value="outUser", method=RequestMethod.POST )
	public String outUser( HttpSession session ) throws Exception{

		System.out.println("/user/outUser : POST");
		
		User dbUser = (User)session.getAttribute("user");
		
		System.out.println(dbUser);
		
		userService.outUser(dbUser);
		
		System.err.println("탈퇴신청한 User=> " + dbUser);
		
		session.invalidate();
		
		System.out.println("~~회원탈퇴 끝~~");
		
		return "/user/loginView";
	}
	
	
	@RequestMapping( value="findPassword", method=RequestMethod.GET )
	public String findPassword() throws Exception{
		
		System.out.println("/user/findPassword : GET");
		
		System.out.println("비밀번호 찾기 단순 네비게이션");
		
		return "/user/findPassword";
	}
	
	
	
	@RequestMapping( value="returnUser", method=RequestMethod.GET )
	public String returnUser() throws Exception{

		System.out.println("/user/returnUser : GET");
		
		System.out.println("계정복구화면으로 단순 네비게이션");
		
		return "/user/returnUser";
	}

	
	@RequestMapping( value="findEmail", method=RequestMethod.GET )
	public String findEmail() throws Exception{

		System.out.println("/user/findEmail : GET");
		
		System.out.println("Email 찾기 화면으로 단순 네비게이션");
		
		return "/user/findEmail";
	}
	
	
	
	@RequestMapping( value="findEmail", method=RequestMethod.POST )
	public String findEmail( HttpSession session ) throws Exception{
		
		System.out.println("/user/findEmail : GET");
	
		System.out.println("Email 찾기 화면으로 단순 네비게이션");
		
		return "/user/findEmail";
	}
	
	
	
	
	//index에서 어케 jsp로 가는지 아직 해결중, 지금은 이렇게
	@RequestMapping( "loginView" )
	public String loginView() throws Exception{
		
		System.out.println("=======login View========");

		return "/user/userIndex";
	}
	
	
	@RequestMapping( value="login", method=RequestMethod.GET )
	public String login() throws Exception{
		
		System.out.println("/user/logon : GET");

		return "/user/loginView";
	}
	
	
	@RequestMapping( value="login", method=RequestMethod.POST )
	public String login(@ModelAttribute("user") User user , Model model, HttpSession session ) throws Exception{
		
		System.out.println("/user/login : POST");
		//Business Logic
		
		System.out.println("로긴한 user=>" + user);
		
		User dbUser=userService.getUser(user.getEmail());
		
		System.out.println("겟유저 가져온 dbUser=>" + dbUser);
		
		if( user.getPassword().equals(dbUser.getPassword())){
			
			session.setAttribute("user", dbUser);
			model.addAttribute("user", user);
			
			if ( dbUser.getRole().equals("academy") ) {
				
				Map<String, Object> map = academyService.getAcademyCode(dbUser.getUserNo());
	            
	            model.addAttribute("list",map.get("list"));
				
				return "/academy/selectAcademy";
			}
			
			return "userMain";
			
		}else {
			
			model.addAttribute("message", "회원정보가 맞지 않습니다.");
			return "/user/loginView";
		}
	}
		
	
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/user/logout : POST");
		
		session.invalidate();
		
		return "index";
	}
	
	
	 
	@RequestMapping( value="listUser" )
	public String listUser( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/user/listUser : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		System.err.println("Search => " + search);
		
//		System.out.println("searchRole 잘받았나==>" + search.getSearchRole() );
		
		// Business logic 수행
		Map<String , Object> map=userService.getUserList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		System.out.println( "써치 키워드->" + search.getSearchKeyword() );
		
		System.out.println("listUser 끝");
		
		return "/user/listUser";
	}
	
	
	
	// Connect 
	
	@RequestMapping( value="listConnect", method=RequestMethod.GET )
	public String listConnect( HttpSession session, Model model ) throws Exception{
	
		System.out.println("/user/myAcademy : GET");
		
		System.out.println(session.getAttribute("user"));
		
		model.addAttribute( "user", session.getAttribute("user") );
		
		System.out.println("내가다니는학원 단순 네비게이션");
		
		return "/user/listConnect";
	}
	
}
