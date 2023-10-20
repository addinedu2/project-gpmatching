package com.gpmatching.matchingboard.pubgboard.service;

import java.util.List;
import java.util.Map;

import com.gpmatching.dto.CloseAlarmDto;
import com.gpmatching.matchingboard.dto.MatchingBoardDto;



public interface PubgBoardService {

	void write(MatchingBoardDto matchingBoardDto);
	
	int getLastMatchingItemBoardNo();
	
	List<MatchingBoardDto> getMatchingBoardListByGameName(String gameName);
	
	List<MatchingBoardDto> getSelectPubgBoardListByGameName(String gameName);
	
	MatchingBoardDto findPubgBoardByBoardNo(int boardNo);
	
	boolean getMatchingCloseByBoardNo(int boardNo);

	List<MatchingBoardDto> searchMatchingBoardListByTitle(String gameName, String keyword);


	void setNowConfirmCount(int confirmCount);

	void setMatchingCloseTrue(int boardNo, CloseAlarmDto closeAlarm);

	boolean isMatchingCloseCondition(int boardNo);
	
	void edit(MatchingBoardDto matchingBoardDto);

	void delete(int boardNo);

}