package com.gpmatching.mapper;

import org.apache.ibatis.annotations.Insert;

import com.gpmatching.dto.OverwatchDto;
import com.gpmatching.dto.PubgDto;

public interface PubgMapper {
	
	@Insert("insert into Pubg ( boardNo, pubgPlay, pubgPosition, pubgGun,"
			+ "pubgServer, pubgMode) "
			+ "values ( #{boardNo}, #{pubgPlay}, #{pubgPosition} , #{pubgGun}, "
			+ "#{pubgServer}, #{pubgMode})") 
	public void insert(PubgDto pubg); 

}
