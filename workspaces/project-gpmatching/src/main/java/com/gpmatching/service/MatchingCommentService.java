package com.gpmatching.service;

import java.util.List;

import com.gpmatching.dto.MatchingCommentDto;

public interface MatchingCommentService {
	
	void writeMatchingComment(MatchingCommentDto matchingComment);

	List<MatchingCommentDto> getMatchingCommentByBoardNo(int boardNo);

	void setCommentStatusConfirm( int commentNo);

	void setCommentStatusReject(int commentNo);

	boolean isMatchingCloseTrueByCommentNo(int commentNo);
	
	int showCommentConfirmCount(int boardNo);
}
