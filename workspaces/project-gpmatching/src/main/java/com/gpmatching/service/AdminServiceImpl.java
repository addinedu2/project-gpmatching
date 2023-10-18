package com.gpmatching.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.dto.AdminDto;
import com.gpmatching.mapper.AdminMapper;

public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper adminMapper;
	
	
	//회원 검색
	@Override
	public List<AdminDto> searchUsers(String keyword, int from, int count) {
		return adminMapper.searchUsers(keyword, from, count);
	}
	//회원 총 인원
	@Override
	public int getUserCount() {
		return adminMapper.getUserCount();
	}
	
	//회원 전체 목록
	@Override
	public List<AdminDto> UserList() {
		List<AdminDto> userList = adminMapper.UserList();
		return userList;
	}
	
	//회원목록 특정 페이지 조회
	@Override
	public List<AdminDto> listUserListByPage(int from, int count) {
		List<AdminDto> listUserListByPage = adminMapper.selectUserList(from, count);
		return listUserListByPage;
	}
	
	//회원 유저넘버 뽑기
	@Override
	public AdminDto getUserNo(int userNo) {
		return adminMapper.getUserNo(userNo);
		}
	
	@Override
	public void updateUser(AdminDto adminDto) {
		adminMapper.updateUser(adminDto);
	}
	@Override
	public void updateImage(AdminDto adminDto) {
		adminMapper.updateImage(adminDto);
	}
	
	//회원이 쓴 글만 보기(자유게시판)
	@Override
	public List<AdminDto> getUserCommonBoardByUserNo(int userNo, int from, int count) {
		return adminMapper.selectUserCommonBoardByUserNo(userNo, from, count);
	}
	
	@Override
	public int getcountCommonBoardPosts(int userNo) {
		return adminMapper.getcountCommonBoardPosts(userNo);
	}
	
	
	//회원이 쓴 글만 보기(매칭게시판)
	@Override
	public List<AdminDto> getUserMatchingBoardByUserNo(int userNo, int from, int count) {
		return adminMapper.selectUserMatchingBoardByUserNo(userNo, from, count);
	}
	
	@Override
	public int getcountMatchingBoardPosts(int userNo) {
		return adminMapper.getcountMatchingBoardPosts(userNo);
	}
	
	
	//회원이 쓴 글만 보기(신고게시판)
	@Override
	public List<AdminDto> getUserReportBoardByUserNo(int userNo, int from, int count) {
		return adminMapper.selectUserReportBoardByUserNo(userNo, from, count);
	}

	@Override
	public int getcountReportBoardPosts(int userNo) {
		return adminMapper.getcountReportBoardPosts(userNo);
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
