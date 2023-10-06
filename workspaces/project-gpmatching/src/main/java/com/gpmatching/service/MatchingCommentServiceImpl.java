package com.gpmatching.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


import com.gpmatching.dto.MatchingCommentDto;
import com.gpmatching.mapper.MatchingCommentMapper;

public class MatchingCommentServiceImpl implements MatchingCommentService{

	@Autowired
	private MatchingCommentMapper matchingCommentMapper;

	@Override
	public void writeMatchingComment(MatchingCommentDto matchingComment) {
		
		matchingCommentMapper.insertMatchingComment(matchingComment);
	}
	
//	@Override
//	public List<MatchingCommentDto> getMatchingCommentByBoardNo(int boardNo){
//		
//		List<MatchingCommentDto> comments = matchingCommentMapper.selectMatchingCommentByBoardNo(boardNo);
//		
//		return comments;
//	}
	
}
