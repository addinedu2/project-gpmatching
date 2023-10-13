package com.gpmatching.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.mapper.MatchingReviewMapper;

public class MatchingReviewServiceImpl implements MatchingReviewService {

	@Autowired
	private MatchingReviewMapper matchingReviewMapper;

	@Override
	public int getMatchingCloseByLoginUser(int userNo) {

		int matchingCloseCount = matchingReviewMapper.selectMatchingCloseByLoginUser(userNo);
		
		return matchingCloseCount;
	}

	
}
