package com.buyedu.service.academy;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.buyedu.dao.academy.AcademyDao;
import com.buyedu.dao.connect.ConnectDao;
import com.buyedu.domain.Academy;
import com.buyedu.domain.Connect;
import com.buyedu.domain.Search;

@Service
public class AcademyService {
	
	@Autowired
	private AcademyDao academyDao;
	
	@Autowired
	private ConnectDao connectDao;
	
	
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
	
	public void updateAcademyIntro(Academy academy) throws Exception{
		academyDao.updateAcademyIntro(academy);
	}
	
	public void updateAcademyHistory(Academy academy) throws Exception{
		academyDao.updateAcademyHistory(academy);
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
	
	
	// 인증 --------------------------------------------------
	public Map<String, Object> academyConnect(String academyCode) throws Exception{
		
		List<Connect> connect = connectDao.academyConnect(academyCode);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("connect", connect);
		
		return map;
	};
	
	public String updateConnect(int connectNo) throws Exception{
		
		return connectDao.updateConnectAcceptaca(connectNo);
	}
	
	public void deleteConnect(int connectNo) throws Exception{
		
		connectDao.deleteConnectfromAca(connectNo);
	}
	
	
	// 학원 정보 모두삭제 --------------------------------------------------
	
	public void deleteAcademyAll(String academyCode) throws Exception{
		
		academyDao.deleteReview(academyCode);
		
		academyDao.deleteEdu(academyCode);
		
		academyDao.deleteConnection(academyCode);
		
		academyDao.deleteAcademy(academyCode);
		
	}


}
