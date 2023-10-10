package com.gpmatching.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardAttachDto {
	
	private int boardAttachNo;
	private String userFilename;
	private String savedFilename;
	private Date regDate;
	private int downloadCount;
	private int commonNo;

}
