package com.gpmatching.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gpmatching.dto.AdminDto;
import com.gpmatching.service.AdminService;
import com.gpmatching.ui.ThePager;

@Controller
@RequestMapping(path = {"/admin"})
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	private String linkUrl;
	
	
	@GetMapping(path= {"/adminUserList"})
	public String showAdminUserList(@RequestParam(defaultValue="1") int pageNo,  @RequestParam(defaultValue = "") String keyword, Model model) {
		
		//페이지별 게시물 조회
		int pageSize = 10; //한 페이지 표시 개수
		int pagerSize = 5;//표시 페이지 개수
		//String linkUrl = "adminUserList";
		String linkUrl = "/project-gpmatching/admin/adminUserList";
	    
		int dataCount = adminService. getUserCount();//총 게시물 개수
		
		int from = (pageNo -1) *pageSize;//첫번째 페이지 게시물 순서
		List<AdminDto> listuser = adminService.listUserListByPage(from, pageSize);
		
		
		
		
		//페이지 번호 표시 부분
		ThePager pager = 
				new ThePager(dataCount, pageNo, pageSize, pagerSize, linkUrl);
		
		model.addAttribute("pagingUrl", linkUrl); //jsp에서 뽑아오기
		model.addAttribute("listuser", listuser);
		model.addAttribute("pager",pager);
		model.addAttribute("pageNo",pageNo);
		
		
		return "/admin/adminUserList";
			
		}
	
	@GetMapping("/getAdminUserListUrl")
    @ResponseBody
    public String getAdminUserListUrl() {
        return "/admin/adminUserList";
    }

	
	
	
	
	@GetMapping(path = {"/adminOverview"} )
	public String showAdminOverview() {
	    return "/admin/adminOverview";
	}


   
		
	
//	//신규 회원 리스트
//	@GetMapping(path = {"/userHome"}, produces = "application/json;charset=utf-8")
//	@ResponseBody
//	public List<AdminDto> userHome(Model model) {
//		List<AdminDto> newUsers = adminService.getNewUsers();
//		model.addAttribute("newUsers", newUsers);
//	    return newUsers;
//	}
//	



	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	//링크 를릭하면 회원의 유저넘버 추출해서 상세정보 보기
//	@GetMapping("/users/{userNo}")
//	public String viewUser(@PathVariable int userNo, Model model) {
//	    User user = userService.getUserByUserNo(userNo);
//	    if (user != null) {
//	        model.addAttribute("user", user);
//	        return "userDetails";
//	    } else {
//	        // 사용자를 찾을 수 없는 경우에 대한 처리 (예: 에러 페이지로 리다이렉트)
//	        return "error"; // 또는 다른 에러 페이지의 뷰 이름을 리턴할 수 있습니다.
//	    }
	}

	