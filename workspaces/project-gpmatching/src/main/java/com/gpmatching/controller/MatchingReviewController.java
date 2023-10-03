package com.gpmatching.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gpmatching.dto.CommonBoardDto;
import com.gpmatching.dto.MatchingReviewDto;
import com.gpmatching.service.MatchingReviewService;

@Controller
public class MatchingReviewController {

	@Autowired
	private MatchingReviewService matchingReviewService;
	
//	//CommonBoardController에다가 작성함 (test)
//	@GetMapping(path = { "/test" })
//	public String writeMatchingReviewForm(MatchingReviewDto matchingReview) {
//		
//		return "home";
//	}
		
		
	@PostMapping(path = { "/commonBoard/review" })
	public String writeMatchingReview(MatchingReviewDto matchingReview) {
		
		matchingReviewService.writeMatchingReview(matchingReview);
		
		return "redirect:/home";
	}
}
