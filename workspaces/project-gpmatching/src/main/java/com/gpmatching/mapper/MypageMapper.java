package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.gpmatching.dto.MypageBoardDto;
import com.gpmatching.dto.UserDto;

@Mapper
public interface MypageMapper {

	//내 정보 수정하는 메서드(이미지를 수정하지 않고 내정보를 수정하기-이미지컬럼없음)
	@Update ( "UPDATE User "
			+ "SET nickname = #{nickname}, userPhone = #{userPhone}, userEmail = #{userEmail}, userIntro = #{userIntro} "
			+ "WHERE userId = #{userId}") 
	void updateUserProfileWithoutImage(UserDto loginuser);

	//내 정보 수정하는 메서드(이미지 수정용)
	@Update ( "UPDATE User "
			+ "SET nickname = #{nickname}, userPhone = #{userPhone}, userEmail = #{userEmail}, userImage = #{userImage}, userIntro = #{userIntro} "
			+ "WHERE userId = #{userId}") 
	void updateUserProfileWithImage(UserDto loginuser);
	
	//프로필 조회
	@Select(  "select * "
			+ "from User "
			+ "where userId = #{userId}")
	UserDto selectUserProfile(UserDto loginUser);
	
	
	//마이페이지 내가 쓴 글만 보기(공통게시판)
	@Select("select cb.commonTitle boardTitle, cb.regDate, cb.commonNo boardNo, 'common' boardType "
		 	  + "from CommonBoard cb "
		 	  + "inner join User u "
		 	  + "on u.userNo = cb.userNo "
			  + "where u.userNo = #{ userNo } and cb.category = 'common' and deleted = false "   //여기서 데이터에서 공통만 뽑아냄, 위에서 데이터 가져오는거, 아래서 데이터 가져갈 것도 신경 쓸 것
			  + "order by commonNo desc "
			  + "limit 6")
	List<MypageBoardDto> selectMyWriteCommonBoardByUserNo(int userNo);
	
	
	//마이페이지 내가 쓴 글만 보기(매칭게시판)
	@Select("select mb.boardTitle, mb.regDate, mb.boardNo, gameNo, 'matching' boardType "
	        + "from MatchingBoard mb "
	        + "inner JOIN User u "
	        + "on u.userNo = mb.userNo "
	        + "where u.userNo = #{userNo} and deleted = false "
	        + "order by boardNo desc "
	        + "limit 6")
	List<MypageBoardDto> selectMyWriteMatchingBoardByUserNo(int userNo);
	
	
	
	@Select("select COALESCE(sum(reviewPoint), 0) from MatchingReview where reviewedUserNo = #{userNo}")
	int selectMyReviewPoint(int userNo);
}






