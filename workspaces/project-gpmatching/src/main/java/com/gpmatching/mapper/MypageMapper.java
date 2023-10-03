package com.gpmatching.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.gpmatching.dto.CommonBoardDto;
import com.gpmatching.dto.UserDto;

@Mapper
public interface MypageMapper {
	
	//로그인할때 아이디와 비번 찾는 메서드
	@Select ("select userId, userPwd, userEmail, nickname, userPhone, userGrade, regDate, deletedUser, userNo "
             + "from User "
			+ "where userId = #{userId} and userPwd = #{userPwd} ")
	UserDto selectUserByIdAnduserPwd(@Param("userId") String userId, @Param("userPwd") String userPwd);
	
	
	//공통게시판 글 전체 조회
	@Select("select commonNo, commonTitle, commonContent, userNo, readCount, regDate, deleted "
		  + "from CommonBoard "
		  + "where "
		  + "order by commonNo desc")
	List<CommonBoardDto> selectAllBoard();//전체 리스트 가져오기
	
	
	
}
