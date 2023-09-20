package com.gpmatching.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class RoleDto {

	private int roleNo;
	private String roleName;
	private Date regDate;
}
