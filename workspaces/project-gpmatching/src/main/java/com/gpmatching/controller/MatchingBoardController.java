package com.gpmatching.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gpmatching.dto.MatchingBoardDto;
import com.gpmatching.service.MatchingBoardService;

import lombok.Setter;

@Controller
@RequestMapping(path = { "/boardMatching"})
public class MatchingBoardController {
	
	@Setter(onMethod_ = { @Autowired }) 
	private MatchingBoardService service;
	
	@GetMapping(path = { "/lol-list"})
	public String lolMatchingBoardList() {
		
		return "/boardMatching/lol-list";
	}
	
	@GetMapping(path = { "/battleground-list"})
	public String bgMatchingBoardList() {
		
		return "/boardMatching/battleground-list";
	}
	
	@GetMapping(path = { "/overwatch-list"})
	public String owMatchingBoardList() {
		
		return "/boardMatching/overwatch-list";
	}
	
	
	@GetMapping(path = { "/write"})
	public String writeMatchingBoard() {
		
		//test
		MatchingBoardDto testMatchingBoard;
		
		testMatchingBoard = new MatchingBoardDto();
		testMatchingBoard.setBoardNo(0);
		testMatchingBoard.setBoardTitle("test title");
		testMatchingBoard.setBoardContent("test content");
		testMatchingBoard.setPreferGender(false);
		testMatchingBoard.setMatchingClose(false);
		testMatchingBoard.setRegDate(new Date());
		testMatchingBoard.setReadCount(0);
		
		
		service.write(testMatchingBoard);
		
		return "/boardMatching/write";
		
	}
	
	@PostMapping(path = { "/write"})
	public String writeMatchingBoard(MatchingBoardDto matchingBoardDto) {
		
		//test
		
		service.write(matchingBoardDto);
		//service.write(matchingBoardDto);
		return null;
		
	}

}
