package com.gpmatching.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.dto.MatchingReviewDto;
import com.gpmatching.mapper.MatchingReviewMapper;

public class MatchingReviewServiceImpl implements MatchingReviewService {

	@Autowired
	private MatchingReviewMapper matchingReviewMapper;

	@Override
	public void writeMatchingReview(MatchingReviewDto matchingReview) {
		
		matchingReviewMapper.insertMatchingReview(matchingReview);		
	}
}
