package com.gpmatching.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import com.gpmatching.dto.GameListDto;

@Mapper
public interface GameListMapper {
	

	
	@Insert("insert into GameList ( gameName, gameCom) "
			+ "values ( #{gameName}, #{gameCom})")
	@Options(useGeneratedKeys = true, keyProperty = "gameNo", keyColumn="gameNo")
	public void insert(GameListDto game);
	
	
	@Select("select * from GameList where GameList.gameNo = #{gameNo}")
	public GameListDto select() ;

}
