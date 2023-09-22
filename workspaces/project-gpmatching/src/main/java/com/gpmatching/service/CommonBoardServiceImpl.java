package com.gpmatching.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.dto.CommonBoardDto;
import com.gpmatching.mapper.CommonBoardMapper;

public class CommonBoardServiceImpl implements CommonBoardService {
	
	@Autowired
	public CommonBoardMapper commonBoardMapper;
	
	@Override
	public void writeCommonBoard(CommonBoardDto commonBoardDto) {
		commonBoardMapper.insertCommonBoard(commonBoardDto);
		
//		for(BoardAttachDto attach : commonBoard.getBoardAttachList()) {
//			commonBoardMapper.insertBoardAttach(attach);
//		}
	}

	@Override
	public List<CommonBoardDto> listCommonBoard() {

		List<CommonBoardDto> commonBoardList = commonBoardMapper.selectAllBoard();
		
		return commonBoardList;
	}

	@Override
	public CommonBoardDto findCommonBoardByCommonNo(int commonNo) {
		CommonBoardDto commonBoardDto = commonBoardMapper.selectCommonBoardByCommonNo(commonNo);

//		if(commonBoardDto != null) {
//			List<CommonBoardDto> attachList = commonBoardMapper.selectCommonAttachByCommonNo(commonNo);
//		}
		
		return commonBoardDto;
	}
	
	@Override
	public void deleteCommon(int commonNo) {
		commonBoardMapper.deleteCommon(commonNo);
	}
	
	//Edit
	@Override
	public void commonEdit(CommonBoardDto commonBoardDto) {
		commonBoardMapper.updateCommonEdit(commonBoardDto);
	}

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
