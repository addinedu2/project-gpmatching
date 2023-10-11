package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.gpmatching.dto.MatchingCommentDto;

@Mapper
public interface MatchingCommentMapper {

	// 닉네임은 어떻게 불러오는거지..?
	@Insert("insert into MatchingComment (boardNo, mCommentContent, userNo) "
			+ "values (#{ boardNo }, #{ mCommentContent }, #{ userNo })")
	@Options(useGeneratedKeys = true, keyProperty = "mCommentNo")
	void insertMatchingComment(MatchingCommentDto matchingComment);

	@Select("select c.mCommentNo, c.mCommentContent, u.nickname, c.status "
			+ "from MatchingComment c "
			+ "inner join User u "
			+ "on c.userNo = u.userNo "
			+ "where boardNo = #{ boardNo }")
	List<MatchingCommentDto> selectMatchingCommentByBoardNo(int boardNo);
	
	
	@Select("update MatchingComment set status = #{ status } "
			+ "where mCommentNo = #{commentNo}")
	void updateMatchingCommentStatus(@Param("commentNo") int commentNo, @Param("status") String status);

	@Select("select count(*) from MatchingComment where boardNo = #{ boardNo } and status = '1'")
	int commentConfirmCountByMatchingBoardNo(int boardNo);

	@Select("select boardNo from MatchingComment where mCommentNo = #{ commentNo}")
	int selectBoardNoByCommentNo(int commentNo);

	@Select("select status from MatchingComment where mCommentNo = #{ commentNo}")
	String selectStatusByCommentNo(int commentNo);


	
	
//	// 지우진 마세용
//	@Select("select c.mCommentNo, c.boardNo, c.mCommentContent, c.userNo "
//			+ "from MatchingComment c "
//			+ "inner join MatchingBoard m "
//			+ "on m.boardNo = c.boardNo "
//			+ "where m.gameNo =  (select gameNo "
//			+ "from GameList where gameName = #{ gameName} )")
//			//+ "order by commentNo desc")
//	List<MatchingCommentDto> selectMatchingCommentByGameName(String gameName);
}
