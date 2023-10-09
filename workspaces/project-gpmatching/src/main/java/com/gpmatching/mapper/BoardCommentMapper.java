package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.gpmatching.dto.BoardCommentDto;

@Mapper
public interface BoardCommentMapper {
	
	//공통게시판 댓글 쓰기
	@Insert("insert into BoardComment (commonNo, userNo, commentContent, groupNo, step, depth) "
	      + "values (#{commonNo}, #{userNo}, #{commentContent}, 0, 1, 0)")
	@Options(useGeneratedKeys = true, keyProperty = "commentNo", keyColumn="commentNo")
	void insertComment(BoardCommentDto boardCommentDto);
	
	//댓글 목록
	@Select("select u.userNo, u.nickname, bc.commentNo, bc.commonNo, bc.commentContent, bc.regDate, bc.deleted, bc.groupNo, bc.step, bc.depth "
			  + "from BoardComment bc "
		  	  + "inner join User u "
			  + "on u.userNo = bc.userNo "
			  + "where commonNo = #{ commonNo } and deleted = false "
			  + "order by groupNo desc, step asc")
	List<BoardCommentDto> selectBoardCommentByCommonNo(@Param("commonNo") int commonNo);	
	
	//댓글 삭제
	@Update("update BoardComment "
			+ "set deleted =  true "
			+ "where commentNo = #{ commentNo } ")
	void deleteComment(@Param("commentNo") int commentNo );

	
	//댓글 수정
	@Update( "update BoardComment "
			+ "set commentContent = #{ commentContent } "
			+ "where commentNo = #{ commentNo }")
	void updateComment(BoardCommentDto boardComment);
	
	//그룹 넘버 수정
	@Update ( "update BoardComment "
			+ "set groupno = #{ groupNo } "
			+ "where commentno = #{ commentNo }")
	void updateGroupNo(@Param("groupNo") int groupNo, @Param("commentNo") int commentNo);
	
	
	//댓글 불러오기
	@Select("select * "
		  + "from BoardComment "
		  + "where commentNo = #{commentNo} and deleted = false")
	BoardCommentDto selectBoardCommentByCommentNo(int commentNo);

	@Update("update BoardComment "
		  + "set step = step + 1 "
		  + "where groupNo = #{groupNo} and step >= #{step}")
	void updateStep(BoardCommentDto boardComment);

	//대댓글 작성
	@Insert("insert into BoardComment (commonNo, userNo, commentContent, groupNo, step, depth) "
		  + "values (#{commonNo}, #{userNo}, #{commentContent}, #{groupNo}, #{step}, #{depth})")
	@Options(useGeneratedKeys = true, keyProperty = "commentNo", keyColumn = "commentNo")
	void insertRecomment(BoardCommentDto boardComment);
	
	
}