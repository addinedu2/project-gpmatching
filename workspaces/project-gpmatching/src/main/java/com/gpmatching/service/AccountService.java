package com.gpmatching.service;

import com.gpmatching.dto.UserDto;

public interface AccountService {

	void register(UserDto user);
	
	UserDto findloginUser(UserDto user);


}
