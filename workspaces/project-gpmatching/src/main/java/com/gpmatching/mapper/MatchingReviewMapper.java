package com.gpmatching.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;

import com.gpmatching.dto.MatchingReviewDto;

@Mapper
public interface MatchingReviewMapper {

	@Insert("insert into MatchingReview (reviewContent, reviewPoint, userNo, commonNo) "
			+ "values (#{ reviewContent }, #{ reviewPoint }, #{ userNo }, #{ commonNo })")
	@Options(useGeneratedKeys = true, keyProperty = "reviewNo") 
	void insertMatchingReview(MatchingReviewDto matchingReview);
	
	
}
