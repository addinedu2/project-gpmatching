package com.gpmatching.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gpmatching.dto.AlramDto;
import com.gpmatching.dto.BoardCommentDto;
import com.gpmatching.service.BoardCommentService;

import lombok.Setter;

@Controller
@RequestMapping(path = { "/commonBoard" })
public class BoardCommentController {
	
	@Setter(onMethod_ = { @Autowired })
	private BoardCommentService boardCommentService;
	
	@GetMapping(path= {"/commentList"})
	public String showCommentList(int commonNo, Model model) {
		
		List<BoardCommentDto> comments = boardCommentService.getCommentListByCommonNo(commonNo);
		model.addAttribute("comments",comments);
		
		return "commonBoard/commentList";
	}

	
	//공통게시판 댓글 쓰기
	@PostMapping(path= {"/writeComment"})
	public String writeComment(BoardCommentDto boardComment, AlramDto alram, @RequestParam(defaultValue = "-1") int pageNo) {
	
		boardCommentService.writeComment(boardComment, alram);

		//return "redirect:commonDetail";
		return String.format("redirect:commonDetail?commonNo=%d&pageNo=%d", boardComment.getCommonNo(), pageNo);
	}
	
	@PostMapping(path= {"/ajax-writeComment"})
	@ResponseBody
	public String ajaxWriteComment(BoardCommentDto boardComment, AlramDto alram, @RequestParam(defaultValue = "-1") int pageNo) {
	
		if (pageNo < 1) {
			return "redirect:commonList";
		}
		
		boardCommentService.writeComment(boardComment, alram);

		return "success";
	}
	
	//대댓글 쓰기
	@PostMapping(path= {"/writeRecomment"})
	@ResponseBody
	public String writeRecomment(BoardCommentDto boardComment) {
			
		BoardCommentDto parentBoardComment = boardCommentService.findBoardCommentByCommentNo(boardComment.getCommentNo());
			
		boardComment.setCommonNo(parentBoardComment.getCommonNo());
		boardComment.setGroupNo(parentBoardComment.getGroupNo());
		boardComment.setStep(parentBoardComment.getStep()+1);
		boardComment.setDepth(parentBoardComment.getDepth()+1);
			
		//대댓 작성시 depth업데이트
		boardCommentService.updateStep(boardComment);
			
		//대댓 작성
		boardCommentService.writeRecomment(boardComment);
			
		return "success";
	}
	
	
	@GetMapping(path = {"/deleteComment"}) //댓글 삭제
	public String deleteComment(int commentNo, int commonNo, int pageNo) {
		
		boardCommentService.deleteComment(commentNo);
		//return "redirect:commonDetail";
		return String.format("redirect:commonDetail?commonNo=%d&pageNo=%d", commonNo, pageNo);
	}  
	
	@GetMapping(path = {"/ajax-deleteComment"})
	@ResponseBody
	public String ajaxDeleteComment(int commentNo) {
		
		boardCommentService.deleteComment(commentNo);
		
		return "success";
	} 
	
	@PostMapping(path = {"/editComment"})
	public String editComment(BoardCommentDto boardComment, @RequestParam(defaultValue = "-1") int pageNo) {
		boardCommentService.editComment(boardComment);
		return String.format("redirect:commonDetail?commonNo=%d&pageNo=%d", boardComment.getCommonNo(), pageNo);	
	}
	
	@PostMapping(path = {"/ajax-editComment"})
	@ResponseBody
	public String ajaxEditComment(BoardCommentDto boardComment) {
		boardCommentService.editComment(boardComment);
		
		return "success";	
	}
	
}


