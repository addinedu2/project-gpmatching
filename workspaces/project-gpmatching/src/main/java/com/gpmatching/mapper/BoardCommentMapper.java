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
	
	@Update("update BoardComment "
			+ "set deleted =  true "
			+ "where commentNo = #{ commentNo } ")
	void deleteComment(@Param("commentNo") int commentNo );
	
	@Select("select commentNo, commonNo, userNo, commentContent, regDate, deleted "
			+ "from BoardComment "
			+ "where commonNo = #{ commonNo } "
			+ "order by commentNo desc")
	List<BoardCommentDto> selectBoardCommentByCommonNo(@Param("commonNo") int commonNo);

	
	
	//	@Update("update BoardComment "
	//	+ "set groupNo = #{ groupNo } "
	//	+ "where commentNo = #{ commentNo }")
	//void updateGroupNo(@Param("groupNo") int groupNo,@Param("commentNo") int commentNo);


}