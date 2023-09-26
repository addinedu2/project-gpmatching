package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

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
	
	//mysql db 설정에 table명, 칼럼명 대소문자 구분 설정 가능 - 매칭 해주어야 한다.
	/*
	@Insert( "insert into MatchingBoard ( boardTitle, "
			+ "boardContent, preferGender, mic) "
			+ "values ( #{ boardTitle }, #{ boardContent }, "
			+ "#{ preferGender }, #{ mic } )")
	void insertMatchingBoard2(MatchingBoardDto matchingBoardDto);
	*/
	
	@Insert( "insert into MatchingBoard ( boardTitle, "
			+ "boardContent, preferGender, mic, userNo, gameNo) "
			+ "values ( #{ boardTitle }, #{ boardContent }, "
			+ "#{ preferGender }, #{ mic } ,  #{ userNo}, #{ gameNo})")
	void insertMatchingBoard(MatchingBoardDto matchingBoardDto);
	


	@Select( "select boardNo, boardTitle, boardContent, regDate "
			+ "from MatchingBoard "
			+ "order by boardNo desc")
	List<MatchingBoardDto> selectAllMatchingBoard();
	
	
	@Select( "select boardNo, boardTitle, boardContent, regDate "
			+ "from MatchingBoard "
			+ "where gameNo = #{ gameNo } "
			+ "order by boardNo desc")
	List<MatchingBoardDto> selectMatchingBoardListByGameNo(int gameNo);
	

	@Select( "select boardNo, boardTitle, boardContent, regDate "
			+ "from MatchingBoard "
			+ "where gameNo = (select gameNo "
			+ "from GameList where gameName = #{ gameName} )"
			+ "order by boardNo desc" )
	List<MatchingBoardDto> selectMatchingBoardListByGameName(String gameName);
	
	
	//MatchingBoard 의 마지막 튜플의 boardNo (ai 설정됨) 를 가지고 오는 SQL 문
	@Select("select max(boardNo) from MatchingBoard")
	public int selectMatchingItemBoardNo() ;
	
	
	@Select("select boardNo, boardTitle, boardContent "
			+ "from MatchingBoard "
			+ "where boardNo = #{ boardNo }")
	MatchingBoardDto selectMatchingBoardByBoardNo(@Param("boardNo")int boardNo);
	
	
}
