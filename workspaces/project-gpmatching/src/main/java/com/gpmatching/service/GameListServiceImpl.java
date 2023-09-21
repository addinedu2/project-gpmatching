package com.gpmatching.service;

import java.util.ArrayList;
import java.util.List;

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


	
	@Override
	public GameListDto findGameListByGameNo(int gameNo) {
		GameListDto game = mapper.selectByGameNo(gameNo);
		return game;
	};
	
	@Override
	public GameListDto findGameListByGameName(String gameName) {
		GameListDto game = mapper.selectByGameName(gameName);
		return null;
	};
	
	@Override
	public List<GameListDto> listGameList() {
		List<GameListDto> game = mapper.selectAllGameList();
		return game;
	}

	@Override
	public void show() {
		List<GameListDto> game = mapper.selectAllGameList();
		for(GameListDto i : game) {
			System.out.println(i);
		}
	
	};


}
