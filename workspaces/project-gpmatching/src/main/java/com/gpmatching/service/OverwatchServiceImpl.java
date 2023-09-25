package com.gpmatching.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.dto.OverwatchDto;
import com.gpmatching.mapper.OverwatchMapper;

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
