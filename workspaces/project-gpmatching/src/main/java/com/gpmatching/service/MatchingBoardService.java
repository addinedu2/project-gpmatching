package com.gpmatching.service;

import java.util.List;

import com.gpmatching.dto.MatchingBoardDto;

public interface MatchingBoardService {

	void write(MatchingBoardDto matchingBoardDto);
	
	List<MatchingBoardDto> listMatchingBoard();

	int getLastMatchingItemBoardNo();
}