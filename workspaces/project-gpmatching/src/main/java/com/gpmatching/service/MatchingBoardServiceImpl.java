package com.gpmatching.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.dto.MatchingBoardDto;
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
	public List<Map<String, String>> getSelectLolMatchingMapByGameName(String gameName) {
		List<Map<String, String>> list = mapper.selectLolMatchingMapByGameName(gameName);
		return list;
	}
	
	@Override
	public List<Map<String, String>> getSelectOwMatchingMapByGameName(String gameName) {
		List<Map<String, String>> list = mapper.selectOwMatchingMapByGameName(gameName);
		return list;
	}
	
	@Override
	public List<Map<String, String>> getSelectPubgMatchingMapByGameName(String gameName) {
		List<Map<String, String>> list = mapper.selectPubgMatchingMapByGameName(gameName);
		return list;
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
