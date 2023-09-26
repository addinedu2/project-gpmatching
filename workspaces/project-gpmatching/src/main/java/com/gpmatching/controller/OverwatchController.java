package com.gpmatching.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gpmatching.dto.OverwatchDto;
import com.gpmatching.service.OverwatchService;

import lombok.Setter;

@Controller
@RequestMapping(path = { "/overwatch"})
public class OverwatchController {
	
	@Autowired
	@Setter
	OverwatchService overwatchService;
	
	@GetMapping(path = { "/write"})
	public String writeOverwatch() {
		OverwatchDto overwatchDto = new OverwatchDto();
		
		System.out.println("test");

		
		//overwatchDto.setBoardNo(2); // BoardNo 중복값 2번 입력하면 에러
		//overwatchDto.setBoardNo(30); //MatchingBoard에 없는 BoardNo 넣으면 에러
		overwatchDto.setOwPlay("owPlay");
		overwatchDto.setOwPosition("owPosition");
		overwatchDto.setOwTier("owTier");
		overwatchService.write(overwatchDto, 50);
		
		
		return "home";
	}
}