package com.gpmatching.mapper;

import org.apache.ibatis.annotations.Insert;

import com.gpmatching.dto.OverwatchDto;

public interface OverwatchMapper {
	
	@Insert("insert into Overwatch ( boardNo, owTier, owPlay, owPosition) "
			+ "values ( #{boardNo}, #{owTier}, #{owPlay} , #{owPosition})") 
	public void insert(OverwatchDto overwatch); 

}
