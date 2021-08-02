package com.buyedu.dao.user;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.buyedu.domain.Search;
import com.buyedu.domain.User;

@Mapper
public interface UserDao {
	
	public void addUser(User user) throws Exception;

	public User getUser(String email) throws Exception;
	
	public User getUserByUserNo(int userNo) throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public void updatePassword(User user) throws Exception;
	
	public void outUser(User user) throws Exception;
	
	public User findAbleDate(User user) throws Exception;
	
	public User findEmail(User user) throws Exception;
	
	public User findPassword(User user) throws Exception;
	
	public void returnUserByUser(User user) throws Exception;
	
	public List<User> getUserList(Search search) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
	public int checkEmail(String email) throws Exception;
	
}
