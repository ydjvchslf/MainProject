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
		System.out.println("여기는 애드컴플레인");
	}

	public int getComplain(int complainNo) throws Exception {
		return complainDao.getComplain(complainNo);
	}

	public List<Complain> getComplainList(Search search) throws Exception {
		List<Complain> list= complainDao.getComplainList(search);
		int totalCount = complainDao.getTotalCount(search);
		
		
	
		list.get(0).setTotalCount(totalCount);
		System.err.println(list);
		return list;
	}

	public void updateComplain (Complain complain) throws Exception {
		complainDao.updateComplain(complain);
		System.out.println("여기는 업데이트컴플레인");

	}
	
	public void deleteComplain(int complainNo) throws Exception {
		System.out.println("여기는 딜리트컴플레인");
		complainDao.deleteComplain(complainNo);
		
	}

}
