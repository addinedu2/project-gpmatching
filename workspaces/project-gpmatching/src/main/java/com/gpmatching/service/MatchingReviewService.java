package com.gpmatching.service;

import java.util.List;

import com.gpmatching.dto.MatchingReviewDto;
import com.gpmatching.matchingboard.dto.MatchingBoardDto;

public interface MatchingReviewService {

	int getMatchingCloseByLoginUser(int userNo);
	
	List<MatchingBoardDto> getMatchingBoardsNeedToReview(int userNo);
	
	void setMatchingReview(MatchingReviewDto matchingReviewDto);

	int getUserNoByNickname(String nickname);
}
