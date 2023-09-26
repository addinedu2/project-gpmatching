package com.gpmatching.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	/**
	 * home 화면 (메인화면) 컨트롤러
	 * @return home 화면
	 */
	
	@GetMapping(path = { "/", "/home" })
	public String home() {
		
		
		return "/home";
		
		//return "/home";

	}
	
}
