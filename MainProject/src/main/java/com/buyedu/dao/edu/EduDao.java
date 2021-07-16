package com.buyedu.dao.edu;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.buyedu.domain.Academy;
import com.buyedu.domain.Edu;
import com.buyedu.domain.Search;

@Mapper
public interface EduDao {
	
	int addEdu(Edu edu);
	
	Edu getEdu(int eduNo);
	
	int updateEdu(Edu edu);
	
	List<Edu> getEduList(Search search);
	
	int getEduTotalCount(Search search);
	
	int deleteEdu(int eduNo);
	
}