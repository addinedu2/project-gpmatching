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
	
	@Insert( "insert into matchingboard ( boardTitle, "
			+ "boardContent, preferGender, matchingClose ) "
			+ "values ( #{ boardTitle }, #{ boardContent },"
			+ "#{ preferGender }, #{ matchingClose } )")
	void insertMatchingBoard(MatchingBoardDto matchingBoardDto);

}
