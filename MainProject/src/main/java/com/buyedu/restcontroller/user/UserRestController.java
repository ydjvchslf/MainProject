package com.buyedu.restcontroller.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.buyedu.domain.Academy;
import com.buyedu.domain.Connect;
import com.buyedu.domain.User;
import com.buyedu.service.academy.AcademyService;
import com.buyedu.service.user.UserService;

@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AcademyService academyService;
	
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	//회원가입창 이메일 중복확인
	@GetMapping("json/checkEmail/{userId}")
	public Map checkEmail(	@PathVariable String userId ) throws Exception{
	
		System.out.println("/user/json/checkEmail : GET");
			
		int result2 = userService.checkEmail(userId);
			
		Integer result = new Integer(result2);
		
		System.out.println("결과는?==> " + result);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("result", result);
			
		return map;
		
	}
	
	// 비번 변경창에서 원래 비번 확인
	@PostMapping ("json/checkPassword")
	public Map checkPassword(@RequestBody Map<String, String> map ) throws Exception{
			
		System.out.println("/user/json/checkPassword : POST");
		
		String email = map.get("email");
		String password = map.get("password");
		
		System.err.println("email=>" + email);
		System.err.println("password=>" + password);
		
		User dbUser = userService.getUser(email);
		
		String result="";
		
		if ( dbUser.getPassword().equals(password) ) {
			result = "ok";
		}else {
			result = "no";
		}
		
		Map<String, String> map2 = new HashMap<String, String>();
		
		map2.put("result", result);
		
		System.out.println("완료");
		
		return map2;
			
		}
	
	
	@PostMapping ("json/findEmail")
	public Map findEmail(@RequestBody Map<String, String> map ) throws Exception{
			
		System.out.println("/user/json/findEmail : POST");
		
		String name = map.get("name");
		String phone = map.get("phone");
		
		System.err.println("name=>" + name);
		System.err.println("phone=>" + phone);
		
		User user = new User();
		
		user.setName(name);
		user.setPhone(phone);
		
		User dbUser = userService.findEmail(user);
		
		Map<String, String> map1 = new HashMap<String, String>();
		
		String message="";
		String dbEmail="";
		
		if( dbUser == null) {
			
			message = "no";
			map1.put("message", message);
			
		}else {
			
			message = "ok";
			dbEmail = dbUser.getEmail();
			map1.put("message", message);
			map1.put("dbEmail", dbEmail);
		}
		
		System.out.println("완료");
		
		return map1;
			
		}
	
	
	@PostMapping ("json/findPassword")
	public Map findPassword(@RequestBody Map<String, String> map ) throws Exception{
			
		System.out.println("/user/json/findPassword : POST");
		
		String name = map.get("name");
		String phone = map.get("phone");
		String email = map.get("email");
		
		System.err.println("name=>" + name);
		System.err.println("phone=>" + phone);
		System.err.println("email=>" + email);
		
		User user = new User();
		
		user.setName(name);
		user.setPhone(phone);
		user.setEmail(email);
		
		User dbUser = userService.findPassword(user);
		
		Map<String, String> map1 = new HashMap<String, String>();
		
		String message="";
		
		if( dbUser == null) {
			
			message = "no";
			map1.put("message", message);
			
		}else {
			
			message = "ok";
			map1.put("message", message);
		}
		
		System.out.println("완료");
		
		return map1;
			
		}
	
	
	
	@PostMapping ("json/changePassword")
	public Map changePassword(@RequestBody Map<String, String> map ) throws Exception{
			
		System.out.println("/user/json/changePassword : POST");
		
		String name = map.get("name");
		String phone = map.get("phone");
		String email = map.get("email");
		String password = map.get("password");
		
		System.err.println("name=> " + name + " phone=> " + phone 
							+ " email=> " + email + " password=> " +password);
		
		User user = userService.getUser(email);
		user.setPassword(password);
		
		System.out.println("여기에유?");
		
		userService.updatePassword(user);
		
		Map<String, String> map1 = new HashMap<String, String>();
		
		map1.put("message", "ok");
		
		return map1;
			
		}
	
	
	@PostMapping ("json/returnUser") //mappper 손보고 확인해야행 
	public Map returnUser(@RequestBody Map<String, String> map ) throws Exception{
			
		System.out.println("/user/json/returnUser : POST");
		
		String name = map.get("name");
		String email = map.get("email");
		String password = map.get("password");
		
		System.err.println("name=> "+ name +" email=> "+ email +" password=> " + password );
		
		User dbUser = userService.getUser(email);
		
		System.err.println("찾은 user=> "+dbUser);
		
		Map<String, String> map1 = new HashMap<String, String>();
		
		String message="";
		//아예 회원 정보 없을 때
		if( dbUser == null) {
			
			message = "no";
			map1.put("message", message);
			
		}else{
			
			User ableUser = userService.findAbleDate(dbUser);
			System.err.println("ableUser=>"+ableUser);
			
				// 복구가능기간 && 계정상태 = '1'
				if ( ableUser != null && ableUser.getAccountState().equals("1") ) {
					
					userService.returnUserByUser(ableUser);
					message = "ok";
					map1.put("message", message);
					
				}else {
					
					message = "disable";
					map1.put("message", message);
					
				}
		}
		return map1;
			
		}
	
	
	@GetMapping("json/addConnect/{userNo}/{academyCode}")
	public Map addConnect(	@PathVariable int userNo,
							@PathVariable String academyCode ) throws Exception{
	
		System.out.println("/user/json/addConnect : GET");
		System.out.println("받아온 userNo => "+userNo+" 받아온 academyCode=> "+academyCode);
		
		int connectCnt = userService.checkConnectCnt(userNo);
		
		System.out.println("등록한 인증갯수 : "+connectCnt);
		
		Map<String, String> map1 = new HashMap<String, String>();
		
		if ( 3 == connectCnt ) {
			map1.put("message", "no");
			return map1;
		}
		
		User user = userService.getUserByUserNo(userNo);
		
		Academy academy = academyService.getAcademy(academyCode);
	
		Connect connect = new Connect();
		connect.setUser(user);
		connect.setAcademy(academy);
		
		userService.addConnect(connect);
		
		map1.put("message", "ok");
			
		return map1;
		
	}
}
