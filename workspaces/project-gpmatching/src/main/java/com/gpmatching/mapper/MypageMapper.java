package com.gpmatching.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.gpmatching.dto.UserDto;

@Mapper
public interface MypageMapper {

	//내 정보 수정하는 메서드
	@Update ( "UPDATE User "
			+ "SET nickname = #{nickname}, userPhone = #{userPhone}, userEmail = #{userEmail} "
			+ "WHERE userId = #{userId}") 
	void updateUserProfile(UserDto loginuser);

	//프로필 조회
	@Select(  "select * "
			+ "from User "
			+ "where userId = #{userId}")
	UserDto selectUserProfile(UserDto loginUser);

}
