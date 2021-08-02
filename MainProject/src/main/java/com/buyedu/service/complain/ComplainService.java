package com.buyedu.service.complain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.buyedu.dao.complain.ComplainDao;
import com.buyedu.domain.Search;
import com.buyedu.domain.Complain;


@Service
public class ComplainService {
	
	@Autowired
	private ComplainDao complainDao;
			
	public void addComplain(Complain complain) throws Exception {
		complainDao.addComplain(complain);
	}
	
	// 신고 정보
	public Complain getComplain(int complainNo) throws Exception{
		
		return complainDao.getComplain(complainNo);
	};
	
	// 신고 목록
	public Map<String, Object> getComplainList(Search search) throws Exception{
		
		List<Complain> list = complainDao.getComplainList(search);
		int totalCount = complainDao.getTotalCount(search);
		
		System.out.println("lilllll" + list);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}
	
	// 신고 처리
	public void updateComplainState(Complain complain) throws Exception{
		
		complainDao.updateComplainState(complain);
		
	};


}
