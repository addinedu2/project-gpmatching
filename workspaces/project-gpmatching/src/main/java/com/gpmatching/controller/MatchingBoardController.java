package com.gpmatching.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String listMatchingBoardList(Model model) {
		
		List<MatchingBoardDto> matchingBoardList = service.listMatchingBoard();
		
		model.addAttribute("matchingBoardList", matchingBoardList);
		
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
	public String showWriteForm(HttpSession session) {
		
		return "/boardMatching/write";
	}
	
	@PostMapping(path = { "/write"})
	public String writeMatchingBoard(MatchingBoardDto matchingBoardDto) {
		
		service.write(matchingBoardDto);
		
		return "redirect:lol-list";	
	}

	@GetMapping(path = { "/detail"})
	public String test() {
		return "/boardMatching/detail";
	}
}
