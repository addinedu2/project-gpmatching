package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.gpmatching.dto.AdminDto;
import com.gpmatching.dto.CommonBoardDto;
import com.gpmatching.dto.MypageBoardDto;

@Mapper
public interface AdminMapper {
	
	//회원 전체 목록
	@Select( "select userNo, userPwd, userId, userEmail, nickname, userPhone, userGrade, regDate, deletedUser, userImage "
			+ "from User "
			+ "ORDER BY regDate DESC ")
	List<AdminDto> UserList();
	
	//회원 페이지별 조회
	@Select( "select userNo, userPwd, userId, userEmail, nickname, userPhone, userGrade, regDate, deletedUser, userImage " +
			"from User " +
			"ORDER BY regDate DESC " +
			"LIMIT #{from}, #{count}")
	List<AdminDto> selectUserList(@Param("from") int from, @Param("count") int count);
	
	//회원 검색
	@Select ("select userNo, userPwd, userId, userEmail, nickname, userPhone, userGrade, regDate, deletedUser, userImage "
			+ "from User "
			+ "where userNo LIKE CONCAT('%', #{keyword}, '%') "
			+ "OR userId LIKE CONCAT('%', #{keyword}, '%') "
			+ "OR userEmail LIKE CONCAT('%', #{keyword}, '%') "
			+ "OR nickname LIKE CONCAT('%', #{keyword}, '%') "
			+ "OR userGrade LIKE CONCAT('%', #{keyword}, '%') "
			+ "OR deletedUser LIKE CONCAT('%', #{keyword}, '%')")
	List<AdminDto> searchUsers(@Param("keyword") String keyword, @Param("from") int from, @Param("count") int count);
	
	//회원 UserNo 기준으로 회원 정보 가져오기
	@Select( "select userNo, userPwd, userId, userEmail, nickname, userPhone, userGrade, regDate, deletedUser, userImage, userIntro, banEndDate "
			+ "from User "
			+ "where userNo = #{userNo} ")
	AdminDto getUserNo(int userNo);
	
	//회원 정보 수정하는 메서드
	@Update("UPDATE User " +
	        "SET userId = #{userId}, " +
	        "userEmail = #{userEmail}, " +
	        "nickname = #{nickname}, " +
	        "userPhone = #{userPhone}, " +
	        "userGrade = #{userGrade}, " +
	        "userIntro = #{userIntro}, " +
	        "banEndDate = #{banEndDate}, " +
	        "deletedUser = #{deletedUser} " +
	        "WHERE userNo = #{userNo}")
	void updateUser(AdminDto adminDto);
	
	//회원 이미지 수정하는 메서드
	@Update("update User "
			+ "set userImage = #{userImage} "
			+ "WHERE userNo = #{userNo}")
	void updateImage(AdminDto adminDto);
	
	//회원 총 명수
	@Select( "select count(*) "
			+ "from User" )
	int getUserCount();
	
	////////////////////////잠시 여기서부터 회원 글 매퍼

	//회원이 쓴 글만 보기(자유게시판)
	@Select("select cb.commonTitle boardTitle, cb.regDate, cb.commonNo boardNo, cb.deleted "
		 	  + "from CommonBoard cb "
		 	  + "inner join User u "
		 	  + "on u.userNo = cb.userNo "
			  + "where u.userNo = #{ userNo } and cb.category = 'common' "   //여기서 데이터에서 공통만 뽑아냄, 위에서 데이터 가져오는거, 아래서 데이터 가져갈 것도 신경 쓸 것
			  + "order by commonNo desc "
			  + "LIMIT #{from}, #{count}")
	List<AdminDto> selectUserCommonBoardByUserNo(@Param("userNo") int userNo, @Param("from") int from, @Param("count") int count);
	
	@Select("Select count(*) "
			+ "from CommonBoard "
			+ "where userNo = #{ userNo } and category = 'common'")
	int getcountCommonBoardPosts(int userNo);
	
	
	//회원이 쓴 글만 보기(매칭게시판)
	@Select("select mb.boardTitle, mb.regDate, mb.boardNo, mb.deleted, mb.gameNo, mb.boardContent "
	        + "from MatchingBoard mb "
	        + "inner JOIN User u "
	        + "on u.userNo = mb.userNo "
	        + "where u.userNo = #{userNo} "
	        + "order by boardNo desc "
	        + "LIMIT #{from}, #{count}")
	List<AdminDto> selectUserMatchingBoardByUserNo(@Param("userNo") int userNo, @Param("from") int from, @Param("count") int count);

	@Select("Select count(*) "
			+ "from MatchingBoard "
			+ "where userNo = #{ userNo } ")
	int getcountMatchingBoardPosts(int userNo);
	
	
	//회원이 쓴 글만 보기(신고게시판)
	@Select("select cb.commonTitle boardTitle, cb.regDate, cb.commonNo boardNo, cb.deleted "
		 	  + "from CommonBoard cb "
		 	  + "inner join User u "
		 	  + "on u.userNo = cb.userNo "
			  + "where u.userNo = #{ userNo } and cb.category = 'report' "   //여기서 데이터에서 공통만 뽑아냄, 위에서 데이터 가져오는거, 아래서 데이터 가져갈 것도 신경 쓸 것
			  + "order by commonNo desc "
			  + "LIMIT #{from}, #{count}")
	List<AdminDto> selectUserReportBoardByUserNo(@Param("userNo") int userNo, @Param("from") int from, @Param("count") int count);

	@Select("Select count(*) "
			+ "from CommonBoard "
			+ "where userNo = #{ userNo } and category = 'report'")
	int getcountReportBoardPosts(int userNo);
	
	
//	//회원이 쓴 글 페이지별 조회
//	@Select( "select userNo, userPwd, userId, userEmail, nickname, userPhone, userGrade, regDate, deletedUser, userImage " +
//			"from User " +
//			"ORDER BY regDate DESC " +
//			"LIMIT #{from}, #{count}")
//	List<AdminDto> selectUserList(@Param("from") int from, @Param("count") int count);
	
	
}