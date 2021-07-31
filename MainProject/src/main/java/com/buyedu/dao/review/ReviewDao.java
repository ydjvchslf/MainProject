package com.buyedu.dao.review;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


import com.buyedu.domain.Review;
import com.buyedu.domain.Search;

@Mapper
public interface ReviewDao {
	
	void addReview(Review review);
	
	Review getReview(int reviewNo);
	
	void updateReview(Review review);
	
	List<Review> getReviewList(Search search);
	
	int getTotalCount(Search search);
	
	void deleteReview(int reviewNo);
	
	int getConnect(Map<String,Object> map) throws Exception ;
	
	String getReviewWriter(int userNo);
	
	List<Review> getmyReview(int userNo);
	
	int countmyReview(Map<String, Object> map) throws Exception;

}