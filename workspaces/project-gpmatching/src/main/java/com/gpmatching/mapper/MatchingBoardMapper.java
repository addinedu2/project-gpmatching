package com.gpmatching.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.gpmatching.dto.MatchingBoardDto;

@Mapper
public interface MatchingBoardMapper {
	
	/*
	@Insert( "insert into matchingbaord ( boardNo, boardTitle, "
			+ "boardContent, preferGender, mic, matchingClose,"
			+ "regDate, readCount, deleted, userNo, gameNo) "
			+ "values ( #{ boardNo }, #{ boardTitle }, #{ boardContent },"
			+ "#{ preferGender },#{ mic },#{ matchingClose },#{ regDate },"
			+ "#{ readCount }, #{ deleted }, #{ userNo }, #{ gameNo })")
	*/
	
	@Insert( "insert into MatchingBoard ( boardTitle, "
			+ "boardContent, preferGender, mic) "
			+ "values ( #{ boardTitle }, #{ boardContent }, "
			+ "#{ preferGender }, #{ mic } )")
	void insertMatchingBoard(MatchingBoardDto matchingBoardDto);

}
