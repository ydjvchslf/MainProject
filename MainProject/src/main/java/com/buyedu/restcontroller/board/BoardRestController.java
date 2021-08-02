package com.buyedu.restcontroller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.buyedu.domain.User;
import com.buyedu.service.board.BoardService;
import com.google.gson.JsonObject;

import com.google.gson.JsonObject;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;


@Controller
@RequestMapping("/board/*")
public class BoardRestController {

	@Autowired
	private BoardService boardService;
		
	public BoardRestController(){
		System.out.println(this.getClass());
	}
	
	// 좋아요
	@ResponseBody
    @RequestMapping(value = "json/heart", method = RequestMethod.POST)
    public int heart(HttpServletRequest httpRequest) throws Exception {

        int heart = Integer.parseInt(httpRequest.getParameter("heart"));
        int boardNo = Integer.parseInt(httpRequest.getParameter("boardNo"));
        int userNo = ((User) httpRequest.getSession().getAttribute("user")).getUserNo();
        
        Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		map.put("userNo", userNo);

        if(heart >= 1) {
        	boardService.deleteRecommend(map);
            heart=0;
        } else {
        	boardService.addRecommend(map);
            heart=1;
        }

        return heart;
    }
	
	// 댓글 목록
	@ResponseBody
    @RequestMapping(value = "json/listComment/{boardNo}", method = RequestMethod.GET)

	    private List<Map<String, Object>> listComment(@PathVariable int boardNo) throws Exception{
		List<Map<String, Object>> map= boardService.listComment(boardNo);
		int commentCount = boardService.commentCount(boardNo);
	    if(map.size()!=0) {
	    	map.get(0).put("commentCount", commentCount);}
	    
		return map;
	    }

	// 댓글 작성
	@ResponseBody
    @RequestMapping(value = "json/addComment", method = RequestMethod.POST)
	    private int addComment(@RequestParam int boardNo, @RequestParam String content, HttpServletRequest httpRequest) throws Exception{
	        
	        int userNo = ((User) httpRequest.getSession().getAttribute("user")).getUserNo();
	        int commentCount =boardService.commentCount(boardNo);
	        Map<String, Object> map = new HashMap<String, Object>();
			map.put("boardNo", boardNo);
			map.put("commentContent", content);
			map.put("userNo", userNo);

	        return boardService.addComment(map); 
	    }
	
	// 댓글 수정
	@ResponseBody
    @RequestMapping(value = "json/updateComment", method = RequestMethod.POST)
    private int updateComment(@RequestParam int commentNo, @RequestParam String content, HttpServletRequest httpRequest) throws Exception{
        
		int userNo = ((User) httpRequest.getSession().getAttribute("user")).getUserNo();   
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commentNo", commentNo);
		map.put("commentContent", content);
		map.put("userNo", userNo);
        
        return boardService.updateComment(map);
    }
    
	// 댓글 삭제
	@ResponseBody
    @RequestMapping(value = "json/deleteComment/{commentNo}", method = RequestMethod.POST)
    private int deleteComment(@PathVariable int commentNo) throws Exception{
		
		return boardService.deleteComment(commentNo);
	}
	
	// 썸머노트 API 이미지 업로드
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
    @ResponseBody
    public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {

        JsonObject jsonObject = new JsonObject();

        String fileRoot = "C:\\z.utility\\summernote_image\\";	//저장될 파일 경로
        String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자

        // 랜덤 UUID+확장자로 저장될 savedFileName
        String savedFileName = UUID.randomUUID() + extension;	
        
        File targetFile = new File(fileRoot + savedFileName);

        try {
            InputStream fileStream = multipartFile.getInputStream();
            FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
            jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
            jsonObject.addProperty("responseCode", "success");

        } catch (IOException e) {
            FileUtils.deleteQuietly(targetFile);	// 실패시 저장된 파일 삭제
            jsonObject.addProperty("responseCode", "error");
            e.printStackTrace();
        }

        return jsonObject;
    }
	
}
        

