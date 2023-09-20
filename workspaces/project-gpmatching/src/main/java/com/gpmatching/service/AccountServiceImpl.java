package com.gpmatching.service;

import com.gpmatching.common.Util;
import com.gpmatching.dto.UserDto;
import com.gpmatching.mapper.UserMapper;

import lombok.Setter;


public class AccountServiceImpl implements AccountService {

	@Setter
	private UserMapper userMapper;
	
	@Override
	public void register(UserDto user) {
		
		String hashedPasswd = Util.getHashedString(user.getUserPwd(), "SHA-256");
		user.setUserPwd(hashedPasswd);
		
		userMapper.insertUser(user);
		
	}

	@Override
	public UserDto findLoginUser(UserDto user) {
		
		String hashedPasswd = Util.getHashedString(user.getUserPwd(), "SHA-256");
		user.setUserPwd(hashedPasswd);
		
		UserDto loginUser = userMapper.selectUserByIdAndPwd(user.getUserId(), user.getUserPwd());
		
		return loginUser;
	}
	
	

}
