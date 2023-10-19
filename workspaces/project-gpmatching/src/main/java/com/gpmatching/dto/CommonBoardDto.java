package com.gpmatching.dto;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CommonBoardDto {
	int boardInfoNo;
	
	private int commonNo;//공통게시판 글번호 자동 증가
	private String commonTitle;//공통게시판 제목
	private int userNo;//공통게시판 글쓴이 정보
	private String commonContent;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date regDate;
	private int readCount;
	private boolean deleted;
	private String nickname;//닉네임 표시
	private String category;
	private String userId;
	
	private List<BoardAttachDto> boardAttachList;
	
	private List<BoardCommentDto> boardCommentList;
	

}
