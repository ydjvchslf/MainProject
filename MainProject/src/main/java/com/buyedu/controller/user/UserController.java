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
	
	// 회원 등록화면 네비게이터
	@RequestMapping( value="addUser", method=RequestMethod.GET )
	public String addUser() throws Exception{
		
		return "/user/addUserView";
	}
	
	// 회원 등록
	@RequestMapping( value="addUser", method=RequestMethod.POST )
	public String addUser( @ModelAttribute("user") User user ) throws Exception {

		userService.addUser(user);
		return "/user/loginViewTiles";
	}
	
	// 회원 정보
	@RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser( HttpSession session, @RequestParam("email") String email , Model model ) throws Exception {
		
		User user = userService.getUser(email);
		List<Connect> list = userService.getConnectList(user.getUserNo());
		model.addAttribute("listAcademy", list);
		model.addAttribute("user", user);
		
		// 학원 툴바
		Map<String, Object> map = academyService.getAcademyCodeList(user.getUserNo());
		model.addAttribute("list",map.get("list"));
		
		return "/user/getUser";
	}
	
	//sns간편로그인이 내정보 누를때 
	@RequestMapping( value="getUser/{email}", method=RequestMethod.GET )
	public String getUserNew( HttpSession session, @PathVariable String email , Model model ) throws Exception {
		
		User user = userService.getUser(email);
		//간편로그인 유저가 내정보 또 누를시 에러 안내게 해야하는데...
		if ( user == null ) {
			model.addAttribute("email", email);
	    	
	    	return "/user/getUser/"+email;
		}
		return null;
	}
	
	// 회원 수정 GET
	@RequestMapping( value="updateUser", method=RequestMethod.GET )
	public String updateUser( @RequestParam("email") String email , Model model , HttpSession session ) throws Exception{

		User user = userService.getUser(email);
		model.addAttribute("user", user);
		session.setAttribute("user", user);
		
		return "/tiles/user/updateUserTiles";
	}
	
	// 회원 수정 POST
	@RequestMapping( value="updateUser", method=RequestMethod.POST )
	public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session ) throws Exception{

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
	
	// 비밀번호 수정
	@RequestMapping( value="updatePassword", method=RequestMethod.POST )
	public String updatePassword( @ModelAttribute("user") User user , Model model , HttpSession session ) throws Exception{

		User user2 = userService.getUser(user.getEmail());
		user2.setPassword(user.getPassword());
		userService.updatePassword(user2);
		session.setAttribute("user", user2);
		
		model.addAttribute("user", user2);
		
		String getUserView = this.getUser(session, user.getEmail(), model);
		
		return getUserView;
	}
	
	// 회원 탈퇴 GET
	@RequestMapping( value="outUser", method=RequestMethod.GET )
	public String outUser( @RequestParam("email") String email , Model model , HttpSession session ) throws Exception{
		
		User user = userService.getUser(email);
		session.setAttribute("user", user);
		
		model.addAttribute("user", user);
		
		return "/tiles/user/outUserTiles";
	}
	
	// 회원 탈퇴 POST
	@RequestMapping( value="outUser", method=RequestMethod.POST )
	public String outUser( HttpSession session ) throws Exception{

		User dbUser = (User)session.getAttribute("user");
		userService.outUser(dbUser);
		session.invalidate();
		
		return "/user/loginViewTiles";
	}
	
	// 비밀번호 찾기
	@RequestMapping( value="findPassword", method=RequestMethod.GET )
	public String findPassword() throws Exception{
		
		return "/user/findPassword";
	}
	
	// 계정 복구
	@RequestMapping( value="returnUser", method=RequestMethod.GET )
	public String returnUser() throws Exception{

		return "/user/returnUser";
	}

	// 이메일 찾기 GET
	@RequestMapping( value="findEmail", method=RequestMethod.GET )
	public String findEmail() throws Exception{

		return "/user/findEmail";
	}
	
	// 이메일 찾기 POST
	@RequestMapping( value="findEmail", method=RequestMethod.POST )
	public String findEmail( HttpSession session ) throws Exception{
		
		return "/user/findEmail";
	}
	
	//네이버 콜백jsp 이동
	@RequestMapping( value="callback" )
	public String callback() throws Exception{
		
		return "/user/callback";
	}
	
	// 로그인 화면 네비게이터
	@RequestMapping( value="login", method=RequestMethod.GET )
	public String login() throws Exception{
		
		return "/user/loginViewTiles";
	}
	
	// 학원 로그인
	@RequestMapping( value="loginacademy", method=RequestMethod.GET )
	public String login( @RequestParam String email, Model model ) throws Exception{
		
		User dbUser=userService.getUser(email);
		Map<String, Object> map = academyService.getAcademyCodeList(dbUser.getUserNo());
		model.addAttribute("list", map.get("list"));
		
		return "academyMain";
	}
	
	// sns 로그인
	@RequestMapping( value="snsLoginNotaccount", method=RequestMethod.GET )
	public String snsLoginNotaccount( @RequestParam String email ) throws Exception{
		
		return "userMain";
	}
	
	// 로그인
	@RequestMapping( value="login", method=RequestMethod.POST )
	public String login(@ModelAttribute("user") User user , Model model, HttpSession session , HttpServletResponse res) throws Exception{
		
		User dbUser=userService.getUser(user.getEmail());
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
	            
	            model.addAttribute("list",map.get("list"));
	            
	          //아카데미 화면
				String getUserView = this.getUser(session, user.getEmail(), model);
				
	         return getUserView;
			}
			
			//일반유저, 관리자 화면
			String getUserView = this.getUser(session, user.getEmail(), model);
			
			return "/search/searchList";
		}else{
			model.addAttribute("message", "회원정보가 맞지 않습니다.");
			return "/user/loginViewTiles";
		}	
	}
	
	//sns로긴-> db없어서 회원가입창 이동
	@RequestMapping( value="snsAddUser", method=RequestMethod.GET )
	public String snsAddUser( @RequestParam("email") String email , Model model ) throws Exception{
	
		model.addAttribute("snsEmail", email);
		
		return "/user/snsAddUserView";
	}
	
	//카카오 로그인
	@RequestMapping( value="/snsLogin/{email}" )
	public String snsLogin( @PathVariable String email, Model model, HttpSession session , HttpServletResponse res) throws Exception{
	    
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
	    	
	    	return "/user/getUser";
	    }else { //카카오 통합로그인
	    	Cookie cookie = new Cookie("loginAccountType", "total");
	    	cookie.setPath("/");
	    	res.addCookie(cookie);
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
	 		return "/search/searchList";
	    }
	}
	
	//네이버 로그인
	@RequestMapping( value="naverLogin", method=RequestMethod.GET )
	public String naverLogin( @RequestParam String email, Model model, HttpSession session , HttpServletResponse res ) throws Exception{
		
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
				
				return "/search/searchList";
		}
	}
		
	// 로그 아웃
	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	 // 유저 목록
	@RequestMapping( value="listUser" )
	public String listUser( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		List<String> roles = search.getSearchRole();
		List<String> states = search.getSearchAccountState();
		Map<String , Object> map=userService.getUserList(search);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("roles", roles);
		model.addAttribute("states", states);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "/user/listUser";
	}
	
	// 학원 삭제
   @RequestMapping( value="deleteacademy", method=RequestMethod.GET )
   public String deleteaca( @RequestParam String email, Model model ) throws Exception{
      
      User dbUser=userService.getUser(email);
      Map<String, Object> map = academyService.getAcademyCodeList(dbUser.getUserNo());
      model.addAttribute("list", map.get("list"));
      
      return "/academy/deleteAcademy";
   }
	
	// 인증 목록
	@RequestMapping( value="listConnect", method=RequestMethod.GET )
	public String listConnect( HttpSession session, Model model ) throws Exception{
	
		User user = (User)session.getAttribute("user");
		List<Connect> list = userService.getConnectList(user.getUserNo());
			
		model.addAttribute("list", list);
		model.addAttribute( "user", session.getAttribute("user") );
		return "/tiles/user/getUserTiles";
	}
	
}
