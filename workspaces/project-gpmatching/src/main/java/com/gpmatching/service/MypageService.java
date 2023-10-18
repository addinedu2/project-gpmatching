package com.gpmatching.service;

import java.util.List;

import com.gpmatching.dto.MypageBoardDto;
import com.gpmatching.dto.UserDto;

public interface MypageService {

	void editUser(UserDto loginUser);

	UserDto selectUserProfile(UserDto loginUser);

	List<MypageBoardDto>findMyWriteCommonBoardByUserNo(int userNo);
	
	List<MypageBoardDto>findMyWriteMatchingBoardByUserNo(int userNo);
	
	int getMyReviewPoint(int userNo);
}
