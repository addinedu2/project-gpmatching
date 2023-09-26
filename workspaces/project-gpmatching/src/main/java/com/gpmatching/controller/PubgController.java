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