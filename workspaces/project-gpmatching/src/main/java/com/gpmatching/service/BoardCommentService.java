package com.gpmatching.service;

import java.util.List;

import com.gpmatching.dto.BoardCommentDto;

public interface BoardCommentService {

	void writeComment(BoardCommentDto boardComment);

	void deleteComment(int commentNo);

	void editComment(BoardCommentDto boardComment);

	List<BoardCommentDto> getCommentListByCommonNo(int commonNo);

	int countCommentsByPostId(int commonNo);

   

	
	}

	


	


