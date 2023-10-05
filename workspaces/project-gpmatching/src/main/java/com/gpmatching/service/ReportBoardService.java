package com.gpmatching.service;

import java.util.List;

import com.gpmatching.dto.BoardAttachDto;
import com.gpmatching.dto.ReportBoardDto;

public interface ReportBoardService {

	void writeReportBoard(ReportBoardDto reportBoard);

	List<ReportBoardDto> listReportBoard();

	ReportBoardDto findReportBoardByCommonNo(int commonNo);

	int getCommonBoardCount();

	BoardAttachDto findBoardAttachByBoardAttachNo(int boardAttachNo);

	List<BoardAttachDto> findBoardAttachByCommonNo(int commonNo);

	List<ReportBoardDto> listReportBoardByPage(int from, int count, String category);

	

	

	

}
