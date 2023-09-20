package com.gpmatching.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.dto.MatchingBoardDto;
import com.gpmatching.mapper.MatchingBoardMapper;

import lombok.Setter;

public class MatchingBoardServiceImpl implements MatchingBoardService {

	@Setter(onMethod_ = { @Autowired }) 
	MatchingBoardMapper mapper;
	
	public void write(MatchingBoardDto matchingBoardDto) {
		mapper.insertMatchingBoard(matchingBoardDto);
	}
}
