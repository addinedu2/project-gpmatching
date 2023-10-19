package com.gpmatching.service;

import java.util.List;

import com.gpmatching.dto.BoardAttachDto;
import com.gpmatching.dto.CommonBoardDto;

public interface CommonBoardService {

	void writeCommonBoard(CommonBoardDto commonBoardDto);

	List<CommonBoardDto> listCommonBoard();
	List<CommonBoardDto> listCommonBoardByPage(int from, int count, String category);
	int getCommonBoardCount();
	
	CommonBoardDto findCommonBoardByCommonNo(int commonNo);

	void deleteCommon(int commonNo);

	void commonEdit(CommonBoardDto commonBoard);

	List<BoardAttachDto> findBoardAttachByCommonNo(int commonNo);

	BoardAttachDto findBoardAttachByBoardAttachNo(int boardAttachNo);

	void incrementReadCount(int commonNo);

}