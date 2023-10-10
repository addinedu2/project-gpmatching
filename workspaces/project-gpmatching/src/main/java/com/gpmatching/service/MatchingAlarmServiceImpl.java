package com.gpmatching.service;

import org.springframework.beans.factory.annotation.Autowired;

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

	
}
