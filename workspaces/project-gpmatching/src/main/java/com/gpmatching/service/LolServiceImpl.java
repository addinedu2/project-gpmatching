package com.gpmatching.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.dto.LolDto;
import com.gpmatching.mapper.GameListMapper;
import com.gpmatching.mapper.LolMapper;
import com.gpmatching.mapper.UserMapper;

import lombok.Setter;

public class LolServiceImpl implements LolService {
	
	@Setter(onMethod_ = { @Autowired }) 
	LolMapper mapper;
	
	@Override
	public void write(LolDto lolDto, int boardNo){
		
		System.out.println("test");
//		LolDto lol = new LolDto();
//		lol.setBoardNo(boardNo);
//		lol.setLolPlay("lolPlay");
//		lol.setLolPosition("lolPosition");
//		lol.setLolSur("lolSur");
//		lol.setLolTier("lolTier");
//		
		lolDto.setLolTier("gold");
		lolDto.setBoardNo(boardNo);
		mapper.insert(lolDto);
	}

}
