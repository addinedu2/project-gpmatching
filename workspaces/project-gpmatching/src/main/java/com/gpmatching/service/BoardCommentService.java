package com.gpmatching.service;

import java.util.List;

import com.gpmatching.dto.AlramDto;
import com.gpmatching.dto.BoardCommentDto;

public interface BoardCommentService {

	void writeComment(BoardCommentDto boardComment, AlramDto alram);

	void deleteComment(int commentNo);

	void editComment(BoardCommentDto boardComment);

	List<BoardCommentDto> getCommentListByCommonNo(int commonNo);


	int countCommentsByPostId(int commonNo);

	BoardCommentDto findBoardCommentByCommentNo(int commentNo);

	void updateStep(BoardCommentDto boardComment);

	void writeRecomment(BoardCommentDto boardComment);
	
	List<AlramDto> getAlamListByUserNo(int userNo);
}

