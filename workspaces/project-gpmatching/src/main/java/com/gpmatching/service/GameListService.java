package com.gpmatching.service;

import java.util.ArrayList;
import java.util.List;

import com.gpmatching.dto.GameListDto;

public interface GameListService {
	
	public void register(GameListDto gameDto);

	public void show();

	public ArrayList<GameListDto> list();


}
