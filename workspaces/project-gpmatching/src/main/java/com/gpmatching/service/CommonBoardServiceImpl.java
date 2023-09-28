package com.gpmatching.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

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
	public void writeCommonBoard(CommonBoardDto commonBoardDto) {
		commonBoardMapper.insertCommonBoard(commonBoardDto);
		
//		for(BoardAttachDto attach : commonBoard.getBoardAttachList()) {
//			commonBoardMapper.insertBoardAttach(attach);
//		}
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
		
		CommonBoardDto commonBoardDto = commonBoardMapper.selectCommonBoardByCommonNo(commonNo);

		if(commonBoardDto != null) {
			List<BoardCommentDto> commentList = boardCommentMapper.selectBoardCommentByCommonNo(commonNo);
			commonBoardDto.setBoardCommentList(commentList);
		}
		
		
		return commonBoardDto;
	}
	
	//공통게시판 글 삭제
	@Override
	public void deleteCommon(int commonNo) {
		commonBoardMapper.deleteCommon(commonNo);
	}
	
	//공통게시판 글 수정
	@Override
	public void commonEdit(CommonBoardDto commonBoardDto) {
		commonBoardMapper.updateCommonEdit(commonBoardDto);
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

}
