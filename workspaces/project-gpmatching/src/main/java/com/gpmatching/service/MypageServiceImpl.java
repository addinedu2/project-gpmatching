package com.gpmatching.service;

import org.springframework.beans.factory.annotation.Autowired;

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
		//데이터베이스 데이터 수정(mapper 사용)
		mypageMapper.updateUserProfile(user);
		
	}

	@Override
	public UserDto selectUserProfile(UserDto loginUser) {
		
		 UserDto selectUserProfile = mypageMapper.selectUserProfile(loginUser);
		return selectUserProfile;
	}
	
	

}
