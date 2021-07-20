package com.buyedu.dao.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.buyedu.domain.Review;
import com.buyedu.domain.Search;

@Mapper
public interface ReviewDao {
	
	public void addReview(Review review);
	
	public Review getReview(int reviewNo);
	
	public int updateReview(Review review);
	
	public List<Review> getReviewList(Search search);
	
	public int getTotalCount(Search search);
	
	public int deleteReview(Review review);
	
	String getReviewWriter(int userNo);

}