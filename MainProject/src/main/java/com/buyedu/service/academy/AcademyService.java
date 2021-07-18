package com.buyedu.service.academy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.buyedu.dao.academy.AcademyDao;
import com.buyedu.domain.Academy;
import com.buyedu.domain.Search;

@Service
public class AcademyService {
	
	@Autowired
	private AcademyDao academyDao;
	
	
	// 학원 등록
	public void addAcademy(Academy academy) throws Exception {
		academyDao.addAcademy(academy);
		}
	
	public Academy getAcademy(String academyCode) throws Exception {

		return academyDao.getAcademy(academyCode);
	}
	
	public Map<String, Object> getAcademyCodeList(int userNo) throws Exception {
		
		Academy academy = new Academy();
		
		List<Academy> list = academyDao.getAcademyCodeList(userNo);
		
		int count = list.size();
		academy.setCount(count);
				
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		
		System.out.println("service list = "+list);
		System.out.println("count = "+count);
		
		return map;
	};
	
	public String getAcademyCode(int userNo) throws Exception{
		return academyDao.getAcademyCode(userNo);
	}
	
	public String getAcademyCodeforEdu(int eduNo) throws Exception{
		return academyDao.getAcademyCodeforEdu(eduNo);
	};
	
	public String checkAcademyCode(String academyCode) throws Exception{
		return academyDao.checkAcademyCode(academyCode);
	};
	
	public String updateAcademyHistory(String academyCode) throws Exception{
		return academyDao.updateAcademyHistory(academyCode);
	}
	
	public String updateAcademyIntro(Academy academy) throws Exception{
		return academyDao.updateAcademyIntro(academy);
	}
	
	// 지도검색 후 학원 목록
	public List<Academy> getSearchList(Search search) {
		return academyDao.getSearchList(search);
	}
	
	
	// 파일 업로드 method
	public void addMultimedia(Academy academy) throws Exception{
		academyDao.addMultimedia(academy);
	}
	
	public Map<String, Object> getMultimediaList(String academyCode) throws Exception{
		
		List<Academy> list = academyDao.getMultimediaList(academyCode);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		
		return map;
	}
	
	public void deleteMultimedia(int multimediaNo) throws Exception{
		academyDao.deleteMultimedia(multimediaNo);
	}
	


}
