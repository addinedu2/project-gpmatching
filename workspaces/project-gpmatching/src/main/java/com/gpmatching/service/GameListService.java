package com.gpmatching.service;

import java.util.List;

import com.gpmatching.dto.GameListDto;

public interface GameListService {
	
	public void register(GameListDto gameDto);

	public GameListDto findGameListByGameNo(int gameNo);

	public GameListDto findGameListByGameName(String gameName);
	
	public List<GameListDto> listGameList();

	public void show();

}
