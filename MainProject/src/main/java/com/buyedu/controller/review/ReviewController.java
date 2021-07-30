package com.buyedu.controller.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.buyedu.domain.Academy;
import com.buyedu.domain.Board;
import com.buyedu.domain.Connect;
import com.buyedu.domain.Page;
import com.buyedu.domain.Review;
import com.buyedu.domain.Search;
import com.buyedu.domain.User;
import com.buyedu.service.academy.AcademyService;
import com.buyedu.service.review.ReviewService;
import com.buyedu.service.user.UserService;
import com.buyedu.util.UserUtil;

@Controller

@RequestMapping("/review/*")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private AcademyService academyService;
	
	public ReviewController() {
		System.out.println(this.getClass());
	}
	
	@Value("5")
	int pageUnit;
	
	@Value("10")
	int pageSize;
	
	@RequestMapping( value="addReviewView", method=RequestMethod.GET)
	public String addReview(@ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception {
		System.out.println("addReviewView");
		
		
		String academyCode = request.getParameter("academyCode");

		System.out.println("아카데미코드 : "+academyCode);
		model.addAttribute("academyCode" , academyCode);
		

		
		
		return "/review/addReviewView";
	}
	@RequestMapping (value="addReview", method=RequestMethod.POST)
	public String addReview(@ModelAttribute("review") Review review , @ModelAttribute("uesr") User user ,  HttpServletRequest httpRequest) throws Exception {
		
		System.out.println("애드리뷰포스트 시작");
		
		int userNo = ((User)httpRequest.getSession().getAttribute("user")).getUserNo();
		System.out.println(userNo);
		
		System.out.println("review :" + review);
		user.setUserNo(userNo);
		review.setReviewWriter(user);
		
		String academyCode = httpRequest.getParameter("academyCode");
		System.out.println("아카데미코드 : "+academyCode);
		
		System.out.println("리뷰가 들어가야함 review :" +review);
		
		reviewService.addReview(review);
		
		review.setAcademyCode(academyCode);
		
		
		return "redirect:/review/listReview?academyCode="+review.getAcademyCode();
	}

	@RequestMapping (value = "getReview" , method=RequestMethod.GET)
	public String getReview (@RequestParam("reviewNo") int reviewNo, Model model , HttpServletRequest request) throws Exception {
		System.out.println("리뷰넘버 : "+reviewNo);
		Review review = reviewService.getReview(reviewNo);
		
		int userNo = ((User)request.getSession().getAttribute("user")).getUserNo();  
		//String name = ((User)httpRequest.getSession().getAttribute("user")).getName();
		String academyCode = request.getParameter("academyCode");
		
		
		model.addAttribute("review" , review);
		model.addAttribute("userNo", userNo);
		model.addAttribute("academyCode" , academyCode);
		System.out.println(userNo);
		System.out.println(review);
		
		
		return "/review/getReview";
	}
	
	@RequestMapping (value = "updateReview", method=RequestMethod.GET)
	public String updateReview(@RequestParam("reviewNo") int reviewNo , Model model , HttpServletRequest request) throws Exception {
		
		Review review = reviewService.getReview(reviewNo);
		String academyCode = request.getParameter("academyCode");
		System.out.println("아카데미코드 : "+academyCode);
		
		
		
		model.addAttribute("academyCode",academyCode);
		model.addAttribute("review",review);
		
		return "/review/updateReviewView";
	}
	
	@RequestMapping( value="updateReview", method=RequestMethod.POST)
	public String updateReview( @ModelAttribute("reviewNo") Review review , HttpServletRequest request) throws Exception{
		
		
		reviewService.updateReview(review);
		String academyCode = request.getParameter("academyCode");
		System.out.println("아카데미코드 : "+academyCode);
	
		
		review.setAcademyCode(academyCode);
		System.out.println("reivew : "+review);
		
		
		return "redirect:/review/getReview?reviewNo="+review.getReviewNo()+"&academyCode="+review.getAcademyCode();
		
	}
	
	@RequestMapping (value="listReview")
	public String listReview(@ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("listReview 시작");
		int userNo = ((User)request.getSession().getAttribute("user")).getUserNo();
		
		String academyCode = request.getParameter("academyCode");
		Academy academy = academyService.getAcademy(academyCode);
		
		model.addAttribute("academy", academy);
		
		// 툴바 학원 리스트
		User user = UserUtil.user();
		
		Map<String, Object> map = academyService.getAcademyCodeList(user.getUserNo());
		
		model.addAttribute("list", map.get("list"));
		
		
		System.out.println("search : "+search);
		
		System.out.println("academyCode : "+academyCode);
		
		System.out.println("userNo : "+userNo);
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setSearchAcademyCode(academyCode);
				
		Map<String , Object> map2 = reviewService.getReviewList(search);
		System.out.println("컨트롤 쪽 map : "+map2);
		
		int totalCount = ((Integer)map2.get("totalCount")).intValue();
		
		Page resultPage = new Page(search.getCurrentPage(),totalCount , pageUnit , search.getPageSize());
		
		model.addAttribute("listR" , map2.get("list"));
		model.addAttribute("resultPage", resultPage);

		return "/review/listReview";
	}
	
	//test
	@RequestMapping(value="testAddReview")
	public String testAddReview(HttpServletRequest request, Model model) throws Exception {
		System.out.println("testAddReview");
		
		System.out.println(request.getParameter("userNo"));
		System.out.println(request.getParameter("academyCode"));
		
		// 툴바 시작
		Academy academy = academyService.getAcademy(request.getParameter("academyCode"));
		model.addAttribute("academy", academy);
		User user = UserUtil.user();
		Map<String, Object> map = academyService.getAcademyCodeList(user.getUserNo());
		model.addAttribute("list", map.get("list"));
		// 툴바 끝
		
		return "/review/testAdd";
	}
	
	
	
	
	
	@RequestMapping(value="deleteReview", method = RequestMethod.GET)
	public String deleteReview(@RequestParam("reviewNo") int reviewNo , HttpServletRequest request) throws Exception{
		
		System.out.println("/review/deleteReview : GET");
		reviewService.deleteReview(reviewNo);
		
		Review review = new Review();
		
		review.setReviewNo(reviewNo);
		
		String academyCode = request.getParameter("academyCode");
		System.out.println("아카데미코드 : "+academyCode);
	
		
		review.setAcademyCode(academyCode);
		System.out.println("리뷰넘버들어가냐..?"+reviewNo);
		System.out.println("리뷰들어가냐"+review);
		System.out.println("아카데미코드 들어가줘 제발"+academyCode);
		
		
		
		return "redirect:/review/listReview?academyCode="+review.getAcademyCode();
		
		
	}
	
	@RequestMapping(value="getmyReview")
	public String getmyReview(@ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception {
		
		System.out.println("getmyReview 시작");
		int userNo = ((User)request.getSession().getAttribute("user")).getUserNo();
		
		String academyCode = request.getParameter("academyCode");
		Academy academy = academyService.getAcademy(academyCode);
		
		model.addAttribute("academy", academy);
		
		// 툴바 학원 리스트
		User user = UserUtil.user();
		
		Map<String, Object> map = academyService.getAcademyCodeList(user.getUserNo());
		
		model.addAttribute("list", map.get("list"));
		
		
		System.out.println("search : "+search);
		
		System.out.println("academyCode : "+academyCode);
		
		System.out.println("userNo : "+userNo);
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setSearchAcademyCode(academyCode);
				
		Map<String , Object> map2 = reviewService.getReviewList(search);
		System.out.println("컨트롤 쪽 map : "+map2);
		
		int totalCount = ((Integer)map2.get("totalCount")).intValue();
		
		Page resultPage = new Page(search.getCurrentPage(),totalCount , pageUnit , search.getPageSize());
		
		model.addAttribute("listR" , map2.get("list"));
		model.addAttribute("resultPage", resultPage);
		
		
		
		return "/review/mylistReview";
	}
	

}
