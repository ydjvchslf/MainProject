package com.buyedu.service.edu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.buyedu.dao.edu.EduDao;
import com.buyedu.dao.pickedu.PickEduDao;
import com.buyedu.dao.purchaseedu.PurchaseEduDao;
import com.buyedu.domain.Edu;
import com.buyedu.domain.PickEdu;
import com.buyedu.domain.PurchaseEdu;
import com.buyedu.domain.Search;

@Service
public class EduService {
	
	@Autowired
	private EduDao eduDao;
	@Autowired
	private PickEduDao pickDao;
	@Autowired
	private PurchaseEduDao purchaseDao;
	
	public int addEdu(Edu edu) throws Exception {
		
		return eduDao.addEdu(edu);
	}
	
	public Edu getEdu(int eduNo) throws Exception {
		
		return eduDao.getEdu(eduNo);
	}
	
	public int updateEdu(Edu edu) throws Exception {
		
		return eduDao.updateEdu(edu);
	}
	
	@Transactional (readOnly = true)
	public Map<String , Object> getEduList(Search search) {
		
		List<Edu> list= eduDao.getEduList(search);
		System.err.println(list);
		int totalCount = eduDao.getEduTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", totalCount);
		
		return map;
	}
	
	public int getEduTotalCount(Search search) {
		
		return eduDao.getEduTotalCount(search);
	}
	
	public int deleteEdu(int eduNo) {
		
		return eduDao.deleteEdu(eduNo);
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public int addPickEdu(PickEdu pickEdu) throws Exception {
		
		return pickDao.addPickEdu(pickEdu);
	}
	
	public PickEdu getPickEdu(int pickNo) throws Exception {
		
		return pickDao.getPickEdu(pickNo);
	}
	
	public PickEdu getPickNo(PickEdu pickEdu) throws Exception {
		
		return pickDao.getPickNo(pickEdu);
	}
	
	@Transactional (readOnly = true)
	public Map<String , Object> getPickEduList(Search search) throws Exception {
		
		List<PickEdu> list= pickDao.getPickEduList(search);
		System.err.println(list);
		int totalCount = pickDao.getPickEduTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", totalCount);
		
		return map;
	}
	
	public int getPickEduTotalCount(Search search) throws Exception {
		
		return pickDao.getPickEduTotalCount(search);
	}
	
	public int deletePickEdu(int eduNo) throws Exception {
		
		return pickDao.deletePickEdu(eduNo);
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	public int addPurchaseEdu(PurchaseEdu purchaseEdu) throws Exception {
		
		return purchaseDao.addPurchaseEdu(purchaseEdu);
	}
	
	public PurchaseEdu getPurchaseEdu(String purchaseUid) throws Exception {
		
		return purchaseDao.getPurchaseEdu(purchaseUid);
	}
	
	public int updatePurchaseEdu(PurchaseEdu purchaseEdu) throws Exception {
		
		return purchaseDao.updatePurchaseEdu(purchaseEdu);
	}

	@Transactional (readOnly = true)
	public Map<String , Object> getPurchaseEduList(Search search) throws Exception {
		
		System.out.println("디버깅 ================="+search);
		
		List<PurchaseEdu> list= purchaseDao.getPurchaseEduList(search);
		System.err.println(list);
		int totalCount = purchaseDao.getPurchaseEduTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", totalCount);
		
		return map;
	}
	
	public Map<String , Object> getPurchaseAcademyList(Search search) throws Exception {
		
		List<PurchaseEdu> list= purchaseDao.getPurchaseAcademyList(search);
		System.err.println(list);
		int totalCount = purchaseDao.getPurchaseAcademyTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", totalCount);
		
		return map;
	}
	
	public int getPurchaseEduTotalCount(Search search) throws Exception {
		
		return purchaseDao.getPurchaseEduTotalCount(search);
	}
	
	public int updateEduRest(Edu edu) throws Exception {
		
		return eduDao.updateEduRest(edu);
	}
	
	public int getPayNo(int userNo) throws Exception {
		
		return purchaseDao.getPayNo(userNo);
	}
	
	public int deletePurchaseEdu(PurchaseEdu purchaseEdu) throws Exception {
		
		return purchaseDao.deletePurchaseEdu(purchaseEdu);
	}

}