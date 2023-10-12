package com.gpmatching.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.dto.AdminDto;
import com.gpmatching.dto.BoardAttachDto;
import com.gpmatching.dto.BoardCommentDto;
import com.gpmatching.dto.CommonBoardDto;
import com.gpmatching.mapper.AdminMapper;
import com.gpmatching.mapper.UserMapper;

public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper adminMapper;
	
	@Autowired
	UserMapper userMapper;
	
	
	//유저 목록 리스트
	@Override
	public List<AdminDto> listUserBoard() {
		List<AdminDto> userBoardList = adminMapper.UserList();
		return userBoardList;
	}
	
	//글, 댓글 번호로 링크 만들기
	
	
	
	
	
	//	@Override
//	public List<AdminDto> getUserList(int pageNum, int pageSize) {
//		//페이징 처리
//		int startRow = (pageNum - 1) * pageSize;
//		int endPow = pageNum * pageSize;
//		
//		//회원 목록 조회
//		List<AdminDto> userList = adminMapper.getUserList(startRow, endPow);
//		
//		for (AdminDto user : userList ) {
//			user.setTotalPosts(adminMapper.countTotalPostsByUserNo(user.getUserNo()));	
//			user.setTotalComments(adminMapper.countTotalCommentsByUserNo(user.getUserNo()));
//		}	
//    return userList;


	
	
	
	
	
	
	
	
	
	
}
