package com.buyedu.controller.complain;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.buyedu.domain.Board;
import com.buyedu.domain.Complain;
import com.buyedu.domain.Page;
import com.buyedu.domain.Search;
import com.buyedu.domain.User;
import com.buyedu.service.complain.ComplainService;
import com.buyedu.util.UserUtil;

@Controller

@RequestMapping("/complain/*")
public class ComplainController {
	
	@Autowired
	private ComplainService complainService;
	
	@Value("5")
	int pageUnit;
	
	@Value("10")
	int pageSize;
	
	// 게시글 신고
	@RequestMapping( value="addBoardComplain", method=RequestMethod.GET)
	public String addComplain(@RequestParam("boardNo") int boardNo, 
								@RequestParam("complainSort") String complainSort,
								@RequestParam("reason") String complainReasonCode,
								Model model , HttpServletRequest request) throws Exception {
		System.out.println("addBoardComplain/GET");
		
		Board board = new Board();
		board.setBoardNo(boardNo);
		
		User user = UserUtil.user();
		user.getUserNo();
		
		Complain complain = new Complain();
		complain.setComplainReasonCode(complainSort);
		complain.setComplainSort(complainSort);
		
		
		
		
		return "/complain/addComplainView";
	}
	
	// 댓글 신고
	@RequestMapping( value="addCommentComplain", method=RequestMethod.GET)
	public String addComplain(@RequestParam("boardNo") int boardNo, @RequestParam("commentNo") int commentNo,
								@RequestParam("complainSort") String complainSort,
								Model model , HttpServletRequest request) throws Exception {
		System.out.println("addCommentComplain/GET");
		
		
		
		return "/complain/addComplainView";
	}
	
	@RequestMapping(value = "getComplainList", method = RequestMethod.GET)
	public void getComplainList() {
		System.out.println("getCompalinList / GET");
	}
	
	

}
