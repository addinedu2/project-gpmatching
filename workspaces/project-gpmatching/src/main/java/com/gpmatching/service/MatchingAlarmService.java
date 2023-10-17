package com.gpmatching.service;

import java.util.List;

import com.gpmatching.dto.AlarmDto;
import com.gpmatching.dto.MatchingAlarmDto;

public interface MatchingAlarmService {

	void saveMatchingAlarm(MatchingAlarmDto matchingAlarm);
	
	List<MatchingAlarmDto> getMatchingAlarmListByUserNo(int userNo);
	
	void deleteAlarmListByUserNo(int userNo);

	
}
