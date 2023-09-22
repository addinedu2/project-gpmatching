package com.gpmatching.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;

import com.gpmatching.dto.BoardCommentDto;

@Mapper
public interface BoardCommentMapper {
	
	//int num = 1;
//	@Insert("insert into boardcomment (commonNo, userNo, commentContent, groupNo, step, depth) "
//		  + "values (#{commonNo},#{userNo},#{commentContent},0,1,0)")
	
	@Insert("insert into BoardComment (commentContent) "
		  + "values (#{commentContent})")
	
	@Options(useGeneratedKeys = true, keyProperty = "commentNo", keyColumn="commentNo")

	void insertComment(BoardCommentDto boardCommentDto);

}
