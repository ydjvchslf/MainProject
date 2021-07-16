package com.buyedu.restcontroller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;
import com.buyedu.domain.User;
import com.buyedu.service.board.BoardService;


@Controller
@RequestMapping("/board/*")
public class BoardRestController {

	@Autowired
	private BoardService boardService;
	//setter Method 구현 않음
		
	public BoardRestController(){
		System.out.println(this.getClass());
	}
	
	@ResponseBody
    @RequestMapping(value = "json/heart", method = RequestMethod.POST)
    public int heart(HttpServletRequest httpRequest) throws Exception {

        int heart = Integer.parseInt(httpRequest.getParameter("heart"));
        int boardNo = Integer.parseInt(httpRequest.getParameter("boardNo"));
        int userNo = ((User) httpRequest.getSession().getAttribute("user")).getUserNo();
        
        Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		map.put("userNo", userNo);
//
//        Product product = new Product();
//        User user = new User();
//
//        product.setProdNo(prodNo);
//        user.setUserId(userid);

        System.out.println(heart);

        if(heart >= 1) {
        	boardService.deleteRecommend(map);
            heart=0;
        } else {
        	boardService.addRecommend(map);
            heart=1;
        }

        return heart;

    }
	
	@ResponseBody
    @RequestMapping(value = "json/listComment/{boardNo}", method = RequestMethod.GET)

	    private List<Map<String, Object>> listComment(@PathVariable int boardNo) throws Exception{
//		System.out.println("rest listComment : get");
//		System.err.println(boardService.listComment(boardNo));
//		int commentCount = boardService.commentCount(boardNo);
//		model.addAttribute("commentCount", commentCount);
//		System.out.println("리스트댓글 : "+commentCount);
		List<Map<String, Object>> map= boardService.listComment(boardNo);
		int commentCount = boardService.commentCount(boardNo);
	    System.out.println("리스트코멘트 : "+commentCount);
	    if(map.size()!=0) {
	    	map.get(0).put("commentCount", commentCount);}
	    System.err.println(map);
		return map;
	    }

	
	@ResponseBody
    @RequestMapping(value = "json/addComment", method = RequestMethod.POST)
	    private int addComment(@RequestParam int boardNo, @RequestParam String content, HttpServletRequest httpRequest) throws Exception{
	        
	        int userNo = ((User) httpRequest.getSession().getAttribute("user")).getUserNo();
	        int commentCount =boardService.commentCount(boardNo);
	        Map<String, Object> map = new HashMap<String, Object>();
			map.put("boardNo", boardNo);
			map.put("commentContent", content);
			map.put("userNo", userNo);
//			map.put("commentCnt", commentCount);
			System.err.println("보드서비스 : " + map);

	        //로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 됩니다. 저는 따로 폼을 구현하지 않았기때문에 임시로 "test"라는 값을 입력해놨습니다.	
	        return boardService.addComment(map);
	        
	    }
	@ResponseBody
    @RequestMapping(value = "json/updateComment", method = RequestMethod.POST)
    private int updateComment(@RequestParam int commentNo, @RequestParam String content, HttpServletRequest httpRequest) throws Exception{
        
		System.out.println("updateComment/post");
		int userNo = ((User) httpRequest.getSession().getAttribute("user")).getUserNo();   
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("commentNo", commentNo);
		map.put("commentContent", content);
		map.put("userNo", userNo);
        
        return boardService.updateComment(map);
    }
    
	@ResponseBody
    @RequestMapping(value = "json/deleteComment/{commentNo}", method = RequestMethod.POST)
    private int deleteComment(@PathVariable int commentNo) throws Exception{
//		boardService.deleteCommentCnt(boardNo);
		    return boardService.deleteComment(commentNo);
		}
	
//	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json")
//	@ResponseBody
//	public JsonObject uploadSummernoteImageFile(@RequestParam("file")  multipartFile) {
//		
//		JsonObject jsonObject = new JsonObject();
//		
//		String fileRoot = "C:\\summernote_image\\";	//저장될 외부 파일 경로
//		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
//		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
//				
//		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
//		
//		File targetFile = new File(fileRoot + savedFileName);	
//		
//		try {
//			InputStream fileStream = multipartFile.getInputStream();
//			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
//			jsonObject.addProperty("url", "/Images/"+savedFileName);
//			jsonObject.addProperty("responseCode", "success");
//				
//		} catch (IOException e) {
//			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
//			jsonObject.addProperty("responseCode", "error");
//			e.printStackTrace();
//		}
//		
//		return jsonObject;
//	}
//}
        
}
