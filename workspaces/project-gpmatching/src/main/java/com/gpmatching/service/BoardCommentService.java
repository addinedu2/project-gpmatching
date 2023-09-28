package com.gpmatching.service;

import com.gpmatching.dto.BoardCommentDto;

public interface BoardCommentService {

	void writeComment(BoardCommentDto boardComment);

	void deleteComment(int commentNo);

	void editComment(BoardCommentDto boardComment);

	


}