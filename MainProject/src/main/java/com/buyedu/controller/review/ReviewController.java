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

@Controller

@RequestMapping("/review/*")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
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
	public String updateReview(@RequestParam("reviewNo") int reviewNo , Model model) throws Exception {
		
		Review review = reviewService.getReview(reviewNo);
		
		
		model.addAttribute("review",review);
		
		return "/review/updateReviewView";
	}
	
	@RequestMapping( value="updateReview", method=RequestMethod.POST)
	public String updateReview( @ModelAttribute("review") Review review, Model model) throws Exception{
		
		
		reviewService.updateReview(review);
		
		
		return "redirect:/review/getReview?reviewNo="+review.getReviewNo();
		
	}
	
	@RequestMapping (value="listReview")
	public String listReview(@ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		if(search.getCurrentPage() ==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		String academyCode = request.getParameter("academyCode");
		System.out.println("아카데미코드 : "+academyCode);
		int userNo = ((User)request.getSession().getAttribute("user")).getUserNo(); 
		System.out.println("여기서 터지냐..?11111");
		
		System.out.println("여기서 터지냐..?22222");
	
		List<Review> list = reviewService.getReviewList(search);
		System.out.println("여기서터지나 3333333");
		int totalCount = list.get(0).getTotalCount();
		Page resultPage = new Page (search.getCurrentPage(),totalCount,pageUnit,pageSize);
		System.out.println("여기서터지나 44444444");
		Map<String , Object> map = new HashMap<String , Object>();
		String connectState = "1";
		map.put("userNo", userNo);
		map.put("academyCode", academyCode);
		map.put("connectState", connectState);
		
		int connect = reviewService.getConnect(map);
		System.out.println("맵 : "+map);
		
		System.err.println("커낵트 : "+connect);
		
		model.addAttribute("academyCode" , academyCode);
		model.addAttribute("connect",connect);
		model.addAttribute("list",list);
		model.addAttribute("resultPage" , resultPage);
		model.addAttribute("search",search);
		//model.addAttribute("connect" , map.get("connect"));
		
		System.err.println(list);
		
	
		return "/review/listReview";
	}
	
	
	
	
	
	/*@RequestMapping(value="deleteReview", method = RequestMethod.POST)
	public int deleteReview(@RequestParam("review") Review r) throws Exception{
		
		reviewService.deleteReview(review);
		
		return "redirect:/review/listReview";
	}
	*/

}
