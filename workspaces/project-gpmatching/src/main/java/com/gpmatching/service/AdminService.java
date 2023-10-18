package com.gpmatching.service;

import java.util.List;

import com.gpmatching.dto.AdminDto;
import com.gpmatching.dto.CommonBoardDto;
import com.gpmatching.dto.UserDto;

public interface AdminService {

	

	int getUserCount();

	AdminDto getUserNo(int userNo);

	

	List<AdminDto> UserList();

	List<AdminDto> listUserListByPage(int from, int count);

	List<AdminDto> searchUsers(String keyword, int from, int count);

	void updateUser(AdminDto adminDto);

	void updateImage(AdminDto adminDto);

	List<AdminDto> getUserCommonBoardByUserNo(int userNo, int from, int count);

	

	List<AdminDto> getUserReportBoardByUserNo(int userNo, int from, int count);

	int getcountCommonBoardPosts(int userNo);

	int getcountMatchingBoardPosts(int userNo);

	int getcountReportBoardPosts(int userNo);

	List<AdminDto> getUserMatchingBoardByUserNo(int userNo, int from, int count);

	

	

	







	

	
	
	
	
	
	

	


	

	

}
