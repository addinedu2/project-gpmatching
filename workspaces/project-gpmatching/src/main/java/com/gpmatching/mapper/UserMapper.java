package com.gpmatching.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.gpmatching.dto.UserDto;

public interface UserMapper {
	
	@Insert(  "insert into user (userId, userPwd, userEmail) "
			+ "values (#{ userId }, #{ userPwd }, #{ userEmail })")
	void insertUser(UserDto user);

	@Select("select userId, email, regDate "
			+ "from user "
			+ "where userId = #{ userId } and userPwd = #{ userPwd }")
	UserDto selectUserByIdAndPwd(@Param("userId") String userId, 
									@Param("userPwd") String userPwd);
	
	

}
