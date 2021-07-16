package com.buyedu.service.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.buyedu.dao.academy.AcademyDao;
import com.buyedu.dao.connect.ConnectDao;
import com.buyedu.dao.user.UserDao;
import com.buyedu.domain.Academy;
import com.buyedu.domain.Search;
import com.buyedu.domain.User;
import com.buyedu.domain.Connect;

@Service
public class UserService {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private ConnectDao connectDao;

	@Transactional
	public void addUser(User user) throws Exception {
		userDao.addUser(user);
	}
	
	public User getUser(String email) throws Exception {
		return userDao.getUser(email);
	}
	
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
	}
	
	public void updatePassword(User user) throws Exception {
		userDao.updatePassword(user);
	}
	
	public void outUser(User user) throws Exception {
		userDao.outUser(user);
	}
	
	public void returnUserByUser(User user) throws Exception{
		userDao.returnUserByUser(user);
	}
	
	@Transactional (readOnly = true)
	public Map<String , Object> getUserList(Search search) throws Exception {
		List<User> list= userDao.getUserList(search);
		int totalCount = userDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	public int checkEmail(String userId) throws Exception{
		return userDao.checkEmail(userId);
	}
	
	public User findEmail(User user) throws Exception{
		return userDao.findEmail(user);
	}
	
	public User findPassword(User user) throws Exception{
		return userDao.findPassword(user);
	}
	
	public User findAbleDate(User user) throws Exception{
		return userDao.findAbleDate(user);
	}
	
	public User getUserByUserNo(int userNo) throws Exception{
		return userDao.getUserByUserNo(userNo);
	}
	
	
	// Connect 
	public int checkConnectCnt(int userNo) throws Exception{
		return connectDao.checkConnectCnt(userNo);
	}
	
	public int checkAcademyCode(Connect connect) throws Exception{
		return connectDao.checkAcademyCode(connect);
	}
	
	public Connect getConnect(Connect connect) throws Exception{
		return connectDao.getConnect(connect);
	}

	public List<Connect> getConnectList(int userNo) throws Exception {
		return connectDao.getConnectList(userNo);
	}
	
	public void addConnect(Connect connect) throws Exception{
		connectDao.addConnect(connect);
	}
	
	public void updateConnectAccept(Connect connect) throws Exception {
		connectDao.updateConnectAccept(connect);
	}
	
	public void updateConnectReject(Connect connect) throws Exception {
		connectDao.updateConnectReject(connect);
	}
	
	public void deleteConnect(Connect connect) throws Exception{
		connectDao.deleteConnect(connect);
	}
	


}
