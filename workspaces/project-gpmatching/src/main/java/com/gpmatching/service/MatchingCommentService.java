package com.gpmatching.service;

import java.util.List;

import com.gpmatching.dto.MatchingCommentDto;

public interface MatchingCommentService {
	
	void writeMatchingComment(MatchingCommentDto matchingComment);

	List<MatchingCommentDto> getMatchingCommentByBoardNo(int boardNo);

	//List<MatchingCommentDto> getMatchingCommentByBoardNo(int boardNo);
}
