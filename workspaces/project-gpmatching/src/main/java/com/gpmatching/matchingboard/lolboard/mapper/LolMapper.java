package com.gpmatching.matchingboard.lolboard.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import com.gpmatching.matchingboard.dto.LolDto;


@Mapper
public interface LolMapper {

	
	
	@Insert("insert into Lol ( boardNo, lolPosition, lolSur, lolPlay, lolTier) "
			+ "values ( #{boardNo}, #{lolPosition}, #{lolSur} , #{lolPlay}, #{lolTier})") 
	public void insert(LolDto lol); 
	
	@Update("update Lol set lolPosition = #{lolPosition}, lolSur = #{lolSur}, lolPlay = #{lolPlay} "
			+ "lolTier = #{lolTier} "
			+ "where boardNo = #{boardNo}")
	
	public void update(LolDto lol);
}
