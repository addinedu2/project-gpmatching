package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.gpmatching.dto.CommonBoardDto;
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
	
	
	//마이페이지 내가 쓴 글만 보기
	@Select("select cb.commonTitle, cb.regDate "
		 	  + "from CommonBoard cb "
		 	  + "inner join User u "
		 	  + "on u.userNo = cb.userNo "
			  + "where u.userNo = #{ userNo } and cb.category = 'common' and deleted = false "   //여기서 데이터에서 공통만 뽑아냄, 위에서 데이터 가져오는거, 아래서 데이터 가져갈 것도 신경 쓸 것
			  + "order by commonNo desc")
	List<CommonBoardDto> selectMyWriteBoardByUserNo(int userNo);

}
