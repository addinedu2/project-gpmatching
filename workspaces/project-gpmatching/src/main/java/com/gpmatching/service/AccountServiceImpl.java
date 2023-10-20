package com.gpmatching.service;


import org.apache.ibatis.annotations.Param;

import com.gpmatching.common.Util;
import com.gpmatching.dto.UserDto;
import com.gpmatching.mapper.UserMapper;

import lombok.Setter;

public class AccountServiceImpl implements AccountService {

	@Setter
	private UserMapper userMapper;
	
	//회원가입
	@Override
	public void register(UserDto user) { //회원 가입을 할 거다
		
		//DB에 비밀번호 암호화
		String hashPasswd = Util.getHashedString(user.getUserPwd(), "SHA-256" ); //입력한 비번 암호화
		user.setUserPwd(hashPasswd); //암호화 된 비번으로 넣기
						
		userMapper.insertUser(user);
	}
	
	@Override 
	//로그인한 유저 저장
	public UserDto findLoginUser(UserDto user) {

//		String hashedPasswd = Util.getHashedString(user.getUserPwd(), "SHA-256");
//		user.setUserPwd(hashedPasswd);


		UserDto loginUser = userMapper.selectUserByIdAnduserPwd(user.getUserId(), user.getUserPwd());
		return loginUser;  //컨트롤러에서 보자
	}
	
	
	
//	//마이페이지 수정  MypageServiceImpl로 이동
//	@Override
//	public void editUser(UserDto user) {
//		//데이터베이스 데이터 수정(mapper 사용)
//		userMapper.updateUserProfile(user);
//		
//	}

	
	
	//로그인 중복검사
	@Override
	public boolean isUserIdValid(String userId) {
		
		int count = userMapper.selectUserCountMyUserId(userId);
		return count == 0;
	}
	//로그인 닉네임 중복검사
	@Override
	public boolean isNickNameValid(String nickname) {
		
		int count = userMapper.selsectUserCountMyNickName(nickname);
		return count == 0;
	}
	
	@Override
	public UserDto	findUserByPhoneAndEmail(String userPhone, String userEmail) {
		return userMapper.findUserByPhoneAndEmail(userPhone, userEmail);
	}

	@Override
	public void deleteUser(String userPwd) {
		userMapper.deleteUser(userPwd);
		
	}
	

}