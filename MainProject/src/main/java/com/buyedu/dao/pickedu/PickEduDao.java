package com.buyedu.dao.pickedu;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.buyedu.domain.PickEdu;
import com.buyedu.domain.Search;

@Mapper
public interface PickEduDao {
	
	int addPickEdu(PickEdu pickEdu) throws Exception;
	
	PickEdu getPickEdu(int pickNo) throws Exception;
	
	PickEdu getPickNo(PickEdu pickEdu) throws Exception;
	
	List<PickEdu> getPickEduList(Search search) throws Exception;
	
	int getPickEduTotalCount(Search search) throws Exception;
	
	int deletePickEdu(int eduNo) throws Exception;

}
