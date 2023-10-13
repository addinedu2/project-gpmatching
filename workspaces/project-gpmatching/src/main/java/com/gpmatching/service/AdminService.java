package com.gpmatching.service;

import java.util.List;

import com.gpmatching.dto.AdminDto;
import com.gpmatching.dto.UserDto;

public interface AdminService {

	
	List<AdminDto> getNewUsers();

	int getUserCount();

	AdminDto getUserNo(int userNo);

	List<AdminDto> searchUsers(String keyword, int from, int count);

	List<AdminDto> UserList();

	List<AdminDto> listUserListByPage(int from, int count);

	
	
	
	
	
	

	


	

	

}
