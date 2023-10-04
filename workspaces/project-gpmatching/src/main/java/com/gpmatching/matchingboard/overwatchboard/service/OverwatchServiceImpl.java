package com.gpmatching.matchingboard.overwatchboard.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.matchingboard.dto.OverwatchDto;
import com.gpmatching.matchingboard.overwatchboard.mapper.OverwatchMapper;

import lombok.Setter;

public class OverwatchServiceImpl implements OverwatchService {
	
	@Setter(onMethod_ = { @Autowired }) 
	OverwatchMapper mapper;
	
	@Override
	public void write(OverwatchDto overwatchDto, int boardNo){
		
		overwatchDto.setBoardNo(boardNo);
		mapper.insert(overwatchDto);
	}

}
