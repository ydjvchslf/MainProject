package com.buyedu.dao.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.buyedu.domain.Board;
import com.buyedu.domain.Search;


@Mapper
public interface BoardDao {
	
	public void addBoard(Board board) throws Exception ;
	
	public Board getBoard(int boardNo) throws Exception;
	
	public Board getBoardNoAcademy(int boardNo) throws Exception;
	
	public Board getBoardAcademy(int boardNo) throws Exception;
	
	public List<Board> getBoardList(Search search) throws Exception;
	
//	public List<Board> getMyBoardList(Search search, int userNo) throws Exception;
	
	public List<Map<String, Object>> getBoardListPin(Board board) throws Exception;

	public void updateBoard(Board board) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
//	public int getMyTotalCount(Search search, int userNo) throws Exception;
	
	public void deleteBoard(int boardNo) throws Exception;
	
	public int updateViewcnt(int boardNo) throws Exception;
	
	public void addRecommend(Map<String,Object> map) throws Exception ;
	
	public void deleteRecommend(Map<String,Object> map) throws Exception ;
	
	public int getRecommend(Map<String,Object> map) throws Exception ;
	
	public int recommendCnt(int boardNo) throws Exception;
	
	public int commentCount(int boardNo) throws Exception;
	
	public List<Map<String, Object>> listComment(int boardNo) throws Exception;
	   
	public int addComment(Map<String,Object> map) throws Exception;


	public int updateComment(Map<String,Object> map) throws Exception;

	public int deleteComment(int commentNo) throws Exception;
	
	//학원 공지사항
	public List<Board> getBoardListAcademy(Search search) throws Exception;
	public int getTotalCountAcademy(Search search) throws Exception;


}
