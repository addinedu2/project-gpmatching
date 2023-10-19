package com.gpmatching.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MatchingCommentDto {

	private int commentNo;
	private Date mCommentRegDate;
	private String mCommentContent;
	private int boardNo;
	private int userNo;
	String status;
	
	//User
	private UserDto user;
	String nickname;
	
	//MatchingBoard
	boolean matchingClose;
	int headCount;
	int confirmCount;
}
