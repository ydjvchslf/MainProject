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
		
		List<Academy> list = academyDao.getAcademyCodeList(userNo);
				
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		
		System.out.println("service list = "+list);
		
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
	
	public String updateAcademyIntro(Academy academy) throws Exception{
		return academyDao.updateAcademyIntro(academy);
	}
	
	public String updateAcademyHistory(Academy academy) throws Exception{
		return academyDao.updateAcademyHistory(academy);
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
	
	public String getMultimedia(int multimediaNo) throws Exception{
		
		String multimedia = academyDao.getMultimedia(multimediaNo);
		
		return multimedia;
	};
	
	public int getImageCount(String academyCode) throws Exception{
		
		int imgcount = academyDao.getImageCount(academyCode);
		
		return imgcount;
	};
	
	public int getVideoCount(String academyCode) throws Exception{
		
		int vidcount = academyDao.getVideoCount(academyCode);
		
		return vidcount;
	};
	
	
	public int deleteMultimedia(int multimediaNo) throws Exception{
		return academyDao.deleteMultimedia(multimediaNo);
	}
	


}
