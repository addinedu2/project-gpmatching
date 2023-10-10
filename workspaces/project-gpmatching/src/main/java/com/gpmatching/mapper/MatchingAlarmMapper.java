package com.gpmatching.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;

import com.gpmatching.dto.MatchingAlarmDto;

@Mapper
public interface MatchingAlarmMapper {

	@Insert("insert into MatchingAlarm (alarmContent, mCommentNo) values ('댓글을 달았습니다', #{ mCommentNo })")
	@Options(useGeneratedKeys = true, keyProperty = "alarmNo")
	void insertMatchingAlarm(MatchingAlarmDto matchingAlarmDto);
}
