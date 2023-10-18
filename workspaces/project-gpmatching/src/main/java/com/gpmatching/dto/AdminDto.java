package com.gpmatching.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.gpmatching.matchingboard.dto.MatchingBoardDto;

import lombok.Data;

@Data
public class AdminDto {
	
	//회원 목록 정보들
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String userEmail;
	private String nickname;
	private String userPhone;
	private String userGrade;
	
	// @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date regDate;
	private String userImage;
	private String userIntro;
    private boolean	deletedUser;
    // @JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date banEndDate;
	
	
	private int boardNo;
	private String boardTitle;
	private int gameNo;
	private boolean deleted;
	
//	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
//	private Date regDate;
	
	private String boardType;
	
    
}
