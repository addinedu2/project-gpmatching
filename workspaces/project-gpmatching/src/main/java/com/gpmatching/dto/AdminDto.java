package com.gpmatching.dto;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.gpmatching.matchingboard.dto.MatchingBoardDto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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
	private String category;
	private boolean deleted;
	private String boardContent;
	private int count;
	
//	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
//	private Date regDate;
	
	// 원형 그래프 1일치 일주일치
	private int commonBoardCountForDay;
	private int matchingBoardCountBattlegroundForDay;
	private int matchingBoardCountLolForDay;
	private int matchingBoardCountOverwatchForDay;

	private int commonBoardCountForWeek;
	private int matchingBoardCountBattlegroundForWeek;
	private int matchingBoardCountLolForWeek;
	private int matchingBoardCountOverwatchForWeek;
    
}
