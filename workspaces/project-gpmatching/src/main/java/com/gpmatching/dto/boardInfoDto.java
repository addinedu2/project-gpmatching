package com.gpmatching.dto;

import java.util.Date;

import lombok.Data;

@Data
public class boardInfoDto {
	int boardInfoNo;
	String boardCard;
	String boardName;
	Date regDate;
	boolean boardActive;
}
