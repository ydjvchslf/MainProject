package com.buyedu.dao.connect;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.buyedu.domain.Connect;

@Mapper
public interface ConnectDao {
	
	public int checkConnectCnt(int userNo) throws Exception;
	
	public Connect getConnect(Connect connect) throws Exception;
	
	public List<Connect> getConnectList(int userNo) throws Exception;
	
	public int checkAcademyCode(Connect connect) throws Exception;

	public void addConnect(Connect connect) throws Exception;
	
	public void updateConnectAccept(Connect connect) throws Exception;
	
	public void updateConnectReject(Connect connect) throws Exception;

	public void deleteConnect(Connect connect) throws Exception;
	
	List<Connect> academyConnect(String academyCode) throws Exception;
	
	void deleteConnectfromAca(int connectNo) throws Exception;
	
	public String updateConnectAcceptaca(int connectNo) throws Exception;
	
	int getStudentCount(String academyCode) throws Exception;
	
	String getConnectReviewUser(Map map) throws Exception;

}
