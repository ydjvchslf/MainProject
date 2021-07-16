package com.buyedu.dao.purchaseedu;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.buyedu.domain.Academy;
import com.buyedu.domain.PurchaseEdu;
import com.buyedu.domain.Search;

@Mapper
public interface PurchaseEduDao {
	
	int addPurchaseEdu(PurchaseEdu purchase) throws Exception;
	
	PurchaseEdu getPurchaseEdu(String purchaseUid) throws Exception;
	
	int updatePurchaseEdu(PurchaseEdu purchaseEdu) throws Exception;

}