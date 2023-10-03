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
	
	@Update ( "update BoardComment "
			+ "set groupno = #{ groupNo } "
			+ "where commentno = #{ commentNo }")
	void updateGroupNo(@Param("groupNo") int groupNo, @Param("commentNo") int commentNo);
	//그룹 넘버 수정
	
	@Select("select commentNo, commonNo, userNo, commentContent, regDate, deleted "
			+ "from BoardComment "
			+ "where commonNo = #{ commonNo } "
			+ "order by commentNo desc")
	List<BoardCommentDto> selectBoardCommentByCommonNo(@Param("commonNo") int commonNo);
	//사용할 댓글 위치 찾기
	
	@Update("update BoardComment "
			+ "set deleted =  true "
			+ "where commentNo = #{ commentNo } ")
	void deleteComment(@Param("commentNo") int commentNo );
	//댓글 삭제
	
	@Update( "update BoardComment "
			+ "set commentContent = #{ commentContent } "
			+ "where commentNo = #{ commentNo }")
	void updateComment(BoardCommentDto boardComment);
	//댓글 수정
	
	
	
	
	
	
}