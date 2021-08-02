package com.buyedu.restcontroller.complain;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.buyedu.domain.Board;
import com.buyedu.domain.Complain;
import com.buyedu.domain.User;
import com.buyedu.service.complain.ComplainService;
import com.buyedu.util.UserUtil;

@RestController
@RequestMapping("/complain/*")
public class ComplainRestController {
	
	@Autowired
	private ComplainService complainService;
	
	@Value("20")
	int pageUnit;
	
	@Value("5")
	int pageSize;
	
	// 게시글 신고
	@ResponseBody
	@RequestMapping( value="json/addBoardComplain/{boardNo}", method=RequestMethod.POST)
	public void addComplain(@PathVariable int boardNo, 
							@RequestParam String reason) throws Exception {
		
		System.out.println("json/addBoardComplain : POST");
		
		User user = UserUtil.user();
		
		Board board = new Board();
		board.setBoardNo(boardNo);
		
		System.out.println("json user = "+user);
		System.out.println("json board = " + board);
		
		Complain complain = new Complain();
		complain.setUser(user);
		complain.setBoard(board);
		complain.setComplainReasonCode(reason);
		complain.setComplainSort("B");
		
		System.out.println("게시글신고 complain = " + complain);
		
		complainService.addComplain(complain);
		
		System.out.println("신고 완료");
	}
	
	// 신고 처리
	@RequestMapping(value="json/updateComplain/{complainNo}", method=RequestMethod.POST)
	public void updateComplain(@PathVariable int complainNo) throws Exception{
		
		System.out.println("json/updateComplain : POST");
		
		Complain complain = complainService.getComplain(complainNo);
		
		complain.setComplainState("1");
		
		complainService.updateComplainState(complain);
		
		System.out.println("신고 처리 완료");
	};
	
	// 신고 반려
	@RequestMapping(value = "json/deleteComplain2/{complainNo}", method=RequestMethod.POST)
	public void deleteComplain2(@PathVariable int complainNo) throws Exception{
		
		System.out.println("json/deleteComplain : POST");
		
		complainService.deleteComplain(complainNo);
		
		System.out.println("신고가 반려 되었습니다.");
	};
	
	// 신고 취소
	@RequestMapping(value = "json/deleteComplain/{boardNo}", method=RequestMethod.POST)
	public void deleteComplain(@PathVariable int boardNo) throws Exception{
		
		System.out.println("json/deleteComplain : POST");
		
		User user = UserUtil.user();
		
		Board board = new Board();
		board.setBoardNo(boardNo);
		
		Complain complain = new Complain();
		complain.setUser(user);
		complain.setBoard(board);
		
		int complainNo =  complainService.getComplainNo(complain);
		
		complainService.deleteComplain(complainNo);
		
		System.out.println("신고가 삭제 되었습니다.");
	};
	
	
	

}
