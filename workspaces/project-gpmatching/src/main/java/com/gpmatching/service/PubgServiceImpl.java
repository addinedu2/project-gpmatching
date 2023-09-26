package com.gpmatching.service;

import org.springframework.beans.factory.annotation.Autowired;


import com.gpmatching.dto.PubgDto;
import com.gpmatching.mapper.PubgMapper;

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
