package com.gpmatching.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.common.Util;
import com.gpmatching.dto.UserDto;
import com.gpmatching.mapper.UserMapper;

import lombok.Setter;

public class AccountServiceImpl implements AccountService {

	@Setter
	private UserMapper usermapper;
	
	@Override
	public void register(UserDto user) { //회원 가입을 할 거다
		
//		String hashPasswd = Util.getHashedString(user.getUserPwd(), "SHA-256" ); //입력한 비번 암호화
//		user.setUserPwd(hashPasswd); //암호화 된 비번으로 넣기
						
		usermapper.insertUser(user);
	}
	
	@Override 
	//로그인한 유저 저장
	public UserDto findloginUser(UserDto user) {
		UserDto loginUser = usermapper.selectUserByIdAnduserPwd(user.getUserId(), user.getUserPwd());
		return loginUser;  //컨트롤러에서 보자
	}
	
	
		
		
	}
	

