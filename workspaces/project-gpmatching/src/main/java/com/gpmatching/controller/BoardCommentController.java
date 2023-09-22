package com.gpmatching.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gpmatching.dto.BoardCommentDto;
import com.gpmatching.service.BoardCommentService;

@Controller
@RequestMapping(path= {"/commonBoard"})
public class BoardCommentController {
	
	@Autowired
	private BoardCommentService boardCommentService;
	
	@PostMapping(path= {"/writeComment"})
	public String writeCommentForm(BoardCommentDto boardComment, @RequestParam(defaultValue = "-1")int pageNo ) {

		boardCommentService.writeComment(boardComment);
	
		return String.format("redirect:commonDetail?commonNo=%d&pageNo=%d", boardComment.getCommonNo(), pageNo);
			//나중에 적은 댓글 주소로 돌아올 것
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
