package com.gpmatching.controller;


import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gpmatching.dto.UserDto;
import com.gpmatching.service.AccountService;

@Controller
@RequestMapping(path = { "/account" })
public class AccountController {


	private AccountService accountService;

	@Autowired
	@Qualifier("accountService")
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
		//어카운트 서비스에서만 돌릴것
	}

	@GetMapping(path = { "/register" })
	public String registerForm (UserDto user) {
		return "account/register";
	}//회원가입 버튼

	@PostMapping(path = { "/register" })
	//@valid/indingResult result 는 유효성 검사라서 회원 가입할때 유효성을 걸어놔야한다. userdto에 걸어둠
	public String register(@ModelAttribute("user") UserDto user) {
	// AccountService accountService = new AccountServiceImpl();
		accountService.register(user);
		return "redirect:/home";
	}//회원가입 폼 한 후 홈으로 돌아오기
	
	
	@GetMapping(path = {"/login"})
	public String loginForm( ) {
		return "account/login";
	}//로그인 버튼
	
	@PostMapping(path = {"/login"})
	public String login(UserDto user, HttpSession session, Model model) {
	UserDto loginUser = accountService.findLoginUser(user);
	
		if (loginUser != null) { //loginUser가 비지 않았다=데이터베이스에 id와 pw가 일치한다=로그인 하기
			session.setAttribute("loginuser", loginUser); //loginUser 정보를 "loginuser"에 넣기
			System.out.println("로그인 성공");
			return "redirect:/home";
		} else {
			model.addAttribute("loginfail", true); // 로그인 실패를 했으니 "loginfail"에 참 넣기
			System.out.println("로그인 실패");
			return "account/login";
		}
			
	}
		
	@GetMapping(path = {"/logout"})
	public String logout(HttpSession session) {
		session.removeAttribute("loginuser"); //세션 정보에서 "loginuser"를 뺀다=로그아웃
		return "account/logout";
	}
	
	
	@GetMapping(path = {"/mypage"})
	public String mypageForm() {
		return "account/mypage";
	} //마이페이지 버튼
	
	
	
	
	@GetMapping(path = {"/editmypage"})
	public String editmypage() {
		return "account/editmypage";
	} // 마이페이지 수정 버튼
	



	/*
	
	
	@PostMapping(path = { "/register" })
	public String register(@ModelAttribute("user") @Valid UserDto user, BindingResult result) {
		
		if(result.hasErrors()) {
			return "account/register";
		}
		accountService.register(user);
		
		return "redirect:/home";
	}
	*/
}