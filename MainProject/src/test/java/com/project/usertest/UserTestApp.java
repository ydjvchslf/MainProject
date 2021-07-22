package com.project.usertest;

import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.buyedu.MainProjectApplication;
import com.buyedu.domain.Academy;
import com.buyedu.domain.Connect;
import com.buyedu.domain.Search;
import com.buyedu.domain.Sms;
import com.buyedu.domain.User;
import com.buyedu.service.user.UserService;


@SpringBootTest(classes=MainProjectApplication.class)
public class UserTestApp {
	
	@Autowired
	private UserService userService;

	//@Test
		public void testAddUser() throws Exception {
		      
		     User user = new User();
		     
		     //user.setUserNo(1000);
		     user.setRole("testRole");
		     user.setEmail("testEmail");
		     user.setPassword("1234");
		     user.setName("mia");
		     user.setPhone("010-9999");
		     user.setAccountState("0");
		     
		     userService.addUser(user);

		      //==> console 확인
		     System.out.println(user);
	      
		      //==> API 확인
//		      Assert.assertEquals(108, user.getUserNo());
//		      Assert.assertEquals("testRole", user.getRole());
//		      Assert.assertEquals("testEmail", user.getEmail());
//		      Assert.assertEquals("1234", user.getPassword());
//		      Assert.assertEquals("mia", user.getName());
//		      Assert.assertEquals("010-9999", user.getPhone());
//		      Assert.assertEquals("0", user.getAccountState());
		      
		      
		   }
			
			//@Test
			public void testGetUser() throws Exception {
				
				User user = new User();
				
				user = userService.getUser("testEmail");

				//==> console 확인
				//System.out.println(user);

			}
			
			//@Test
			public void testGetUserByUserNo() throws Exception {
						
				User user = new User();
						
				user = userService.getUserByUserNo(10);
		
				//==> console 확인
				System.out.println(user);
		
			}
			
			//@Test
			public void testFindEmail() throws Exception {
						
				User user = new User();
				
				user.setName("murph");
				user.setPhone("019777");
				
				user = userService.findEmail(user);
		
				//==> console 확인
				System.out.println(user);
				
			}
			
			//@Test
			public void testFindPassword() throws Exception {
						
				User user = new User();
				
				user.setName("변경네임");
				user.setPhone("변경폰");
				user.setEmail("변경2");
				
				user = userService.findPassword(user);
		
				//==> console 확인
				System.out.println(user);
				
			}
			
			
			//@Test
			public void testUpdatePassword() throws Exception {
						
				User user = userService.getUser("kakao");
				
				System.out.println("변경 전 user => "+user);
				
				user.setPassword("7777");
				
				userService.updatePassword(user);
		
				//==> console 확인
				System.out.println("변경 후 user => "+user);
				
			}
			
			//@Test
			public void testReturnUserByUser() throws Exception {
						
				User user = userService.getUser("daum");
				
				userService.returnUserByUser(user);
		
				//==> console 확인
				System.out.println(user);
				
			}
			
			//@Test
			public void testFindAbleDate() throws Exception {
						
				User user = userService.getUser("naver");
				//User user = userService.getUser("kakao");
				
				User user2 = userService.findAbleDate(user);
				
				if (user2 == null) {
					System.err.println("그런 회원 없어");
				}
		
				System.err.println("가능한 유저=> "+user2);
				
			}
			
			
			//@Test
			 public void testUpdateUser() throws Exception{
				 
				User user = userService.getUser("testEmail");
				
				System.out.println("수정전 User=> " + user);

				user.setName("changeName");
				user.setPhone("7777-7777");
				user.setPassword("5678");
				
				userService.updateUser(user);
				
				user = userService.getUser("testEmail");
				
				//==> console 확인
				System.out.println("수정후 User=> " + user);
				
			}
			 
			 
			//@Test
			public void testGetUserListAll() throws Exception{
					 
				 Search search = new Search();
				 search.setCurrentPage(1);
				 search.setPageSize(3);
				 	
				 System.out.println("search==> "+search);
				 	
				 Map<String,Object> map = userService.getUserList(search);
				 	
				 List<Object> list = (List<Object>)map.get("list");
				 System.out.println("list.size는? ==> "+ list.size());
				 	
				//==> console 확인
				//System.out.println(list);
				 	
				 Integer totalCount = (Integer)map.get("totalCount");
				 System.out.println(totalCount);
				 	
				 System.out.println("=======================================");
				 	
				 search.setCurrentPage(1);
				 search.setPageSize(3);
				 search.setSearchCondition("0");
				 search.setSearchKeyword("");
				 map = userService.getUserList(search);
				 	
				 list = (List<Object>)map.get("list");
				 	
				 //==> console 확인
				 //System.out.println(list);
				 	
				 totalCount = (Integer)map.get("totalCount");
				 System.out.println(totalCount);
			}
			
			
			//@Test // mapper role 빼놔서 안걸러짐
			public void testGetUserListByRole() throws Exception{
					 
				 Search search = new Search();
				 search.setCurrentPage(1);
				 search.setPageSize(3);
				 
				 //search.setSearchRole("student");
				 //search.setSearchRole("parents");
				 //search.setSearchRole("academy");
				 	
				 System.out.println("search==> "+search);
				 	
				 Map<String,Object> map = userService.getUserList(search);
				 	
				 List<Object> list = (List<Object>)map.get("list");
				 //Assert.assertEquals(2, list.size());
				 	
				 //==> console 확인
				 System.out.println("list==> "+ list);
				 	
				 Integer totalCount = (Integer)map.get("totalCount");
				 System.out.println(totalCount);
				 	
				 System.out.println("=======================================");
				 	
				 search.setCurrentPage(1);
				 search.setPageSize(3);
				 //search.setSearchCondition("0");
				 //search.setSearchKeyword("");
				 map = userService.getUserList(search);
				 	
				 list = (List<Object>)map.get("list");
				 //Assert.assertEquals(2, list.size());
				 	
				 //==> console 확인
				 //System.out.println(list);
				 	
				 totalCount = (Integer)map.get("totalCount");
				 System.out.println(totalCount);
			}
		 
				 
			
			 
			//@Test
			public void testCheckEmail() throws Exception{
					
				int result = userService.checkEmail("testEmail");
					
				System.out.println("아이디 중복확인유무 0 or 1 => "+ result );
					
			} 
			
			
			
			
			
			///////////////////////////인증 /////////////////////////////////
			
			
			
			//@Test
			public void testCheckConnectCnt() throws Exception{
				
				int result = userService.checkConnectCnt(11);
				System.out.println( "인증개수 => "+ result );
				
			}
			
			//@Test
			public void testCheckAcademyCode() throws Exception{
				
				User user = new User();
				user.setUserNo(11);
				
				Academy academy = new Academy();
				academy.setAcademyCode("code99");
				
				Connect connect = new Connect();
				connect.setUser(user);
				connect.setAcademy(academy);
				
				int result = userService.checkAcademyCode(connect);
				
				System.out.println( "학원코드 중복 확인 => "+ result );
				
			}
			
			//@Test 
			public void testAddConnect() throws Exception{
					
				User user = userService.getUser("admin");
					
				Academy academy = new Academy();
					
				academy.setAcademyCode("heyhey");
					
				Connect connect = new Connect();
				
				connect.setUser(user);
				connect.setAcademy(academy);
					
				System.out.println("=========================" + connect);
					
				userService.addConnect(connect);
					
			}
			
			
			//@Test 
			public void testGetConnect() throws Exception {
				
				User user = userService.getUser("kakao");
				
				Academy academy = new Academy();
				academy.setAcademyName("영수학원");
				academy.setAcademyCode("code55");
				
				Connect connect = new Connect();
				connect.setUser(user);
				connect.setAcademy(academy);
				
				System.out.println("===" + connect);
				
				Connect dbConnect = userService.getConnect(connect);
				
				System.out.println("학원 코드=> " + dbConnect.getAcademy().getAcademyCode() 
								+ " 학원명 => "+dbConnect.getAcademy().getAcademyName() );

			}
			
			
			//@Test // 인증한 학원 모두 뽑아내기
			public void testGetConnectList() throws Exception{
				
				List<Connect> list = userService.getConnectList(500);
				
				//Assert.assertNotNull(list);
				
				System.out.println( "인증갯수 : " + list.size() );
				
				if ( list.size() == 0 ) {
					
					System.out.println("인증한 학원갯수 0개");
					
				}else if ( list.size() == 1 ) {
					
					System.out.println("인증 학원갯수 1개");
					Connect co1 = (Connect)list.get(0);
					String one = co1.getAcademy().getAcademyCode();
					
					System.out.println("인증 학원코드 1=> " +one);
					
				}else if ( list.size() == 2 ) {
					
					System.out.println("인증 학원갯수 2개");
					Connect co2 = (Connect)list.get(1);
					String two = co2.getAcademy().getAcademyCode();
					
					System.out.println("인증 학원코드 2=> " +two);
					
				}else if ( list.size() == 3 ) {
					
					System.out.println("인증 학원갯수 3개");
					Connect co3 = (Connect)list.get(2);
					String three = co3.getAcademy().getAcademyCode();
					
					System.out.println("인증 학원코드 3=> " +three);
					
				}
			}
			 
			
			
			
			
			//@Test 
			public void testUpdateAccept() throws Exception{
				
				User user = userService.getUser("admin"); //userNo
				
				Academy academy = new Academy();
				
				academy.setAcademyCode("heyhey"); //academyCode
				academy.setUser(user);
				
				Connect connect = new Connect();
				
				connect.setUser(user);
				connect.setAcademy(academy);
				connect.setConnectState("1"); // 0->1
				
				System.out.println("connect======" + connect);
				
				userService.updateConnectAccept(connect);
				
			}
			
			//@Test 
			public void testUpdateReject() throws Exception{
					
				User user = userService.getUser("admin"); //userNo
					
				Academy academy = new Academy();
					
				academy.setAcademyCode("heyhey"); //academyCode
				academy.setUser(user);
					
				Connect connect = new Connect();
					
				connect.setUser(user);
				connect.setAcademy(academy);
				connect.setConnectState("2"); // 0->2
					
				System.out.println("connect======" + connect);
					
				userService.updateConnectReject(connect);
					
				}
			
			//@Test //connect에서 admin 삭제됨  
			public void testDeleteConnect() throws Exception{
				
				User user = userService.getUser("admin"); //userNo
				
				Academy academy = new Academy();
					
				academy.setAcademyCode("heyhey"); //academyCode
				academy.setUser(user);
					
				Connect connect = new Connect();
					
				connect.setUser(user);
				connect.setAcademy(academy);
					
				System.out.println("connect======" + connect);
					
				userService.deleteConnect(connect);
				
			}
			
			//SMS
			
			//@Test  
			public void testAddSms() throws Exception{
				
				Sms sms = new Sms();
				
				sms.setPhone("48485");
				userService.addSms(sms);
				
				System.out.println("SMS===> "+sms);
			}
			
			//@Test  
			public void testGetSms() throws Exception{
				
				Sms sms = new Sms();
				
				//sms.setPhone("48485");
				userService.getSms("48485");
				
				System.out.println("겟 SMS===> "+sms);
			}

}
