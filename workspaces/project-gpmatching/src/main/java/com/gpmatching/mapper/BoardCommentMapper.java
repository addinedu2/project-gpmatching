package com.gpmatching.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;

import com.gpmatching.dto.BoardCommentDto;

@Mapper
public interface BoardCommentMapper {
	
	//공통게시판 댓글 쓰기
	@Insert("insert into BoardComment (commentContent) "
		  + "values (#{commentContent})")
	
	@Options(useGeneratedKeys = true, keyProperty = "commentNo", keyColumn="commentNo")

	void insertComment(BoardCommentDto boardCommentDto);
		
	//	@Update("update BoardComment "
	//	+ "set groupNo = #{ groupNo } "
	//	+ "where commentNo = #{ commentNo }")
	//void updateGroupNo(@Param("groupNo") int groupNo,@Param("commentNo") int commentNo);


}