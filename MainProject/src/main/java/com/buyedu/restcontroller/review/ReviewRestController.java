package com.buyedu.restcontroller.review;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.buyedu.domain.Review;
import com.buyedu.domain.User;
import com.buyedu.service.review.ReviewService;
import com.buyedu.util.UserUtil;

@RestController
@RequestMapping("/review/*")
public class ReviewRestController {

	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value = "json/addReview/{academyCode}", method = RequestMethod.POST)
	public void addReview(@RequestParam("reviewTitle") String reviewTitle, 
							@RequestParam("reviewContent") String reviewContent,
							@PathVariable String academyCode) throws Exception {
		
		User user = UserUtil.user();
		
		Review review = new Review();
		
		
		review.setAcademyCode(academyCode);
		review.setReviewWriter(user);
		review.setReviewTitle(reviewTitle);
		review.setReviewContent(reviewContent);
		
		reviewService.addReview(review);
	}
	
	@RequestMapping(value = "json/updateReview/{reviewNo}", method = RequestMethod.POST)
	public void updateReview(@RequestParam("reviewTitle") String reviewTitle, 
							@RequestParam("reviewContent") String reviewContent,
							@PathVariable int reviewNo) throws Exception{
		
		Review review = reviewService.getReview(reviewNo);
		
		review.setReviewTitle(reviewTitle);
		review.setReviewContent(reviewContent);
		
		//reviewService.updateReview(review);
		
		System.out.println("수정 리븁ㅂㅂㅂㅂ"+review);
	}
	
	@RequestMapping(value = "json/deleteReview/{reviewNo}", method = RequestMethod.POST)
	public void deleteReview(@PathVariable int reviewNo) throws Exception{
		reviewService.deleteReview(reviewNo);
	}
	
	
}
