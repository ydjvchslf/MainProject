package com.buyedu.controller.academy;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.filechooser.FileSystemView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import com.buyedu.domain.Academy;
import com.buyedu.domain.Board;
import com.buyedu.domain.Connect;
import com.buyedu.domain.Page;
import com.buyedu.domain.Search;
import com.buyedu.domain.User;
import com.buyedu.service.academy.AcademyService;
import com.buyedu.service.board.BoardService;
import com.buyedu.service.user.UserService;


@Controller
@RequestMapping("/academy/*")
public class AcademyController {
	
	@Autowired
	public AcademyService academyService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	public UserService userService;
	
	public String random() {
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 7; i++) {
		    int rIndex = rnd.nextInt(3);
		    switch (rIndex) {
		    case 0:
		        // a-z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
		        break;
		    case 1:
		        // A-Z
		        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
		        break;
		    case 2:
		        // 0-9
		        temp.append((rnd.nextInt(10)));
		        break;
		    }
		}
		
		String random =  temp.toString();
		
		return random;
	}
	
	@Value("5")
	int pageUnit;
	
	@Value("5")
	int pageSize;
	
	@RequestMapping("addAcademyView")
	public String addAcademyView() throws Exception {
		
		System.out.println("addAcademyView 단순 네비게이터");
		
		return "/academy/addAcademyView";
	}

	@RequestMapping("addAcademy")
	public String addAcademy(@ModelAttribute("academy") Academy academy
							, @RequestParam("userNo") int userNo) throws Exception {
		
		System.out.println("addAcademy : POST");		
		System.out.println("userNo = " + userNo);
		System.out.println("academy = " + academy);
		
		User user = new User();
		user.setUserNo(userNo);
		academy.setUser(user);
		
		String makeAcaCode = random();
		
		String checkAcademyCode = academyService.checkAcademyCode(makeAcaCode);
		
		if (checkAcademyCode == null) {
			
			academy.setAcademyCode(makeAcaCode);
			System.out.println("중복되는 학원코드가 존재하지 않습니다.");
			System.out.println("학원 코드 : "+makeAcaCode);
		}else {
			
			System.out.println("학원코드가 중복되어 다시 실행합니다.");
			String makeAnotherAcaCode = random();
			
			academy.setAcademyCode(makeAnotherAcaCode);
			System.out.println("학원 코드 : "+makeAnotherAcaCode);
		}
		
		academyService.addAcademy(academy);
		
		return "main";
	}
	
	
	@RequestMapping(value = "academyInfo", method = RequestMethod.GET)
	public String getAcademyInfo( @RequestParam("academyCode") String academyCode, @ModelAttribute("search") Search search, Model model, HttpSession session, HttpServletRequest request ) throws Exception{
		
		System.out.println("/academy/academyInfo : GET");
		
		System.out.println("academyInfo 아카데미 코드 = " + academyCode);
		
		Academy academy = academyService.getAcademy(academyCode);
		
		model.addAttribute("academy", academy);
		
		System.out.println(academy);
		
		//학원 공지사항
		System.out.println("학원 공지사항 돌아간다");
//		String academyCodeb = request.getParameter("academyCode");
		String category = request.getParameter("cateCode"); // 게시판 종류
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setCateCode(category);
		
		List<Board> list =boardService.getBoardListAcademy(search);
		
		if(list.size()!=0) {
			int totalCount = list.get(0).getTotalCount();
			Page resultPage = new Page( search.getCurrentPage(),totalCount, pageUnit, pageSize);
			System.out.println(resultPage);
		
		model.addAttribute("list", list);
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		}
		
		return "/tiles/academy/academyInfo";
	}
	
	@RequestMapping(value = "academySampleEdu", method = RequestMethod.GET)
	public String getAcademySampleEdu(@RequestParam("academyCode") String academyCode, Model model) throws Exception{
		
		System.out.println("/academy/academySampleEdu : GET 테스트 학원만 뽑는중");
		
		System.out.println("academySampleEdu 아카데미 코드 = " + academyCode);
		
		Academy academy = academyService.getAcademy(academyCode);
		
		Map<String, Object> map = academyService.getMultimediaList(academyCode);
		
		int imgcount = academyService.getImageCount(academyCode);
		int vidcount = academyService.getVideoCount(academyCode);
		
		model.addAttribute("academy", academy);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("imgcount", imgcount);
		model.addAttribute("vidcount", vidcount);
		
		System.out.println("academySampleEdu map = "+map.get("list"));
		
		return "/tiles/academy/academySampleEdu";
	}
	
//	@RequestMapping(value = "eduVideo", method = RequestMethod.GET)
//	public StreamingResponseBody getVideo() throws Exception{
//		File file = new ClassPathResource("static/image/KakaoTalk_20210719_213033364.mp4").getFile();
//		@SuppressWarnings("resource")
//		final InputStream is = new FileInputStream(file);
//		return video -> {
//			byte[] data = new byte[2048];
//	        int read = 0;
//	        while ((read = is.read(data)) > 0) {
//	        	video.write(data, 0, read);
//	        }
//	        video.flush();
//		};
//	}
	
	
//	academyConnects
	
	@RequestMapping(value = "academyConnects", method = RequestMethod.GET)
	public String academyConnectList(@RequestParam("academyCode") String academyCode, Model model, HttpSession session) throws Exception{
		
		System.out.println("/academy/academyConnects : GET");
		
		System.out.println("academyConnect 아카데미 코드 = " + academyCode);
		
		Academy academy = academyService.getAcademy(academyCode);
		
		Map<String, Object> map = academyService.academyConnect(academyCode);
		
		model.addAttribute("academy", academy);
		model.addAttribute("connect", map.get("connect"));
		
		System.out.println("academyConnects map = "+map.get("connect"));
		
		return "/tiles/academy/academyConnect";
	}
	

}
