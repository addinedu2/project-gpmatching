package com.gpmatching.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;

import com.gpmatching.dto.MatchingAlarmDto;

@Mapper
public interface MatchingAlarmMapper {

	@Insert("insert into MatchingAlarm (alarmContent, mCommentNo) values ('댓글을 달았습니다', #{ mCommentNo })")
	@Options(useGeneratedKeys = true, keyProperty = "alarmNo")
	void insertMatchingAlarm(MatchingAlarmDto matchingAlarmDto);

	
	@Select("select ma.alarmNo, ma.mCommentNo, ma.alarmContent, ma.regDate, mc.boardNo, u.nickname "
			  + "from MatchingComment mc "
			  + "inner join MatchingAlarm ma on ma.mCommentNo = mc.CommentNo "
			  + "inner join User u on u.userNo = mc.userNo "
			  + "where mc.userNo != ${userNo} "
			  + "order by ma.mCommentNo desc")
	List<MatchingAlarmDto> selectAlarmListByUserNo(int userNo);


	@Delete("delete "
		  + "from MatchingAlarm "
		  + "where mCommentNo "
		  + "in (select mc.CommentNo "
		  + "    from MatchingComment mc "
		  + "    inner join User u on u.userNo = mc.userNo "
		  + "    where mc.userNo != ${userNo})")
	void deleteAlarmListByUserNo(int userNo);
}
