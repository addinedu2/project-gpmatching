package com.gpmatching.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;

import com.gpmatching.dto.GameListDto;

@Mapper
public interface GameListMapper {
	

	
	@Insert("insert into gamelist ( gameName, gameCom) "
			+ "values ( #{gameName}, #{gameCom})")
	@Options(useGeneratedKeys = true, keyProperty = "gameNo", keyColumn="gameNo")
	public void insert(GameListDto game);

}
