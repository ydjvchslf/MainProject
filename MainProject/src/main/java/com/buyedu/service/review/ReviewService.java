package com.buyedu.service.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.buyedu.dao.connect.ConnectDao;
import com.buyedu.dao.review.ReviewDao;
import com.buyedu.domain.Search;
import com.buyedu.domain.Academy;
import com.buyedu.domain.Connect;
import com.buyedu.domain.Review;


@Service
public class ReviewService {
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private ConnectDao connectDao;
	
	public void addReview(Review review) throws Exception {
		reviewDao.addReview(review);
	}

	public Review getReview(int reviewNo) throws Exception {
		return reviewDao.getReview(reviewNo);
	}

	public Map<String,Object> getReviewList(Search search) throws Exception {
		List<Review> list= reviewDao.getReviewList(search);
		int totalCount = reviewDao.getTotalCount(search);
		
		Map<String ,Object> map = new HashMap();
		map.put("list" , list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	public void updateReview (Review review) throws Exception {
		reviewDao.updateReview(review);
	}
	
	public void deleteReview(int reviewNo) throws Exception {
		reviewDao.deleteReview(reviewNo);
	}
	
	public String getReviewWriter(int userNo) throws Exception {
		return reviewDao.getReviewWriter(userNo);
	}

	public int getConnect(Map<String,Object> map) throws Exception {	
		return reviewDao.getConnect(map);
	}
	
	public Map<String,Object> getmyReviewList(int userNo) throws Exception {
		List<Review> list = reviewDao.getmyReview(userNo);
		Map<String , Object> map = new HashMap<String , Object>();
		map.put("list", list);
		
		return map;
	}
	
	public int countmyReview(Map<String, Object> map) throws Exception{
		int count = reviewDao.countmyReview(map);
		
		return count;
	};
	
	public String getConnectReviewUser(Map map) throws Exception{
		String state = connectDao.getConnectReviewUser(map);
		
		return state;
	};
	
}
