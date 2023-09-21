package com.gpmatching.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gpmatching.dto.GameListDto;
import com.gpmatching.service.GameListService;

import lombok.Setter;

@Controller
@RequestMapping(path = { "/gamelist" } )
public class GameListController {
	
	@Setter(onMethod_ = { @Autowired }) 
	GameListService gameListService;
	
	@GetMapping(path = {"/register"} )
	public String regGameList(GameListDto game) {
		
		//GameListDto gameDto = new GameListDto();
		//gameDto.setGameName("league of legends");
		//gameDto.setGameCom("riot games");
		
		//GameListDto gameDto = new GameListDto();
		//gameDto.setGameName("batte ground");
		//gameDto.setGameCom("kakao games");
		
		//GameListDto gameDto = new GameListDto();
		//gameDto.setGameName("overwatch2");
		//gameDto.setGameCom("blizzard");
		
		//gameListService.register(gameDto);
		
		gameListService.register(game);
		
		return "home";
		
	}
	
	@GetMapping(path = {"/show"} )
	public String showGameList() {
		
		gameListService.show();
		
		return "home";
		
	}
	
	@GetMapping(path = {"/list"} )
	public String listGameList() {
		
		gameListService.listGameList();
		
		return "/gamelist/list";
		
	}


}
