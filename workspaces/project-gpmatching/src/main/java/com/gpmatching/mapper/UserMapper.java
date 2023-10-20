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
	@Insert("insert into User ( userPwd, userId, userEmail, nickname, userPhone, userImage, lolnickname, ownickname, bgnickname ) "
			+ "values (#{userPwd}, #{userId}, #{userEmail}, #{nickname}, #{userPhone}, #{userImage}, #{lolnickname}, #{ownickname}, #{bgnickname}) ")
	void insertUser(UserDto user);

	
	//로그인할때 아이디와 비번 찾는 메서드	
	@Select ("select userId, userPwd, userEmail, nickname, userPhone, userGrade, regDate, deletedUser, userNo, userImage "
             + "from User "
			+ "where userId = #{userId} and userPwd = #{userPwd} and deletedUser = false ")
	UserDto selectUserByIdAnduserPwd(@Param("userId") String userId, @Param("userPwd") String userPwd);
	


	//로그인 중복검사
	@Select(  "select count(*) "
			+ "from User "
			+ "where userId = #{ userId }")
	int selectUserCountMyUserId(String userId);
	
	//닉네임 중복검사
	@Select(  "select count(*) "
			+ "from User "
			+ "where nickname = #{ nickname }")
	int selsectUserCountMyNickName(String nickname);
	
	//아이디 찾을 때 핸드폰와 이메일 찾는 메서드	
	@Select ("select userId "
	         + "from User "
	         + "where userPhone = #{userPhone} and userEmail = #{userEmail} ")
	UserDto findUserByPhoneAndEmail(@Param("userPhone") String userPhone, @Param("userEmail") String userEmail);

	
	
//	//회원탈퇴 비밀번호 
//	@Select(  "select userPwd "
//			+ "from User "
//			+ "where userPwd = #{ userPwd }")
//	UserDto findUserByPwd(@Param("userPwd") String userPwd);
	
	//회원탈퇴 진행
	@Update(  "update User "
			+ "set deletedUser = 1 "
			//+ "where userId = #{userId}")
			+ "where userPwd = #{userPwd}")
	void deleteUser(String userPwd);
	
	
	//비번 찾을 때 아이디와 이메일 찾는 메서드	
//	@Select ("select userId, userEmail "
//	         + "from User "
//	         + "where userId = #{userId} and userEmail = #{userEmail} ")
//	UserDto findUserByIdAnduserEmail(String userId, String userEmail);


	
//	@Update("UPDATE User SET deletedUser = true " //  delelted 값을 참으로 돌린다
//			+ "WHERE userId = #{userId} ")
//	void deleteUser(@Param("userId") String userId);
//유저 정보 중 탈퇴 유무를 유로 돌리는 메서드

	
}
