package com.petmeeting.joy.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.petmeeting.joy.admin.model.EventboardDto;
import com.petmeeting.joy.main.service.MainService;
import com.petmeeting.joy.playboard.model.PlayboardDto;

@Controller
public class MainController {
	
	@Autowired
	MainService mainService;
	
	
	@RequestMapping(value = "main.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String main(Model model) {
		List<PlayboardDto> todayPboard = mainService.getTodayPlayboards();
		
		List<EventboardDto> eventList = mainService.getThisMonthEvents();
		
		model.addAttribute("todayPlayboard", todayPboard);
		model.addAttribute("eventList", eventList);
		return "main";
	}
	
}
