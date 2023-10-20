package com.gpmatching.service;

import com.gpmatching.dto.UserDto;

public interface AccountService {



	void register(UserDto user);
	UserDto findLoginUser(UserDto user);
	//void editUser(UserDto user);
	
	boolean isUserIdValid(String userId);  //로그인 중복검사
	UserDto findUserByPhoneAndEmail(String userPhone, String userEmail);
	boolean isNickNameValid(String nickname);

	void deleteUser(String userPwd);

	
}
