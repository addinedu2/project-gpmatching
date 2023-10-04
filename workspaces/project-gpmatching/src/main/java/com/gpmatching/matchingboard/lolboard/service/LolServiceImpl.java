package com.gpmatching.matchingboard.lolboard.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.matchingboard.dto.LolDto;
import com.gpmatching.matchingboard.lolboard.mapper.LolMapper;

import lombok.Setter;

public class LolServiceImpl implements LolService {
	
	@Setter(onMethod_ = { @Autowired }) 
	LolMapper mapper;
	
	@Override
	public void write(LolDto lolDto, int boardNo){
		
		lolDto.setBoardNo(boardNo);
		mapper.insert(lolDto);
	}

	@Override
	public void edit(LolDto lolDto, int boardNo){
		
		lolDto.setBoardNo(boardNo);
		mapper.update(lolDto);
	}

	
}
