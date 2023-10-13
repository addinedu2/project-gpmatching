package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.gpmatching.matchingboard.dto.MatchingBoardDto;

@Mapper
public interface MatchingReviewMapper {

	@Select("select count(*) from MatchingBoard where userNo = #{ userNo } and matchingClose = '1'")
	int selectMatchingCloseByLoginUser(int userNo);
	
	@Select("select m.boardTitle, m.boardContent, u.nickname "
			+ "from MatchingBoard m "
			+ "inner join User u on m.userNo = u.userNo"
			+ "inner join MatchingComment c on "
			+ "where matchingClose = '1'")
	List<MatchingBoardDto> selectNotYetWrittenReviewList(int userNo);
}
