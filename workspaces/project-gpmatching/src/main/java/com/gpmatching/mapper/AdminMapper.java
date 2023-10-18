package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.gpmatching.dto.AdminDto;

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
	
	
	//유저 글 전체 조회
	@Select("select * "
	        + "from MatchingBoard mb "
	        + "inner join CommonBoard cb "
	        + "ON mb.userNo = cb.userNo "
	        + "where mb.userNo = #{userNo} ")
	int countTotalPostsByUserNo(int userNo);
	
	//유저 글 페이지별 조회
	@Select("select * "
	        + "from MatchingBoard mb "
	        + "inner join CommonBoard cb "
	        + "ON mb.userNo = cb.userNo "
	        + "where mb.userNo = #{userNo} "
			+ "order by commonNo desc "
			+ "limit #{from}, #{count}")
	int countPagePostsByUserNo(int userNo);
	
	//유저 코멘트 전체 조회
	@Select("select * "
	        + "from MatchingComment mc "
	        + "inner join BoardComment bc "
	        + "ON mb.userNo = cb.userNo "
	        + "where mb.userNo = #{userNo}")
	int countTotalCommentsByUserNo(int userNo);
	
	//유저 댓글 페이지별 조회
	@Select("select * "
	        + "from MatchingComment mc "
	        + "inner join BoardComment bc "
	        + "ON mc.userNo = bc.userNo "
	        + "where mb.userNo = #{userNo} "
			+ "order by commonNo desc "
			+ "limit #{from}, #{count}")
	int countPageCommentsByUserNo(int userNo);
	
	//게시물 글 상세 보기
	@Select("SELECT mb.boardNo, mb.boardTitle, mb.boardContent, mb.regDate, mb.readCount, mb.deleted, mb.gameNo "
			+ "FROM MatchingBoard mb "
			+ "JOIN User u "
			+ "ON mb.userNo = u.userNo "
			+ "WHERE u.userNo = #{userNo} " +
	        "UNION ALL " +
	        "SELECT cb.commonNo, cb.commonTitle, cb.commonContent, cb.regDate, cb.readCount, cb.deleted, cb.category "
	        + "FROM CommonBoard cb "
	        + "JOIN User u "
	        + "ON cb.userNo = u.userNo "
	        + "WHERE u.userNo = #{userNo}")
	AdminDto selectBoardNumbersByUserNo(@Param("userNo") int userNo);

	//댓글 상세보기
	@Select("SELECT bc.commentNo, bc.regDate, bc.commentContent, bc.commonNo, bc.userNo, bc.groupNo, bc.step, bc.depth, bc.deleted "
			+ "FROM BoardComment bc "
			+ "JOIN User u "
			+ "ON bc.userNo = u.userNo "
			+ "WHERE u.userNo = #{userNo} " +
	        "UNION ALL " +
	        "SELECT mc.mCommentNo, mc.mCommentRegDate, mc.mCommentContent, mc.mCommentConfirm, mc.boardNo, mc.userNo, mc.status "
	        + "FROM MatchingComment mc "
	        + "JOIN User u "
	        + "ON mc.userNo = u.userNo "
	        + "WHERE u.userNo = #{userNo}")
	AdminDto selectCommentNumbersByUserNo(@Param("userNo") int userNo);


	//글 갯수 카운트
	@Select("select count(*) "
			+ "from (select boardNo, userNo FROM MatchingBoard WHERE userNo = #{userNo} " 
					+ "union all "
					+ "SELECT commonNo, userNo FROM MatchingComment WHERE userNo = #{userNo}") 
	int UserAllpostCount();
	
	//댓글 갯수 카운트
	@Select("select count(*) "
			+ "from (select commentNo, userNo FROM BoardComment WHERE userNo = #{userNo} "
					+ "union all "
					+ "SELECT mCommentNo, userNo FROM CommonBoard WHERE userNo = #{userNo}") 
	int UserAllCommentCount();
	
	// 유저 삭제
	@Update("UPDATE User SET deletedUser = true " // delelted 값을 참으로 돌린다
			+ "WHERE userId = #{userId} ")
	void deleteUser(@Param("userId") String userId);


}
