package com.gpmatching.matchingboard.overwatchboard.service;

import com.gpmatching.matchingboard.dto.OverwatchDto;

public interface OverwatchService {

	void write(OverwatchDto overwatchDto, int boardNo);

}