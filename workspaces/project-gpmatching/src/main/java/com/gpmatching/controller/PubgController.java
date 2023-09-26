
/**
* @brief 클래스 설명 : 베틀그라운드 게시판 정보 (Pubg 테이블) 
* 					controller 클래스 (view 없는 테스트 클래스)
* @author 최종 수정자 : hi.lee
* @version 1.0, 작업 내용 : 글쓰기 service 호출 (write)
* @Date : 2023-09-26
* 
*/


package com.gpmatching.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gpmatching.dto.OverwatchDto;
import com.gpmatching.dto.PubgDto;
import com.gpmatching.service.OverwatchService;
import com.gpmatching.service.PubgService;

import lombok.Setter;

@Controller
@RequestMapping(path = { "/pubg"})
public class PubgController {
	
	@Autowired
	@Setter
	PubgService pubgService;
	
	@GetMapping(path = { "/write"})
	public String writeOverwatch() {
		//PubgDto pubg = new PubgDto();
		
		System.out.println("test");

		
		//pubgDto.setBoardNo(2); // BoardNo 중복값 2번 입력하면 에러
		//pubgDto.setBoardNo(30); //MatchingBoard에 없는 BoardNo 넣으면 에러

		
		
		return "home";
	}
}