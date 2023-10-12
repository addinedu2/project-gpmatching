package com.gpmatching.dto;

import com.gpmatching.matchingboard.dto.MatchingBoardDto;

import lombok.Data;

@Data
public class AdminDto {
	
	//회원 목록 정보들
	
	private int totalPosts;
    private int totalComments;
	
    private UserDto userDto;
    private CommonBoardDto commonBoardDto;
    private MatchingBoardDto matchingBoardDto;
    
}
