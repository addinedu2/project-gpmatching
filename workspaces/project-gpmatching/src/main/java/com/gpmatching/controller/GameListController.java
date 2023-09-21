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
		
		GameListDto gameDto = new GameListDto();
		gameDto.setGameName("lol");
		gameDto.setGameCom("riot games");
		
		gameListService.register(gameDto);
		
		return "home";
		
	}
	
	@GetMapping(path = {"/show"} )
	public String showGameList() {
		
		gameListService.show();
		
		return "home";
		
	}
	
	@GetMapping(path = {"/list"} )
	public String iistGameList(GameListDto game) {
		
		gameListService.list();
		
		return "/gamelist/list";
		
	}


}
