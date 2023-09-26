package com.gpmatching.mapper;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.gpmatching.dto.UserDto;

//MapperFactoryBean이 구현 클래스를 만들때 사용하는 인터페이스
//반드시 mapper.xml 파일과 패키지, 인터페이스 이름, 메서드 이름 등이 일치하도록 작성
// <mybatis:scan 을 통해 Mapper 인터페이스로 사용되는 설정


@Mapper
public interface UserMapper {
	
	
	//회원 가입
	@Insert("insert into User ( userPwd, userId, userEmail, nickname, userPhone ) "
			+ "values (#{userPwd}, #{userId}, #{userEmail}, #{nickname}, #{userPhone}) ")
	void insertUser(UserDto user);

		
	@Select ("select userId, userPwd, userEmail, nickname, userPhone, userGrade, regDate, deletedUser "
             + "from User "
			+ "where userId = #{userId} and userPwd = #{userPwd} ")
	UserDto selectUserByIdAnduserPwd(@Param("userId") String userId, @Param("userPwd") String userPwd);
	//로그인할때 아이디와 비번 찾는 메서드
	
	@Update ("UPDATE User "
			+ "SET nickname = #{nickname}, userPhone = #{userPhone}, userEmail = #{userEmail} "
			+ "WHERE userId = #{userId}") 
	void updateUserProfile(UserDto user);
	//내 정보 수정하는 메서드
	
//	@Update("UPDATE User SET deletedUser = true " //  delelted 값을 참으로 돌린다
//			+ "WHERE userId = #{userId} ")
//	void deleteUser(@Param("userId") String userId);
//유저 정보 중 탈퇴 유무를 유로 돌리는 메서드
	
}
