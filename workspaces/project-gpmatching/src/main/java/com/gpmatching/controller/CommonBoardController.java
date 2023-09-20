package com.gpmatching.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gpmatching.dto.CommonBoardDto;
import com.gpmatching.service.CommonBoardService;

@Controller
@RequestMapping(path= {"/board"})
public class CommonBoardController {
	
	@Autowired
	private CommonBoardService commonBoardService;

	@GetMapping(path= {"/list"})
	public String list() {

//testCode
//		CommonBoardDto test = new CommonBoardDto();
//		  
//		  //test.setCommonNo(0);
//		  test.setCommonTitle("title1");
//		  test.setUserNo(1);
//		  test.setCommonContent("content1"); 
//		  
//		  
//		  commonBoardService.writeCommonBoard(test);
		
		return "board/list";
	}
	
	@GetMapping(path = {"/write"})
	public String showWriteForm(HttpSession session) {
//		if(session.getAttribute("loginuser") == null) {
//			return "redirect:/account/login";
//		}
		
		return "board/write";
	}
	
	@PostMapping(path= {"/write"})
	public String writeCommonBoard(CommonBoardDto commonBoardDto) {
		
		commonBoardService.writeCommonBoard(commonBoardDto);
		
		return "board/write";
	}
	/*
	@GetMapping(path = {"/commonWrite"})
	public String write(CommonBoardDto commonBoard) {
		
		//요청데이터읽기
		System.out.println(commonBoard);
		
		//요청처리
		commonBoardService.writeCommonBoard(commonBoard);
		
		return "redirect:commonList";
	}
	*/
}
