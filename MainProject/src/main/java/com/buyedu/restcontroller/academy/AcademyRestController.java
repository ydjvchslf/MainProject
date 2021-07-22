package com.buyedu.restcontroller.academy;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.buyedu.domain.Academy;
import com.buyedu.domain.User;
import com.buyedu.service.academy.AcademyService;
import com.buyedu.service.user.UserService;

@RestController
@RequestMapping("/academy/*")
public class AcademyRestController {

	@Autowired
	private AcademyService academyService;
	
	@Autowired
	private UserService userService;
	
	public AcademyRestController() {
		System.out.println(this.getClass());
	}
	
	@ResponseBody
	@RequestMapping(value = "json/academyProfile/{userNo}", method = RequestMethod.GET)
	public Map<String, Object> academyProfile(@PathVariable int userNo) throws Exception{
		
	      System.out.println("academy/json/academyProfile : 학원 프로필 목록");
	      
	      Map<String, Object> map = academyService.getAcademyCodeList(userNo);
	      
	      System.out.println("학원 프로필 맵 = " + map);
	      
	      return map;
	}
	
	@RequestMapping(value = "json/getacademyInfo/{academyCode}", method = RequestMethod.GET)
	public Academy academy(@PathVariable String academyCode) throws Exception{
		
		System.out.println("json/getacademyInfo : GET");
		
		System.out.println("academyInfo 아카데미 코드 = " + academyCode);
		
		Academy academy = academyService.getAcademy(academyCode);
		
		
		return academy;
	}

	@ResponseBody
	@RequestMapping(value = "json/updateIntro/{academyCode}", method = RequestMethod.POST)
	private Academy updateIntro(HttpServletRequest httpRequest,
							@PathVariable String academyCode, 
							@RequestParam String updateIntro) throws Exception{
		
		System.out.println("수정 요청 한 학원 소개 = " + updateIntro);
		
		Academy academy = academyService.getAcademy(academyCode);
		
		academy.setAcademyIntro(updateIntro);
					
		System.out.println("json aca = " + academy);
		
		academyService.updateAcademyIntro(academy);
		
		System.out.println("수정 된 학원 소개 = "+academyService.getAcademy(academyCode).getAcademyIntro());
		
		return academy;
	}
	
	@ResponseBody
	@RequestMapping(value = "json/updateHistory/{academyCode}", method = RequestMethod.POST)
	private Academy updateHistory(HttpServletRequest httpRequest,
							@PathVariable String academyCode, 
							@RequestParam String updateHistory) throws Exception{
		
		System.out.println("수정 요청한 학원 실적 = " + updateHistory);
		
		Academy academy = academyService.getAcademy(academyCode);
		
		academy.setAcademyHistory(updateHistory);
					
		System.out.println("json aca = " + academy);
		
		academyService.updateAcademyHistory(academy);
		
		System.out.println("수정 된 학원 실적 = "+academyService.getAcademy(academyCode).getAcademyHistory());
		
		return academy;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/file-upload/{academyCode}", method = RequestMethod.POST)
	public String fileUpload(
			@RequestParam("article_file") List<MultipartFile> multipartFile
			, @PathVariable String academyCode
			, HttpServletRequest request) {
		
		String strResult = "{ \"result\":\"FAIL\" }";
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot;
		try {
			// 파일이 있을때 탄다.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				
				for(MultipartFile file:multipartFile) {
					fileRoot = "C:\\Users\\woan2\\git\\MainProject\\MainProject\\src\\main\\resources\\static\\image\\";
					
					String originalFileName = file.getOriginalFilename();	//오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
					String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
					
					File targetFile = new File(fileRoot + savedFileName);	
					
					System.out.println("ex = " + extension);
					
					Academy academy = new Academy();
					academy.setAcademyCode(academyCode);
					academy.setMultimedia(savedFileName);					
					
					try (InputStream fileStream = file.getInputStream()){
						if (extension.equals(".mp4")) {
//							fileStream = new FileInputStream(videoEncoder.encode(savedFileName));
							academy.setMultimediarole("V");
						}else {
							academy.setMultimediarole("I");
						}
						
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
						
					} catch (Exception e) {
						//파일삭제
						FileUtils.deleteQuietly(targetFile);	//저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
					
					academyService.addMultimedia(academy);
					
					System.out.println("파일 저장 경로 = "+fileRoot);
					System.out.println("add multimedia Ajax 아카데미 = "+academy);
					
				}
				strResult = "{ \"result\":\"OK\" }";
			}
			// 파일 아무것도 첨부 안했을때 
			else
				strResult = "{ \"result\":\"OK\" }";
		}catch(Exception e){
			e.printStackTrace();
		}
		return strResult;
	}
	
	@ResponseBody
	@RequestMapping(value = "json/deleteMultimedia/{multimediano}", method = RequestMethod.POST)
	private int deleteMultimedia(@PathVariable int multimediano) throws Exception{
		
		String multimedia = academyService.getMultimedia(multimediano);
		
		System.out.println("삭제 파일 이름 = " + multimedia);
		
		String fileRoot = "C:\\Users\\woan2\\git\\MainProject\\MainProject\\src\\main\\resources\\static\\image\\";
		
		File file = new File(fileRoot+multimedia);
		
		if (file.exists()) {
			if (file.delete()) {
				System.out.println("파일 삭제 성공!!");
			}else {
				System.err.println("파일 삭제 실패 ㅜ.ㅜ");
			}
		} else {
			System.err.println("폴더 안에 파일이 존재하지 않습니다.");
		}
		
		return academyService.deleteMultimedia(multimediano);
	}
	
	// ------------------------------ 학원 인증 ------------------------------
	
	@ResponseBody
	@RequestMapping(value = "json/academyConnect/{academyCode}", method = RequestMethod.POST)
	public Map<String, Object> academyConnectList(@PathVariable String academyCode, HttpSession session) throws Exception{
		
		System.out.println("json/academyConnects : POST");
		
		System.out.println("academyConnect 아카데미 코드 = " + academyCode);
		
		Academy academy = academyService.getAcademy(academyCode);
		
		Map<String, Object> map = academyService.academyConnect(academyCode);
		
		System.out.println("academyConnects map = "+map.get("connect"));
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "json/updateConnect/{connectNo}", method = RequestMethod.POST)
	private String updateConnect(@PathVariable int connectNo) throws Exception{
		
		System.out.println(" ajax updateConnect -> 인증 완료");
		
		System.out.println("json 으로 받은 connectNo " + connectNo);
		
		return academyService.updateConnect(connectNo);
	}
	
	@ResponseBody
	@RequestMapping(value = "json/deleteConnect/{connectNo}", method = RequestMethod.POST)
	private void deleteConnect(@PathVariable int connectNo) throws Exception{
		
		System.out.println(" ajax updateConnect -> 인증 거부시 정보 삭제됨");
		
		System.out.println("json 으로 받은 connectNo " + connectNo);
		
		academyService.deleteConnect(connectNo);
	}
	
	// 학원 삭제!!!!! 진짜진짜진짜 중요함
	@ResponseBody
	@RequestMapping(value = "json/deleteAcademyAll/{academyCode}", method = RequestMethod.POST)
	private void deleteAcademy(@PathVariable String academyCode) throws Exception{
		
		String name = academyService.getAcademy(academyCode).getAcademyName();
		
		System.out.println(" ajax deleteAcademy -> 해당 학원 :" +name+ "의 정보가 모두 삭제됨.");
		
		System.out.println("삭제되는 정보는 1. 학원 정보 2. 인증 정보 3. 후기 정보 4. 수업 정보 5. 게시글 ");
		
		academyService.deleteAcademyAll(academyCode);
	}
	

}
