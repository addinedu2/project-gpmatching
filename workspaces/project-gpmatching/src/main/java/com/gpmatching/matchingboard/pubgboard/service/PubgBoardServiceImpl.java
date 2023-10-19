package com.gpmatching.matchingboard.pubgboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.dto.CloseAlarmDto;
import com.gpmatching.mapper.MatchingAlarmMapper;
import com.gpmatching.mapper.MatchingCommentMapper;
import com.gpmatching.matchingboard.dto.MatchingBoardDto;
import com.gpmatching.matchingboard.pubgboard.mapper.PubgBoardMapper;

import lombok.Setter;

public class PubgBoardServiceImpl implements PubgBoardService {

	@Setter(onMethod_ = { @Autowired }) 
	PubgBoardMapper mapper;
	
	@Autowired
	MatchingCommentMapper matchingCommentMapper;
	
	@Setter(onMethod_ = { @Autowired }) 
	MatchingAlarmMapper matchingAlarmMapper;
	
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
		
		List<MatchingBoardDto> boardMachingList  = mapper.selectMatchingBoardListByGameName(gameName);
		
		return boardMachingList;
	}
	
	
	
	@Override
	public List<MatchingBoardDto> getSelectPubgBoardListByGameName(String gameName) {
		List<MatchingBoardDto> pubgList = mapper.selectPubgBoardListByGameName(gameName);
		return pubgList;
	}
	

	@Override
	public MatchingBoardDto findPubgBoardByBoardNo(int boardNo) {
		MatchingBoardDto pubgBoard = mapper.selectPubgBoardByBoardNo(boardNo);
		return pubgBoard;
	}
	
	public void setNowConfirmCount(int boardNo) {
		int confirmCount = matchingCommentMapper.commentConfirmCountByMatchingBoardNo(boardNo);
		mapper.updateConfirmCount(confirmCount, boardNo);
	}
	
	
	@Override
	public void delete(int boardNo) {
		mapper.deletePubgBoard(boardNo);
		
	}
	

	@Override
	public boolean getMatchingCloseByBoardNo(int boardNo) {
		boolean matchingClose = mapper.selectMatchingCloseByBoardNo(boardNo);
		return matchingClose;
	}
	

	@Override
	public List<MatchingBoardDto> searchMatchingBoardListByTitle(String gameName, String keyword) {

		List<MatchingBoardDto> list = mapper.selectPubgBoardListByTitle(gameName, keyword);
				
		return list;
	}

	@Override
	public boolean isMatchingCloseCondition(int boardNo) {
		MatchingBoardDto pubgBoard = mapper.selectPubgBoardByBoardNo(boardNo);
		int headCount = pubgBoard.getHeadCount();
		int confirmCount = pubgBoard.getConfirmCount();
		if(headCount == confirmCount) {
			return true;
		} else {
			System.out.println("headCount 와 confirmCount 가 같지 않습니다.");
			return false;
		}
		
	}
	
	@Override
	public void setMatchingCloseTrue(int boardNo, CloseAlarmDto closeAlarm) {
		if(isMatchingCloseCondition(boardNo)) {
			mapper.updateMatchingCloseTrueByBoardNo(boardNo);
			matchingAlarmMapper.insertCloseAlarm(closeAlarm);
		}else {
			System.out.println("headCount 와 confirmCount 가 같지 않아 matchingClose 값을 변경할수 없습니다.");
			
		}
		
	}

	
}
