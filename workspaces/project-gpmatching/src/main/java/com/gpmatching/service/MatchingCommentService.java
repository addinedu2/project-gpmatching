package com.gpmatching.service;

import java.util.List;

import com.gpmatching.dto.MatchingAlarmDto;
import com.gpmatching.dto.MatchingCommentDto;

public interface MatchingCommentService {
	
	void writeMatchingComment(MatchingCommentDto matchingComment, MatchingAlarmDto matchingAlarm);

	List<MatchingCommentDto> getMatchingCommentByBoardNo(int boardNo);

	void setCommentStatusConfirm( int commentNo);

	void setCommentStatusReject(int commentNo);

	boolean isMatchingCloseTrueByCommentNo(int commentNo);

	int getBoardNoByCommentNo(int commentNo);

	List<MatchingAlarmDto> getMatchingAlarmListByUserNo(int userNo);

	List<MatchingCommentDto> getMatchingCommentForReview(int boardNo);
	
	//int showCommentConfirmCount(int boardNo);
}
