package com.gpmatching.matchingboard.overwatchboard.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import com.gpmatching.matchingboard.dto.OverwatchDto;


public interface OverwatchMapper {
	
	@Insert("insert into Overwatch ( boardNo, owTier, owPlay, owPosition ) "
			+ "values ( #{boardNo}, #{owTier}, #{owPlay} , #{owPosition})") 
	public void insert(OverwatchDto overwatch); 
	
	@Update("update Overwatch set owTier = #{owTier}, owPlay = #{owPlay}, owPosition = #{owPosition} "
			+ "where boardNo = #{boardNo}")
	public void update(OverwatchDto overwatch);
	

}
