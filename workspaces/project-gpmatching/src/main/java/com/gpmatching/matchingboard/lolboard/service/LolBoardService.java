package com.gpmatching.matchingboard.lolboard.service;

import java.util.List;
import java.util.Map;

import com.gpmatching.dto.MatchingCommentDto;
import com.gpmatching.matchingboard.dto.MatchingBoardDto;


public interface LolBoardService {

	void write(MatchingBoardDto matchingBoardDto);
	
	//List<MatchingBoardDto> listMatchingBoard();

	int getLastMatchingItemBoardNo();
	
	// 아마 안쓸듯? (-허지웅) List<MatchingBoardDto> getMatchingBoardListByGameName(String gameName);
	
	List<MatchingBoardDto> getSelectLolBoardListByGameName(String gameName);

	MatchingBoardDto findLolBoardByBoardNo(int boardNo);

	MatchingBoardDto findMatchingBoardByBoardNo(int boardNo);

	void edit(MatchingBoardDto matchingBoardDto);
	
	void delete(int boardNo);
	
	List<MatchingBoardDto> getMatchingBoardListByLolTier(String gameName, String lolTier);


	//List<MatchingBoardDto> getMatchingBoardListByGameNo(int gameNo);
	
	//String getMatchingBoardNickname();
}