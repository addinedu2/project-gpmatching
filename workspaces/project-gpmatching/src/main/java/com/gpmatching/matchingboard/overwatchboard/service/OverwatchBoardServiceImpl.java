package com.gpmatching.matchingboard.overwatchboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.mapper.MatchingCommentMapper;
import com.gpmatching.matchingboard.dto.MatchingBoardDto;
import com.gpmatching.matchingboard.overwatchboard.mapper.OverwatchBoardMapper;

import lombok.Setter;

public class OverwatchBoardServiceImpl implements OverwatchBoardService {

	@Setter(onMethod_ = { @Autowired }) 
	OverwatchBoardMapper mapper;
	
	@Autowired
	MatchingCommentMapper matchingCommentMapper;
	
	public void write(MatchingBoardDto matchingBoardDto) {
		mapper.insertMatchingBoard(matchingBoardDto);
		
		
	}
	
	@Override
	public void edit(MatchingBoardDto matchingBoardDto) {
		mapper.updateMatchingBoard(matchingBoardDto);
		
	}
	
	@Override
	public int getLastMatchingItemBoardNo() {
		int boardNo = mapper.selectMatchingItemBoardNo();
		
		return boardNo;
	}
	
	@Override
	public List<MatchingBoardDto> getMatchingBoardListByGameName(String gameName) {
		
		List<MatchingBoardDto> boardMatchingList  = mapper.selectMatchingBoardListByGameName(gameName);
		
		return boardMatchingList;
	}
	

	@Override
	public List<MatchingBoardDto> getSelectOwBoardListByGameName(String gameName) {
		List<MatchingBoardDto> overwatchBoardList = mapper.selectOwBoardListByGameName(gameName);
		return overwatchBoardList;
	}
	

	@Override
	public MatchingBoardDto findOwBoardByBoardNo(int boardNo) {
		MatchingBoardDto overwatchBoard = mapper.selectOwBoardByBoardNo(boardNo);
		return overwatchBoard;
	}
	
	@Override
	public MatchingBoardDto findMatchingBoardByBoardNo(int boardNo) {
		
		MatchingBoardDto overwatchBoard = mapper.selectMatchingBoardByBoardNo(boardNo);
		
		
		
		return overwatchBoard;
	}
	
	
	public void setNowConfirmCount(int boardNo) {
		int confirmCount = matchingCommentMapper.commentConfirmCountByMatchingBoardNo(boardNo);
		mapper.updateConfirmCount(confirmCount, boardNo);
	}

	
	@Override
	public void delete(int boardNo) {
		mapper.deleteOverwatchBoard(boardNo);
		
	}

	@Override
	public boolean getMatchingCloseByBoardNo(int boardNo) {
		boolean matchingClose = mapper.selectMatchingCloseByBoardNo(boardNo);
		return matchingClose;
	}
	

	@Override
	public List<MatchingBoardDto> searchMatchingBoardListByTitle(String gameName, String keyword) {

		List<MatchingBoardDto> list = mapper.selectOwBoardListByTitle(gameName, keyword);
				
		return list;
	}

	@Override
	public boolean isMatchingCloseCondition(int boardNo) {
		MatchingBoardDto overwatchBoard = mapper.selectOwBoardByBoardNo(boardNo);
		int headCount = overwatchBoard.getHeadCount();
		int confirmCount = overwatchBoard.getConfirmCount();
		if(headCount == confirmCount) {
			return true;
		} else {
			System.out.println("headCount 와 confirmCount 가 같지 않습니다.");
			return false;
		}
		
	}
	
	@Override
	public void setMatchingCloseTrue(int boardNo) {
		if(isMatchingCloseCondition(boardNo)) {
			mapper.updateMatchingCloseTrueByBoardNo(boardNo);
		}else {
			System.out.println("headCount 와 confirmCount 가 같지 않아 matchingClose 값을 변경할수 없습니다.");
			
		}
		
	}
}
