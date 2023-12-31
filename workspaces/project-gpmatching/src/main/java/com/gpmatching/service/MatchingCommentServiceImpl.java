package com.gpmatching.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.dto.ConfirmAlarmDto;
import com.gpmatching.dto.MatchingAlarmDto;
import com.gpmatching.dto.MatchingCommentDto;
import com.gpmatching.mapper.MatchingAlarmMapper;
import com.gpmatching.mapper.MatchingCommentMapper;
import com.gpmatching.matchingboard.lolboard.mapper.LolBoardMapper;

public class MatchingCommentServiceImpl implements MatchingCommentService{

	@Autowired
	private LolBoardMapper lolBoardMapper;
	
	@Autowired
	private MatchingCommentMapper matchingCommentMapper;
	
	@Autowired
	private MatchingAlarmMapper matchingAlarmMapper;

	@Override
	public void writeMatchingComment(MatchingCommentDto matchingComment, MatchingAlarmDto matchingAlarm) {
		
		matchingCommentMapper.insertMatchingComment(matchingComment);
		
		matchingAlarm.setCommentNo(matchingComment.getCommentNo());
		matchingAlarmMapper.insertMatchingAlarm(matchingAlarm);
	}


	@Override
	public List<MatchingCommentDto> getMatchingCommentByBoardNo(int boardNo) {

		List<MatchingCommentDto> comments = matchingCommentMapper.selectMatchingCommentListByBoardNo(boardNo);
		
		return comments;
	}
	
	@Override
	public int getBoardNoByCommentNo(int commentNo) {
		int boardNo = matchingCommentMapper.selectBoardNoByCommentNo(commentNo);
		return boardNo;
	}
	
	/**
	 * 롤 매칭 승인 method 
	 * 
	 * 변수 리스트 
	 * status : 댓글 승인상태
	 * confirmCount : 승인된 인원
	 * headCount : 모집인원
	 * 
	 * status 에 따른 댓글 승인 상태
	 * 
	 * status : "1" -> 신청승인된 글
	 * status : "0" -> 신청승인되지 않은 글
	 * status : "2" -> 거절된 글
	 * 
	 * 매칭 로직 : 
	 * 
	 * confirmCount 가 모집인원보다 2 이상 작을때 -> 신청승인
	 * 
	 * confirmCount 가 모집인원보다 1 작을때 -> 신청승인 후 매칭 글 마감 (matchingClose 값을 true 로 update)
	 * 
	 * confirmCount 가 모집인원보다 같거나 클때 -> 혹시 마감이 안되어있다면 마감 (matchingClose 값을 true 로 update)
	 * 
	 * @author hi.lee
	 * @param commentNo 매칭댓글번호
	 */
	
	@Override
	public void setCommentStatusConfirm(int commentNo, ConfirmAlarmDto confirmAlarm) {
		//System.out.println(commentNo);
		int boardNo = matchingCommentMapper.selectBoardNoByCommentNo(commentNo);
		int confirmCount = matchingCommentMapper.commentConfirmCountByMatchingBoardNo(boardNo);
		int headCount = lolBoardMapper.matchingBoardheadCountByBoardNo(boardNo);
		String status = matchingCommentMapper.selectStatusByCommentNo(commentNo);
		
		//승인 알림용
		matchingAlarmMapper.insertConfirmAlarm(confirmAlarm);
		
		if(status.equals("1")) { // 신청승인된 글
			System.out.println("신청승인된 글입니다.");
			return;
		} else if(confirmCount + 1 < headCount  ) { //confirmCount 가 모집인원보다 2이상 작을때
			matchingCommentMapper.updateMatchingCommentStatus( commentNo , "1" );
			lolBoardMapper.updateConfirmCount(confirmCount+1, boardNo);
			System.out.println("신청승인합니다.");
			return;
		
		//confirmCount 가 모집인원보다 1 작을때
		} else if( confirmCount + 1 == headCount ) {
			matchingCommentMapper.updateMatchingCommentStatus( commentNo , "1" );
			lolBoardMapper.updateConfirmCount(confirmCount+1, boardNo);
			//lolBoardMapper.updateMatchingCloseTrueByBoardNo(boardNo);
			System.out.println("신청승인합니다.");
			//System.out.println("마감합니다.");
			return;
		
		//confirmCount 가 모집인원보다 같거나 클때
		} else if (headCount == confirmCount || headCount < confirmCount ) {
			//lolBoardMapper.updateMatchingCloseTrueByBoardNo(boardNo);
			//System.out.println("마감된 글입니다.");
			return;
			
		} 
		
	
	}
	
	/**
	 * 롤 매칭 마감 판별 method
	 * @author hi.lee
	 * @param commentNo 댓글번호
	 * @return matchingClose 마감여부
	 */
	
	@Override
	public boolean isMatchingCloseTrueByCommentNo(int commentNo) {
		int boardNo = matchingCommentMapper.selectBoardNoByCommentNo(commentNo);
		boolean matchingClose = lolBoardMapper.selectMatchingCloseByBoardNo(boardNo);
		
		return matchingClose;
	}
	
	/**
	 * 롤 매칭 거절 method
	 * 
	 * 로직: 
	 * 롤 매칭 마감 판별하고
	 * 마감했으면 -> 거절x
	 * 마감하지 않았으면 -> 거절o
	 * @author hi.lee
	 * @param commentNo 댓글번호
	 */
	
	@Override
	public void setCommentStatusReject(int commentNo) {
		boolean matchingClose = isMatchingCloseTrueByCommentNo(commentNo);
		int boardNo;
		int confirmCount ;
		if(!matchingClose) {
			matchingCommentMapper.updateMatchingCommentStatus( commentNo , "2" );
			boardNo = matchingCommentMapper.selectBoardNoByCommentNo(commentNo);
			confirmCount = matchingCommentMapper.commentConfirmCountByMatchingBoardNo(boardNo);
			lolBoardMapper.updateConfirmCount(confirmCount, boardNo);
		}
		
	}


	@Override
	public List<MatchingAlarmDto> getMatchingAlarmListByUserNo(int userNo) {
		List<MatchingAlarmDto> matchingAlarms = matchingAlarmMapper.selectAlarmListByUserNo(userNo);
		
		return matchingAlarms;
	}


	@Override
	public List<MatchingCommentDto> getMatchingCommentForReview(int boardNo) {

		List<MatchingCommentDto> review = matchingCommentMapper.selectMatchingCommentListForReview(boardNo);
		return review;
	}
	
	
//	@Override
//	public int showCommentConfirmCount(int boardNo) {
//		
//		int confirmCount = matchingCommentMapper.commentConfirmCountByMatchingBoardNo(boardNo);
//		return confirmCount;
//	}
	
//	@Override
//	public List<MatchingCommentDto> getMatchingCommentByBoardNo(int boardNo){
//		
//		List<MatchingCommentDto> comments = matchingCommentMapper.selectMatchingCommentByBoardNo(boardNo);
//		
//		return comments;
//	}
	
}
