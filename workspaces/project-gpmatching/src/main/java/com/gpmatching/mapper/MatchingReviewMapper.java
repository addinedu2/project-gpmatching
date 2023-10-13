package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.gpmatching.matchingboard.dto.MatchingBoardDto;

@Mapper
public interface MatchingReviewMapper {

	@Select("select count(*) from MatchingBoard where userNo = #{ userNo } and matchingClose = '1'")
	int selectMatchingCloseByLoginUser(int userNo);
	
	@Select("select m.boardNo, m.boardTitle, c.commentNo, u.nickname "
			+ "from MatchingBoard m "
			+ "inner join MatchingComment c on c.boardNo = m.boardNo "
			+ "inner join User u on c.userNo = u.userNo where m.userNo = #{ userNo } and matchingClose = '0' "
			+ "order by boardNo desc")
	List<MatchingBoardDto> selectNotYetReviewList(int userNo);
}
