package com.gpmatching.matchingboard.dto;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.gpmatching.dto.MatchingCommentDto;
import com.gpmatching.dto.UserDto;

import lombok.Data;

@Data
public class MatchingBoardDto {
	int boardNo;
	String boardTitle;
	String boardContent;
	String preferGender;
	boolean mic;
	boolean matchingClose;
	int headCount;
	int confirmCount;
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	Date regDate;
	int readCount;
	boolean deleted;
	int userNo;
	int gameNo;
	String startTime;
	String endTime;
	
	//User
	String nickname;
	
	//Lol
	String lolPosition;
	String lolSur;
	String lolPlay;
	String lolTier;
	
	//Pubg
	private String pubgPlay;
	private String pubgPosition;
	private String pubgGun;
	private String pubgServer;
	private String pubgMode;
	
	//overwatch
	private String owTier;
	private String owPlay;
	private String owPosition;
	
	private List<MatchingCommentDto> matchingCommentList;
	private UserDto user;
	private LolDto lol;
	private String mCommentContent;
	private int commentNo;
	private String writer;
	private String commentWriter;
	

}
