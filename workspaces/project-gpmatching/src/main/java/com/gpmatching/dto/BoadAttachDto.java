package com.gpmatching.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoadAttachDto {
	
	private int boadAttachNo;
	private String userFilename;
	private String savedFilename;
	private Date regDate;
	private int downloadCount;
	private int commonNo;

}
