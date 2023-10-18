package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.gpmatching.dto.MatchingReviewDto;
import com.gpmatching.matchingboard.dto.MatchingBoardDto;

@Mapper
public interface MatchingReviewMapper {

	@Select("select count(*) from MatchingBoard where userNo = #{ userNo } and matchingClose = 1")
	int selectMatchingCloseByLoginUser(int userNo);
	
	// 로그인 유저가 글 작성자일때
	@Select("SELECT mbp.boardNo, mbp.boardTitle, u.nickname " +
			"FROM MatchingBoard mbp " +
			"inner join User u on u.userNo = mbp.userNo " +
            "INNER JOIN ( " +
            "    SELECT mb.boardNo, count(mc.boardNo) cnt " +
            "    FROM MatchingComment mc " +
            "    INNER JOIN MatchingBoard mb " +
            "    ON mc.boardNo = mb.boardNo " +
            "    WHERE mb.userNo = #{userNo} AND mc.status = '1' AND mb.matchingClose = true " +
            "    GROUP BY mb.boardNo " +
            "    HAVING cnt > (SELECT count(mr.boardNo) cnt " +
            "                  FROM MatchingReview mr " +
            "                  WHERE mr.boardNo = mb.boardNo " +
            "                  ) " +
            ") a " +
            "ON mbp.boardNo = a.boardNo " +
            "order by mbp.boardNo desc " +
            "limit 6")
    List<MatchingBoardDto> selectMatchingBoardsNeedToReview(int userNo);
	 

//	// 글작성자가 로그인 유저일때 해당 글의 댓글 중 리뷰를 작성하지 않은 댓글을 가져오는 매퍼
//	@Select("SELECT DISTINCT m.boardNo, m.boardTitle, cu.nickname, c.commentNo "
//			+"FROM MatchingBoard m "
//			+"INNER JOIN MatchingComment c ON m.boardNo = c.boardNo "
//			+"INNER JOIN User mu ON m.userNo = mu.userNo "
//			+"INNER JOIN User cu ON c.userNo = cu.userNo "
//			+"LEFT JOIN MatchingReview r ON m.boardNo = r.boardNo AND r.userNo = #{userNo} "
//			+"WHERE m.userNo = #{userNo} AND m.matchingClose = 1 "
//			+"AND c.commentNo NOT IN ( "
//			+"SELECT rc.commentNo "
//			+"FROM MatchingReview rr "
//			+"INNER JOIN MatchingComment rc ON rr.commentNo = rc.commentNo "
//			+"WHERE rr.boardNo = m.boardNo) "
//			+"ORDER BY m.boardNo DESC "
//			+"limit 6")
//	@ResultType(MatchingBoardDto.class)
//	List<MatchingBoardDto> selectNotYetReviewList(int userNo);

	
	
	
	@Insert("insert into MatchingReview(reviewPoint, reviewContent, boardNo, userNo, reviewedUserNo, commentNo) "
			+ "values (#{reviewPoint}, #{reviewContent}, #{boardNo}, #{userNo}, #{reviewedUserNo}, #{commentNo})")
	void insertMatchingReview(MatchingReviewDto matchingReviewDto);
	
	@Select("select userNo from User where nickname = #{nickname}")
	int selectUserNoByNickname(String nickname);
}
