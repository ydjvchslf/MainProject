package com.buyedu.dao.complain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.buyedu.domain.Complain;
import com.buyedu.domain.Search;

	
	@Mapper
	public interface ComplainDao {
		
		void addComplain(Complain complain)throws Exception;
		
		int getComplain(int complainNo);
		
		int updateComplain(Complain complain);
		
		List<Complain> getComplainList(Search search);
		
		int getTotalCount(Search search);
		
		void deleteComplain(int complainNo);
	

}
