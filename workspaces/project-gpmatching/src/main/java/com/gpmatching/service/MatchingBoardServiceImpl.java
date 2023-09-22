package com.gpmatching.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.dto.GameListDto;
import com.gpmatching.dto.MatchingBoardDto;
import com.gpmatching.dto.MatchingCommentDto;
import com.gpmatching.mapper.MatchingBoardMapper;
import com.gpmatching.mapper.MatchingCommentMapper;

import lombok.Setter;

public class MatchingBoardServiceImpl implements MatchingBoardService {

	@Setter(onMethod_ = { @Autowired }) 
	MatchingBoardMapper mapper;
	
	@Autowired
	MatchingCommentMapper matchingCommentMapper;
	
	public void write(MatchingBoardDto matchingBoardDto) {
		mapper.insertMatchingBoard(matchingBoardDto);
		
		
	}
	
	@Override
	public List<MatchingBoardDto> listMatchingBoard() {
		
		List<MatchingBoardDto> matchingBoardList = mapper.selectAllMatchingBoard();
		
		return matchingBoardList;
	}
	
	@Override
	public int getLastMatchingItemBoardNo() {
		int boardNo = mapper.selectMatchingItemBoardNo();
		
		return boardNo;
	}
	
	public MatchingBoardDto findMatchingBoardByBoardNo(int boardNo) {
		
		MatchingBoardDto matchingBoard = mapper.selectMatchingBoardByBoardNo(boardNo);
		
		List<MatchingCommentDto> matchingCommentList = matchingCommentMapper.selectMatchingCommentByBoardNo(boardNo);
		matchingBoard.setMatchingCommentList(matchingCommentList);
		
		return matchingBoard;
		
	}
}
