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

import com.gpmatching.dto.MatchingAlarmDto;
import com.gpmatching.dto.MatchingCommentDto;
import com.gpmatching.service.MatchingAlarmService;
import com.gpmatching.service.MatchingCommentService;

import lombok.Setter;

@Controller
@RequestMapping(path = { "/boardMatching/lolBoard" })
public class MatchingCommentController {

	@Autowired
	private MatchingCommentService matchingCommentService;
	
	@Setter(onMethod_ = { @Autowired })
	private MatchingAlarmService matchingAlarmService;
	
	@PostMapping(path = { "/write-comment" })
	public String writeMatchingComment(MatchingCommentDto matchingComment, MatchingAlarmDto matchingAlarmDto, @RequestParam(defaultValue = "-1") int boardNo) {
		
		
		matchingCommentService.writeMatchingComment(matchingComment);
		
//		// 댓글이 작성될때 알림 테이블에 정보 저장 (미완성)
//		matchingAlarmService.saveMatchingAlarm(matchingAlarmDto);
		
		return "redirect:lol-list";
	}
	
	@PostMapping(path = { "/ajax-write-comment" })
	@ResponseBody
	public String ajaxWriteMatchingComment(MatchingCommentDto matchingComment, MatchingAlarmDto matchingAlarmDto, @RequestParam(defaultValue = "-1") int boardNo) {
		
		
		matchingCommentService.writeMatchingComment(matchingComment);
		
//		// 댓글이 작성될때 알림 테이블에 정보 저장 (미완성)
//		matchingAlarmService.saveMatchingAlarm(matchingAlarmDto);
		
		return "success";
	}
	
	@GetMapping(path = { "/lol-comment" })
	public String showMatchingCommentList(int boardNo, Model model) {
		
		List<MatchingCommentDto> mComments = matchingCommentService.getMatchingCommentByBoardNo(boardNo);
		model.addAttribute("mComments", mComments);
		
		return "boardMatching/lolBoard/lol-comment";
	}
}
