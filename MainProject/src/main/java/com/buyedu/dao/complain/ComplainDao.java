package com.buyedu.dao.complain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.buyedu.domain.Complain;
import com.buyedu.domain.Search;

	
	@Mapper
	public interface ComplainDao {
		
		void addComplain(Complain complain) throws Exception;
		
		Complain getComplain(int complainNo) throws Exception;
		
		List<Complain> getComplainList(Search search) throws Exception;
		
		int getComplainNo(Complain complain) throws Exception;
		
		int getComplainCount(Complain complain) throws Exception;
		
		int getTotalCount(Search search) throws Exception;
		
		void updateComplainState(Complain complain) throws Exception;
		
		void deleteComplain(int complainNo) throws Exception;
		
}
