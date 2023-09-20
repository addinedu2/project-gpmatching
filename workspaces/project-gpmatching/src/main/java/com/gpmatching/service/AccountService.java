package com.gpmatching.service;

import com.gpmatching.dto.UserDto;

public interface AccountService {

	public void register(UserDto user);
	
	public UserDto findLoginUser(UserDto user);
}
