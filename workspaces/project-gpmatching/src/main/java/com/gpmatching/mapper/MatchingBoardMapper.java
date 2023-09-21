package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
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
	@Insert( "insert into MatchingBoard ( boardTitle, "
			+ "boardContent, preferGender, mic) "
			+ "values ( #{ boardTitle }, #{ boardContent }, "
			+ "#{ preferGender }, #{ mic } )")
	void insertMatchingBoard(MatchingBoardDto matchingBoardDto);
	

	@Select( "select boardNo, boardTitle, boardContent, regDate "
			+ "from MatchingBoard "
			+ "order by boardNo desc")
	List<MatchingBoardDto> selectAllMatchingBoard();
	
	
	//@Select( "select boardNo  from MatchingBoard where type='boardNo' ORDER BY num DESC LIMIT 1")
	@Select("select max(boardNo) from MatchingBoard")
	public int selectMatchingItemBoardNo() ;
	
	@Select("select boardNo from MatchingBoard where BoardTitle = #{boardTitle}")
	public int selectMatchingitemByBoardNtitle(String boardTitle) ;
	
	
	
}
