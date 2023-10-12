package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.gpmatching.dto.AdminDto;
import com.gpmatching.dto.BoardAttachDto;
import com.gpmatching.dto.CommonBoardDto;

@Mapper
public interface AdminMapper {
	
	//회원정보에 쓸 목록
	@Select( "select count(*) "
			+ "from User"
			+ "order by regDate DESC")
	List<AdminDto> UserList();
	
	@Select( "select count(*) "
			+ "from User" )
	int getUserCount();
	
	
	//유저 글 전체 조회
	@Select("select count(*) "
	        + "from MatchingBoard mb "
	        + "inner join CommonBoard cb "
	        + "ON mb.userNo = cb.userNo "
	        + "where mb.userNo = #{userNo}")
	int countTotalPostsByUserNo(int userNo);
	
	//유저 글 페이지별 조회
	@Select("select count(*) "
	        + "from MatchingBoard mb "
	        + "inner join CommonBoard cb "
	        + "ON mb.userNo = cb.userNo "
	        + "where mb.userNo = #{userNo} "
			+ "order by commonNo desc "
			+ "limit #{from}, #{count}")
	int countPagePostsByUserNo(int userNo);
	
	//유저 코멘트 전체 조회
	@Select("select count(*) "
	        + "from MatchingComment mc "
	        + "inner join BoardComment bc "
	        + "ON mb.userNo = cb.userNo "
	        + "where mb.userNo = #{userNo}")
	int countTotalCommentsByUserNo(int userNo);
	
	//유저 댓글 페이지별 조회
	@Select("select count(*) "
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


	//첨부파일 조회
	@Select("select boardAttachNo, commonNo, userFilename, savedFilename, regDate, downloadCount "
		  + "from BoardAttach "
		  + "where commonNo = #{commonNo}")
	List<BoardAttachDto> selectBoardAttachByCommonNo(@Param("commonNo") int commonNo);
		
	@Select("select boardAttachNo, commonNo, userFilename, savedFilename, regDate, downloadCount "
		  + "from BoardAttach "
		  + "where boardAttachNo = #{boardAttachNo}")
	BoardAttachDto selectBoardAttachByBoardAttachNo(@Param("boardAttachNo") int boardAttachNo);
		
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
