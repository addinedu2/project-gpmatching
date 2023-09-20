package com.gpmatching.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gpmatching.dto.BoardCommentDto;
import com.gpmatching.service.BoardCommentService;

@Controller

public class BoardCommentController {
	
	@Autowired
	private BoardCommentService boardCommentService;
	
	@GetMapping(path= {"/comment"})
	public String writeCommentForm(BoardCommentDto boardCommentDto) {
		
		return "board/comment";
	}
	
	@PostMapping(path= {"/comment"})
	public String writeComment(BoardCommentDto boardCommentDto) {
	
		boardCommentService.writeComment(boardCommentDto);

		return "board/comment";
	}
	
	
////testCode
//	@GetMapping(path= {"/test"})
//	public String writeCommentForm(BoardCommentDto boardComment) {
//		
//		return "test2";
//	}
//	
//	@PostMapping(path= {"/test"})
//	public String writeComment(BoardCommentDto boardComment) {
//		
//		boardCommentService.writeComment(boardComment);
//	
//		System.out.println(boardComment);//testCode
//
//		BoardCommentDto test = new BoardCommentDto();
//		
//		  test.setCommentNo(11);
//		  test.setCommonNo(11);
//		  test.setUserNo(11);
//		  test.setCommentContent("content1");
////		  test.setGroupNo(1);
////		  test.setStep(1);
////		  test.setDepth(0);
////		  test.setDeleted(false);
//		  
//		  boardCommentService.writeComment(test);
//		
//		return "redirect:/test";
//	}

}
