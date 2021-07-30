package com.buyedu.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.buyedu.domain.Academy;
import com.buyedu.domain.Board;
import com.buyedu.domain.Page;
import com.buyedu.domain.Search;
import com.buyedu.service.academy.AcademyService;
import com.buyedu.service.board.BoardService;
import com.buyedu.util.UserUtil;
//import com.buyedu.service.complain.ComplainService;
import com.buyedu.domain.User;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


	//==> 게시판관리 Controller
	@Controller
	@RequestMapping("/board/*")
	public class BoardController {
		
		///Field
		@Autowired
		private BoardService boardService;
		
		@Autowired
		private AcademyService academyService;
//		private ComplainService complainService;
		//setter Method 구현 않음
		
//		@Autowired
//		@Qualifier("categoryServiceImpl")
//		private CategoryService categoryService;
//		//setter Method 구현 않음
			
		public BoardController(){
			System.out.println(this.getClass());
		}
		

		@Value("5")
		int pageUnit;
		
		@Value("10")
		int pageSize;
		
		@RequestMapping( value="addBoard", method=RequestMethod.GET )
		public String addBoard( Model model, HttpServletRequest request) throws Exception {
			
			System.out.println("/board/addBoard : GET");
			String category = request.getParameter("cateCode");
			String academyCode = request.getParameter("academyCode");
			System.out.println("글쓰기 카테고리 : " +category);
			System.out.println("글쓰기 학원코드 : " +academyCode);
			Board board = new Board();
			board.setCateCode(category);
			board.setAcaWriter(academyCode);
			System.out.println("addview : "+board.getCateCode());
			model.addAttribute(board);
			
			//Map<String , Object> cgmap=categoryService.getCategoryList();
			//model.addAttribute("cglist", cgmap.get("list"));
			//System.err.println(cgmap);
			
			return "/board/addBoardView";
		}
		
		@RequestMapping( value="addBoard", method=RequestMethod.POST)
		public String addBoard( @ModelAttribute("board") Board board, Model model, @ModelAttribute("user") User user, HttpServletRequest httpRequest ) throws Exception {

			int userNo = ((User)httpRequest.getSession().getAttribute("user")).getUserNo();
			String category = httpRequest.getParameter("cateCode");
			System.out.println(category);
			board.setCateCode(category);
			System.out.println("카테고리 코드 : "+board.getCateCode());
		//	board.setBoardWriter(userNo);	
			System.out.println("/board/addBoard : POST");
			System.err.println(board);
			//Business Logic
			boardService.addBoard(board);
			Board board1 = boardService.getBoard(board.getBoardNo());
			System.out.println("insert??");
			model.addAttribute("board", board1);
			model.addAttribute(userNo);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("boardNo", board.getBoardNo());
			map.put("userNo", userNo);
			int boardLike = boardService.getRecommend(map);
			model.addAttribute("heart",0);
			System.out.println("들어갔나 정보 : "+board1);
			System.out.println("추천수가 안나오지? "+boardLike);
			
			return "redirect:/board/listBoard?cateCode="+board.getCateCode();
		}
		
		//@RequestMapping("/getProduct.do")
		@RequestMapping( value="getBoard", method = RequestMethod.GET)
		public String  getBoard( @RequestParam("boardNo") int boardNo, Model model, HttpServletRequest request ) throws Exception {
			
			System.out.println("/board/getBoard : GET");
			//Business Logic
			
			int userNo = ((User)request.getSession().getAttribute("user")).getUserNo();  
			int recommendCnt = boardService.recommendCnt(boardNo);
			String category = request.getParameter("cateCode");
			String academyCode = request.getParameter("academyCode");
			String isMine = request.getParameter("isMine");
			System.out.println("겟보드 이즈마인 :" +isMine);
			
			Board board = boardService.getBoard(boardNo);
			
			System.out.println("컨트롤러 겟보드 "+board);
			
			board.setRecommendCnt(recommendCnt);
			System.err.println(board.getRecommendCnt());
			
		//	board.setBoardWriter(boardWriter);
			System.out.println("컨트롤러 : "+board);
			System.out.println(boardNo);
		//	System.out.println("컨트롤러 boardWriter : "+boardWriter);
//			int board1 = boardService.updateViewcnt(brdNo);
			// *조회수 증가시키기
			boardService.updateViewcnt(boardNo);
			// Model 과 View 연결
			model.addAttribute("board", board);
			model.addAttribute("isMine", isMine);
			System.out.println("겟 프로덕트 : "+board);
			System.err.println(board.getEmail());
			
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("boardNo", boardNo);
			map.put("userNo", userNo);
			
			
			int boardLike = boardService.getRecommend(map);
	        System.out.println("쪼아용"+boardLike);
	        model.addAttribute("heart",boardLike);
	        model.addAttribute("userNo",userNo);
	        
//	        int complainBoard = complainService.addComplainBoard(map);
//	        System.out.println("컴플레인"+complainBoard);
//	        model.addAttribute("complainBoard",complainBoard);
			return "/board/getBoard";
		}
		
		@RequestMapping( value="getBoardAca", method = RequestMethod.GET)
		public String  getBoardAca( @RequestParam("boardNo") int boardNo, Model model, HttpServletRequest request ) throws Exception {
			
			System.out.println("/board/getBoardAca : GET");
			//Business Logic
			
			int userNo = ((User)request.getSession().getAttribute("user")).getUserNo();  
			int recommendCnt = boardService.recommendCnt(boardNo);
			String category = request.getParameter("cateCode");
			String academyCode = request.getParameter("academyCode");
			
			
				Board board = boardService.getBoardAcademy(boardNo);
				board.setRecommendCnt(recommendCnt);
//				board.setAcademyCode(academyCode);
				boardService.updateViewcnt(boardNo);
				System.out.println("컨트롤러 겟보드아카 "+board);
				// Model 과 View 연결
				model.addAttribute("board", board);
				model.addAttribute("academy", academyCode);
				System.out.println("모델에 담긴 아카데미 : "+model.addAttribute("academy", academyCode));
				return "/board/getBoardAca"; 
		}
		
		//@RequestMapping("/updateProductView.do")
		@RequestMapping( value="updateBoard", method=RequestMethod.GET )
		public String updateBoard( @RequestParam("boardNo") int boardNo , Model model ) throws Exception{

			System.out.println("/board/updateBoardView : GET");
			//Business Logic
			Board board = boardService.getBoard(boardNo);
			System.err.println("게시글번호 왜못받아??"+boardNo);
//			Map<String , Object> cgmap=categoryService.getCategoryList();
//			// Model 과 View 연결
//			System.err.println("리스트 :: " + cgmap.get("list"));
//			model.addAttribute("list", cgmap.get("list"));
			model.addAttribute("board", board);
			
			return "/board/updateBoardView";
		}
		
		//@RequestMapping("/updateProduct.do")
		@RequestMapping( value="updateBoard", method=RequestMethod.POST )
		public String updateBoard( @ModelAttribute("board") Board board , Model model) throws Exception{

			/*
			 * int prodNo=Integer.parseInt(request.getParameter("prodNo"));
			 * System.out.println("/updatePorudct.do");
			 */
			//Business Logic
			System.err.println("업데이트 전 프로덕트 : "+board);
			boardService.updateBoard(board);
			System.out.println("업데이트 후 프로덕트 : "+board);
			System.out.println("받아오는 boardNo :"+board.getBoardNo());

//			String sessionId=((User)session.getAttribute("user")).getUserId();
//			if(sessionId.equals(user.getUserId())){
//				session.setAttribute("user", user);
//			}
			
			return "redirect:/board/getBoard?boardNo="+board.getBoardNo();
		}
		
		//@RequestMapping("/listProduct.do")
		@RequestMapping( value="listBoard" )
		public String listBoard( @ModelAttribute("search") Search search , @ModelAttribute("board") Board board, Model model , HttpServletRequest request) throws Exception{
			
			System.out.println("/board/listBoard : GET / POST");
			User user = UserUtil.user();
		    Map<String, Object> map1 = academyService.getAcademyCodeList(user.getUserNo());
		    model.addAttribute("list", map1.get("list"));
		    
			System.err.println("keyword : " +search.getSearchKeyword());
			System.err.println("condition : " +search.getSearchConditionb());
			System.err.println("condition 1 : " + request.getParameter("searchConditionb"));
			
			String category = request.getParameter("cateCode"); // 게시판 종류
			String isMine = request.getParameter("isMine");
//			String academyCode = request.getParameter("academyCode");
			
			if(isMine==null){
				isMine="n";
			}
			
			int userNo = ((User)request.getSession().getAttribute("user")).getUserNo();  
			
			
			if(search.getCurrentPage() ==0 ){
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			
			System.out.println("현재 :: " + search.getCurrentPage());
			search.setCateCode(category);
			System.out.println("list 컨트롤러 카테고리: " +category);
			search.setIsMine(isMine);
			search.setSearchUserNo(userNo);
	//		search.setAcademyCode(academyCode);
			// Business logic 수행
			List<Board> list =boardService.getBoardList(search);
			
			Page resultPage1 = new Page( 1, 0, pageUnit, pageSize);
			model.addAttribute("resultPage", resultPage1);
			
//			Map<String , Object> cgmap=categoryService.getCategoryList();
			if(list.size()!=0) {
			int totalCount = list.get(0).getTotalCount();
			Page resultPage = new Page( search.getCurrentPage(),totalCount, pageUnit, pageSize);
			System.out.println(resultPage);
			
			board.setCateCode(category);
//			List<Map<String, Object>> commentMap= boardService.listComment(board.getBoardNo());
			
			List<Map<String, Object>> map= boardService.getBoardListPin(board); 
			
//			List<Board> list2 =boardService.getMyBoardList(search, userNo);
//			Map<String , Object> cgmap=categoryService.getCategoryList();
//			if(list2.size()!=0) {
//			int totalCount2 = list2.get(0).getTotalCount();
//			Page resultPage2 = new Page( search.getCurrentPage(),totalCount, pageUnit, pageSize);
//			System.out.println(resultPage);
			// Model 과 View 연결
			model.addAttribute("list", list);
			model.addAttribute("map", map);
//			model.addAttribute("list2", list2);
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);
//			model.addAttribute("category", category);
			System.err.println("로우넘 이상해 : " +search.getEndRowNum());
//
			System.err.println("2 : "+search.getSearchKeyword());
			}

			return "/board/listBoard";
		}
		
		//@RequestMapping("/listProduct.do")
		@RequestMapping( value="listBoardAcademy" )
		public String listBoardAcademy( @ModelAttribute("search") Search search , @ModelAttribute("board") Board board, Model model , HttpServletRequest request) throws Exception{
			
			System.out.println("학원 공지사항 돌아간다");
			User user = UserUtil.user();
		    Map<String, Object> map = academyService.getAcademyCodeList(user.getUserNo());
		    model.addAttribute("list", map.get("list"));
		    
		    String academyCode = request.getParameter("academyCode");
			Academy academy = academyService.getAcademy(academyCode);
			model.addAttribute("academy", academy);
			
			System.err.println("여기는 서치 : "+search);
			System.out.println("여기는 보드 : "+board);
			String category = request.getParameter("cateCode"); // 게시판 종류
			
			System.out.println("학원 공지사항 아카코드 : "+academyCode);
			
			if(search.getCurrentPage() ==0 ){
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			search.setCateCode(category);
		//	search.setAcademyCode(academyCode);
			
			List<Board> listb =boardService.getBoardListAcademy(search);
			model.addAttribute("search", search);
			Page resultPage1 = new Page( 1, 0, pageUnit, pageSize);
			model.addAttribute("resultPage", resultPage1);
			
			if(listb.size()!=0) {
				int totalCount = listb.get(0).getTotalCount();
				Page resultPage = new Page( search.getCurrentPage(),totalCount, pageUnit, pageSize);
				System.out.println(resultPage);
				
			model.addAttribute("listb", listb);
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);
			}
			
			return "/board/listBoardAcademy";
		}
		
		@RequestMapping( value="deleteBoard", method = RequestMethod.GET)
		public String  deleteBoard( @RequestParam("boardNo") int boardNo, HttpServletRequest request) throws Exception {
		
			System.out.println("/board/deleteBoard : GET");
			//Business Logic
//			Board board = new Board();
			String category = request.getParameter("cateCode");
			
//			boardService.getBoardList(cateCode);
			boardService.deleteBoard(boardNo);
			System.out.println("삭제성공");
			System.out.println("살려주세요......................");
			System.err.println("카테고리 코드 받아오니..? :"+category);
			Board board = new Board();
			board.setCateCode(category);
			// Model 과 View 연결
			//model.addAttribute("board", board);
			//System.err.println("겟 프로덕트 : "+board);
			//BoardService boardService.listBoard(null, null, null);

			return "redirect:/board/listBoard?cateCode="+board.getCateCode();
		}

	}

