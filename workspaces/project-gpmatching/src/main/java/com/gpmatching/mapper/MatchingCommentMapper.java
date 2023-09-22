package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.gpmatching.dto.MatchingCommentDto;

@Mapper
public interface MatchingCommentMapper {

	// 닉네임은 어떻게 불러오는거지..?
	@Insert("insert into MatchingComment (boardNo, mCommentContent) "
			+ "values (#{ boardNo }, #{ mCommentContent })")
	@Options(useGeneratedKeys = true, keyProperty = "mCommentNo")
	void insertMatchingComment(MatchingCommentDto matchingComment);
	
	@Select("select commentNo, boardNo, boardContent "
			+ "from MatchingComment "
			+ "where boardNo = #{ boardNo }")
	List<MatchingCommentDto> selectMatchingCommentByBoardNo(@Param("boardNo") int boardNo);
}
