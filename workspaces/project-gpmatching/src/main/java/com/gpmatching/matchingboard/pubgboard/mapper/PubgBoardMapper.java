package com.gpmatching.matchingboard.pubgboard.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.gpmatching.dto.UserDto;
import com.gpmatching.matchingboard.dto.MatchingBoardDto;

@Mapper
public interface PubgBoardMapper {
	
	//모든 테이블 칼럼 항목 보여주는 예시 쿼리
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
			+ "#{ preferGender }, #{ mic } , #{ userNo }, #{ gameNo })")
	@Options(useGeneratedKeys = true, keyProperty = "boardNo")
	void insertMatchingBoard(MatchingBoardDto matchingBoardDto);
	


//	@Select( "select boardNo, boardTitle, boardContent, regDate, userNo "
//			+ "from MatchingBoard "
//			+ "order by boardNo desc")
//	List<MatchingBoardDto> selectAllMatchingBoard();
	
	
	@Select( "select boardNo, boardTitle, boardContent, regDate, userNo "
			+ "from MatchingBoard "
			+ "where gameNo = #{ gameNo } "
			+ "order by boardNo desc")
	List<MatchingBoardDto> selectMatchingBoardListByGameNo(int gameNo);
	
	
//	// 테스트
//	@Select("SELECT mb.boardNo, mb.boardTitle, mb.boardContent, mb.regDate, mb.userNo, u.nickname " +
//            "FROM MatchingBoard mb " +
//            "INNER JOIN User u ON mb.userNo = u.userNo " +
//            "WHERE mb.gameNo = (SELECT gameNo FROM GameList WHERE gameName = #{gameName}) " +
//            "ORDER BY mb.boardNo DESC")
//	List<MatchingBoardDto> selectMatchingBoardListByGameName(String gameName);
	

	@Select( "select boardNo, boardTitle, boardContent, regDate, userNo, mic "
			+ "from MatchingBoard "
			+ "where gameNo = (select gameNo "
			+ "from GameList where gameName = #{ gameName} ) "
			+ "order by boardNo desc" )
	List<MatchingBoardDto> selectMatchingBoardListByGameName(String gameName);
	
//	@Select( "select nickname "
//			+ "from User u "
//			+ "inner join matchingBoard m "
//			+ "on m.boardNo = (select boardNo "
//			+ "from MatchingBoard "
//			+ "where gameNo = (select gameNo "
//			+ "from GameList where gameName = #{ gameName} )) "
//			+ "order by boardNo desc" )
//	selectMatchingBoardListByGameName(String gameName);	
	
	
	//MatchingBoard 의 마지막 튜플의 boardNo (ai 설정됨) 를 가지고 오는 SQL 문
	@Select("select max(boardNo) from MatchingBoard")
	public int selectMatchingItemBoardNo() ;
	
	
	@Select("select boardNo, boardTitle, boardContent "
			+ "from MatchingBoard "
			+ "where boardNo = #{ boardNo }")
	MatchingBoardDto selectMatchingBoardByBoardNo(@Param("boardNo")int boardNo);
	

	@Select("select u.nickname, m.boardNo, m.boardTitle, m.boardContent, m.preferGender, m.mic, "
			+ "m.matchingClose, m.regDate, m.readCount, m.gameNo, p.pubgPlay, p.pubgPosition, p.pubgGun, "
			+ "p.pubgServer, p.pubgMode "
			+ "from MatchingBoard m "
			+ "inner join Pubg p "
			+ "on p.boardNo = m.boardNo "
			+ "inner join User u "
			+ "on m.userNo = u.userNo "
			+ "where m.boardNo = #{ boardNo } ") 
	MatchingBoardDto selectPubgBoardByBoardNo(int boardNo);

	
	
	//User 테이블, MatchingBoard 테이블, Pubg 테이블 join해서 같이 보여주는 코드(게임명: "battle ground")
	@Select( "select u.nickname, m.boardNo, m.boardTitle, m.boardContent, m.preferGender, m.mic, "
			+ "m.matchingClose, m.regDate, m.readCount, p.pubgPlay, p.pubgPosition, p.pubgGun, "
			+ "p.pubgServer, p.pubgMode "
			+ "from MatchingBoard m "
			+ "inner join Pubg p "
			+ "on p.boardNo = m.boardNo "
			+ "inner join User u "
			+ "on m.userNo = u.userNo "
			+ "where m.gameNo =  (select gameNo "
			+ "from GameList where gameName = #{ gameName} ) "
			+ "and deleted = false "
			+ "order by m.boardNo desc" )
	List<MatchingBoardDto> selectPubgBoardListByGameName(String gameName);
	

	@Update( "update MatchingBoard set boardTitle = #{boardTitle}, "
			+ "boardContent = #{ boardContent }, preferGender = #{ preferGender }, mic = #{ mic }, "
			+ "matchingClose = #{ matchingClose }, readCount = #{ readCount } "
			+ "where boardNo = #{boardNo} ")
	void updateMatchingBoard(MatchingBoardDto matchingBoardDto);
	
	
	//deleted = true 로 설정하여 삭제
	@Update("update MatchingBoard set deleted = true "
		  + "where boardNo = #{boardNo}")
	void deletePubgBoard(int boardNo);
	
	/* 성공
	@Select( "select * "
			+ "from MatchingBoard m "
			+ "inner join Lol l "
			+ "on l.boardNo = m.boardNo "
			+ "inner join User u "
			+ "on m.userNo = u.userNo "
			+ "where m.gameNo =  (select gameNo "
			+ "from GameList where gameName = #{ gameName} ) "
			+ "order by m.boardNo desc" )
	List<Map<String, String>> SelectGameMatchingMapByGameName(String gameName);
	*/
	
	
//	@Select("select u.nickname from MatchingBoard m, User u where m.userNo = u.userNo")
//	String selectMatchingBoardNickname();
}
