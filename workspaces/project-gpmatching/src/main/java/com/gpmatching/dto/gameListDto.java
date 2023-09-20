package com.gpmatching.dto;

import java.util.Date;

import lombok.Data;

@Data
public class gameListDto {

	int gameNo;
	Date gameRegDate;
	String gameName;
	String gameCom;
}
