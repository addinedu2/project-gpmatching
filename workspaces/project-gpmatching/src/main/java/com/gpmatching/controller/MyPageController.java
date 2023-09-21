package com.gpmatching.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gpmatching.dto.UserDto;
import com.gpmatching.service.AccountService;

@Controller
@RequestMapping(path = {"/account"})
public class MyPageController {
	private AccountService accountService;
		
//	@Autowired
//	@Qualifier("accountService")
//	public void setAccountService(AccountService accountService) {
//		this.accountService = accountService;
//	}
//	
	
	@GetMapping(path = {"/mypage"})
	public String mypage(HttpSession session, Model model) {
		UserDto LogingUser = (UserDto) session.getAttribute("loginuser");
		
		if (LogingUser != null) {
			model.addAttribute("user", LogingUser);
			return "account/mypage";
		} else {
		   return "account/login";
		}
		
	}

	
	
	@GetMapping(path = {"/editmypage"})

	public String editmypage(HttpSession session, Model model) {
		UserDto LogingUser = (UserDto) session.getAttribute("loginuser");
			
		if (LogingUser != null) {
		model.addAttribute("user", LogingUser);
				return "account/editmypage";
			} else {
			   return "account/login";
			}
		
	} // 마이페이지 수정 버튼
	

	
	
}
