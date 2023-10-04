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
import org.springframework.web.bind.annotation.ResponseBody;

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

	//회원가입 버튼
	@GetMapping(path = { "/register" })
	public String registerForm (HttpSession session, Model model) {
 		// 이미 로그인된 사용자가 있을 경우 마이 페이지로 리디렉션
	    if (session.getAttribute("loginuser") != null) {
	        return "account/mypage";
	    } else {
	        return "account/register";
	    }
	}

		
//	@PostMapping(path = { "/register" })  todo
//	//@valid/indingResult result 는 유효성 검사라서 회원 가입할때 유효성을 걸어놔야한다. userdto도 활성화
//	public String register(@ModelAttribute("user") @Valid UserDto user, BindingResult result) {
//		
//		if(result.hasErrors()) {
//			return "account/register";
//		}
//		accountService.register(user);
//		
//		return "redirect:/home";
//	}//회원가입 폼 한 후 홈으로 돌아오기

	
	//회원 가입
	@PostMapping(path = { "/register" })
	public String register(@ModelAttribute("user") UserDto user) {
	// AccountService accountService = new AccountServiceImpl();
		accountService.register(user);
		return "redirect:/home";
	}
	
	
	
	//로그인 버튼
	@GetMapping(path = {"/login"})
	public String loginForm(HttpSession session, Model model) {
	    // 이미 로그인된 사용자가 있을 경우 마이 페이지로 리디렉션
		    if (session.getAttribute("loginuser") != null) {
		        return "account/mypage";
		    } else {
		        return "account/login";
		    }
		}

	
	//로그인 성공/실패	
	@PostMapping(path = {"/login"})
	public String login(UserDto user, HttpSession session, Model model) {
	UserDto loginUser = accountService.findLoginUser(user);
	
		if (loginUser != null) { //loginUser가 비지 않았다=데이터베이스에 id와 pw가 일치한다=로그인 하기
			session.setAttribute("loginuser", loginUser); //loginUser 정보를 "loginuser"에 넣기
			return "redirect:/home";
		} else {
			model.addAttribute("loginfail", true); // 로그인 실패를 했으니 "loginfail"에 참 넣기
			return "account/login";
		}	
		
	}
		
	//로그아웃
	@GetMapping(path = {"/logout"})
	public String logout(HttpSession session) {
		session.removeAttribute("loginuser"); //세션 정보에서 "loginuser"를 뺀다=로그아웃
		return "redirect:/home";
		//return "account/logout";
	}
	
	
	//비밀번호 찾기 페이지 가기
	@GetMapping(path = {"/forgetPassword"})
	public String forgetPassword() {
		
		return "account/forget-password";
	}
	
	
	//로그인 중복검사
	@GetMapping(path = {"/check-id-dup"}, produces = "text/plain;charset=utf-8")  //  produces = "text/plain;charset=utf-8"  한글
	@ResponseBody //이 메서드가 반환하는 값은 view이름이 아니고 응답 컨텐츠 입니다. 별도의 처리를 하지 않고 그냥 응답해라. ajax를 쓰면 필수적으로 사용되는 어노테이션
	public String checkMemberIdDuplication(String userId) {
		
		boolean valid = accountService.isUserIdValid(userId);
		
		return String.valueOf(valid); 
		
	}



}