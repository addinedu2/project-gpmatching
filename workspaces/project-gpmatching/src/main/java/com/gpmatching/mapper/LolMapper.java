package com.gpmatching.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.gpmatching.dto.LolDto;

@Mapper
public interface LolMapper {

	
	
	@Insert("insert into Lol ( boardNo, lolPosition, lolSur, lolPlay, lolTier) "
			+ "values ( #{boardNo}, #{lolPosition}, #{lolSur} , #{lolPlay}, #{lolTier})") 
	public void insert(LolDto lol); 
}
