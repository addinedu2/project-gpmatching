package com.gpmatching.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.gpmatching.dto.AlarmDto;
import com.gpmatching.dto.MatchingAlarmDto;
import com.gpmatching.mapper.MatchingAlarmMapper;

import lombok.Setter;

public class MatchingAlarmServiceImpl implements MatchingAlarmService{

	@Setter(onMethod_ = { @Autowired })
	private MatchingAlarmMapper matchingAlarmMapper;
	
	@Override
	public void saveMatchingAlarm(MatchingAlarmDto matchingAlarmDto) {
		matchingAlarmMapper.insertMatchingAlarm(matchingAlarmDto);
	}
	
	@Override
	public List<MatchingAlarmDto> getMatchingAlarmListByUserNo(int userNo) {
		List<MatchingAlarmDto> matchingAlarms = matchingAlarmMapper.selectAlarmListByUserNo(userNo);
		
		return matchingAlarms;
	}

	@Override
	public void deleteAlarmListByUserNo(int userNo) {
		matchingAlarmMapper.deleteAlarmListByUserNo(userNo);
		
	}

	@Override
	public int countMatchingAlarmNoByUserNo(int userNo) {
		int mAlarmCount = matchingAlarmMapper.countMatchingAlarmNo(userNo);
		return mAlarmCount;
	}
	
	@Override
	public void deleteConfirmListByUserNo(int userNo) {
		matchingAlarmMapper.deleteConfirmListByUserNo(userNo);
		
	}
	
	
}
