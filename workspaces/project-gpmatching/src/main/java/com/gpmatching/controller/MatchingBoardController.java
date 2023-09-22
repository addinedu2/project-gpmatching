package com.gpmatching.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gpmatching.dto.LolDto;
import com.gpmatching.dto.MatchingBoardDto;
import com.gpmatching.service.LolService;
import com.gpmatching.service.MatchingBoardService;

import lombok.Setter;

@Controller
@RequestMapping(path = { "/boardMatching"})
public class MatchingBoardController {
	
	@Setter(onMethod_ = { @Autowired }) 
	private MatchingBoardService matchingBoardService;
	
	@Setter(onMethod_ = { @Autowired }) 
	private LolService lolService;
	
	@GetMapping(path = { "/lol-list"})
	public String matchingBoardList(Model model) {
		
		List<MatchingBoardDto> matchingBoardList = matchingBoardService.listMatchingBoard();
		
		model.addAttribute("matchingBoardList", matchingBoardList);
		
		return "/boardMatching/lol-list";
	}
	
	@GetMapping(path = { "/comment-list" })
	public String showCommentList(@RequestParam(defaultValue = "-1") int boardNo, Model model) {
		
		MatchingBoardDto matchingBoard = matchingBoardService.findMatchingBoardByBoardNo(boardNo);
		
		model.addAttribute("matchingBoard", matchingBoard);
		
		return "/boardMatching/comment-list";
	}

	@GetMapping(path = { "/battleground-list"})
	public String bgMatchingBoardList() {
		
		return "/boardMatching/battleground-list";
	}
	
	@GetMapping(path = { "/overwatch-list"})
	public String owMatchingBoardList() {
		
		return "/boardMatching/overwatch-list";
	}
	
	
	@GetMapping(path = { "/lol-write"})
	public String showLolWriteForm(HttpSession session) {
		
		return "/boardMatching/lol-write";
	}
	
	@PostMapping(path = { "/lol-write"})
	public String writeLolMatchingBoard(MatchingBoardDto matchingBoardDto, LolDto lolDto) {
		
		matchingBoardService.write(matchingBoardDto);
		//lolService.write(lolDto, matchingBoardDto.getBoardNo());
		int boardNo = matchingBoardService.getLastMatchingItemBoardNo();
		lolService.write(lolDto, boardNo);
		
		return "redirect:lol-list";	
	}

	@GetMapping(path = { "/battleground-write"})
	public String showBgWriteForm(HttpSession session) {
		
		return "/boardMatching/write";
	}
	
	@PostMapping(path = { "/battleground-write"})
	public String writeBgMatchingBoard(MatchingBoardDto matchingBoardDto) {
		
		matchingBoardService.write(matchingBoardDto);
		
		return "redirect:lol-list";	
	}

	@GetMapping(path = { "/overwatch-write"})
	public String showOwWriteForm(HttpSession session) {
		
		return "/boardMatching/write";
	}
	
	@PostMapping(path = { "/overwatch-write"})
	public String writeOwMatchingBoard(MatchingBoardDto matchingBoardDto) {
		
		matchingBoardService.write(matchingBoardDto);
		
		return "redirect:lol-list";	
	}

}
