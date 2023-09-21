package com.gpmatching.service;

import java.util.ArrayList;
import java.util.List;

import com.gpmatching.dto.GameListDto;

public interface GameListService {
	
	public void register(GameListDto gameDto);

	public void show();

	public GameListDto findGameListByGameName(String gameName);

	public GameListDto findGameListByGameNo(int gameNo);

	public List<GameListDto> listGameList();


}
