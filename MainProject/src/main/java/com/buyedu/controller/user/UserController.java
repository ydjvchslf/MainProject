package com.buyedu.controller.user;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.buyedu.domain.Academy;
import com.buyedu.domain.Connect;
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
	
	
	//Test용 
	@RequestMapping( value="tiles", method=RequestMethod.GET )
	public String test(Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/user/listUser : GET / POST");
		
		System.out.println("계정상태=> " + search.getSearchAccountState());
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		System.err.println("Search => " + search);
		
		System.out.println("searchRole 잘받았나==>" + search.getSearchRole() );
		
		List<String> roles = search.getSearchRole();
		List<String> states = search.getSearchAccountState();
		
		System.err.println(roles);
		System.err.println(states);
		
		model.addAttribute("roles", roles);
		model.addAttribute("states", states);
			
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
		
		return "/tiles/user/listUserTiles";
	}
	
	
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
		
		return "/user/loginViewTiles";
	}
	
	
	@RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser( HttpSession session, @RequestParam("email") String email , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUser(email);
		
		/*
		//간편로그인 유저가 내정보 누를시 에러 안내게 해야하는데...
		if ( user == null ) {
			
			System.out.println("이메일=>" +email);
			
			model.addAttribute("email", email);
	    	
	    	return "/user/getUser";
 			
		}
		*/
		
		List<Connect> list = userService.getConnectList(user.getUserNo());
		model.addAttribute("listAcademy", list);
		// Model 과 View 연결
		model.addAttribute("user", user);
		
		//재현이꺼추가
		Map<String, Object> map = academyService.getAcademyCodeList(user.getUserNo());
		model.addAttribute("list",map.get("list"));
		
		System.err.println(user);
		System.out.println(list);

		
		return "/user/getUser";
	}
	
	
	//sns간편로그인이 내정보 누를때 
	@RequestMapping( value="getUser/{email}", method=RequestMethod.GET )
	public String getUserNew( HttpSession session, @PathVariable String email , Model model ) throws Exception {
		
		System.out.println("새로추가한 메서드,,,");
		//Business Logic
		User user = userService.getUser(email);
		
		//간편로그인 유저가 내정보 또 누를시 에러 안내게 해야하는데...
		if ( user == null ) {
			
			System.out.println("이메일=>" +email);
			
			model.addAttribute("email", email);
	    	
	    	return "/user/getUser/"+email;
		}
		
		return null;
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
		
		return "/tiles/user/updateUserTiles";
	}
	
	
	@RequestMapping( value="updateUser", method=RequestMethod.POST )
	public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session ) throws Exception{

		System.out.println("/user/updateUser : POST");
		
		User dbUser = userService.getUserByUserNo(user.getUserNo());
		
		dbUser.setName(user.getName());
		dbUser.setPhone(user.getPhone());
		
		
		userService.updateUser(dbUser);
		
		String sessionEmail=((User)session.getAttribute("user")).getEmail();
		
		if(sessionEmail.equals(user.getEmail())){
			session.setAttribute("user", dbUser);
		}
		
		model.addAttribute("user", dbUser);
		
		return "/user/getUser";
	}
	
	
//	@RequestMapping( value="updatePassword", method=RequestMethod.GET )
//	public String updatePassword( @RequestParam("email") String email , Model model , HttpSession session ) throws Exception{
//
//		System.out.println("/user/updatePassword : GET");
//		
//		User user = userService.getUser(email);
//		
//		session.setAttribute("user", user);
//		
//		System.err.println("세션저장된 user ==> " + user);
//		
//		model.addAttribute("user", user);
//		
//		System.out.println( "세션저장된 유저 =>" + session.getAttribute("user") );
//		
//		System.out.println("비번변경화면으로 단순 네비게이션");
//		
//		return "/user/updatePasswordTiles";
//	}
	
	@RequestMapping( value="updatePassword", method=RequestMethod.POST )
	public String updatePassword( @ModelAttribute("user") User user , Model model , HttpSession session ) throws Exception{

		System.out.println("/user/updatePassword : POST");
		
		System.err.println(user.getEmail() + "///" + user.getPassword() );
		
		User user2 = userService.getUser(user.getEmail());
		
		System.out.println("비번변경 전 user==> "+user2);
		
		user2.setPassword(user.getPassword());
		
		userService.updatePassword(user2);
		
		System.out.println("비번변경 후 user==> "+ user2);
		
		session.setAttribute("user", user2);
		
		model.addAttribute("user", user2);
		
		System.out.println("비번 변경완료->정보조회 화면으로 네비게이션");
		
		//return "/user/getUser?email="+user2.getEmail();
		
		String getUserView = this.getUser(session, user.getEmail(), model);
		
		return getUserView;
	}
	
	@RequestMapping( value="outUser", method=RequestMethod.GET )
	public String outUser( @RequestParam("email") String email , Model model , HttpSession session ) throws Exception{

		System.out.println("/user/outUser : GET");
		
		User user = userService.getUser(email);
		
		session.setAttribute("user", user);
		
		System.err.println("탈퇴하는 user => " + user);
		
		model.addAttribute("user", user);
		
		System.out.println("회원탈퇴 단순 네비게이션");
		
		return "/tiles/user/outUserTiles";
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
		
		return "/user/loginViewTiles";
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
	
	
	//네이버 콜백jsp 이동
	@RequestMapping( value="callback" )
	public String callback() throws Exception{
		
		System.out.println("네이버 콜백jsp 단순 네비게이션");
		
		return "/user/callback";
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
		System.out.println("로그인 화면으로 단순 네비게이션");

		return "/user/loginViewTiles";
	}
	
	@RequestMapping( value="loginacademy", method=RequestMethod.GET )
	public String login( @RequestParam String email, Model model ) throws Exception{
		
		System.out.println("/user/logon : 학원에서 프로필선택으로 메인창");
		System.out.println("로그인 화면으로 단순 네비게이션");
		
		User dbUser=userService.getUser(email);
		
		Map<String, Object> map = academyService.getAcademyCodeList(dbUser.getUserNo());
		
		model.addAttribute("list", map.get("list"));
		
		System.out.println("겟유저 가져온 dbUser=>" + dbUser);
		
		return "academyMain";
	}
	
	
	@RequestMapping( value="snsLoginNotaccount", method=RequestMethod.GET )
	public String snsLoginNotaccount( @RequestParam String email ) throws Exception{
		
		System.out.println("/user/snsLoginNotaccount : 가입안한 SNS 로긴한 유저");
	
		return "userMain";
	}
	
	
	@RequestMapping( value="login", method=RequestMethod.POST )
	public String login(@ModelAttribute("user") User user , Model model, HttpSession session , HttpServletResponse res) throws Exception{
		
		System.out.println("/user/login : POST");
		//Business Logic
		
		System.out.println("로긴한 user=>" + user);
		
		User dbUser=userService.getUser(user.getEmail());
		
		System.out.println("겟유저 가져온 dbUser=>" + dbUser);
		
		if ( dbUser == null ) {
			
			model.addAttribute("message", "회원정보가 맞지 않습니다.");
			return "/user/loginViewTiles";
		}
		
		String accountState = dbUser.getAccountState();
		
		if ( accountState.equals("1") ) {
			
			model.addAttribute("message", "회원정보가 맞지 않습니다.");
			return "/user/loginViewTiles";
		}
		
		if( user.getPassword().equals(dbUser.getPassword()) ){
			
			session.setAttribute("user", dbUser);
			model.addAttribute("user", dbUser);
			
			System.out.println("if문 dbuser >"+dbUser);
			
			// 쿠키에 로그인 타입 값 설정
			Cookie ck = new Cookie("loginType", "normal");
			ck.setPath("/");
			res.addCookie(ck);
			
			List<Connect> list = userService.getConnectList(user.getUserNo());
			model.addAttribute("list", list);
			
			Cookie cookie = new Cookie("loginAccountType", "normal");
			cookie.setPath("/");
			res.addCookie(cookie);
			
			if ( dbUser.getRole().equals("academy") ) {
				
				Map<String, Object> map = academyService.getAcademyCodeList(dbUser.getUserNo());
	            
				System.out.println("2 if문 dbuser"+dbUser);
	            model.addAttribute("list",map.get("list"));
	            
				//model.addAttribute("user", dbUser);
	            System.out.println(map.get("list"));
	          //아카데미 화면
				String getUserView = this.getUser(session, user.getEmail(), model);
				
	         return getUserView;
				
			}
			
			//일반유저, 관리자 화면
			String getUserView = this.getUser(session, user.getEmail(), model);
			
			//return getUserView;
			return "/search/searchList";
			
		}else{
			
			model.addAttribute("message", "회원정보가 맞지 않습니다.");
			return "/user/loginViewTiles";
		
		}	
	}
	
	
	//sns로긴-> db없어서 회원가입창 이동
	@RequestMapping( value="snsAddUser", method=RequestMethod.GET )
	public String snsAddUser( @RequestParam("email") String email , Model model ) throws Exception{
	
		System.out.println("/user/addUser : GET (SNS 버전)");
		
		System.out.println("sns에서 가져온 email => " + email);
		
		model.addAttribute("snsEmail", email);
		
		System.out.println("SNS 버전 끝");
		
		return "/user/snsAddUserView";
	}
	
	
	
	//카카오 로그인
	@RequestMapping( value="/snsLogin/{email}" )
	public String snsLogin( @PathVariable String email, Model model, HttpSession session , HttpServletResponse res) throws Exception{
	    
		//session.invalidate();
		
		System.out.println("/user/snsLogin");
		
		System.err.println("패쓰받아온 email => "+email);
	        
	    User dbUser = userService.getUser(email);
	    
	 // 쿠키에 로그인 타입 값 설정
 		Cookie ck = new Cookie("loginType", "kakao");
 		ck.setPath("/");
 		res.addCookie(ck);
	    
	    //카카오 간편로그인
	    if( dbUser == null ){
	    	
	    	//변경전 시작
	    	Cookie cookie = new Cookie("loginAccountType", "sns");
	    	cookie.setPath("/");
	    	res.addCookie(cookie);
	    	
	    	model.addAttribute("mk", email);
	    	
	    	System.out.println("email=>" + email);
	    	
	    	return "/user/getUser";
	    	//변경전 끝
	    	
	    	
	    }else { //카카오 통합로그인
	    	
	    	Cookie cookie = new Cookie("loginAccountType", "total");
	    	cookie.setPath("/");
	    	res.addCookie(cookie);
	    	
	    	System.out.println("로긴한 user=>" + dbUser);
		        
	 	    session.setAttribute("user", dbUser);
	 	    model.addAttribute("user", dbUser);
	 	    
	 	    String accountState = dbUser.getAccountState();
	 	    
	 	    if (accountState.equals("1")) {
	 	    	
	 	    	model.addAttribute("message", "회원정보가 맞지 않습니다.");
	 			return "/user/loginView";
	 		}
	 	    
	 		if ( dbUser.getRole().equals("academy") ) {
	 			
	 			Map<String, Object> map = academyService.getAcademyCodeList(dbUser.getUserNo());
	             
	             model.addAttribute("list",map.get("list"));
	 			
	             String getUserView = this.getUser(session, email, model);
	 			
	 			return getUserView;
	 			
	 		}
	 		
	 		//String getUserView = this.getUser(session, email, model);
			
	 		return "/search/searchList";
		
	    }
	    
	   
	}
	
	
	//네이버 로그인
	@RequestMapping( value="naverLogin", method=RequestMethod.GET )
	public String naverLogin( @RequestParam String email, Model model, HttpSession session , HttpServletResponse res ) throws Exception{
		
		System.out.println("/user/naverLogin : GET");
		
		System.out.println("네이버 로긴으로 받아온 email=> "+email);
		
		int result = userService.checkEmail(email);
		
		Cookie ck = new Cookie("loginType", "naver");
		ck.setPath("/");
		res.addCookie(ck);
		
		//아이디 중복 없음 / 네이버 간편로그인
		if (result == 0) {
			
			Cookie cookie = new Cookie("loginAccountType", "sns");
			cookie.setPath("/");
			res.addCookie(cookie);
			
			model.addAttribute("email", email);
	    	
	    	return "/user/getUser";
			
		}else{//네이버 로그인 기존회원
			
			Cookie cookie = new Cookie("loginAccountType", "total");
			cookie.setPath("/");
			res.addCookie(cookie);
			
			User dbUser = userService.getUser(email);
		    
		    System.out.println("로긴한 user=>" + dbUser);
		    
		    String accountState = dbUser.getAccountState();
		    
		    if (accountState.equals("1")) {
		    	
		    	model.addAttribute("message", "회원정보가 맞지 않습니다.");
				return "/user/loginView";
			}
		        
		    session.setAttribute("user", dbUser);
		    
		    model.addAttribute("user", dbUser);
		    
		    // 쿠키에 로그인 타입 값 설정
			
				
				if ( dbUser.getRole().equals("academy") ) {
					
					Map<String, Object> map = academyService.getAcademyCodeList(dbUser.getUserNo());
		            
		            model.addAttribute("list",map.get("list"));
					
		            String getUserView = this.getUser(session, email, model);
					
					return getUserView;
					
				}
				
				//String getUserView = this.getUser(session, email, model);
				
				//return getUserView;
				
				return "/search/searchList";
			
		}
		
	}
	
		
	
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/user/logout : POST");
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	 
	@RequestMapping( value="listUser" )
	public String listUser( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/user/listUser : GET / POST");
		
		System.out.println("계정상태=> " + search.getSearchAccountState());
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		System.err.println("Search => " + search);
		
		System.out.println("searchRole 잘받았나==>" + search.getSearchRole() );
		
		List<String> roles = search.getSearchRole();
		List<String> states = search.getSearchAccountState();
		
		System.err.println(roles);
		System.err.println(states);
		
		model.addAttribute("roles", roles);
		model.addAttribute("states", states);
			
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
	
	
   @RequestMapping( value="deleteacademy", method=RequestMethod.GET )
   public String deleteaca( @RequestParam String email, Model model ) throws Exception{
      
      System.out.println("/user/deleteacademy : 학원에서 프로필삭제");
      
      User dbUser=userService.getUser(email);
      
      Map<String, Object> map = academyService.getAcademyCodeList(dbUser.getUserNo());
      
      model.addAttribute("list", map.get("list"));
      
      System.out.println("겟유저 가져온 dbUser=>" + dbUser);
      
      System.out.println("학원 프로필 삭제 끝");
      
      return "/academy/deleteAcademy";
   }
	
	
	
	// Connect 
	
	@RequestMapping( value="listConnect", method=RequestMethod.GET )
	public String listConnect( HttpSession session, Model model ) throws Exception{
	
		System.out.println("/user/myAcademy : GET");
		
		User user = (User)session.getAttribute("user");
		
		System.out.println("세션담긴 user=> "+ user );
		
		List<Connect> list = userService.getConnectList(user.getUserNo());

		System.err.println("리스트에 담은 Connect => "+list);
		
			
		model.addAttribute("list", list);
		model.addAttribute( "user", session.getAttribute("user") );
		
		System.out.println("내가다니는학원 단순 네비게이션");
		
		return "/tiles/user/getUserTiles";
	}
	
	
	

	
}
