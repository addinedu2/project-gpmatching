package com.gpmatching.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.dto.MypageBoardDto;
import com.gpmatching.dto.UserDto;
import com.gpmatching.mapper.MypageMapper;



public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageMapper mypageMapper;
	
//	@Setter
//	private AccountService accountService;
	
	//마이페이지 수정
	@Override
	public void editUser(UserDto user) {
		
		if(user.getUserImage() != null ) {
		//데이터베이스 데이터 수정(mapper 사용)
		mypageMapper.updateUserProfileWithImage(user);
		}else {
			mypageMapper.updateUserProfileWithoutImage(user);
		}
		
	}
	//마이페이지 조회
	@Override
	public UserDto selectUserProfile(UserDto loginUser) {
		
		 UserDto selectUserProfile = mypageMapper.selectUserProfile(loginUser);
		return selectUserProfile;
	}
	
	
	//내가 작성한 글 보여주기(공통게시판)
	@Override
	public List<MypageBoardDto> findMyWriteCommonBoardByUserNo(int userNo) {
		
		List<MypageBoardDto> writeBoard = mypageMapper.selectMyWriteCommonBoardByUserNo(userNo);
		return writeBoard;
	}
	
	//내가 작성한 글 보여주기(매칭게시판)
	@Override
	public List<MypageBoardDto> findMyWriteMatchingBoardByUserNo(int userNo) {
		
		List<MypageBoardDto> writeBoard = mypageMapper.selectMyWriteMatchingBoardByUserNo(userNo);
		return writeBoard;
		
	}
	@Override
	public int getMyReviewPoint(int userNo) {

		int reviewPoint = mypageMapper.selectMyReviewPoint(userNo);
		
		return reviewPoint;
	}




}
