//package com.gpmatching.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.gpmatching.service.AdminService;
//
//@Controller
//public class AdminController {
//	
//	@Autowired
//	private AdminService adminService;
//	
//	@GetMapping("/admin_main")
//	public void main(Model model) {
//		System.out.println("메인 페이지로 이동");
//		model.addAttribute("boardList", service.getAdminList());
//		model.addAttribute("userInfo",UserService.adminUserList());
//		
//	}
//	
//	@GetMapping("/admin_boardList")
//	public void mainList(Model model) {
//		System.out.println("어드민메인 게시판 리스트");
//		model.addAttribute("allBoard", service.getAllboard());
//	}
//	
//	// 어드민 회원 관리
//	@GetMapping("/admin_userList")
//	public void user_list(Model model) {
//		//회원 기본정보 페이징(x)
//		System.out.println("/admin_userList 요청");
//		List<UserVO> list = UserService.adminUserList2();
//		model.addAttribute("userInfo",list);
//		
//		
//	};
//	
//	@ResponseBody
//	@PostMapping("/getuserInfo")
//	public UserVO getuserInfo(String id) {
//		System.out.println("유저 인포 아작스");
//		UserVO user = UserService.getInfo(id);
//		return user;
//	}
//	
//	@ResponseBody
//	@PostMapping("/getUserBoardList")
//	public List<BoardVO> getUserBoardList(String board_writer) {
//		System.out.println("open! user boardList ajax!");
//		System.out.println("조회할 회원 아이디 : " + board_writer);
//		List<BoardVO> list = service.getUserBoardList(board_writer);
//		
//		return list;
//	}
//	@ResponseBody
//	@PostMapping("/getCommentList")
//	public List<CommentVO> getCommentList(String com_writer){
//		System.out.println("open! user Comment List ajax!");
//		System.out.println("조회할 회원 아이디 : " + com_writer);
//		List<CommentVO> list = comService.getComList(com_writer);
//		System.out.println(list);
//		return list;
//	}
//	
//	@ResponseBody
//	@PostMapping("/successId")
//	public void successId(String id) {
//		System.out.println(id);
//		System.out.println("open! user sign success Id ajax!");
//		UserService.successId(id);
//	}
//	
//	@ResponseBody
//	@PostMapping("/failId")
//	public void failId(String id) {
//		System.out.println(id);
//		System.out.println("open! user sign failId Id ajax!");
//		UserService.failed(id);
//	}
//	
//	@ResponseBody
//	@PostMapping("/deleteBoard")
//	public void deleteBoard(int board_no) {
//		System.out.println("삭제할 게시물 : " + board_no);
//		service.JBoardDelete(board_no);
//	}
//	
//	@GetMapping("/admin_dataTotal")
//	public void admin_dataTotal(Model model) {
//		model.addAttribute("allTotal", service.getAllTotal());
//	}
//	
//	@ResponseBody
//	@PostMapping("/findDate")
//	public List<HashMap<String, Object>> admin_findDate(String date1 , String date2) {
//		System.out.println(date1);
//		System.out.println(date2);
//		List<HashMap<String, Object>> list = service.admin_findDate(date1, date2);
//		System.out.println(service.admin_findDate(date1, date2));
//		return list;
//	}
//	
//	@ResponseBody
//	@PostMapping("/dropId")
//	public void dropID(String id) {
//		UserService.dropUser(id);
//	}
//}