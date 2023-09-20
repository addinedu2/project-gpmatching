package com.gpmatching.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.dto.CommonBoardDto;
import com.gpmatching.mapper.CommonBoardMapper;

public class CommonBoardServiceImpl implements CommonBoardService {
	
	@Autowired
	public CommonBoardMapper commonBoardMapper;
	
	@Override
	public void writeCommonBoard(CommonBoardDto commonBoard) {
		commonBoardMapper.insertCommonBoard(commonBoard);
	}
	
//	@Override
//	public List<CommonBoardDto> listCommonBoard(){
//		return null;
//	}

}
