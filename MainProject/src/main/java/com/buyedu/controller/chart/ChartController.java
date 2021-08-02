package com.buyedu.controller.chart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.buyedu.service.chart.ChartService;

@Controller
@RequestMapping("/chart/*")
public class ChartController {
	
	@Autowired
	public ChartService chartService;
	
	// 차트 가져오기
	@RequestMapping("getChart")
	public String getChart(Model model) throws Exception {
		
		model.addAttribute("userData", chartService.getUserData());
		model.addAttribute("academyData", chartService.getAcademyData());
		model.addAttribute("board", chartService.getBoardCnt());
		model.addAttribute("edu", chartService.getEduCnt());
		model.addAttribute("review", chartService.getReviewCnt());
		
		return "chart/getChart";
	}
	
	@RequestMapping("moveChat")
	public String moveChat() throws Exception {
		
		return "redirect:http://localhost:3000/";
	}

}
