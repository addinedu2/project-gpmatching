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
import com.gpmatching.service.MypageService;

@Controller
@RequestMapping(path = {"/account"})
public class MyPageController {
	
	@Autowired
	private MypageService mypageService;
	
		
	@Autowired
	@Qualifier("mypageService")
	public void setMypageService(MypageService mypageService) {
		this.mypageService = mypageService;
	}
	
	
	@GetMapping(path = {"/mypage"})
	public String mypage(HttpSession session, Model model) {
		UserDto loginUser = (UserDto) session.getAttribute("loginuser");
		
		if (loginUser != null) {
			model.addAttribute("loginuser", loginUser);
			return "account/mypage";
		} else {
		   return "account/login";
		}
		
	}//마이페이지 버튼

	
	// 마이페이지 수정 버튼(로그인 하고 들어갈 수 있는 컨트롤러)
	@GetMapping(path = {"/editMypage"})
	public String editmypage(HttpSession session, Model model) {
		UserDto loginUser = (UserDto) session.getAttribute("loginuser");
			
		if (loginUser != null) {
		model.addAttribute("loginuser", loginUser);
				return "account/editMypage";
			} else {
				return "account/login";
			}
		
	} 

	//마이페이지 수정(데이터베이스에 보내기)
	@PostMapping(path = {"/editMypage"})
	public String updateUserProfile(UserDto loginUser, HttpSession session, Model model)  {
		// 수정된 사용자 정보를 데이터베이스에 업데이트
		mypageService.editUser(loginUser);
		
		UserDto selectForRegDate = mypageService.selectUserProfile(loginUser);
		
		// 세션에서 사용자 정보 업데이트
		session.setAttribute("loginuser", selectForRegDate);

		//수정 후 리다이렉트할 페이지 
		return "redirect:mypage";
		
	}
	
	
	
	
	
//	@GetMapping(path = {"/deletedUser"})
//	public String DeletedUser(HttpSession session, Model model) {
//		UserDto DeletedUser = (UserDto) session.getAttribute("loginuser");
//		if (DeletedUser != null) {
//			model.addAttribute("user", DeletedUser);
//			return "account/editMypage";
//		} else {
//		   return "account/login";
//		}
//	}
	//유저 삭제+로그인 해야지만 탈퇴를 할 수 있게 하기
}
