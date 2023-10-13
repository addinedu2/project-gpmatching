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


	@Select("select c.commentNo, c.mCommentContent, u.nickname, c.status "
			+ "from MatchingComment c "
			+ "inner join User u "
			+ "on c.userNo = u.userNo "
			+ "where boardNo = #{ boardNo }")
	List<MatchingCommentDto> selectMatchingCommentByBoardNo(int boardNo);
	
	
	@Select("update MatchingComment set status = #{ status } "
			+ "where commentNo = #{commentNo}")
	void updateMatchingCommentStatus(@Param("commentNo") int commentNo, @Param("status") String status);
 
	// 지원자 수 카운트에도 이용 (-허지웅)
	@Select("select count(*) from MatchingComment where boardNo = #{ boardNo } and status = '1'")
	int commentConfirmCountByMatchingBoardNo(int boardNo);

	@Select("select boardNo from MatchingComment where commentNo = #{ commentNo}")
	int selectBoardNoByCommentNo(int commentNo);

	@Select("select status from MatchingComment where commentNo = #{ commentNo}")
	String selectStatusByCommentNo(int commentNo);

}
