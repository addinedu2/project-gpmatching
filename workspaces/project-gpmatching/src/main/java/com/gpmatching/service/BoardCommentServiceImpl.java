package com.gpmatching.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.dto.BoardCommentDto;
import com.gpmatching.mapper.BoardCommentMapper;

import lombok.Setter;

public class BoardCommentServiceImpl implements BoardCommentService {
	
	@Setter(onMethod_ = { @Autowired })
	private BoardCommentMapper boardCommentMapper;
	
	@Override
	public List<BoardCommentDto> getCommentListByCommonNo(int commonNo) {
		
		List<BoardCommentDto> boardComments = boardCommentMapper.selectBoardCommentByCommonNo(commonNo);
		
		return boardComments;
	}
	
	//댓글 쓰기-삭제-수정
	@Override   
 	public void writeComment(BoardCommentDto boardComment) {
		boardCommentMapper.insertComment(boardComment);	
		boardCommentMapper.updateGroupNo(boardComment.getCommentNo(), boardComment.getCommentNo());
		
	}
	
	@Override
	public void deleteComment(int commentNo) {
		boardCommentMapper.deleteComment(commentNo);
	}

	
	@Override
	public void editComment(BoardCommentDto boardComment) {
		boardCommentMapper.updateComment(boardComment);
	}

	//댓글 갯수
	@Override
	public int countCommentsByPostId(int commonNo) {
		return boardCommentMapper.selectBoardByCommentCount(commonNo);
	}
	
	//대댓글 작성
	@Override
	public BoardCommentDto findBoardCommentByCommentNo(int commentNo) {
		
		BoardCommentDto boardComment = boardCommentMapper.selectBoardCommentByCommentNo(commentNo);
		
		return boardComment;
	}

	@Override
	public void updateStep(BoardCommentDto boardComment) {
		boardCommentMapper.updateStep(boardComment);
		
	}

	@Override
	public void writeRecomment(BoardCommentDto boardComment) {
		boardCommentMapper.insertRecomment(boardComment);
		
	}


}