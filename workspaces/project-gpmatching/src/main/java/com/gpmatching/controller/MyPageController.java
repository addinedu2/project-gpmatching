package com.gpmatching.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gpmatching.dto.UserDto;
import com.gpmatching.service.AccountService;

@Controller
@RequestMapping(path = {"/account"})
public class MyPageController {
	private AccountService accountService;
		
	@Autowired
	@Qualifier("accountService")
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	
	
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

	
	
	@GetMapping(path = {"/editMypage"})
	public String editmypage(HttpSession session, Model model) {
		UserDto LogingUser = (UserDto) session.getAttribute("loginuser");
			
		if (LogingUser != null) {
		model.addAttribute("user", LogingUser);
				return "account/editMypage";
			} else {
			   return "account/login";
			}
		
	} // 마이페이지 수정 버튼(로그인 하고 들어갈 수 있는 컨트롤러)

	@PostMapping(path = {"/editMypage"})
	public String updateUserProfile(UserDto updateUser, HttpSession session) {
		accountService.editUser(updateUser);
		 // 수정된 사용자 정보를 데이터베이스에 업데이트
		session.setAttribute("loginuser", updateUser);
		// 세션에서 사용자 정보 업데이트
		 return "account/mypage";
		 //수정 후 리다이렉트할 페이지 
	}//마이페이지 수정(데이터베이스에 보내기)
	
	
	
	
	
//	@GetMapping(path = {"/deletedUser"})
//	public String deletedUser()
	//유저 삭제+로그인 해야지만 탈퇴를 할 수 있게 하기
}
