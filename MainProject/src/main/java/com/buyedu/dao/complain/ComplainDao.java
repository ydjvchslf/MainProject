package com.buyedu.dao.complain;

import org.apache.ibatis.annotations.Mapper;

import com.buyedu.domain.Complain;

	
	@Mapper
	public interface ComplainDao {
		
		void addComplain(Complain complain) throws Exception;
	

}
