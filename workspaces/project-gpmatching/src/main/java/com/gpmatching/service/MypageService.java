package com.gpmatching.service;

import com.gpmatching.dto.UserDto;

public interface MypageService {

	void editUser(UserDto loginUser);

	UserDto selectUserProfile(UserDto loginUser);


}
