package com.buyedu.dao.chart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.buyedu.domain.Chart;

@Mapper
public interface ChartDao {
	
	public List<Chart> getUserChart();
	
	public List<Chart> getAcademyChart();

}
