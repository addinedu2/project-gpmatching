package com.gpmatching.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.dto.BoardAttachDto;
import com.gpmatching.dto.BoardCommentDto;
import com.gpmatching.dto.CommonBoardDto;
import com.gpmatching.mapper.BoardCommentMapper;
import com.gpmatching.mapper.CommonBoardMapper;

public class CommonBoardServiceImpl implements CommonBoardService {
	
	@Autowired
	public CommonBoardMapper commonBoardMapper;
	
	@Autowired
	private BoardCommentMapper boardCommentMapper;
	
	@Override
	public void writeCommonBoard(CommonBoardDto commonBoard) {
		commonBoardMapper.insertCommonBoard(commonBoard);
		
		for(BoardAttachDto attach : commonBoard.getBoardAttachList()) {
			attach.setCommonNo(commonBoard.getCommonNo());
			commonBoardMapper.insertBoardAttach(attach);
		}
	}
	

	//공통게시판 리스트
	@Override
	public List<CommonBoardDto> listCommonBoard() {

		List<CommonBoardDto> commonBoardList = commonBoardMapper.selectAllBoard();
		
		return commonBoardList;
	}

	//공통게시판 글 번호 찾기
	@Override
	public CommonBoardDto findCommonBoardByCommonNo(int commonNo) {
		
		CommonBoardDto commonBoard = commonBoardMapper.selectCommonBoardByCommonNo(commonNo);

		if(commonBoard != null) {
			List<BoardCommentDto> commentList = boardCommentMapper.selectBoardCommentByCommonNo(commonNo);
			commonBoard.setBoardCommentList(commentList);
			
			List<BoardAttachDto> attachList = commonBoardMapper.selectBoardAttachByCommonNo(commonNo);
			commonBoard.setBoardAttachList(attachList);
		}
		
		return commonBoard;
	}
	
	
	//공통게시판 글 삭제
	@Override
	public void deleteCommon(int commonNo) {
		commonBoardMapper.deleteCommon(commonNo);
	}
	
	//공통게시판 글 수정
	@Override
	public void commonEdit(CommonBoardDto commonBoard) {
		commonBoardMapper.updateCommonEdit(commonBoard);
	}

	//공통게시판 특정 페이지 조회
	@Override
	public List<CommonBoardDto> listCommonBoardByPage(int from, int count) {
		
		List<CommonBoardDto> commonBoardList = commonBoardMapper.selectBoardByPage(from, count);
		
		return commonBoardList;
	}

	@Override
	public int getCommonBoardCount() {
		int count = commonBoardMapper.selectCommonBoardCount();
		return count;
	}
	
	//첨부파일
	@Override
	public List<BoardAttachDto> findBoardAttachByCommonNo(int commonNo){
		List<BoardAttachDto> attachList = commonBoardMapper.selectBoardAttachByCommonNo(commonNo);
		
		return attachList;
	}
	
	@Override
	public BoardAttachDto findBoardAttachByBoardAttachNo(int boardAttachNo) {
		BoardAttachDto attach = commonBoardMapper.selectBoardAttachByBoardAttachNo(boardAttachNo);
		
		return attach;
	}


	@Override
	public void incrementReadCount(int commonNo) {
		commonBoardMapper.incrementReadCount(commonNo);
		
	}

	
}
