package com.gpmatching.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gpmatching.dto.MatchingReviewDto;
import com.gpmatching.service.MatchingReviewService;

@Controller
public class MatchingReviewController {

	@Autowired
	private MatchingReviewService matchingReviewService;
	
	@GetMapping(path = { "/test" })
	public String writeMatchingReviewForm(MatchingReviewDto matchingReview) {
		
		
		return "home";
	}
	
	@PostMapping(path = { "/test" })
	public String writeMatchingReview(MatchingReviewDto matchingReview) {
		
		matchingReviewService.writeMatchingReview(matchingReview);
		
		return "redirect:/home";
	}
}
