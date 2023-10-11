package com.gpmatching.service;

import java.util.List;

import com.gpmatching.dto.CommonBoardDto;
import com.gpmatching.dto.UserDto;

public interface MypageService {

	void editUser(UserDto loginUser);

	UserDto selectUserProfile(UserDto loginUser);

	List<CommonBoardDto>findMyWriteBoardByUserNo(int userNo);
}
