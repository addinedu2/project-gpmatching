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
	public String showAdminUserList(@RequestParam(defaultValue="1") int pageNo,  
			@RequestParam(defaultValue = "") String keyword, Model model) {
		
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
		
		
		return "admin/adminUserList";
			
		}

	@GetMapping(path = {"/searchUsers"})
	public String searchUsers(@RequestParam("keyword") String keyword,
            @RequestParam(defaultValue = "1") int pageNo,
            @RequestParam(defaultValue = "10") int pageSize, Model model) {
			int from = (pageNo - 1) * pageSize;
			List<AdminDto> searchResults = adminService.searchUsers(keyword, from, pageSize);
			  model.addAttribute("listuser", searchResults); // listuser 모델에 검색 결과를 추가
			  return "admin/adminUserList"; // 뷰의 경로를 반환
			}
	

	@GetMapping(path = {"/adminOverview"} )
	public String showAdminOverview() {
	    return "/admin/adminOverview";
	    
	}
	
	//링크 를릭하면 회원의 유저넘버 추출해서 상세정보 보기
	@GetMapping(path = {"/user/{userNo}"})
	public String viewUser(int userNo, Model model) {
		AdminDto user = adminService.getUserNo(userNo);
		if (user != null) {
			model.addAttribute("user", user);
		}
		return "/admin/adminUserDetail";
		}
		
}
	
	