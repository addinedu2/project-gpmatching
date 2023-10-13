package com.gpmatching.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gpmatching.dto.UserDto;
import com.gpmatching.service.BoardCommentService;
import com.gpmatching.service.MatchingReviewService;

import lombok.Setter;

@Controller
@RequestMapping(path = { "/review" })
public class MatchingReviewController {

	@Setter(onMethod_ = { @Autowired })
	private MatchingReviewService matchingReviewService;		
	
	@GetMapping(path = { "/write" })
	public String ShowMatchingReviewForm() {
		
		return "/review/write";
	}
	

		
		
	
}
