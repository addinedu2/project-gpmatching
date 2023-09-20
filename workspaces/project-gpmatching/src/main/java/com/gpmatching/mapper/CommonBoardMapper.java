package com.gpmatching.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.gpmatching.dto.CommonBoardDto;

@Mapper
public interface CommonBoardMapper {

	@Insert("insert into commonboard(commonTitle,userNo,commonContent) "
		  + "values (#{commonTitle},#{userNo},#{commonContent})")
	
	void insertCommonBoard(CommonBoardDto commonBoard);
}
