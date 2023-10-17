package com.gpmatching.dto;

import java.util.Date;
import java.util.List;

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
	private Date regDate;
	private String userImage;
	private String userIntro;
    private boolean	deletedUser;
    private Data banEndDate;
	
	
	
	private List<CommonBoardDto> CommonBoardlist;
	private List<MatchingBoardDto> MatchingBoardlist;
	private List<BoardCommentDto> BoardCommentlist;
	private List<MatchingCommentDto> MatchingCommentlist;
	
	//private int totalPosts;
    //private int totalComments;
	
    
}
