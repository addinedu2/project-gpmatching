package com.gpmatching.matchingboard.lolboard.service;

import java.util.List;

import com.gpmatching.dto.CloseAlarmDto;
import com.gpmatching.matchingboard.dto.MatchingBoardDto;


public interface LolBoardService {

	void write(MatchingBoardDto matchingBoardDto);
	
	int getLastMatchingItemBoardNo();
	
	List<MatchingBoardDto> getMatchingBoardListByGameName(String gameName);
	
	List<MatchingBoardDto> getSelectLolBoardListByGameName(String gameName);

	MatchingBoardDto findLolBoardByBoardNo(int boardNo);

	MatchingBoardDto findMatchingBoardByBoardNo(int boardNo);

	void edit(MatchingBoardDto matchingBoardDto);
	
	void delete(int boardNo);

	boolean getMatchingCloseByBoardNo(int boardNo);

	List<MatchingBoardDto> searchMatchingBoardListByTitle(String gameName, String keyword);

	List<MatchingBoardDto> getMatchingBoardListByLolTier(String gameName, String lolTier);

	void setNowConfirmCount(int confirmCount);

	void setMatchingCloseTrue(int boardNo, CloseAlarmDto closeAlarm);

	boolean isMatchingCloseCondition(int boardNo);
	

}