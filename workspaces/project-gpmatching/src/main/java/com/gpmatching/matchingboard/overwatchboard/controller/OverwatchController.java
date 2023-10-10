
/**
* 
* @brief 클래스 설명 : 오버워치 게시판 정보 (Overwatch 테이블) 
* 					controller 클래스 (view 없는 테스트 클래스)
* @author 최종 수정자 : hi.lee
* @version 1.0, 작업 내용 : 글쓰기 service 호출 (write)
* @Date : 2023-09-26
* 
*/

package com.gpmatching.matchingboard.overwatchboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gpmatching.matchingboard.dto.OverwatchDto;
import com.gpmatching.matchingboard.overwatchboard.service.OverwatchService;

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