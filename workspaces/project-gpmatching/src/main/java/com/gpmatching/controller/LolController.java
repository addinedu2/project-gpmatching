package com.gpmatching.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gpmatching.dto.LolDto;
import com.gpmatching.service.LolService;

import lombok.Setter;

@Controller
@RequestMapping(path = { "/lol"})
public class LolController {
	
	@Autowired
	@Setter
	LolService lolService;
	
	@GetMapping(path = { "/write"})
	public String writeLol() {
		LolDto lolDto = new LolDto();
		
		System.out.println("test");
//		LolDto lol = new LolDto();
//		lol.setBoardNo(boardNo);
//		lol.setLolPlay("lolPlay");
//		lol.setLolPosition("lolPosition");
//		lol.setLolSur("lolSur");
//		lol.setLolTier("lolTier");
//		
		lolDto.setLolTier("gold");
		//lolDto.setBoardNo(2);
		lolDto.setLolPlay("lolPlay");
		lolDto.setLolPosition("lolPosition");
		lolDto.setLolSur("lolSur");
		lolDto.setLolTier("lolTier");
		lolService.write(lolDto, 3);
		
		return "home";

	}

}
