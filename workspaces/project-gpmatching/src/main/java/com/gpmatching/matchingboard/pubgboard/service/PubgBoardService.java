package com.gpmatching.matchingboard.pubgboard.service;

import java.util.List;
import java.util.Map;

import com.gpmatching.matchingboard.dto.MatchingBoardDto;



public interface PubgBoardService {

	void write(MatchingBoardDto matchingBoardDto);
	
	//List<MatchingBoardDto> listMatchingBoard();

	int getLastMatchingItemBoardNo();
	
	List<MatchingBoardDto> getMatchingBoardListByGameName(String gameName);
	
	List<MatchingBoardDto> getSelectPubgBoardListByGameName(String gameName);
	
	MatchingBoardDto findMatchingBoardByBoardNo(int boardNo);
	
	MatchingBoardDto findPubgBoardByBoardNo(int boardNo);
	
	void edit(MatchingBoardDto matchingBoardDto);

	void delete(int boardNo);



	//List<MatchingBoardDto> getMatchingBoardListByGameNo(int gameNo);

	//MatchingBoardDto findMatchingBoardByBoardNo(int boardNo);
	
	//String getMatchingBoardNickname();
}