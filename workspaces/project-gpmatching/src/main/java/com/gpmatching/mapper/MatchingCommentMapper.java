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

	
	@Insert("insert into MatchingComment (boardNo, mCommentContent, userNo) "
			+ "values (#{ boardNo }, #{ mCommentContent }, #{ userNo })")
	@Options(useGeneratedKeys = true, keyProperty = "commentNo")
	void insertMatchingComment(MatchingCommentDto matchingComment);

	//MatchingBoard 칼럼 join 추가 - 이현일
	@Select("select mc.commentNo, mc.boardNo, mc.mCommentContent, "
			+ "u.nickname, mc.status, mb.headCount, mb.confirmCount, mb.matchingClose "
			+ "from MatchingComment mc "
			+ "inner join MatchingBoard mb "
			+ "on mc.boardNo = mb.boardNo "
			+ "inner join User u "
			+ "on mc.userNo = u.userNo "
			+ "where mc.boardNo = #{ boardNo } ")
	List<MatchingCommentDto> selectMatchingCommentListByBoardNo(int boardNo);
	
	@Select("update MatchingComment set status = #{ status } "
			+ "where commentNo = #{commentNo}")
	void updateMatchingCommentStatus(@Param("commentNo") int commentNo, @Param("status") String status);
 
	@Select("select count(*) from MatchingComment where boardNo = #{ boardNo } and status = '1'")
	int commentConfirmCountByMatchingBoardNo(int boardNo);

	@Select("select boardNo from MatchingComment where commentNo = #{ commentNo}")
	int selectBoardNoByCommentNo(int commentNo);

	@Select("select status from MatchingComment where commentNo = #{ commentNo}")
	String selectStatusByCommentNo(int commentNo);
	
	@Select("select c.commentNo, c.boardNo, c.mCommentContent, u.nickname, c.status "
			+ "from MatchingComment c "
			+ "inner join User u "
			+ "on c.userNo = u.userNo "
			+ "where boardNo = #{ boardNo } "
			+ "and c.status = 1 and c.commentNo not in (select commentNo from MatchingReview)")
	List<MatchingCommentDto> selectMatchingCommentListForReview(int boardNo);

	
}
