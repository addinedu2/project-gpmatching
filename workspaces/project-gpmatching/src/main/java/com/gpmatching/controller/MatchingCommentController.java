package com.gpmatching.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gpmatching.dto.MatchingCommentDto;
import com.gpmatching.service.MatchingCommentService;

@Controller
@RequestMapping(path = { "/boardMatching" })
public class MatchingCommentController {

	@Autowired
	private MatchingCommentService matchingCommentService;
	
	@PostMapping(path = { "/write-comment" })
	public String writeMatchingComment(MatchingCommentDto matchingComment, @RequestParam(defaultValue = "-1") int boardNo) {
		
		
		/*
		 * MatchingCommentDto test = new MatchingCommentDto();
		 * 
		 * test.setBoardNo(0); test.setMCommentConfirm(true);
		 * test.setMCommentContent("ㅋㅋ"); test.setMCommentNo(0); test.setUserNo(0);
		 * 
		 * matchingCommentService.writeMatchingComment(test);
		 */
		
		matchingCommentService.writeMatchingComment(matchingComment);
		
		return "redirect:lol-list";
	}
}
