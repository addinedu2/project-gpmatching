package com.gpmatching.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gpmatching.dto.BoardAttachDto;
import com.gpmatching.dto.BoardCommentDto;
import com.gpmatching.dto.CommonBoardDto;
import com.gpmatching.dto.ReportBoardDto;
import com.gpmatching.mapper.BoardCommentMapper;
import com.gpmatching.mapper.CommonBoardMapper;
import com.gpmatching.mapper.ReportBoardMapper;

@Service
public class ReportBoardServiceImpl implements ReportBoardService {
	
	@Autowired
	public ReportBoardMapper reportBoardMapper;
	
	@Autowired
	private BoardCommentMapper boardCommentMapper;
	
	@Override
	public void writeReportBoard(ReportBoardDto reportBoard) {
		reportBoardMapper.insertReportBoard(reportBoard);
		
		for(BoardAttachDto attach : reportBoard.getBoardAttachList()) {
			attach.setCommonNo(reportBoard.getCommonNo());
			reportBoardMapper.insertReportAttach(attach);
			}
	}

	//공통게시판 리스트
	@Override
	public List<ReportBoardDto> listReportBoard() {
		List<ReportBoardDto> reportBoardList = reportBoardMapper.selectAllBoard();
		return reportBoardList;
	}
	

	//공통게시판 글 번호 찾기
	@Override
	public ReportBoardDto findReportBoardByCommonNo(int commonNo) {
		
		ReportBoardDto reportBoard = reportBoardMapper.selectReportBoardByCommonNo(commonNo);
		if(reportBoard != null) {
			List<BoardCommentDto> commentList = boardCommentMapper.selectBoardCommentByCommonNo(commonNo);
			reportBoard.setBoardCommentList(commentList);
		
			List<BoardAttachDto> attachList = reportBoardMapper.selectBoardAttachByCommonNo(commonNo);
			reportBoard.setBoardAttachList(attachList);
		}
		return reportBoard;
	}
	
	

	
	
	//공통게시판 특정 페이지 조회
	@Override
	public List<ReportBoardDto> listReportBoardByPage(int from, int count, String category) {
		
		List<ReportBoardDto> reportBoardList = reportBoardMapper.selectBoardByPage(from, count, category);
		return reportBoardList;
	}

	@Override
	public int getCommonBoardCount() {
		int count = reportBoardMapper.selectReportBoardCount();
		return count;
	}
	
	//첨부파일
	@Override
	public List<BoardAttachDto> findBoardAttachByCommonNo(int commonNo){
		List<BoardAttachDto> attachList = reportBoardMapper.selectBoardAttachByCommonNo(commonNo);
		return attachList;
	}
	
	@Override
	public BoardAttachDto findBoardAttachByBoardAttachNo(int boardAttachNo) {
		BoardAttachDto attach = reportBoardMapper.selectBoardAttachByBoardAttachNo(boardAttachNo);
		return attach;
	}

	
}
