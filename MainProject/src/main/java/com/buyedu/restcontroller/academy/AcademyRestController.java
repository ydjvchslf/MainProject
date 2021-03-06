package com.buyedu.restcontroller.academy;

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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.converter.StringMessageConverter;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.buyedu.domain.Academy;
import com.buyedu.domain.Board;
import com.buyedu.domain.Page;
import com.buyedu.domain.Search;
import com.buyedu.domain.User;
import com.buyedu.service.academy.AcademyService;
import com.buyedu.service.board.BoardService;
import com.buyedu.service.noti.NotiService;
import com.buyedu.service.user.UserService;
import com.buyedu.util.UserUtil;

@RestController
@RequestMapping("/academy/*")
public class AcademyRestController {

	@Autowired
	private AcademyService academyService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private NotiService notiService;
	
	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;
	
	public AcademyRestController() {
		//System.out.println(this.getClass());
	}
	
	@Value("5")
	int pageUnit;
	
	@Value("5")
	int pageSize;
	
	@GetMapping("testSocket")
	public void testSocket() {
		notiService.noti("xrYC6SH");
	}
	
	// ?????? ????????? (?????? ??????)
	@ResponseBody
	@RequestMapping(value = "json/academyProfile/{userNo}", method = RequestMethod.GET)
	public Map<String, Object> academyProfile(@PathVariable int userNo) throws Exception{
	      Map<String, Object> map = academyService.getAcademyCodeList(userNo);
	      
	      return map;
	}
	
	// ?????? ????????? (???????????? ??????)
	@RequestMapping(value = "json/getacademyInfo/{academyCode}", method = RequestMethod.GET)
	public Academy academy(@PathVariable String academyCode) throws Exception{
		Academy academy = academyService.getAcademy(academyCode);
		academy.setCount(academyService.getStudentCount(academyCode));
		academy.setCount2(academyService.getEduTotalCountforAca(academyCode));
		
		return academy;
	}

	// ?????? ?????? ??????
	@ResponseBody
	@RequestMapping(value = "json/updateIntro/{academyCode}", method = RequestMethod.POST)
	private Academy updateIntro(HttpServletRequest httpRequest,
							@PathVariable String academyCode, 
							@RequestParam String updateIntro) throws Exception{
		Academy academy = academyService.getAcademy(academyCode);
		academy.setAcademyIntro(updateIntro);
		academyService.updateAcademyIntro(academy);
		
		return academy;
	}
	
	// ?????? ?????? ??????
	@ResponseBody
	@RequestMapping(value = "json/updateHistory/{academyCode}", method = RequestMethod.POST)
	private Academy updateHistory(HttpServletRequest httpRequest,
							@PathVariable String academyCode, 
							@RequestParam String updateHistory) throws Exception{
		Academy academy = academyService.getAcademy(academyCode);
		academy.setAcademyHistory(updateHistory);
		academyService.updateAcademyHistory(academy);
		
		return academy;
	}
	
	// ?????? ??????????????? ??????
	@RequestMapping(value = "json/academySampleEdu/{academyCode}", method = RequestMethod.GET)
	public Map<String, Object> getAcademySampleEdu(HttpServletRequest httpRequest,
													@PathVariable String academyCode) throws Exception{
		Map<String, Object> map = academyService.getMultimediaList(academyCode);
		int imgcount = academyService.getImageCount(academyCode);
		
		return map;
	}
	
	// ?????? ?????? ?????????
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
			// ????????? ????????? ??????.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				
				for(MultipartFile file:multipartFile) {
					fileRoot = "C:\\Users\\woohr\\git\\MainProject\\MainProject\\src\\main\\resources\\static\\uploadImages\\";
					// fileRoot = "C:\\Users\\woan2\\git\\MainProject\\MainProject\\src\\main\\resources\\static\\uploadImages\\";
					
					String originalFileName = file.getOriginalFilename();	//???????????? ?????????
					String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//?????? ?????????
					String savedFileName = UUID.randomUUID() + extension;	//????????? ?????? ???
					
					File targetFile = new File(fileRoot + savedFileName);	
					
					System.out.println("ex = " + extension);
					
					Academy academy = new Academy();
					academy.setAcademyCode(academyCode);
					academy.setMultimedia(savedFileName);					
					
					try (InputStream fileStream = file.getInputStream()){
						if (extension.equals(".mp4") || extension.equals(".avi")) {
						//	fileStream = new FileInputStream(videoEncoder.encode(savedFileName));
							academy.setMultimediarole("V");
						}else {
							academy.setMultimediarole("I");
						}
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //?????? ??????
						
					} catch (Exception e) {
						//????????????
						FileUtils.deleteQuietly(targetFile);	//????????? ?????? ?????? ??????
						e.printStackTrace();
						break;
					}
					academyService.addMultimedia(academy);
				}
				strResult = "{ \"result\":\"OK\" }";
			}
			// ?????? ???????????? ?????? ???????????? 
			else
				strResult = "{ \"result\":\"OK\" }";
		}catch(Exception e){
			e.printStackTrace();
		}
		return strResult;
	}
	
	// ?????? ??????????????? ??????
	@ResponseBody
	@RequestMapping(value = "json/deleteMultimedia/{multimediano}", method = RequestMethod.POST)
	private int deleteMultimedia(@PathVariable int multimediano) throws Exception{
		
		String multimedia = academyService.getMultimedia(multimediano);
		String fileRoot = "C:\\Users\\woohr\\git\\MainProject\\MainProject\\src\\main\\resources\\static\\uploadImages\\";
		//String fileRoot = "C:\\Users\\woan2\\git\\MainProject\\MainProject\\src\\main\\resources\\static\\uploadImages\\";
		
		File file = new File(fileRoot+multimedia);
		if (file.exists()) {
			if (file.delete()) {
				//System.out.println("?????? ?????? ??????");
			}else {
				//System.err.println("?????? ?????? ??????");
			}
		} else {
			//System.err.println("?????? ?????? ????????? ???????????? ????????????.");
		}
		
		return academyService.deleteMultimedia(multimediano);
	}
	
	// ------------------------------ ?????? ?????? ------------------------------
	// ?????? ??????
	@ResponseBody
	@RequestMapping(value = "json/academyConnect/{academyCode}", method = RequestMethod.POST)
	public Map<String, Object> academyConnectList(@PathVariable String academyCode, HttpSession session) throws Exception{
		Academy academy = academyService.getAcademy(academyCode);
		Map<String, Object> map = academyService.academyConnect(academyCode);
		
		return map;
	}
	
	// ?????? ??????
	@ResponseBody
	@RequestMapping(value = "json/updateConnect/{connectNo}", method = RequestMethod.POST)
	private String updateConnect(@PathVariable int connectNo) throws Exception{
		return academyService.updateConnect(connectNo);
	}
	
	// ?????? ??????
	@ResponseBody
	@RequestMapping(value = "json/deleteConnect/{connectNo}", method = RequestMethod.POST)
	private void deleteConnect(@PathVariable int connectNo) throws Exception{
		academyService.deleteConnect(connectNo);
	}
	
	// ?????? ??????!!!!! ?????????????????? ?????????
	@ResponseBody
	@RequestMapping(value = "json/deleteAcademyAll/{academyCode}", method = RequestMethod.POST)
	private void deleteAcademy(@PathVariable String academyCode) throws Exception{
		String name = academyService.getAcademy(academyCode).getAcademyName();
		academyService.deleteAcademyAll(academyCode);
	}
	
	// ?????? ????????????
	@RequestMapping(value = "json/getBoardListAcademy/{search}", method = RequestMethod.GET)
	public List<Board> getBoardListAcademy(@PathVariable String academyCode, Search search) throws Exception{
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		List<Board> list =boardService.getBoardListAcademy(search);
		
		if(list.size()!=0) {
			int totalCount = list.get(0).getTotalCount();
			Page resultPage = new Page( search.getCurrentPage(),totalCount, pageUnit, pageSize);
			System.out.println(resultPage);
		}
		return list;
	}

}
