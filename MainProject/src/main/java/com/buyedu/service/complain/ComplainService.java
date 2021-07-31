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


}
