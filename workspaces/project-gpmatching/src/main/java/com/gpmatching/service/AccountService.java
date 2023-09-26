package com.gpmatching.service;

import com.gpmatching.dto.UserDto;

public interface AccountService {



	void register(UserDto user);
	UserDto findLoginUser(UserDto user);
	void editUser(UserDto user);
	
}
