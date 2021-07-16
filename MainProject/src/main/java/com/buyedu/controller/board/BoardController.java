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

import com.buyedu.domain.Board;
import com.buyedu.domain.Page;
import com.buyedu.domain.Search;
import com.buyedu.service.board.BoardService;
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
		public String addBoard(Model model) throws Exception {
			
			System.out.println("/board/addBoard : GET");
			//Map<String , Object> cgmap=categoryService.getCategoryList();
			//model.addAttribute("cglist", cgmap.get("list"));
			//System.err.println(cgmap);
			
			return "/board/addBoardView";
		}
		
		@RequestMapping( value="addBoard", method=RequestMethod.POST)
		public String addBoard( @ModelAttribute("board") Board board, Model model, @ModelAttribute("user") User user, HttpServletRequest httpRequest ) throws Exception {

			 int userNo = ((User)httpRequest.getSession().getAttribute("user")).getUserNo();   
			board.setBoardWriter(userNo);	
			System.out.println("/board/addBoard : POST");
			System.err.println(board);
			//Business Logic
			boardService.addBoard(board);
			Board board1 = boardService.getBoard(board.getBoardNo());
			System.out.println("insert??");
			model.addAttribute("board", board1);
			System.out.println("들어갔나 정보 : "+board1);
			
	
			
			
			return "/board/getBoard";
		}
		
		//@RequestMapping("/getProduct.do")
		@RequestMapping( value="getBoard", method = RequestMethod.GET)
		public String  getBoard( @RequestParam("boardNo") int boardNo, Model model, HttpServletRequest httpRequest ) throws Exception {
			
			System.out.println("/board/getBoard : GET");
			//Business Logic
			int recommendCnt = boardService.recommendCnt(boardNo);
			Board board = boardService.getBoard(boardNo);
			System.out.println(recommendCnt);
			board.setRecommendCnt(recommendCnt);
			System.out.println("컨트롤러 : "+board);
			System.err.println(boardNo);
//			int board1 = boardService.updateViewcnt(brdNo);
			// *조회수 증가시키기
			boardService.updateViewcnt(boardNo);
			// Model 과 View 연결
			model.addAttribute("board", board);
			System.out.println("겟 프로덕트 : "+board);
			System.err.println(board.getEmail());
			
			int userNo = ((User)httpRequest.getSession().getAttribute("user")).getUserNo();  
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("boardNo", boardNo);
			map.put("userNo", userNo);
			
			int boardLike = boardService.getRecommend(map);
	        System.out.println("쪼아용"+boardLike);
	        model.addAttribute("heart",boardLike);
	        
//	        int complainBoard = complainService.addComplainBoard(map);
//	        System.out.println("컴플레인"+complainBoard);
//	        model.addAttribute("complainBoard",complainBoard);
	        
	        
			
			return "/board/getBoard";
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
		public String listBoard( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
			
			System.out.println("/board/listBoard : GET / POST");
			System.err.println("1 : " +search.getSearchKeyword());
			
			
			if(search.getCurrentPage() ==0 ){
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			
			// Business logic 수행
			List<Board> list =boardService.getBoardList(search);
//			Map<String , Object> cgmap=categoryService.getCategoryList();
			if(list.size()!=0) {
			int totalCount = list.get(0).getTotalCount();
			Page resultPage = new Page( search.getCurrentPage(),totalCount, pageUnit, pageSize);
			System.out.println(resultPage);
			
			
			// Model 과 View 연결
			model.addAttribute("list", list);
			model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);
			System.err.println(search.getEndRowNum());
//			model.addAttribute("menu", menu);		
//			model.addAttribute("cglist", cgmap.get("list"));
//			model.addAttribute("category", search.getSearchCategory());
//			System.out.println("menu 어떻게 받아올까 : " +menu);
//			request.setAttribute("menu", request.getParameter("menu"));
			System.err.println("2 : "+search.getSearchKeyword());
			}
			
			return "/board/listBoard";
		}
		
		@RequestMapping( value="deleteBoard", method = RequestMethod.GET)
		public String  deleteBoard( @RequestParam("boardNo") int boardNo) throws Exception {
			
			System.out.println("/board/deleteBoard : GET");
			//Business Logic
			boardService.deleteBoard(boardNo);
			System.out.println("삭제성공");
			// Model 과 View 연결
			//model.addAttribute("board", board);
			//System.err.println("겟 프로덕트 : "+board);
			
			
			
			return "/board/listBoard";
		}
		
	
	@Configuration
	public class WebMvcConfig implements WebMvcConfigurer {

		//web root가 아닌 외부 경로에 있는 리소스를 url로 불러올 수 있도록 설정
	    //현재 localhost:8090/summernoteImage/1234.jpg
	    //로 접속하면 C:/summernote_image/1234.jpg 파일을 불러온다.
	    @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
	        registry.addResourceHandler("/summernoteImage/**")
	                .addResourceLocations("file:///C:/summernote_image/");
	    }
	} 
	}

