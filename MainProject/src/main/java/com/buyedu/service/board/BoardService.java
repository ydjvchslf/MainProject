package com.buyedu.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.buyedu.dao.board.BoardDao;
import com.buyedu.domain.Search;
import com.buyedu.service.noti.NotiService;
import com.buyedu.domain.Board;


@Service
public class BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private NotiService notiService;
			
	public void addBoard(Board board) throws Exception {
		String code = "xrYC6SH";
		boardDao.addBoard(board);
		notiService.noti(code);
	}

	public Board getBoard(int boardNo) throws Exception {
		System.out.println("왜 여기가 문제죠...? 겟보드..?");
		return boardDao.getBoard(boardNo);
	}
	
	public Board getBoardNoacademy(int boardNo) throws Exception {
		System.out.println("왜 여기가 문제죠...? 겟보드..?");
		return boardDao.getBoardNoAcademy(boardNo);
	}
	
	public Board getBoardAcademy(int boardNo) throws Exception {
		System.out.println("여긴 겟보드아카데미");
		return boardDao.getBoardAcademy(boardNo);
	}

	public List<Board> getBoardList(Search search) throws Exception {
		
		List<Board> list= boardDao.getBoardList(search);
		int totalCount = boardDao.getTotalCount(search);
//		int recommendCnt=boardDao.recommendCnt(boardNo);
		if(list.size()!=0) {
		list.get(0).setTotalCount(totalCount);}
//		list.get(boardNo).setRecommendCnt(recommendCnt);
		System.err.println(list);
		
		
		return list;
//		System.out.println("service : "+totalCount);
		
	}

	
public List<Map<String, Object>> getBoardListPin(Board board) throws Exception {
		
	List<Map<String, Object>> list1= boardDao.getBoardListPin(board);
//		int recommendCnt=boardDao.recommendCnt(boardNo);
		
//		list.get(boardNo).setRecommendCnt(recommendCnt);
		System.err.println("getBoardListPin.? :"+list1);
		
		return list1;
//		System.out.println("service : "+totalCount);
	}

	public void updateBoard (Board board) throws Exception {
		boardDao.updateBoard(board);

	}
	
	public void deleteBoard(int boardNo) throws Exception {
		boardDao.deleteBoard(boardNo);
	}
	
	public int updateViewcnt(int boardNo) throws Exception {
		System.out.println("서비스 임플 조회수 : "+boardNo);
		return boardDao.updateViewcnt(boardNo);
	}
	
	public void addRecommend(Map<String,Object> map) throws Exception {
		boardDao.addRecommend(map);
	}
	
	public void deleteRecommend(Map<String,Object> map) throws Exception {
		boardDao.deleteRecommend(map);
	}
	
	public int getRecommend(Map<String,Object> map) throws Exception {	
		return boardDao.getRecommend(map);
	}
	
	public int recommendCnt (int boardNo) throws Exception {	
		return boardDao.recommendCnt(boardNo);
		
	}
	
	public List<Map<String, Object>> listComment(int boardNo) throws Exception{
		System.out.println("service comment");
		List<Map<String, Object>> map= boardDao.listComment(boardNo);
		int commentCount = boardDao.commentCount(boardNo);
	    System.out.println("리스트코멘트 : "+commentCount);
	    if(map.size()!=0) {
	    map.get(0).put("commentCount", commentCount);}
		return map;
	   }
	   
	    // 댓글 작성
	public int addComment(Map<String,Object> map) throws Exception{
		System.out.println("service : "+map);
	   	return boardDao.addComment(map);
	    }
	    
	    // 댓글 수정
	public int updateComment(Map<String,Object> map) throws Exception{
	    return boardDao.updateComment(map);
	    }
	 
	    // 댓글 삭제
	public int deleteComment(int commentNo) throws Exception{
	    return boardDao.deleteComment(commentNo);
	    	
	    }

		
	public int commentCount(int boardNo) throws Exception {
		return boardDao.commentCount(boardNo);
			
		}

		//학원 공지사항
	
	public List<Board> getBoardListAcademy(Search search) throws Exception {
		
		System.out.println("여기는 보드서비스 학원공지사항");
		int totalCount = boardDao.getTotalCountAcademy(search);
		System.out.println("토탈카운트는 나오나? : "+totalCount);
		List<Board> listb= boardDao.getBoardListAcademy(search);
		
//		int recommendCnt=boardDao.recommendCnt(boardNo);
		if(listb.size()!=0) {
		listb.get(0).setTotalCount(totalCount);}
//		list.get(boardNo).setRecommendCnt(recommendCnt);
		System.err.println(listb);
		
		
		return listb;
//		System.out.println("service : "+totalCount);
		
	}
}
