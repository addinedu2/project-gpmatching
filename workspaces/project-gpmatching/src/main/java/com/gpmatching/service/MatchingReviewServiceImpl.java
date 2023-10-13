package com.gpmatching.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.mapper.MatchingReviewMapper;
import com.gpmatching.matchingboard.dto.MatchingBoardDto;

public class MatchingReviewServiceImpl implements MatchingReviewService {

	@Autowired
	private MatchingReviewMapper matchingReviewMapper;

	@Override
	public int getMatchingCloseByLoginUser(int userNo) {

		int matchingCloseCount = matchingReviewMapper.selectMatchingCloseByLoginUser(userNo);
		
		return matchingCloseCount;
	}

	@Override
	public List<MatchingBoardDto> getNotYetReviewList(int userNo) {

		List<MatchingBoardDto> reviewList = matchingReviewMapper.selectNotYetReviewList(userNo);
		
		return reviewList;
	}

	
}
