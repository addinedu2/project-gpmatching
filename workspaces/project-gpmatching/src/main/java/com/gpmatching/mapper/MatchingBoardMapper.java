package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
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
	
	@Insert( "insert into MatchingBoard (boardTitle, "
			+ "boardContent, preferGender, mic, gameNo, userNo) "
			+ "values ( #{ boardTitle }, #{ boardContent }, "
			+ "#{ preferGender }, #{ mic } , #{ gameNo }, #{ userNo })")
	@Options(useGeneratedKeys = true, keyProperty = "boardNo")
	void insertMatchingBoard(MatchingBoardDto matchingBoardDto);
	


	@Select( "select boardNo, boardTitle, boardContent, regDate, userNo "
			+ "from MatchingBoard "
			+ "order by boardNo desc")
	List<MatchingBoardDto> selectAllMatchingBoard();
	
	
	@Select( "select boardNo, boardTitle, boardContent, regDate, userNo "
			+ "from MatchingBoard "
			+ "where gameNo = #{ gameNo } "
			+ "order by boardNo desc")
	List<MatchingBoardDto> selectMatchingBoardListByGameNo(int gameNo);
	

	@Select( "select boardNo, boardTitle, boardContent, regDate, userNo "
			+ "from MatchingBoard "
			+ "where gameNo = (select gameNo "
			+ "from GameList where gameName = #{ gameName} )"
			+ "order by boardNo desc" )
	List<MatchingBoardDto> selectMatchingBoardListByGameName(String gameName);
	
	
	
	
	//@Select( "select boardNo  from MatchingBoard where type='boardNo' ORDER BY num DESC LIMIT 1")
	@Select("select max(boardNo) from MatchingBoard")
	public int selectMatchingItemBoardNo() ;
	
	
	@Select("select boardNo, boardTitle, boardContent "
			+ "from MatchingBoard "
			+ "where boardNo = #{ boardNo }")
	MatchingBoardDto selectMatchingBoardByBoardNo(@Param("boardNo")int boardNo);
	
	
}
