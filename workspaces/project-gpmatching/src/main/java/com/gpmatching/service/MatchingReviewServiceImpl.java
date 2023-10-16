package com.gpmatching.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.dto.MatchingReviewDto;
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

	@Override
	public void setMatchingReview(MatchingReviewDto matchingReviewDto) {
		
		matchingReviewMapper.insertMatchingReview(matchingReviewDto);
		
	}

	@Override
	public int getUserNoByNickname(String nickname) {
		int userNo = matchingReviewMapper.selectUserNoByNickname(nickname);
		
		return userNo;
	}

	
}
