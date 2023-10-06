package com.gpmatching.matchingboard.pubgboard.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import com.gpmatching.matchingboard.dto.PubgDto;



public interface PubgMapper {
	
	@Insert("insert into Pubg ( boardNo, pubgPlay, pubgPosition, pubgGun,"
			+ "pubgServer, pubgMode) "
			+ "values ( #{boardNo}, #{pubgPlay}, #{pubgPosition} , #{pubgGun}, "
			+ "#{pubgServer}, #{pubgMode})") 
	public void insert(PubgDto pubg); 
	
	@Update("update Pubg set pubgPlay = #{pubgPlay}, pubgPosition = #{pubgPosition}, pubgGun = #{pubgGun}, "
			+ "pubgServer = #{pubgServer}, pubgMode = #{pubgMode} "
			+ "where boardNo = #{boardNo}")
	public void update(PubgDto pubg);

}
