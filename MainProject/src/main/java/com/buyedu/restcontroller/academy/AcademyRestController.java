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

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.buyedu.domain.Academy;
import com.buyedu.service.academy.AcademyService;

@RestController
@RequestMapping("/academy/*")
public class AcademyRestController {

	@Autowired
	private AcademyService academyService;
	
	public AcademyRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value = "json/getacademy/{academyCode}", method = RequestMethod.GET)
	public Academy academy(@PathVariable String academyCode) throws Exception{
		Academy academy = academyService.getAcademy(academyCode);
		
		return academy;
	}

	@ResponseBody
	@RequestMapping(value = "json/updateIntro", method = RequestMethod.POST)
	private Academy history(HttpServletRequest httpRequest,
							@RequestParam String academyCode, 
							@RequestParam String academyIntro) throws Exception{
		
		System.out.println("(수정 실적)json 으로 받은 academyCode"+academyCode);
		
		//String intro = httpRequest.getParameter("intro");
		
		Academy academy = new Academy();
		
		academy.setAcademyCode(academyCode);
		academy.setAcademyIntro(academyIntro);
		
		System.out.println("수정 된 학원 소개"+academyIntro);
		
		//academyService.updateAcademyHistory(academy);
		
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
	

}
