package com.gpmatching.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.dto.GameListDto;
import com.gpmatching.mapper.GameListMapper;

import lombok.Setter;

public class GameListServiceImpl implements GameListService {

	@Setter(onMethod_ = { @Autowired }) 
	GameListMapper mapper;
	
	@Override
	public void register(GameListDto gameDto) {
		mapper.insert(gameDto);
	}

}
