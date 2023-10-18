package com.gpmatching.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
	public String viewUser(@PathVariable int userNo, Model model) {
		AdminDto user = adminService.getUserNo(userNo);
		if (user != null) {
			model.addAttribute("user", user);
			}
		return "/admin/adminUserDetail";
		}
	
	//회원 상세보기 수정
	@PostMapping(path = {"/user"})
	public String updateUser(@ModelAttribute("user") AdminDto updateUser) {
	    // userNo를 기반으로 데이터베이스에서 해당 유저 정보를 가져온다.
		AdminDto upUser = adminService.getUserNo(updateUser.getUserNo());

	    // 가져온 유저 정보를 업데이트한다.
		
		upUser.setUserId(updateUser.getUserId());
		upUser.setUserEmail(upUser.getUserEmail());
		upUser.setNickname(updateUser.getNickname());
		upUser.setUserPhone(updateUser.getUserPhone());
		upUser.setUserIntro(updateUser.getUserIntro());
		upUser.setUserGrade(updateUser.getUserGrade());    //선택식도 겟임
		upUser.setDeletedUser(updateUser.isDeletedUser()); // boolean은 겟이 아닌 is
		upUser.setBanEndDate(updateUser.getBanEndDate());
	    // 업데이트된 정보를 데이터베이스에 저장한다.
	    adminService.updateUser(upUser);

	    // 수정 후에 유저 목록 페이지로 리다이렉션 또는 다른 페이지로 리다이렉션할 수 있음
	    return "/admin/adminUserDetail";
	}

	
	
	
	
	
		
}
	
	