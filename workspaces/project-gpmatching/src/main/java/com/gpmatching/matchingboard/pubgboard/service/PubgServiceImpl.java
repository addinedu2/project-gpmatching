package com.gpmatching.matchingboard.pubgboard.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.matchingboard.dto.PubgDto;
import com.gpmatching.matchingboard.pubgboard.mapper.PubgMapper;

import lombok.Setter;

public class PubgServiceImpl implements PubgService {
	
	@Setter(onMethod_ = { @Autowired }) 
	PubgMapper mapper;
	
	@Override
	public void write(PubgDto pubgDto, int boardNo){
		
		pubgDto.setBoardNo(boardNo);
		mapper.insert(pubgDto);
	}

}
