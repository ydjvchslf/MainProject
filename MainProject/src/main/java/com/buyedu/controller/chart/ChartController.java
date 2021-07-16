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
	
	@RequestMapping("getChart")
	public String getChart(Model model) throws Exception {
		System.out.println("getChart() 실행");
		
		model.addAttribute("userData", chartService.getUserData());
		model.addAttribute("academyData", chartService.getAcademyData());
		
		
		return "chart/getChart";
	}
	
	@RequestMapping("moveChat")
	public String moveChat() throws Exception {
		System.out.println("moveChat()");
		return "redirect:http://localhost:3000/";
	}

}
