package com.gpmatching.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gpmatching.dto.ConfirmAlarmDto;
import com.gpmatching.dto.MatchingAlarmDto;
import com.gpmatching.dto.MatchingCommentDto;
import com.gpmatching.dto.UserDto;
import com.gpmatching.service.MatchingAlarmService;
import com.gpmatching.service.MatchingCommentService;

import lombok.Setter;

@Controller
@RequestMapping(path = { "/boardMatching/lolBoard" })
public class LolMatchingCommentController {

	@Setter(onMethod_ = { @Autowired })
	private MatchingCommentService matchingCommentService;
	
	@Setter(onMethod_ = { @Autowired })
	private MatchingAlarmService matchingAlarmService;
	
	@PostMapping(path = { "/write-comment" })
	public String writeMatchingComment(MatchingCommentDto matchingComment, MatchingAlarmDto matchingAlarm, 
									   @RequestParam(defaultValue = "-1") int boardNo) {		
		
		matchingCommentService.writeMatchingComment(matchingComment, matchingAlarm);
		return "redirect:lol-list";
		
	}
	
	@PostMapping(path = { "/ajax-write-comment" })
	@ResponseBody
	public String ajaxWriteMatchingComment(MatchingCommentDto matchingComment, MatchingAlarmDto matchingAlarm, 
										   @RequestParam(defaultValue = "-1") int boardNo) {
		
		
		matchingCommentService.writeMatchingComment(matchingComment, matchingAlarm);
		

		
		return "success";
	}
	
	@GetMapping(path = { "/ajax-show-comment-and-btn-matching" }, produces = "application/json;charset=utf-8")
	@ResponseBody
    public List<MatchingCommentDto> ajaxShowMatchingComment(@RequestParam int boardNo) {
        
	    System.out.println("Received boardNo: " + boardNo);

        List<MatchingCommentDto> comments = matchingCommentService.getMatchingCommentByBoardNo(boardNo);
        
        System.out.println(comments);
        
        for(MatchingCommentDto comment : comments) {
        	comment.setBoardNo(boardNo);
        }
        
        
        return comments; 
    }
	
	@GetMapping(path = { "/commentConfirm" }, produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<MatchingCommentDto> commentConfirm(@RequestParam int commentNo, ConfirmAlarmDto confirmAlarmDto) {
		System.out.println("수락버튼클릭");
		matchingCommentService.setCommentStatusConfirm( commentNo, confirmAlarmDto);

		int boardNo = matchingCommentService.getBoardNoByCommentNo(commentNo);

		System.out.println("Received boardNo: " + boardNo);
		
        List<MatchingCommentDto> comments = matchingCommentService.getMatchingCommentByBoardNo(boardNo);
        
        return comments; 

	}
	
	@GetMapping(path = { "/commentReject"}, produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<MatchingCommentDto> commentReject(@RequestParam int commentNo) {
		System.out.println("거절버튼클릭");
		matchingCommentService.setCommentStatusReject(commentNo);
		
		int boardNo = matchingCommentService.getBoardNoByCommentNo(commentNo);
		
		System.out.println("Received boardNo: " + boardNo);

        List<MatchingCommentDto> comments = matchingCommentService.getMatchingCommentByBoardNo(boardNo);
        
        return comments; 
	}
	
	@GetMapping(path = { "/ajax-show-comment2" }, produces = "application/json;charset=utf-8")
	@ResponseBody
    public List<MatchingCommentDto> ajaxShowMatchingComment2(@RequestParam int boardNo) {
        
	    System.out.println("Received boardNo: " + boardNo);

        List<MatchingCommentDto> comments = matchingCommentService.getMatchingCommentForReview(boardNo);
        
        System.out.println(comments);
        
        for(MatchingCommentDto comment : comments) {
        	comment.setBoardNo(boardNo);
        }
        
        
        return comments; 
    }
	

//	@GetMapping(path = { "/lol-comment" })
//	public String showMatchingCommentList(int boardNo, Model model) {
//		
//		List<MatchingCommentDto> mComments = matchingCommentService.getMatchingCommentByBoardNo(boardNo);
//		model.addAttribute("mComments", mComments);
//		
//		return "boardMatching/lolBoard/lol-comment";
//	}
}
