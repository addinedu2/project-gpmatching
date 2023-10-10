package com.gpmatching.matchingboard.pubgboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;


import com.gpmatching.mapper.MatchingCommentMapper;
import com.gpmatching.matchingboard.dto.MatchingBoardDto;
import com.gpmatching.matchingboard.pubgboard.mapper.PubgBoardMapper;

import lombok.Setter;

public class PubgBoardServiceImpl implements PubgBoardService {

	@Setter(onMethod_ = { @Autowired }) 
	PubgBoardMapper mapper;
	
	@Autowired
	MatchingCommentMapper matchingCommentMapper;
	
	public void write(MatchingBoardDto matchingBoardDto) {
		mapper.insertMatchingBoard(matchingBoardDto);
		
		
	}
	
	@Override
	public void edit(MatchingBoardDto matchingBoardDto) {

		mapper.updateMatchingBoard(matchingBoardDto);
		
	}
	
//	@Override
//	public List<MatchingBoardDto> listMatchingBoard() {
//		
//		List<MatchingBoardDto> matchingBoardList = mapper.selectAllMatchingBoard();
//		
//		return matchingBoardList;
//	}
	
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
		
		List<MatchingBoardDto> boardMachingList  = mapper.selectMatchingBoardListByGameName(gameName);
		
		return boardMachingList;
	}
	
	
	
	@Override
	public List<MatchingBoardDto> getSelectPubgBoardListByGameName(String gameName) {
		List<MatchingBoardDto> pubgList = mapper.selectPubgBoardListByGameName(gameName);
		return pubgList;
	}

	@Override
	public MatchingBoardDto findMatchingBoardByBoardNo(int boardNo) {
		
		return mapper.selectMatchingBoardByBoardNo(boardNo);
	}
	

	@Override
	public MatchingBoardDto findPubgBoardByBoardNo(int boardNo) {
		MatchingBoardDto pubgBoard = mapper.selectPubgBoardByBoardNo(boardNo);
		return pubgBoard;
	}
	
	
	@Override
	public void delete(int boardNo) {
		mapper.deletePubgBoard(boardNo);
		
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
