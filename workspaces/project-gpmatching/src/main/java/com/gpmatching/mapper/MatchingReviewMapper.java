package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;

import com.gpmatching.dto.MatchingReviewDto;
import com.gpmatching.matchingboard.dto.MatchingBoardDto;

@Mapper
public interface MatchingReviewMapper {

	@Select("select count(*) from MatchingBoard where userNo = #{ userNo } and matchingClose = 1")
	int selectMatchingCloseByLoginUser(int userNo);
	
	// 글작성자가 로그인 유저일때 해당 글의 댓글 중 리뷰를 작성하지 않은 댓글을 가져오는 매퍼
	@Select("SELECT DISTINCT m.boardNo, m.boardTitle, mu.nickname AS writer, cu.nickname AS commentWriter, c.commentNo "
			+"FROM MatchingBoard m "
			+"INNER JOIN MatchingComment c ON m.boardNo = c.boardNo "
			+"INNER JOIN User mu ON m.userNo = mu.userNo "
			+"INNER JOIN User cu ON c.userNo = cu.userNo "
			+"LEFT JOIN MatchingReview r ON m.boardNo = r.boardNo AND r.userNo = #{userNo} "
			+"WHERE m.userNo = #{userNo} AND m.matchingClose = 1 "
			+"AND c.commentNo NOT IN ( "
			+"SELECT rc.commentNo "
			+"FROM MatchingReview rr "
			+"INNER JOIN MatchingComment rc ON rr.commentNo = rc.commentNo "
			+"WHERE rr.boardNo = m.boardNo) "
			+"ORDER BY m.boardNo DESC "
			+"limit 6")
	@ResultType(MatchingBoardDto.class)
	List<MatchingBoardDto> selectNotYetReviewList(int userNo);

	
	
	
	@Insert("insert into MatchingReview(reviewPoint, reviewContent, boardNo, userNo, reviewedUserNo, commentNo) "
			+ "values (#{reviewPoint}, #{reviewContent}, #{boardNo}, #{userNo}, #{reviewedUserNo}, #{commentNo})")
	void insertMatchingReview(MatchingReviewDto matchingReviewDto);
	
	@Select("select userNo from User where nickname = #{nickname}")
	int selectUserNoByNickname(String nickname);
}
