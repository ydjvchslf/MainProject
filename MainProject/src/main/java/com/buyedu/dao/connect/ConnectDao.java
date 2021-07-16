package com.buyedu.dao.connect;

import java.util.List;

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

}
