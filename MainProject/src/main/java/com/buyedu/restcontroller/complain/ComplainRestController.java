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
import com.buyedu.service.board.BoardService;
import com.buyedu.service.complain.ComplainService;
import com.buyedu.util.UserUtil;

@RestController
@RequestMapping("/complain/*")
public class ComplainRestController {
	
	@Autowired
	private ComplainService complainService;
	
	@Autowired
	private BoardService boardService;
	
	@Value("20")
	int pageUnit;
	
	@Value("5")
	int pageSize;
	
	// 게시글 신고
	@ResponseBody
	@RequestMapping( value="json/addBoardComplain/{boardNo}", method=RequestMethod.POST)
	public void addBoardComplain(@PathVariable int boardNo, 
							@RequestParam String reason) throws Exception {
		
		User user = UserUtil.user();
		Board board = new Board();
		board.setBoardNo(boardNo);
		
		Complain complain = new Complain();
		complain.setUser(user);
		complain.setBoard(board);
		complain.setComplainReasonCode(reason);
		complain.setComplainSort("B");
		
		complainService.addComplain(complain);
	}
	
	// 댓글 신고
		@ResponseBody
		@RequestMapping( value="json/addCommentComplain/{boardNo}", method=RequestMethod.POST)
		public void addCommentComplain(@PathVariable int boardNo, 
								@RequestParam("commentNo") int commentNo,
								@RequestParam("reason") String reason) throws Exception {
			
			User user = UserUtil.user();
			Board board = new Board();
			board.setBoardNo(boardNo);
			
			Complain complain = new Complain();
			complain.setUser(user);
			complain.setBoard(board);
			complain.setCommentNo(commentNo);
			complain.setComplainReasonCode(reason);
			complain.setComplainSort("C");
			
			complainService.addComplain(complain);
		}
	
	// 신고 처리
	@RequestMapping(value="json/updateComplain/{complainNo}", method=RequestMethod.POST)
	public void updateComplain(@PathVariable int complainNo) throws Exception{
		
		Complain complain = complainService.getComplain(complainNo);
		complain.setComplainState("1");
		complainService.updateComplainState(complain);
		Board board = boardService.getBoard(complain.getBoard().getBoardNo());
		boardService.deleteBoard(complain.getBoard().getBoardNo());
	};
	
	// 신고 반려
	@RequestMapping(value = "json/deleteComplain2/{complainNo}", method=RequestMethod.POST)
	public void deleteComplain2(@PathVariable int complainNo) throws Exception{
		
		complainService.deleteComplain(complainNo);
	};
	
	// 신고 취소
	@RequestMapping(value = "json/deleteComplain/{boardNo}", method=RequestMethod.POST)
	public void deleteComplain(@PathVariable int boardNo) throws Exception{
		
		User user = UserUtil.user();
		Board board = new Board();
		board.setBoardNo(boardNo);
		Complain complain = new Complain();
		complain.setUser(user);
		complain.setBoard(board);
		
		int complainNo =  complainService.getComplainNo(complain);
		
		complainService.deleteComplain(complainNo);
	};

}
