package com.gpmatching.service;

import java.util.List;
import java.util.Map;

import com.gpmatching.dto.MatchingBoardDto;

public interface MatchingBoardService {

	void write(MatchingBoardDto matchingBoardDto);
	
	//List<MatchingBoardDto> listMatchingBoard();

	int getLastMatchingItemBoardNo();
	
	List<MatchingBoardDto> getMatchingBoardListByGameName(String gameName);
	
	List<Map<String, String>> getSelectLolMatchingMapByGameName(String gameName);
	
	List<Map<String, String>> getSelectOwMatchingMapByGameName(String gameName);
	
	List<Map<String, String>> getSelectPubgMatchingMapByGameName(String gameName);

	//List<MatchingBoardDto> getMatchingBoardListByGameNo(int gameNo);

	//MatchingBoardDto findMatchingBoardByBoardNo(int boardNo);
	
	//String getMatchingBoardNickname();
}