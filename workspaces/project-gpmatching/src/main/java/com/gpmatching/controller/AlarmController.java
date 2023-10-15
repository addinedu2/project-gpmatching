package com.gpmatching.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gpmatching.dto.AlarmDto;
import com.gpmatching.dto.UserDto;
import com.gpmatching.service.BoardCommentService;

@Controller
public class AlarmController {
	
	//ToDo
//	@Autowired
//	private BoardCommentService boardCommentService;
//	
//	@GetMapping(path= {"/commonBoard/alramList"})//알람리스트
//	public String alramList(HttpSession session,  Model model) {//@RequestParam(defaultValue="-1") int userNo,삭제
//
//		UserDto loginUser = (UserDto)session.getAttribute("loginuser");
//		List<AlramDto> alrams = boardCommentService.getAlamListByUserNo(loginUser.getUserNo());//유저넘버 조회
//		model.addAttribute("alrams",alrams);
//		
//		//model.addAttribute("userNo",userNo);
//
//		return "commonBoard/alramList";
//	}
//	
//	@GetMapping(path= {"/modules/header"})//알람리스트
//	@ResponseBody
//	public List<AlramDto> headerAlramList(HttpSession session, Model model) {
//
//		UserDto loginUser = (UserDto)session.getAttribute("loginuser");
//		List<AlramDto> alrams = boardCommentService.getAlamListByUserNo(loginUser.getUserNo());//유저넘버 조회
//		
//		//model.addAttribute("alrams",alrams);
//		
//		return alrams;
//	}
}
