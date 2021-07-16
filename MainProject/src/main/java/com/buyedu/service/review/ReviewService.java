package com.buyedu.service.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.buyedu.dao.review.ReviewDao;
import com.buyedu.domain.Search;
import com.buyedu.domain.Review;


@Service
public class ReviewService {
	
	@Autowired
	private ReviewDao reviewDao;
			
	public void addReview(Review review) throws Exception {
		reviewDao.addReview(review);
	}

	public Review getReview(int reviewNo) throws Exception {
		return reviewDao.getReview(reviewNo);
	}

	public List<Review> getReviewList(Search search) throws Exception {
		List<Review> list= reviewDao.getReviewList(search);
		int totalCount = reviewDao.getTotalCount(search);
		
	
		list.get(0).setTotalCount(totalCount);
		System.err.println(list);
		return list;
	}

	public void updateReview (Review review) throws Exception {
		reviewDao.updateReview(review);

	}
	
	public Review deleteReview(int reviewNo) throws Exception {
		return reviewDao.deleteReview(reviewNo);
	}
	
	public String getReviewWriter(int userNo) throws Exception {
		
		return reviewDao.getReviewWriter(userNo);
	}


}
