package com.gpmatching.matchingboard.pubgboard.mapper;

import org.apache.ibatis.annotations.Insert;

import com.gpmatching.matchingboard.dto.PubgDto;



public interface PubgMapper {
	
	@Insert("insert into Pubg ( boardNo, pubgPlay, pubgPosition, pubgGun,"
			+ "pubgServer, pubgMode) "
			+ "values ( #{boardNo}, #{pubgPlay}, #{pubgPosition} , #{pubgGun}, "
			+ "#{pubgServer}, #{pubgMode})") 
	public void insert(PubgDto pubg); 

}
