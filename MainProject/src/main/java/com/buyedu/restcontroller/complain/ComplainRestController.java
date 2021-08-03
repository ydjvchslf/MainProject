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
import com.buyedu.domain.Review;
import com.buyedu.domain.User;
import com.buyedu.service.board.BoardService;
import com.buyedu.service.complain.ComplainService;
import com.buyedu.service.review.ReviewService;
import com.buyedu.util.UserUtil;

@RestController
@RequestMapping("/complain/*")
public class ComplainRestController {
	
	@Autowired
	private ComplainService complainService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ReviewService reviewService;
	
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
		public int addCommentComplain(@PathVariable int boardNo, 
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
			
			int ccount = complainService.getComplainCommentCount(complain);
			
			if (ccount == 0) {
				complainService.addComplain(complain);
			}
			
			return ccount;
		}
		
		// 댓글 신고
		@ResponseBody
		@RequestMapping( value="json/complainReview/{reviewNo}", method=RequestMethod.POST)
		public int addReviewComplain(@PathVariable int reviewNo, 
								@RequestParam("reason") String reason) throws Exception {
			
			User user = UserUtil.user();
			Review review = new Review();
			reviewService.getReview(reviewNo);
			
			Complain complain = new Complain();
			complain.setUser(user);
			complain.setReview(review);
			complain.setComplainReasonCode(reason);
			complain.setComplainSort("R");
			
			int rcount = complainService.getReviewCount(complain);
			
			if (rcount == 0) {
				complainService.addComplain(complain);
			}
			
			return rcount;
		}
	
	// 게시글 신고 처리
	@RequestMapping(value="json/updateComplain/{complainNo}", method=RequestMethod.POST)
	public void updateComplain(@PathVariable int complainNo) throws Exception{
		
		Complain complain = complainService.getComplain(complainNo);
		complain.setComplainState("1");
		complainService.updateComplainState(complain);
		
		String sort = complain.getComplainSort();
		if (sort.equals("B")) {
			Board board = boardService.getBoard(complain.getBoard().getBoardNo());
			boardService.deleteBoard(complain.getBoard().getBoardNo());
		} else if (sort.equals("C")) {
			int commentNo = complainService.getCommentNo(complainNo);
			boardService.deleteComment(commentNo);
		} else if (sort.equals("R")){
			// 리뷰 블러 처리
		}
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
