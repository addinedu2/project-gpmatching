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
	@Insert("insert into BoardComment (commonNo, userNo, commentContent) "
		  + "values (#{commonNo}, #{userNo}, #{commentContent})")
	@Options(useGeneratedKeys = true, keyProperty = "commentNo", keyColumn="commentNo")
	void insertComment(BoardCommentDto boardCommentDto);
	
	//댓글 목록
	@Select("select u.userNo, u.nickname, bc.commentNo, bc.commonNo, bc.commentContent, bc.regDate, bc.deleted "
		  + "from BoardComment bc "
	  	  + "inner join User u "
		  + "on u.userNo = bc.userNo "
		  + "where commonNo = #{ commonNo } and deleted = false "
		  + "order by commentNo desc")
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
	
	
	
	
	
	
}