package com.gpmatching.service;

import java.util.List;

import com.gpmatching.matchingboard.dto.MatchingBoardDto;

public interface MatchingReviewService {

	int getMatchingCloseByLoginUser(int userNo);
	
	List<MatchingBoardDto> getNotYetReviewList(int userNo);
}
