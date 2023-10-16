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
import org.springframework.web.bind.annotation.ResponseBody;

import com.gpmatching.dto.MatchingReviewDto;
import com.gpmatching.dto.UserDto;
import com.gpmatching.matchingboard.dto.MatchingBoardDto;
import com.gpmatching.service.MatchingReviewService;

import lombok.Setter;

@Controller
@RequestMapping(path = { "/review" })
public class MatchingReviewController {

	@Setter(onMethod_ = { @Autowired })
	private MatchingReviewService matchingReviewService;		
	
	@GetMapping(path = { "/ajax-write-review" })
	@ResponseBody
	public String ShowMatchingReviewForm() {
		
		
		return "success";
	}
	
	@GetMapping(path = { "/write" })
	public String ShowMatchingReviewForm2(@RequestParam int boardNo, @RequestParam String writer, 
										  @RequestParam String commentWriter, @RequestParam int commentNo, Model model) {
		
		
		int commentUserNo = matchingReviewService.getUserNoByNickname(commentWriter);

		model.addAttribute("commentWriter", commentWriter);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("writer", writer);
		model.addAttribute("commentUserNo", commentUserNo);
		model.addAttribute("commentNo", commentNo);
		
		return "/review/write";
	}
	
	@PostMapping(path = { "/write-review" })
	public String WriteMatchingReview(MatchingReviewDto matchingReviewDto) {
		
		matchingReviewService.setMatchingReview(matchingReviewDto);
		return "redirect:/home";
	}
	
	@GetMapping(path = { "/ajax-show-review" }, produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<MatchingBoardDto> ShowNotYetReviewList(HttpSession session) {
		
		UserDto loginUser = (UserDto) session.getAttribute("loginuser");
		System.out.println(loginUser.getUserNo());

		List<MatchingBoardDto> reviewList = matchingReviewService.getNotYetReviewList(loginUser.getUserNo());
		
		System.out.println(reviewList);
		return reviewList;
	}
	

		
		
	
}
