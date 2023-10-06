package com.gpmatching.service;

import java.util.List;

import com.gpmatching.dto.BoardAttachDto;
import com.gpmatching.dto.CommonBoardDto;

public interface CommonBoardService {

	void writeCommonBoard(CommonBoardDto commonBoardDto);

	List<CommonBoardDto> listCommonBoard();
	List<CommonBoardDto> listCommonBoardByPage(int from, int count, String category);//특정 페이지 가져오기
	int getCommonBoardCount();
	
	CommonBoardDto findCommonBoardByCommonNo(int commonNo);//commonNo찾고 Dto반환

	void deleteCommon(int commonNo);

	void commonEdit(CommonBoardDto commonBoard);

	List<BoardAttachDto> findBoardAttachByCommonNo(int commonNo);

	BoardAttachDto findBoardAttachByBoardAttachNo(int boardAttachNo);

}