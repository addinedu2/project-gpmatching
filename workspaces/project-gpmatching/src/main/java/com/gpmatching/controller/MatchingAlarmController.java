package com.gpmatching.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gpmatching.dto.MatchingAlarmDto;
import com.gpmatching.dto.UserDto;
import com.gpmatching.service.MatchingAlarmService;
import com.gpmatching.service.MatchingCommentService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MatchingAlarmController {
	
	@Autowired
	private MatchingAlarmService matchingAlarmService;
	
	@GetMapping(path= {"/modules/header"})
	@ResponseBody
	public List<MatchingAlarmDto> headerMatchingAlarmList(HttpSession session, Model model) {
		
		UserDto loginUser = (UserDto)session.getAttribute("loginuser");
		List<MatchingAlarmDto> matchingAlarms = 
				matchingAlarmService.getMatchingAlarmListByUserNo(loginUser.getUserNo());
		
		return matchingAlarms;
	}
	
	@GetMapping(path= {"/commonBoard/alarmList"})//알람리스트
	public String alarmList(HttpSession session,  Model model) {

		UserDto loginUser = (UserDto)session.getAttribute("loginuser");
		List<MatchingAlarmDto> matchingAlarms = 
				matchingAlarmService.getMatchingAlarmListByUserNo(loginUser.getUserNo());//유저넘버 조회
		model.addAttribute("matchingAlarms",matchingAlarms);

		return "commonBoard/alarmList";
	}
	
	
	@GetMapping(path= {"/modules/header/checkAlarm"})
	@ResponseBody
	public String checkAlarmList(HttpSession session, int userNo) {
		
		matchingAlarmService.deleteAlarmListByUserNo(userNo);
		
		return "success";

		
	}
	
}
