package com.buyedu.service.chart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.buyedu.dao.chart.ChartDao;
import com.buyedu.domain.Chart;

@Service
public class ChartService {
	
	@Autowired
	private ChartDao chartDao;
	
	public List<Chart> getUserData() {
		return chartDao.getUserChart();
	}
	
	public List<Chart> getAcademyData() {
		return chartDao.getAcademyChart();
	}
	
	public Map<String,Object> getChartData() {
		List<Chart> userData = chartDao.getUserChart();
		List<Chart> academyData = chartDao.getAcademyChart();
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("userData", userData);
		map.put("academyData", academyData);
		
		return map;
	}
	
	public int getBoardCnt() {
		return chartDao.getBoardCnt();
	}
	
	public int getEduCnt() {
		return chartDao.getEduCnt();
	}
	
	public int getReviewCnt() {
		return chartDao.getReviewCnt();
	}

}
