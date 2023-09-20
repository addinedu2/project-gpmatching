package com.gpmatching.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;

import com.gpmatching.dto.MatchingCommentDto;

@Mapper
public interface MatchingCommentMapper {

	// 매칭지원댓글
	// 닉네임은 어떻게 불러오는거지..?
	@Insert("insert into matchingcomment (mCommentContent, mCommentConfirm) "
			+ "values (#{ mCommentContent }, #{ mCommentConfirm })")
	@Options(useGeneratedKeys = true, keyProperty = "mCommentNo")
	void insertMatchingComment(MatchingCommentDto matchingComment);
	
	
}
