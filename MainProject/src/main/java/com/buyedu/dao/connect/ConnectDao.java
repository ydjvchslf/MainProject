package com.buyedu.dao.connect;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.buyedu.domain.Academy;
import com.buyedu.domain.Search;
import com.buyedu.domain.Connect;

@Mapper
public interface ConnectDao {
	
	public int checkConnectCnt(int userNo) throws Exception;
	
	public Connect getConnect(Connect connect) throws Exception;
	
	// 인증한 학원 GET  
	public List<Connect> getConnectList(int userNo) throws Exception;
	
	
	public int checkAcademyCode(Connect connect) throws Exception;
	// 인증요청 INSERT
	public void addConnect(Connect connect) throws Exception;
	
	public void updateConnectAccept(Connect connect) throws Exception;
	
	public void updateConnectReject(Connect connect) throws Exception;

	public void deleteConnect(Connect connect) throws Exception;
	
	// 아카데미에서 쓰는 커넥트 입니당 >.<
	List<Connect> academyConnect(String academyCode) throws Exception;
	
	void deleteConnectfromAca(int connectNo) throws Exception;
	
	public String updateConnectAcceptaca(int connectNo) throws Exception;
	
	int getStudentCount(String academyCode) throws Exception;
	
	// 후기에서 쓰는 커넥스 입니다.
	String getConnectReviewUser(Map map) throws Exception;

}
