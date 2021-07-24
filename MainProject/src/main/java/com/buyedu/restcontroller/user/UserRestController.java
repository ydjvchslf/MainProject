package com.buyedu.restcontroller.user;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.buyedu.domain.Academy;
import com.buyedu.domain.Connect;
import com.buyedu.domain.Sms;
import com.buyedu.domain.User;
import com.buyedu.service.academy.AcademyService;
import com.buyedu.service.user.UserService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.api.SenderID;

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
	
	
	
	@GetMapping("json/naver/logout/{token}") 
	public String test(@PathVariable String token) {
		System.out.println(token);
		
		String uri = "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=vqx5V5ejE6mgkpcPu2vP&client_secret=YjzvVMUZRW&service_provider=NAVER&access_token="+token;
		//서버간 통신
		RestTemplate rest= new RestTemplate();
		
		Map<String, Object> s = rest.getForObject(uri, Map.class);
		
	    System.out.println(s);
	    
	    return "gd";
	}
	
	
	//회원가입창 이메일 중복확인
	@GetMapping("json/checkEmail/{email}")
	public Map checkEmail(	@PathVariable String email ) throws Exception{
	
		System.out.println("/user/json/checkEmail : GET");
			
		int result2 = userService.checkEmail(email);
			
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
	
	
	@PostMapping ("json/returnUser") 
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
		
		//인증갯수 이미 3개면 등록 못함 
		if ( connectCnt == 3) {
			map1.put("message", "no");
			return map1;
		}
		
		System.err.println("========111");
		
		Academy academy = academyService.getAcademy(academyCode);
		Connect connect = new Connect();
		
		System.err.println("========222");
		
		//인증 0,1,2개 등록상태 --> 공통
		if (  academy != null  ) {
			// 인증 0개 상태
			if ( connectCnt == 0 ) {
				
				User user = userService.getUserByUserNo(userNo);
				connect.setUser(user);
				connect.setAcademy(academy);
				userService.addConnect(connect);
				map1.put("message", "ok");
				
				System.out.println("1111111끝");
				return map1;
				
			}//인증 1,2개 상태
			else {
				//중복 acaCode 걸러주기
				User user = userService.getUserByUserNo(userNo);
				connect.setUser(user);
				connect.setAcademy(academy);
				
				int duplication = userService.checkAcademyCode(connect);
				
					if ( duplication == 1 ) { //중복일때
						map1.put("message", "duplication");
						
						System.out.println("222222끝");
						return map1;
					}else { //중복 아닐때 ->정상 add 하면 됨
						userService.addConnect(connect);
						map1.put("message", "ok");
						
						System.out.println("33333333끝");
						return map1;
					}
			}
			
		}else { //academy == null -> 유효하지 않은 학원코드 
			map1.put("message", "notExist");
			
			System.out.println("44444444끝");
			return map1;
		}
		
	}
	
	
	@GetMapping("json/deleteConnect/{userNo}/{academyCode}")
	public Map deleteConnect( @PathVariable int userNo,
							  @PathVariable String academyCode ) throws Exception{
	
		System.out.println("/user/json/deleteConnect : GET");
		
		User user = userService.getUserByUserNo(userNo);
		Academy academy = academyService.getAcademy(academyCode);
		
		Connect connect = new Connect();
		connect.setUser(user);
		connect.setAcademy(academy);
		
		userService.deleteConnect(connect);
		
		Map map1 = new HashMap<String, String>();
		map1.put("message", "ok");
		
		System.out.println("인증취소 완료");
		
		return map1;
	}
	
	
	
	
	// SMS 인증번호 발송
	@GetMapping("json/sendSms/{phone}")
	public Map sendSms( @PathVariable String phone ) throws Exception{
	
		System.out.println("/user/json/sendSms : GET");
		
		System.out.println("받아온 phone=> "+phone);
		
		int cnt = userService.smsCnt(phone);
		
		if ( cnt == 1 ) {
			userService.deleteSms(phone);
		}
		
		Sms sms = new Sms();
		sms.setPhone(phone);
		
		userService.addSms(sms);
		
		Map<String, String> map1= new HashMap<String, String>();
		map1.put("phone", phone);
		
		System.out.println("sms 테이블에 저장 성공");
		
		return map1;
		
	}
	
	
	// SMS 인증 번호 맞는지 확인
	@GetMapping("json/checkSms/{phone}/{vaildNumber}")
	public Map checkSms( @PathVariable String phone ,
						 @PathVariable int vaildNumber) throws Exception{
	
		System.out.println("/user/json/checkSms : GET");
		
		System.out.println("받아온 phone=> "+phone+" --- 받아온 인증번호=> "+vaildNumber);
		
		Sms sms = userService.getSms(phone);
		
		int first = sms.getVaildNumber();
		
		Map<String, String> map1= new HashMap<String, String>();
		
			if ( first == vaildNumber ) {
				
				System.out.println("sms 인증번호 확인 컨트롤러 끝");
				
				map1.put("result", "ok");
				return map1;
				
			}else{
				
				System.out.println("sms 인증번호 확인 컨트롤러 끝");
				
				map1.put("result", "no");
				return map1;
			}
		
		}
	
	
	
	// Cool SMS API_key 및 API_secret Number
	String api_key = "NCS3PSWYVLVN1LAA";
	String api_secret = "S1QJK5JKOTOWKIT2T6QFIDOPXNCRBPY7";
	
	Message message = new Message(api_key, api_secret);
	SenderID senderID;
	JSONObject result;
	JSONArray result_array;
	
	HashMap<String, String> params = new HashMap<String, String>();
	
	
	@GetMapping("json/sms/{phone}")
	public HashMap sms( @PathVariable String phone ) throws Exception{
	
		System.out.println("/user/json/sms : GET");
		
		//인증번호 6자리 생성
		try {
	    	String[] array = new String[6];
			String key = new String();
			Random rd = new Random(); //랜덤 객체 생성
			
			for(int i=0; i<array.length; i++) {
	            array[i] = Integer.toString(rd.nextInt(10));
	            key += array[i];
	        }
	    
		// 문자보내기(테스트시 발신, 수신 둘다 내 번호로 하기)
		params.put("to", phone); // 수신번호
		params.put("from", "01039239995"); // 발신번호
		params.put("type", "SMS");
		params.put("text", "[사!교육 본인확인] 본인인증 확인번호 ["+key+"]를 입력하세요"); // 문자전송
		params.put("mode", "test");
		params.put("key", key);
		System.out.println("인증번호 6자리 : "+key);	// 인증번호 6자리 숫자가 key가 됨
		result = message.send(params);
		System.out.println((result.get("group_id")));;
		
		 // balance
	      // result = message.balance();
	      // System.out.println((result.get("cash")));
	      
	      // sent
	      //params.clear();
	      try {
	        result = message.sent(params);
	        System.out.println(result.get("data"));
	      } catch (Exception e) {
	        result = (JSONObject) JSONValue.parse(e.getMessage());
	        System.out.println(result.get("code"));
	        System.out.println("NoSuchMessage");
	      }

	      // status
	      //result = message.getStatus(params);
	      System.out.println(result.get("data"));

	      // cancel
	      params.put("mid", "MIDTEST");
	      //result = message.cancel(params);
	      //assertTrue(!result.isEmpty());
	    } catch (Exception e) {
	      //fail(e.toString());
	    }
	    System.out.println(result);
	    System.out.println(params);
	    return params;
	  }
		
	
	
	
}
