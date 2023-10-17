package com.gpmatching.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gpmatching.dto.MypageBoardDto;
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
	

	//마이페이지 버튼 및 마이페이지 들어갔을때 내가 작성한 게시글 출력
	@GetMapping(path = {"/mypage"})
	public String mypage(HttpSession session, Model model) {
		UserDto loginUser = (UserDto) session.getAttribute("loginuser");  //현재 로그인한 사용자의 정보를 세션에서 가져오기
		
	    if (loginUser != null) {
	    	// 로그인한 사용자가 관리자인 경우 어드민 페이지로 리디렉션
	        if (loginUser.getUserGrade().equals("admin")) {
	            return "admin/adminpage";
	        } else {
	            // 로그인한 사용자가 일반 사용자인 경우 마이페이지 표시
	            List<MypageBoardDto> boardList = mypageService.findMyWriteMatchingBoardByUserNo(loginUser.getUserNo());


	            model.addAttribute("loginuser", loginUser);
	            model.addAttribute("boardList", boardList);

	            return "account/mypage";
	        }
	    } else {
	        // 로그인하지 않은 경우 로그인 페이지로 리디렉션
	        return "account/login";
	    }
	}
	
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
	

	
	//ajax 마이페이지 내가 쓴 글만 보기
	@GetMapping(path = { "/boardSelect" }, produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<MypageBoardDto> myWritePageView(String board, HttpSession session){
		
		UserDto loginUser = (UserDto) session.getAttribute("loginuser");
		
		//System.out.println("Received userNo: " + loginUser.getUserNo());
		
		List<MypageBoardDto> boardList = null;
		if(board.equals("common")) {
			boardList = mypageService.findMyWriteCommonBoardByUserNo(loginUser.getUserNo());
		
		}else {
			boardList = mypageService.findMyWriteMatchingBoardByUserNo(loginUser.getUserNo());
		}
		//System.out.println(myPageView);
		
		return boardList;
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
