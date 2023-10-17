package com.gpmatching.matchingboard.pubgboard.service;

import java.util.List;
import java.util.Map;

import com.gpmatching.matchingboard.dto.MatchingBoardDto;



public interface PubgBoardService {

	void write(MatchingBoardDto matchingBoardDto);
	
	int getLastMatchingItemBoardNo();
	
	List<MatchingBoardDto> getMatchingBoardListByGameName(String gameName);
	
	List<MatchingBoardDto> getSelectPubgBoardListByGameName(String gameName);
	
	MatchingBoardDto findMatchingBoardByBoardNo(int boardNo);
	
	MatchingBoardDto findPubgBoardByBoardNo(int boardNo);
	
	void edit(MatchingBoardDto matchingBoardDto);

	void delete(int boardNo);

}