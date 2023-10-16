package com.gpmatching.matchingboard.overwatchboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.mapper.MatchingCommentMapper;
import com.gpmatching.matchingboard.dto.MatchingBoardDto;
import com.gpmatching.matchingboard.overwatchboard.mapper.OverwatchBoardMapper;

import lombok.Setter;

public class OverwatchBoardServiceImpl implements OverwatchBoardService {

	@Setter(onMethod_ = { @Autowired }) 
	OverwatchBoardMapper mapper;
	
	@Autowired
	MatchingCommentMapper matchingCommentMapper;
	
	public void write(MatchingBoardDto matchingBoardDto) {
		mapper.insertMatchingBoard(matchingBoardDto);
		
		
	}
	
	@Override
	public int getLastMatchingItemBoardNo() {
		int boardNo = mapper.selectMatchingItemBoardNo();
		
		return boardNo;
	}
	
//	@Override
//	public List<MatchingBoardDto> getMatchingBoardListByGameNo(int gameNo) {
//		List<MatchingBoardDto> boardMachingList = mapper.selectMatchingBoardListByGameNo(gameNo);
//		
//		return boardMachingList;
//	}
	
	@Override
	public List<MatchingBoardDto> getMatchingBoardListByGameName(String gameName) {
		
		List<MatchingBoardDto> boardMatchingList  = mapper.selectMatchingBoardListByGameName(gameName);
		
		return boardMatchingList;
	}
	

	@Override
	public List<MatchingBoardDto> getSelectOwBoardListByGameName(String gameName) {
		List<MatchingBoardDto> overwatchBoardList = mapper.selectOwBoardListByGameName(gameName);
		return overwatchBoardList;
	}
	
	@Override
	public void delete(int boardNo) {
		mapper.deleteOverwatchBoard(boardNo);
		
	}

	@Override
	public void edit(MatchingBoardDto matchingBoardDto) {
		mapper.updateMatchingBoard(matchingBoardDto);
		
	}

	@Override
	public MatchingBoardDto getSelectOwBoardByBoardNo(int boardNo) {
		MatchingBoardDto overwatchBoard = mapper.selectOwBoardByBoardNo(boardNo);
		return overwatchBoard;
	}
	
	
//	public MatchingBoardDto findMatchingBoardByBoardNo(int boardNo) {
//		
//		MatchingBoardDto matchingBoard = mapper.selectMatchingBoardByBoardNo(boardNo);
//		
//		List<MatchingCommentDto> matchingCommentList = matchingCommentMapper.selectMatchingCommentByBoardNo(boardNo);
//		matchingBoard.setMatchingCommentList(matchingCommentList);
//		
//		return matchingBoard;
//		
//	}
	
//	@Override
//	public String getMatchingBoardNickname() {
//		
//		String nickname = mapper.selectMatchingBoardNickname();
//		
//		return nickname;
//	}
}
