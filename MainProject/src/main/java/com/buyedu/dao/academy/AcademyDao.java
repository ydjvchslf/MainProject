package com.buyedu.dao.academy;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.buyedu.domain.Academy;
import com.buyedu.domain.Search;

@Mapper
public interface AcademyDao {
	
	void addAcademy(Academy academy) throws Exception;
	
	Academy getAcademy(String academyCode) throws Exception;
	
	List<Academy> getAcademyCode(int userNo) throws Exception;
	
	String checkAcademyCode(String academyCode) throws Exception;
	
	void updateAcademyHistory(Academy academy) throws Exception;
	
	void updateAcademyIntro(Academy academy) throws Exception;
	
	// 여기서 메소드 이름이 매퍼에 sql id 랑 동일해야합니다.
	public List<Academy> getSearchList(Search search);
	
	// 파일 업로드
	void addMultimedia(Academy academy) throws Exception;
	
	List<Academy> getMultimediaList(String academyCode) throws Exception;
	
	void deleteMultimedia(int multimediaNo) throws Exception;

}
