package com.buyedu.controller.review;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.buyedu.domain.Academy;
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
	
	@Autowired
	private UserService userService;
	
	public ReviewController() {
		System.out.println(this.getClass());
	}
	
	@Value("5")
	int pageUnit;
	
	@Value("6")
	int pageSize;
	
	// 리뷰 작성화면 단순 네비게이터
	@RequestMapping( value="addReviewView", method=RequestMethod.GET)
	public String addReview(@ModelAttribute("search") Search search , Model model) throws Exception {
		
		return "/review/addReviewView";
	}
	
	// 리뷰 작성한 후 디비에 저장
	@RequestMapping (value="addReview", method=RequestMethod.POST)
	public String addReview(@ModelAttribute("review") Review review , HttpServletRequest request) throws Exception {
		
		User user = UserUtil.user();
		user.setUserNo(user.getUserNo());
		review.setReviewWriter(user);
		
		String academyCode = request.getParameter("academyCode");
		
		reviewService.addReview(review);
		
		return "redirect:/review/listReview?academyCode="+academyCode;
	}

	// 리뷰 상세보기화면 네비게이터
	@RequestMapping (value = "getReview" , method=RequestMethod.GET)
	public String getReview (@RequestParam("reviewNo") int reviewNo, Model model , HttpServletRequest request) throws Exception {
		
		Review review = reviewService.getReview(reviewNo);
		
		User user = UserUtil.user(); 
		String academyCode = request.getParameter("academyCode");
		
		model.addAttribute("review" , review);
		model.addAttribute("userNo", user.getUserNo());
		model.addAttribute("academyCode" , academyCode);
		
		return "/review/getReview";
	}
	
	// 리뷰 수정화면 네비게이터
	@RequestMapping (value = "updateReview", method=RequestMethod.GET)
	public String updateReview(@RequestParam("reviewNo") int reviewNo , Model model , HttpServletRequest request) throws Exception {
		
		Review review = reviewService.getReview(reviewNo);
		String academyCode = request.getParameter("academyCode");
		
		model.addAttribute("academyCode",academyCode);
		model.addAttribute("review",review);
		
		return "/review/updateReviewView";
	}
	
	// 리뷰 수정 후 디비에 저장
	@RequestMapping( value="updateReview", method=RequestMethod.POST)
	public String updateReview( @RequestParam("reviewNo") int reviewNo , HttpServletRequest request) throws Exception{
		
		Review review = reviewService.getReview(reviewNo);
		reviewService.updateReview(review);
		String academyCode = request.getParameter("academyCode");
		
		return "redirect:/review/getReview?reviewNo="+reviewNo+"&academyCode="+academyCode;
		
	}
	
	// 리뷰 목록
	@RequestMapping (value="listReview")
	public String listReview(@ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		User user = UserUtil.user();
		
		String academyCode = request.getParameter("academyCode");
		Academy academy = academyService.getAcademy(academyCode);
		
		// 해당 학원에서 리뷰 쓴 갯수 찾기
		Map<String, Object> countmap = new HashMap<String, Object>();
		
		countmap.put("userNo", user.getUserNo());
		countmap.put("academyCode", academyCode);
		
		int count = reviewService.countmyReview(countmap);
		String state = reviewService.getConnectReviewUser(countmap);
		
		model.addAttribute("count", count);
		model.addAttribute("state",state);
		
		
		model.addAttribute("academy", academy);
		
		Map<String, Object> map = academyService.getAcademyCodeList(user.getUserNo());
		
		model.addAttribute("list", map.get("list"));
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		search.setSearchAcademyCode(academyCode);
				
		Map<String , Object> map2 = reviewService.getReviewList(search);
		
		int totalCount = ((Integer)map2.get("totalCount")).intValue();
		
		Page resultPage = new Page(search.getCurrentPage(),totalCount , pageUnit , search.getPageSize());
		
		model.addAttribute("listR" , map2.get("list"));
		model.addAttribute("resultPage", resultPage);

		return "/review/listReview";
	}
	
	// 리뷰 삭제
	@RequestMapping(value="deleteReview", method = RequestMethod.GET)
	public String deleteReview(@RequestParam("reviewNo") int reviewNo , HttpServletRequest request) throws Exception{
		
		reviewService.deleteReview(reviewNo);
		
		Review review = new Review();
		
		review.setReviewNo(reviewNo);
		
		String academyCode = request.getParameter("academyCode");
	
		return "redirect:/review/listReview?academyCode="+academyCode;
	}
	
	// 내가 쓴 리뷰 목록
	@RequestMapping(value="listmyReview")
	public String getmyReview(@ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception {
		
		User user = UserUtil.user();
		int userNo = user.getUserNo();
		
		Map<String, Object> map =  reviewService.getmyReviewList(userNo);
		
		User user1 =  userService.getUserByUserNo(userNo);
		model.addAttribute("reviewList", map.get("list"));
		model.addAttribute("user", user1);
		
		return "/review/listmyReview";
	}
	
}