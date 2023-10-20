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
    
	//원형 그래프 하루치
	
	@Override
	public int getCommonBoardCountForDay() {
        return adminMapper.getCommonBoardCountForDay();
    }
	@Override
    public int getMatchingBoardCountBattlegroundForDay() {
        return adminMapper.getMatchingBoardCountBattlegroundForDay();
    }
	@Override
    public int getMatchingBoardCountLolForDay() {
        return adminMapper.getMatchingBoardCountLolForDay();
    }
	@Override
    public int getMatchingBoardCountOverwatchForDay() {
        return adminMapper.getMatchingBoardCountOverwatchForDay();
    }
	//원형 그래프 일주일치
	@Override
    public int getCommonBoardCountForWeek() {
        return adminMapper.getCommonBoardCountForWeek();
    }
	@Override
    public int getMatchingBoardCountBattlegroundForWeek() {
        return adminMapper.getMatchingBoardCountBattlegroundForWeek();
    }
	@Override
    public int getMatchingBoardCountLolForWeek() {
        return adminMapper.getMatchingBoardCountLolForWeek();
    }
	@Override
    public int getMatchingBoardCountOverwatchForWeek() {
        return adminMapper.getMatchingBoardCountOverwatchForWeek();
    }
	
	
	
}
