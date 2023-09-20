package com.gpmatching.mapper;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

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

	
	
	//마이 페이지인데 신고나 리뷰 후기 보는 게시판 연결 생각을 해보자
	@Select ("select userId, userPwd, userEmail, nickname, userPhone, userGrade, regDate "
			+ "from user "
			+ "where userId = #{userId} and userPwd = #{userPwd} ")
	UserDto selectUserByIdAnduserPwd(@Param("userId") String userId, @Param("userPwd") String userPwd);





}
