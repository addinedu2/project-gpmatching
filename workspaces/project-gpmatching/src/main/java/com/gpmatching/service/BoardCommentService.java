package com.gpmatching.service;

import java.util.List;

import com.gpmatching.dto.AlarmDto;
import com.gpmatching.dto.BoardCommentDto;

public interface BoardCommentService {

	void writeComment(BoardCommentDto boardComment, AlarmDto alarm);

	void deleteComment(int commentNo);

	void editComment(BoardCommentDto boardComment);

	List<BoardCommentDto> getCommentListByCommonNo(int commonNo);


	int countCommentsByPostId(int commonNo);

	BoardCommentDto findBoardCommentByCommentNo(int commentNo);

	void updateStep(BoardCommentDto boardComment);

	void writeRecomment(BoardCommentDto boardComment);

	List<AlarmDto> getAlamListByUserNo(int userNo);
	
	
}

